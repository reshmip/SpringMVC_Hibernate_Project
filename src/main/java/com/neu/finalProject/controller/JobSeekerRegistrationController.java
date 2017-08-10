package com.neu.finalProject.controller;

import javax.servlet.http.HttpServletRequest;

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

import com.neu.finalProject.dao.SignUpDAO;
import com.neu.finalProject.pojo.User;

@Controller
@RequestMapping(value="/jobSeekerAccount.htm")
public class JobSeekerRegistrationController {

	@Autowired
	@Qualifier("userValidator")
	RegistrationValidator validator;

	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String submitJSForm(HttpServletRequest request,@ModelAttribute("user") User user,BindingResult result, Model model) throws Exception{
		validator.validate(user, result);
		if(result.hasErrors()){
			return "registerJobSeeker";
		}
		
		try{
			System.out.println("entered the controller");
			SignUpDAO signUpDao = new SignUpDAO();
			String role = "Job Seeker";
			
			signUpDao.createJobSeekerAcc(user.getFirstName(),user.getLastName(),user.getEmailId(),user.getPassword(),role);
			/*
			UserDAO userDao = new UserDAO();
			User u = userDao.getUserByUserName(user.getEmailId(), user.getPassword());
			System.out.println("name:"+u.getEmailId() );
			
			request.getSession().setAttribute("userObj", u);
			request.getSession().setAttribute("username", u.getEmailId());
			*/
			model.addAttribute("created", true);
			return "loginJobSeeker";
		} catch (Exception e) {
			System.out.println("Exception: " + e.getMessage());
			model.addAttribute("error",true);
			return "registerJobSeeker";
		}
		
	}
	
}
