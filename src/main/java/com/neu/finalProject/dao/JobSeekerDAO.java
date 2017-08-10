package com.neu.finalProject.dao;

import java.sql.Blob;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import com.neu.finalProject.pojo.JobSeeker;
import com.neu.finalProject.pojo.JobsApplied;

public class JobSeekerDAO extends DAO{

	public JobSeekerDAO(){
		
	}
	
	public JobSeeker submitProfile(String phone, String eduLevel, String univName, String conct,
			String loc,int yrOfExp,String recentEmp,String jobRole,String jobLoc,String skill1,String skill2,
			String skill3,String skill4,String skill5,long personId)
				throws Exception{
		try{
			begin();
			System.out.println("inside submitProfile DAO");
			 Query query = getSession().createQuery("from JobSeeker where personId =:personId");
			 query.setString("personId",String.valueOf(personId));
			  
			 JobSeeker js = (JobSeeker) query.uniqueResult();
			 js.setPhone(phone);
			 js.setHigherEducation(eduLevel);
			 js.setUniversityName(univName);
			 js.setConcentration(conct);
			 //js.setGpa(gpa);
			 js.setLocation(loc);
			 js.setYearsOfExp(yrOfExp);
			 js.setRecentEmployer(recentEmp);
			 js.setJobRole(jobRole);
			 js.setJobLocation(jobLoc);
			 js.setProfileStatus("added");
			 js.setSkill1(skill1);
			 js.setSkill2(skill2);
			 js.setSkill3(skill3);
			 js.setSkill4(skill4);
			 js.setSkill5(skill5);
			 System.out.println("values of JS set in DAO");
			 getSession().update(js);
			 commit();
			 return js;
			 
		}catch (HibernateException e) {
            rollback();
            throw new Exception("Exception while creating user: " + e.getMessage());
        }
	}
	
	public void saveh(long personId, CommonsMultipartFile resumeFile) {
		begin();
		Query query = getSession().createQuery("from JobSeeker where personId =:personId");
		 query.setLong("personId",personId);
		 JobSeeker js = (JobSeeker) query.uniqueResult();
		 //js.setResumeFile(resumeFile.getBytes());
         js.setResumeName(resumeFile.getOriginalFilename());
		  
		 getSession().update(js);
        commit();
    }
	
	public void uploadResume(long personId, Blob resumeFile, String originalFilename, String contentType) {
		begin();
		Query q = getSession().createQuery("from JobSeeker where personId = :personId");
		 q.setLong("personId",personId);
		 System.out.println(resumeFile);
		 JobSeeker j = (JobSeeker) q.uniqueResult(); 
		 System.out.println(contentType);
		 j.setResumeFile(resumeFile);
		 j.setResumeName(originalFilename);
		 j.setFileType(contentType);
		 
		 getSession().update(j);
		 commit();
		
	}
	
	public JobSeeker UploadedResume(long userId) {
		JobSeeker jobseeker=new JobSeeker();
		try{
			
			begin();
			Query query=getSession().createQuery("from JobSeeker where personId=:userId");
			query.setLong("userId",userId);
			jobseeker=(JobSeeker) query.uniqueResult();
			commit();
			
		}
		catch(Exception e){
			e.printStackTrace();
			rollback();
		}
		
		return jobseeker;
		
	}
	
	
	public JobSeeker getUserByUserName(String userName){
		Session session = getSession();
		JobSeeker jobSeeker = null;
		try{
			begin();
			Query query = session.createQuery("from JobSeeker where emailId = :email");
			query.setString("email", userName);
			jobSeeker = (JobSeeker)query.uniqueResult();
			System.out.println("name"+jobSeeker.getFirstName()+" email "+ jobSeeker.getEmailId());
			commit();
		}catch(HibernateException e){
			rollback();
			e.printStackTrace();
		}
		return jobSeeker;
	}
	
	
	public JobSeeker getJobSeekerDetails(long personId){
		JobSeeker j = new JobSeeker();
		try{
			begin();
			System.out.println("inside js details dao");
			Query q = getSession().createQuery("from JobSeeker where personId = :personId");
			 q.setLong("personId",personId);
			 j = (JobSeeker) q.uniqueResult(); 
		
			System.out.println("query executed");
			//System.out.println(j.getFirstName());
			
			
			commit();
			
			 
		}catch (HibernateException e) {
			e.printStackTrace();
			rollback();
           
		}
		return j;
	}
	
	
}
