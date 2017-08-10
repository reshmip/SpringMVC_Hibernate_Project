package com.neu.finalProject.controller;


import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.neu.finalProject.dao.UserDAO;
import com.neu.finalProject.pojo.Employer;
import com.neu.finalProject.pojo.User;



/**
 * Handles requests for the application home page.
 */
@Controller

public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value="/home.htm", method=RequestMethod.GET)
    public String initializeForm() { 
   
        return "home"; 
    }
	
	@RequestMapping(value="/postaJob.htm", method=RequestMethod.GET)
    public String getJobPostForm() { 
   
        return "postaJob"; 
    }
	
	@RequestMapping(value="/loginJobSeeker.htm", method=RequestMethod.GET)
    public String loginJSForm() { 
   
        return "loginJobSeeker"; 
    }
	
	@RequestMapping(value="/employerJobSeeker.htm", method=RequestMethod.GET)
    public String employerJSForm() { 
   
        return "loginEmployer"; 
    }
	
	@RequestMapping(value="/loginUser.htm", method=RequestMethod.POST)
	public String submitLoginJSForm(HttpServletRequest request,@ModelAttribute("user") User user,BindingResult result,Model model){
	
		if(result.hasErrors()){
			return "loginJobSeeker";
		}
		try{
			System.out.println("login controller");
		String userName = user.getEmailId();
		String pwd = user.getPassword();
		
		UserDAO userDao = new UserDAO();
		boolean res = userDao.authenticateUser(userName, pwd);
		User u = userDao.getUserByUserName(userName,pwd);
		if(res == true){
			HttpSession session = request.getSession(true);
			session.setAttribute("firstName", u.getFirstName());
			session.setAttribute("lastName", u.getLastName());
			System.out.println("name:"+u.getFirstName()+"email:"+u.getEmailId()+"role:"+u.getRole());
			session.setAttribute("userObj",u);
			model.addAttribute("firstname",u.getFirstName());
			if(u.getRole().equals("Job Seeker")){
				System.out.println("hi");
				return "jobSeekerPage1";
			}
			else if(u.getRole().equals("Employer"))
				return "employerPage1";
		}else{
			model.addAttribute("error",true);
			
		}
		return "loginJobSeeker";
		}
		
		catch(Exception e){
			e.printStackTrace();
			model.addAttribute("error",true);
			return "loginJobSeeker";
		}
		
	}
	
	@RequestMapping(value="/logout.htm", method = RequestMethod.GET )
	public String logoutMethod(HttpServletRequest request,HttpServletResponse response){
		System.out.println("logout");
		
		request.getSession().invalidate();
		
		return "home";
	}
	
	@RequestMapping(value="/applyJobFromHome/{jobId}",method=RequestMethod.POST)
	public String applyToJobFromHome(HttpSession session, Model model){
		User user = new User();
		user = (Employer)session.getAttribute("userObj");
		if(user == null){
			model.addAttribute("invalidsession", true);
			return "loginJobSeeker";
		}
		else{
			return "jobSeekerJobList";
		}
	}
}
