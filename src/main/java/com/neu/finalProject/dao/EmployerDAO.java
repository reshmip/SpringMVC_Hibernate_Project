package com.neu.finalProject.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.neu.finalProject.pojo.Employer;
import com.neu.finalProject.pojo.JobPost;

public class EmployerDAO extends DAO{

	public JobPost createPost(String title,String name, String desc, String eduLevel, 
			String yrsExp, String loc,String jobType,String jobPostStatus, long personId )throws Exception{
		try{
			begin();
			Query query = getSession().createQuery("from Employer where personId =:personId");
			query.setString("personId",String.valueOf(personId));

			Employer emp = (Employer)query.uniqueResult();
			JobPost post = new JobPost();
			post.setJobTitle(title.toLowerCase());
			post.setCompanyName(name.toLowerCase());
			post.setJobDescription(desc.toLowerCase());
			post.setEduLevel(eduLevel.toLowerCase().toLowerCase());
			post.setExpYears(yrsExp.toLowerCase());
			post.setLocationCity(loc.toLowerCase());
			post.setJobPostStatus(jobPostStatus.toLowerCase());
			post.setJobPostedDate(new Date());
			post.setJobType(jobType.toLowerCase());
			post.setEmployer(emp);
			
			getSession().save(post);
			commit();
			return post;
			
		}catch (HibernateException e) {
			e.printStackTrace();
            rollback();
            throw new Exception("Exception while creating user: " + e.getMessage());
        }
	}
	
	public JobPost updatePost(String title,String name, String desc, String eduLevel, 
			String yrsExp, String loc,String jobType, long jobId,String status,long empId )throws Exception{
		try{
			begin();
			Query query = getSession().createQuery("from Employer where personId =:empId");
			query.setLong("empId",empId);
			Employer emp = (Employer)query.uniqueResult();
			System.out.println("emp id: "+emp.getPersonId());
			Query query1 = getSession().createQuery("from JobPost where jobId =:jobId");
			query1.setLong("jobId",jobId);
			JobPost post = (JobPost)query1.uniqueResult();
			System.out.println("job id: "+jobId);
			//JobPost post = new JobPost();
			post.setJobTitle(title);
			post.setCompanyName(name);
			post.setJobDescription(desc);
			post.setEduLevel(eduLevel);
			post.setExpYears(yrsExp);
			post.setLocationCity(loc);
			post.setJobType(jobType);
			post.setJobPostedDate(new Date());
			post.setJobType(jobType);
			post.setEmployer(emp);
			post.setJobPostStatus(status);
			getSession().update(post);
			commit();
			return post;
			
		}catch (HibernateException e) {
			e.printStackTrace();
            rollback();
            throw new Exception("Exception while creating user: " + e.getMessage());
        }
	}
	
	public List list() throws Exception {
        try {
            begin();
            Query q = getSession().createQuery("from Employer");
            List list = q.list();
            System.out.println("emp size:"+list.size());
            commit();
            return list;
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not list the categories", e);
        }
    }
}
