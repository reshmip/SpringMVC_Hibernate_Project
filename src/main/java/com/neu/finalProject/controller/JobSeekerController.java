package com.neu.finalProject.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.hibernate.Hibernate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import com.neu.finalProject.pojo.Employer;
import com.neu.finalProject.pojo.JobPost;
import com.neu.finalProject.pojo.JobSeeker;
import com.neu.finalProject.pojo.JobsApplied;
import com.neu.finalProject.dao.EmployerDAO;
import com.neu.finalProject.dao.JobDAO;
import com.neu.finalProject.dao.JobSeekerDAO;
import com.neu.finalProject.pojo.User;


@Controller
public class JobSeekerController {

	int page=1;
	@RequestMapping(value="/jshome.htm",method=RequestMethod.GET)
	public String getHome(Model model,HttpSession session){
		try{
			User u = (User)session.getAttribute("userObj");
			if(u == null){
				model.addAttribute("nosession", true);
				return "loginJobSeeker";
			}else{
		JobSeekerDAO jsDao = new JobSeekerDAO();
		JobSeeker js = new JobSeeker();
		User user = (User) session.getAttribute("userObj");
		System.out.println("inside home");
		long jobseekerId = user.getPersonId();
		System.out.println("id:"+jobseekerId);
		js = jsDao.getJobSeekerDetails(jobseekerId);
		System.out.println(jobseekerId+js.getHigherEducation());
		model.addAttribute("js", js);
			}
		}catch (Exception e) {
			System.out.println("Exception: " + e.getMessage());
		}
		return "jobSeekerHome";
	}
	
	@RequestMapping(value="/resume.htm",method=RequestMethod.GET)
	public String getProfile(Model model, HttpSession session){
		try{
			User u = (User)session.getAttribute("userObj");
			if(u == null){
				model.addAttribute("nosession", true);
				return "loginJobSeeker";
			}else{
		JobSeeker js = (JobSeeker) session.getAttribute("userObj");
		model.addAttribute("filename",js.getResumeName());
		return "jobSeekerProfile";
			}
		}catch(Exception e) {
			System.out.println("Exception: " + e.getMessage());
			return "jobSeekrHome";
		}
	}
	
	@RequestMapping(value="/searchJobInList.htm",method=RequestMethod.GET)
	public String getJobSeekerSearchList(){
		
		return "jobSeekerSeachJobs";
	}
	
	@RequestMapping(value="/jobsList.htm",method=RequestMethod.GET)
    private String getJobsPosted(@ModelAttribute("jobSeeker") JobSeeker jobApplicant,BindingResult result,HttpSession session,Model model)throws Exception{
		if(result.hasErrors()){
			return "jobSeekerHome";
		}
		JobDAO jobDAO = new JobDAO();
        List<JobPost> fullList = new ArrayList<JobPost>();      
        try {
        	User u = (User)session.getAttribute("userObj");
			if(u == null){
				model.addAttribute("nosession", true);
				return "loginJobSeeker";
			}else{
            User user = (User) session.getAttribute("userObj");
			long jobSeekerID = user.getPersonId();
			fullList = jobDAO.getNotAppliedList(jobSeekerID);  
            model.addAttribute("newPostList", fullList); 
			}
            return "jobSeekerJobList";             
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return "jobSeekerHome";
        }
        
    }
	
