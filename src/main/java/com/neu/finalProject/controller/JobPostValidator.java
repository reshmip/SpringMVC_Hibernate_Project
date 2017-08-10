package com.neu.finalProject.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.neu.finalProject.pojo.JobPost;
import com.neu.finalProject.pojo.User;

public class JobPostValidator implements Validator{

	@Override
	public boolean supports(Class aClass) {
		// TODO Auto-generated method stub
		return aClass.equals(JobPost.class);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		JobPost jobpost = (JobPost) obj;
		System.out.println("hi");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "jobTitle", "error.invalid.jobpost", "title for job is required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "locationCity", "error.invalid.jobpost", "location for job is required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "companyName", "error.invalid.jobpost", "enter the company name");
        
	}

}
