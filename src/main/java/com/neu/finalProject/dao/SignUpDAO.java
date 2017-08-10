package com.neu.finalProject.dao;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.neu.finalProject.pojo.Employer;
import com.neu.finalProject.pojo.JobSeeker;
import com.neu.finalProject.pojo.User;

public class SignUpDAO extends DAO{

	public SignUpDAO(){
		
	}
	
	public JobSeeker createJobSeekerAcc(String firstName, String lastName, String emailId, String pwd,String role) throws Exception{
		try{
			begin();
			System.out.println("inside the jsDao");
			//JobSeeker jobseeker = new JobSeeker(emailId,pwd);
			JobSeeker user = new JobSeeker();
			if(role.equals("Job Seeker")){
				
				user.setFirstName(firstName);
				user.setLastName(lastName);
				user.setEmailId(emailId);
				user.setPassword(pwd);
				user.setRole(role);
				
				
			}
			getSession().save(user);
			commit();
			return user;
		}catch (HibernateException e) {
            rollback();
            //throw new AdException("Could not create user " + username, e);
            throw new Exception("Exception while creating user: " + e.getMessage());
        }
	}
	
	public Employer createEmployerAcc(String firstName, String lastName, String emailId, String pwd,String role) throws Exception{
		try{
			begin();
			System.out.println("inside the jsDao");
			Employer user = new Employer();
			if(role.equals("Employer")){
				
				user.setFirstName(firstName);
				user.setLastName(lastName);
				user.setEmailId(emailId);
				user.setPassword(pwd);
				user.setRole(role);
				
				
			}
			getSession().save(user);
			commit();
			return user;
		}catch (HibernateException e) {
            rollback();
            //throw new AdException("Could not create user " + username, e);
            throw new Exception("Exception while creating user: " + e.getMessage());
        }
	}
	
	public boolean isExists(User user){
		Session session = (Session) DAO.sessionThread.get();
		boolean result = false;
		
		try{
			begin();
			Query query = session.createQuery("from User where emailId='"+user.getEmailId()+"'");
			User u = (User)query.uniqueResult();
			commit();
			
			if(u!=null)
				System.out.println("found a user");
				result = true;
		}catch(HibernateException e){
			rollback();
			e.printStackTrace();
		}
		return result;
	}
}
