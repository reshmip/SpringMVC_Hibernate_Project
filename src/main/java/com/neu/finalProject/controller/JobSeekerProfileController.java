package com.neu.finalProject.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.neu.finalProject.dao.JobSeekerDAO;
import com.neu.finalProject.pojo.JobSeeker;
import com.neu.finalProject.pojo.User;

@Controller
public class JobSeekerProfileController {

	@Autowired
	@Qualifier("jobSeekerValidator")
	JobSeekerProfileValidator jobseekerValidator;
	
	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(jobseekerValidator);
	}
	
	@RequestMapping(value="/updateProfile.htm", method=RequestMethod.POST)
	public String submitJSProfile(@ModelAttribute("jobSeeker") JobSeeker jobSeeker,
			BindingResult result, Model model, HttpSession session, HttpServletResponse response) throws Exception{
		jobseekerValidator.validate(jobSeeker, result);
		System.out.println(result);
		System.out.println("phone"+jobSeeker.getPhone());
		JobSeeker js = new JobSeeker();
		if(result.hasErrors()){
			System.out.println("found error");
	
			return "jobSeekerUpdateProfile";
		}
		
		try{
			System.out.println("entered the profile submit controller");
			JobSeekerDAO jobSeekerDao = new JobSeekerDAO();
			User user = (User) session.getAttribute("userObj");
			long jobseekerId = user.getPersonId();
			System.out.println("jobseeker id:"+jobseekerId+"jobrole: "+jobSeeker.getJobRole());
			js = jobSeekerDao.submitProfile(jobSeeker.getPhone(),jobSeeker.getHigherEducation(),jobSeeker.getUniversityName(),jobSeeker.getConcentration(),
					jobSeeker.getLocation(),jobSeeker.getYearsOfExp(),jobSeeker.getRecentEmployer(),jobSeeker.getJobRole(),
					jobSeeker.getJobLocation(),jobSeeker.getSkill1(),jobSeeker.getSkill2(),jobSeeker.getSkill3(),jobSeeker.getSkill4(),jobSeeker.getSkill5(),jobseekerId);
			System.out.println("submitted profile");
			model.addAttribute("success",true);
			model.addAttribute("js",js);
			//obj.put("message", "Profile has been added successfully");
			return "jobSeekerUpdateProfile";
			
		}catch (Exception e) {
			System.out.println("Exception: " + e.getMessage());
			model.addAttribute("error",true);
			return "jobSeekerUpdateProfile";
			//obj.put("message", "Profile is not added");
		}
		
		
	}
	
	@RequestMapping(value="/updateProfile.htm",method=RequestMethod.GET)
	public String getUpdateProfile(Model model,HttpSession session){
		try{
		JobSeekerDAO jsDao = new JobSeekerDAO();
		JobSeeker js = new JobSeeker();
		User user = (User) session.getAttribute("userObj");
		System.out.println("inside home");
		long jobseekerId = user.getPersonId();
		System.out.println("id:"+jobseekerId);
		js = jsDao.getJobSeekerDetails(jobseekerId);
		System.out.println(jobseekerId+js.getHigherEducation());
		model.addAttribute("js", js);
		return "jobSeekerUpdateProfile";
		}catch (Exception e) {
			System.out.println("Exception: " + e.getMessage());
			return "jobSeekerUpdateProfile";
			//obj.put("message", "Profile is not added");
		}
		
	}

	
}
