package com.neu.finalProject.controller;

import javax.servlet.http.HttpServletRequest;
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

import com.neu.finalProject.dao.EmployerDAO;
import com.neu.finalProject.pojo.JobPost;
import com.neu.finalProject.pojo.User;

@Controller
//@RequestMapping(value="/submitPost.htm")
public class JobPostController {

	@RequestMapping(value="/submitPost.htm",method=RequestMethod.POST)
	public String submitJobPost(@ModelAttribute("jobPost") JobPost jobpost,BindingResult result,
			HttpServletRequest request, Model model, HttpSession session) throws Exception{

		if(result.hasErrors()){
			System.out.println("error found");
			return "postJob";
		}
		System.out.println("inside submit post controller");
		
			try{
				
				EmployerDAO empDao = new EmployerDAO();
				User user = (User) session.getAttribute("userObj");
				long employerId = user.getPersonId();
				System.out.println("employer id:"+employerId);
				String jobPostStatus = "Active";
				
				empDao.createPost(jobpost.getJobTitle(),jobpost.getCompanyName(), jobpost.getJobDescription(),jobpost.getEduLevel(),
						jobpost.getExpYears(),jobpost.getLocationCity(),jobpost.getJobType(),jobPostStatus,employerId);
				model.addAttribute("success",true);
			}catch (Exception e) {
				System.out.println("Exception: " + e.getMessage());
				model.addAttribute("error",true);
			}
		return "postJob";
	}
}
