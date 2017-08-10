package com.neu.finalProject.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.neu.finalProject.dao.EmployerDAO;
import com.neu.finalProject.dao.JobDAO;
import com.neu.finalProject.pojo.Employer;
import com.neu.finalProject.pojo.JobPost;
import com.neu.finalProject.pojo.JobsApplied;
import com.neu.finalProject.pojo.User;

@Controller
public class EmployerController {

	
	@RequestMapping(value="/empHome.htm",method=RequestMethod.GET)
	public String getHome(Model model, HttpSession session){
		try{
			User u = (Employer)session.getAttribute("userObj");
			if(u == null){
				model.addAttribute("nosession", true);
				return "loginJobSeeker";
			}else{
		User user = (User) session.getAttribute("userObj");
		long employerId = user.getPersonId();
		System.out.println("inside the home DAO:"+employerId);
		JobDAO jobDao = new JobDAO();
		List<JobPost> jobList = new ArrayList<JobPost>();
		jobList = jobDao.getJobsPostedByEmployer(employerId);
		model.addAttribute("jobsList", jobList);		
			}
		}catch (Exception e) {
			System.out.println("Exception: " + e.getMessage());
		}
		return "employerHome";
	}
	
	@RequestMapping(value="/getJobs.htm",method = RequestMethod.GET)
	public String getJobsCount(@RequestParam("pageNumber") int num,Model model, HttpSession session){
		JobDAO jobDAO = new JobDAO();
        List<JobPost> jobList = new ArrayList<JobPost>();
        List<JobPost> pagedList = new ArrayList<JobPost>();
        System.out.println("inside page count" +num);
		try{
			
			User u = (Employer)session.getAttribute("userObj");
			if(u == null){
				model.addAttribute("nosession", true);
				return "loginJobSeeker";
			}else{
			int recordsPerPage = 3;
			
			User user = (User) session.getAttribute("userObj");
			long employerId = user.getPersonId();
				
				jobList = jobDAO.getJobsPostedByEmployer(employerId);
				
				pagedList = jobDAO.getPagedJobsList(employerId,(num*3),3);
	            
				int numberOfRecords = jobList.size();
				System.out.println("num of records:" +numberOfRecords);
				int noOfPages = (int) Math.floor(numberOfRecords * 1.0 / recordsPerPage);
				
				System.out.println("num of pages:" +noOfPages);
				model.addAttribute("total", noOfPages);
				 model.addAttribute("jobsList", pagedList);
			}
		
		}	catch(Exception e){
			System.out.println(e.getMessage());
			
		}
		return "employerHome";
	}
	
	@RequestMapping(value="/postJob.htm",method=RequestMethod.GET)
	public String getProfile(HttpSession session, Model model){
		Employer emp = new Employer();
		emp = (Employer)session.getAttribute("userObj");
		if(emp == null){
			model.addAttribute("nosession", true);
			return "loginJobSeeker";
		}
		else{
			return "postJob";
		}
	}
	
	@RequestMapping(value="/viewApps.htm",method=RequestMethod.GET)
	public String getApplicants(){
		return "employerApplicants";
	}
	
	
	
	
	@RequestMapping(value="submitStatus/{jobAppliedId}", method = RequestMethod.POST)
    public String changeStatus(@RequestParam("status")String status,@PathVariable("jobAppliedId")long jobAppliedId,
    		Model model, HttpSession session) {
    	System.out.println(jobAppliedId);
    	try{
    		User u = (Employer)session.getAttribute("userObj");
			if(u == null){
				model.addAttribute("nosession", true);
				return "loginJobSeeker";
			}else{
    	if(!status.isEmpty() || status !=null){
    		JobDAO jobDao=new JobDAO();
    		System.out.println("status: "+status+"jaID : "+jobAppliedId);
    		jobDao.statusChange(status,jobAppliedId);
    		model.addAttribute("success", true);
    	}else{
    		model.addAttribute("error", true);
    	}
           
			}
    	}catch(Exception e){
    		System.out.println(e.getMessage());
    	}
    	return "applicantDetails";
	}
	
	@RequestMapping(value="submitJobStatus/{jobId}", method = RequestMethod.POST)
    public String changeJobStatus(@RequestParam("jobPostStatus")String status,@PathVariable("jobId")long jobId,
    		Model model,HttpSession session) {
    	System.out.println(jobId);
    	try{
    		User u = (Employer)session.getAttribute("userObj");
			if(u == null){
				model.addAttribute("nosession", true);
				return "loginJobSeeker";
			}else{
    		JobDAO jobDao=new JobDAO();
    		System.out.println("status: "+status+"jaID : "+jobId);
    		jobDao.statusJobChange(status,jobId);
			}
           
    	}catch(Exception e){
    		System.out.println(e.getMessage());
    	}
    	return "employerHome";
	}
	
	//@RequestMapping(value="/applyJob/{jobId}",method=RequestMethod.GET)
	//@RequestMapping(value="/submitStatus/{userId}/{jobId}/{status}.htm",method=RequestMethod.GET)
	public String submitStatus(@PathVariable("userId") long userId,@PathVariable("jobId") long jobId,
			@PathVariable("status") String status, HttpSession session, HttpServletRequest request,Model model)
	{
		try{
			User u = (Employer)session.getAttribute("userObj");
			if(u == null){
				model.addAttribute("nosession", true);
				return "loginJobSeeker";
			}else{
			System.out.println("inside submit status controller");
			System.out.println(" id : "+userId+" status :"+status);
			JobDAO jobDao = new JobDAO();
			
			//String id = request.getParameter("jobSeekerId");
			//System.out.println("js id :"+id);
			//long jsId = Long.valueOf(id);
			
			JobsApplied jobApplied = jobDao.changeStatus(userId,jobId,status);
			System.out.println("status changed successfuly");
			}
			//JobsApplied ja1 = jobDao.getUserById(personId);
			
		}catch (Exception e) {
			System.out.println("Exception: " + e.getMessage());
		}
		return "employerHome";
	}
	

