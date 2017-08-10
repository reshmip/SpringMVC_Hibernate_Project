package com.neu.finalProject.controller;

import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.inject.Qualifier;
import javax.mail.internet.MimeMessage;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.HtmlEmail;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.neu.finalProject.dao.SignUpDAO;
import com.neu.finalProject.pojo.User;


/**
 * @author Reshmi
 *
 */
@Controller
public class SignUpController {

	@Autowired
	
	
	
	@RequestMapping(value="/registerJobSeeker.htm", method=RequestMethod.GET)
    public String registerJSForm() { 
   
        return "registerJobSeeker"; 
    } 
	
	
	@RequestMapping(value="/registerEmployer.htm", method=RequestMethod.GET)
    public String loginEmpForm() { 
   
        return "registerEmployer"; 
    } 
	
	@RequestMapping(value="/registerEmployer.htm", method=RequestMethod.POST)
	public String submitEmpForm(@ModelAttribute("user") User user,BindingResult result,Model model) throws Exception{
		if(result.hasErrors()){
			return "registerEmployer";
		}
		
		try{
			System.out.println("entered the controller");
			SignUpDAO signUpDao = new SignUpDAO();
			String role = "Employer";
			signUpDao.createEmployerAcc(user.getFirstName(),user.getLastName(),user.getEmailId(),user.getPassword(),role);
			model.addAttribute("created",true);
			System.out.println("going into email");
		
			
		
			
			return "loginJobSeeker";
		} catch (Exception e) {
			System.out.println("Exception: " + e.getMessage());
			model.addAttribute("error",true);
			return "registerEmployer";
		}
		
	}
	
}