	@RequestMapping(value="/getJobRecords.htm",method = RequestMethod.GET)
	public String getJobRecordsCount(@RequestParam("pageNumber") int num,Model model, HttpSession session){
		JobDAO jobDAO = new JobDAO();
        List<JobPost> fullList = new ArrayList<JobPost>();
        List<JobPost> pagedList = new ArrayList<JobPost>();
        System.out.println("inside page count" +num);
		try{
			User u = (User)session.getAttribute("userObj");
			if(u == null){
				model.addAttribute("nosession", true);
				return "loginJobSeeker";
			}else{
			int recordsPerPage = 3;
			
	            User user = (User) session.getAttribute("userObj");
				long jobSeekerID = user.getPersonId();
				
				fullList = jobDAO.getNotAppliedList(jobSeekerID);
				pagedList = jobDAO.getPagedAppliedList(jobSeekerID,(num*3),3);
	            
				int numberOfRecords = fullList.size();
				System.out.println("num of records:" +numberOfRecords);
				int noOfPages = (int) Math.floor(numberOfRecords * 1.0 / recordsPerPage);
				
				System.out.println("num of pages:" +noOfPages);
				model.addAttribute("total", noOfPages);
				 model.addAttribute("newPostList", pagedList);
			}
		}	catch(Exception e){
			System.out.println(e.getMessage());
			
		}
		return "jobSeekerJobList";
	}
	
	
	public void sendEmail() throws EmailException{
		Email email = new SimpleEmail();
		System.out.println("inside send email");
		String authuser = "aedtest2015@gmail.com";
		String authpwd = "Jaffa@123";
		email.setSmtpPort(587);
		email.setAuthenticator(new DefaultAuthenticator(authuser, authpwd));
		email.setDebug(true);
		email.setHostName("smtp.gmail.com");
		try {
			email.getMailSession().getProperties().put("mail.smtps.auth", "true");
			email.getMailSession().getProperties().put("mail.debug", "true");
			email.getMailSession().getProperties().put("mail.smtps.port", "587");
			email.getMailSession().getProperties().put("mail.smtps.socketFactory.port", "587");
			email.getMailSession().getProperties().put("mail.smtps.socketFactory.class",   "javax.net.ssl.SSLSocketFactory");
			email.getMailSession().getProperties().put("mail.smtps.socketFactory.fallback", "false");
			email.getMailSession().getProperties().put("mail.smtp.starttls.enable", "true");
			email.setFrom("aedtest2015@gmail.com", "Hired Team");
			email.setSubject("TestMail");
			email.setMsg("This is a test mail?");
			email.addTo("reshmi.padavala@gmail.com", "Reshmi");
			email.setTLS(true);
			email.send();
		} catch (EmailException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value = "/uploadResume.htm", method = RequestMethod.POST)
    public String uploadFile(@RequestParam("resumeFile") MultipartFile file, HttpSession session, Model model) {
		System.out.println("inside file upload controller");
		System.out.println("File:" + file.getOriginalFilename());
		System.out.println("ContentType:" + file.getContentType());
		
		JobSeeker js = (JobSeeker) session.getAttribute("userObj");
		try {
			User u = (User)session.getAttribute("userObj");
			if(u == null){
				model.addAttribute("nosession", true);
				return "loginJobSeeker";
			}else{
			Blob blob = Hibernate.createBlob(file.getInputStream());
			System.out.println("inside file upload controller");
	          JobSeekerDAO jsDao = new JobSeekerDAO();

			jsDao.uploadResume(js.getPersonId(), blob, file.getOriginalFilename(), file.getContentType());
			
			String fileUploadName = file.getOriginalFilename();
			model.addAttribute("filename", fileUploadName);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "jobSeekerProfile";
	}
	
	@RequestMapping(value="download/{userid}",method = RequestMethod.GET)
    public void download(@PathVariable("userid") long userId, HttpServletResponse response,HttpSession session,Model model) {
		System.out.println("I m here");
		JobSeekerDAO jsdao = new JobSeekerDAO();
		System.out.println(userId);
		JobSeeker js=jsdao.UploadedResume(userId);
		System.out.println(js.getResumeName());
		try {
			User u = (User)session.getAttribute("userObj");
			if(u == null){
				model.addAttribute("nosession", true);
				
			}else{
            response.setHeader("Content-Disposition", "inline;filename=\"" +js.getResumeName()+ "\"");
            OutputStream out = response.getOutputStream();
            response.setContentType(js.getFileType());
            IOUtils.copy(js.getResumeFile().getBinaryStream(), out);
            out.flush();
            out.close();
			}
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

	}
	
	@RequestMapping(value = "/viewJDetails/{jobId}", method=RequestMethod.GET)
	public String getJobDetails(@PathVariable("jobId") long jobId,HttpServletRequest req,Model model,HttpSession session){
		JobPost details = new JobPost();
		try{
			User u = (User)session.getAttribute("userObj");
			if(u == null){
				model.addAttribute("nosession", true);
				return "loginJobSeeker";
			}else{
			System.out.println("inside view details controller");
			JobDAO job=new JobDAO();
			
			details=job.getJobDetails(jobId);
			System.out.println("jobId: "+details.getJobId()+" "+details.getExpYears());
			model.addAttribute("details",details);
			req.getSession().setAttribute("detail", details);
			}
			}
			catch(Exception e){
				System.out.println(e.getMessage());
				
			}
		return "viewJDetails";
	}
	
	@RequestMapping(value = "/viewJob/{jobId}", method=RequestMethod.GET)
	public String getAppliedJobDetails(@PathVariable("jobId") long jobId,HttpServletRequest req,Model model,HttpSession session){
		JobPost details = new JobPost();
		try{
			User u = (User)session.getAttribute("userObj");
			if(u == null){
				model.addAttribute("nosession", true);
				return "loginJobSeeker";
			}else{
			System.out.println("inside view details controller");
			JobDAO job=new JobDAO();
			
			details=job.getJobDetails(jobId);
			System.out.println("jobId: "+details.getJobId()+" "+details.getExpYears());
			model.addAttribute("details",details);
			req.getSession().setAttribute("detail", details);
			}
		}
			catch(Exception e){
				System.out.println(e.getMessage());
				
			}
		return "viewAppliedJDetails";
	}
	
	
	
	@RequestMapping(value="/applyJob/{jobId}",method=RequestMethod.GET)
	public String applyJob(@PathVariable("jobId") long jobId, HttpServletRequest req,HttpSession session,Model model){
		try{
			User u = (User)session.getAttribute("userObj");
			if(u == null){
				model.addAttribute("nosession", true);
				return "loginJobSeeker";
			}else{
			JobDAO jobDao = new JobDAO();
			System.out.println("inside apply job controller");
			
			JobSeeker js = (JobSeeker) req.getSession().getAttribute("userObj");
			String user = js.getEmailId();
			
			jobDao.applyJob(user, jobId);
			//jobDao.applyToJob(jobSeeker,post);
			}
			
		}catch(Exception e) {
            System.out.println(e.getMessage());
			System.out.println("error");
		}
		return "jobSeekerJobList";
	}
	
	@RequestMapping(value="/applyToJob/{jobId}",method=RequestMethod.POST)
	public String applyToJob(@PathVariable("jobId") long jobId, HttpServletRequest req,Model model,HttpSession session){
		try{
			User u = (User)session.getAttribute("userObj");
			if(u == null){
				model.addAttribute("nosession", true);
				return "loginJobSeeker";
			}else{
			JobDAO jobDao = new JobDAO();
			System.out.println("inside apply controller");
			
			JobSeeker js = (JobSeeker) req.getSession().getAttribute("userObj");
			String user = js.getEmailId();
			long userId = js.getPersonId();
			boolean check;
			check = jobDao.verifyJobApplication(userId,jobId);
			System.out.println("value"+check);
			if(check){
				model.addAttribute("exists", true);
			}else{
			jobDao.applyJob(user, jobId);
			model.addAttribute("notexists", true);
			}
			}
			//jobDao.applyToJob(jobSeeker,post);
			
		}catch(Exception e) {
            System.out.println(e.getMessage());
			
		}
		return "jobSeekerSeachJobs";
	}
	
	@RequestMapping(value="/applyDetailedJob/{jobId}",method=RequestMethod.POST)
	public String applyDetailedJob(@PathVariable("jobId") long jobId, HttpServletRequest req,Model model,HttpSession session){
		try{
			User u = (User)session.getAttribute("userObj");
			if(u == null){
				model.addAttribute("nosession", true);
				return "loginJobSeeker";
			}else{
			JobDAO jobDao = new JobDAO();
			System.out.println("inside apply controller");
			
			JobSeeker js = (JobSeeker) req.getSession().getAttribute("userObj");
			String user = js.getEmailId();
			long userId = js.getPersonId();
			boolean check;
			check = jobDao.verifyJobApplication(userId,jobId);
			System.out.println("value"+check);
			if(check){
				model.addAttribute("exists", true);
			}else{
			jobDao.applyJob(user, jobId);
			model.addAttribute("notexists", true);
			}
			}
			//jobDao.applyToJob(jobSeeker,post);
			
		}catch(Exception e) {
            System.out.println(e.getMessage());
			
		}
		return "jobSeekerJobList";
	}
	
	
    public String handleFileUpload(HttpSession session,
            @RequestParam("resumeFile") CommonsMultipartFile resumeFile) throws Exception {
		System.out.println("inside file upload controller");
          JobSeekerDAO jsDao = new JobSeekerDAO();
          
        if (resumeFile != null) {
           
                  
                System.out.println("Saving file: " + resumeFile.getOriginalFilename());
                 
                JobSeeker js = (JobSeeker)session.getAttribute("userObj");
                //UploadFile uploadFile = new UploadFile();
                
                jsDao.saveh(js.getPersonId(),resumeFile);               
            
        }
  
        return "successUpload";
    }
	
	
	
	@RequestMapping(value="/appliedList.htm",method=RequestMethod.GET)
	public String appliedJobsList(@ModelAttribute("jobSeeker") JobSeeker jobApplicant,BindingResult result,HttpSession session,Model model)throws Exception{
		if(result.hasErrors()){
			return "jobSeekerHome";
		}
       
        List<JobsApplied> appliedList = new ArrayList<JobsApplied>();

        try {

        	User u = (User)session.getAttribute("userObj");
			if(u == null){
				model.addAttribute("nosession", true);
				return "loginJobSeeker";
			}else{
            User user = (User) session.getAttribute("userObj");
			long jobseekerId = user.getPersonId();

            JobDAO jobDao = new JobDAO();
            List<JobsApplied> jobsApplied =new ArrayList<JobsApplied>();
            jobsApplied = jobDao.getJobsAppliedByUserId(jobseekerId);
            
            model.addAttribute("appliedJobsList", jobsApplied);
			}
	}catch (Exception e) {
        System.out.println(e.getMessage());
   
    }
	return "jobSeekerAppliedJobList";
	}
	
}
