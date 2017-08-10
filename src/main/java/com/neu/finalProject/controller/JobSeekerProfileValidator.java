package com.neu.finalProject.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import com.neu.finalProject.pojo.JobSeeker;

public class JobSeekerProfileValidator implements Validator{

	@Override
	public boolean supports(Class aClass) {
		// TODO Auto-generated method stub
		return aClass.equals(JobSeeker.class);
	}

	@Override
	public void validate(Object o, Errors errors) {
		// TODO Auto-generated method stub
		JobSeeker jobseeker = (JobSeeker)o;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "error.invalid.jobseeker", "enter a valid 10 digit number");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "universityName", "error.invalid.jobseeker","university name is required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "concentration", "error.invalid.jobseeker","enter field of study");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "location", "error.invalid.jobseeker","enter study location");
	}

}