	@RequestMapping(value="/viewApplicants/{jobId}",method=RequestMethod.GET)
	public String viewApplicants(@PathVariable("jobId") long jobId, HttpServletRequest req, Model model,HttpSession session){
		try{
			User u = (Employer)session.getAttribute("userObj");
			if(u == null){
				model.addAttribute("nosession", true);
				return "loginJobSeeker";
			}else{
			JobDAO jobDao = new JobDAO();
			System.out.println("inside view applicant controller");
			
			Employer emp = (Employer) req.getSession().getAttribute("userObj");
			String user = emp.getEmailId();
			
			List<JobsApplied> applicants = new ArrayList();
			applicants = jobDao.getApplicant(user, jobId);
			
			model.addAttribute("jaID",jobId);
			
			String title = jobDao.getJobById(jobId).getJobTitle();
			
			model.addAttribute("applicants", applicants);
			//req.getSession().setAttribute("applicants", applicants);
			req.getSession().setAttribute("title", title);
			
				if(applicants.size()>0){
					model.addAttribute("hasapplicants",true);
				}else{
					model.addAttribute("noapplicants",true);
				}
				return "viewApplicants";
			}
			//jobDao.applyToJob(jobSeeker,post);
			
		}catch(Exception e) {
            System.out.println(e.getMessage());
            return "noApplicants";
		}
		
	}
	
	@RequestMapping(value = "/viewJobDetails/{jobId}", method = RequestMethod.GET)
	public String viewDetails(@PathVariable("jobId")long jobId,HttpServletRequest req,Model model,HttpSession session){
		try{
			User u = (Employer)session.getAttribute("userObj");
			if(u == null){
				model.addAttribute("nosession", true);
				return "loginJobSeeker";
			}else{
		JobDAO job=new JobDAO();
		System.out.println("inside view job details controller");
		JobPost jobPost=job.getJobDetails(jobId);
		System.out.println("jobId: "+jobPost.getJobId()+" "+jobPost.getExpYears());
		model.addAttribute("post",jobPost);
		}
		}
		catch(Exception e){
			System.out.println(e.getMessage());
		}
		return "jobDetails";
	}
	
	@RequestMapping(value="/updatePost/{jobId}.htm",method=RequestMethod.POST)
	public String updateJobPost(@PathVariable("jobId")long jobId,@ModelAttribute("jobPost") JobPost jobpost,BindingResult result,
			Model model, HttpSession session) throws Exception{
		try{
			User u = (Employer)session.getAttribute("userObj");
			if(u == null){
				model.addAttribute("nosession", true);
				return "loginJobSeeker";
			}else{
			EmployerDAO empDao = new EmployerDAO();
			User user = (User) session.getAttribute("userObj");
			long employerId = user.getPersonId();
			System.out.println("employer id:"+employerId);
			String jobPostStatus = "Active";
			JobPost post =  empDao.updatePost(jobpost.getJobTitle(),jobpost.getCompanyName(), jobpost.getJobDescription(),jobpost.getEduLevel(),
					jobpost.getExpYears(),jobpost.getLocationCity(),jobpost.getJobType(),jobId,jobPostStatus,employerId);
			model.addAttribute("success",true);
			model.addAttribute("post",post);
			}
		}catch (Exception e) {
			System.out.println("Exception: " + e.getMessage());
			model.addAttribute("error",true);
		}
		return "jobDetails";
	}
	
	@RequestMapping(value="down/{jaid}",method = RequestMethod.GET)
    public void download(@PathVariable("jaid")
            long documentId, HttpServletResponse response,HttpSession session,Model model) {
		System.out.println("I m here");
		JobDAO jd=new JobDAO();
		System.out.println(documentId);
		JobsApplied j=jd.getAppliedResume(documentId);
		System.out.println(j.getResumeName());
		try {
			User u = (Employer)session.getAttribute("userObj");
			if(u == null){
				model.addAttribute("nosession", true);
				
			}else{
            response.setHeader("Content-Disposition", "inline;filename=\"" +j.getResumeName()+ "\"");
            OutputStream out = response.getOutputStream();
            response.setContentType(j.getFileType());
            IOUtils.copy(j.getResumeFile().getBinaryStream(), out);
            out.flush();
            out.close();
			}
         
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

	}
	
	@RequestMapping(value = "/viewDetails/{jobsAppliedId}", method = RequestMethod.GET)
	public String viewApplicantDetails(@PathVariable("jobsAppliedId")long jobsAppliedId,
			HttpServletRequest req,Model model,HttpSession session){
		try{
			User u = (Employer)session.getAttribute("userObj");
			if(u == null){
				model.addAttribute("nosession", true);
				return "loginJobSeeker";
			}else{
		JobDAO job=new JobDAO();
		System.out.println("inside view applicant details controller");
		JobsApplied jobApplicant=job.getJobsApplied(jobsAppliedId);
		model.addAttribute("applicant",jobApplicant);
			}
		}
		catch(Exception e){
			System.out.println(e.getMessage());
		}
		return "applicantDetails";
}
}
