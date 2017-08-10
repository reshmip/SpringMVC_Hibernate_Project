package com.neu.finalProject.dao;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.neu.finalProject.pojo.User;

public class UserDAO extends DAO{
	
	public UserDAO(){
		
	}

	public boolean authenticateUser(String userName, String pwd){
		User user = getUserByUserName(userName,pwd);
		if(user!=null && user.getEmailId().equals(userName) && user.getPassword().equals(pwd)){
			System.out.println("The user exists");
			return true;
		}else{
			System.out.println("The user do not exist");
			return false;
		}
	}
	
	public User getUserByUserName(String userName, String password){
		Session session = getSession();
		User user = null;
		try{
			begin();
			Query query = session.createQuery("from User where emailId = :email and password = :pwd");
			query.setString("email", userName);
			query.setString("pwd", password);
			user = (User)query.uniqueResult();
			System.out.println("name"+user.getFirstName()+" email "+ user.getEmailId());
			commit();
		}catch(HibernateException e){
			rollback();
			e.printStackTrace();
		}
		return user;
	}
	
	

    
	/*
	public User loginUser(String userName, String password){
		
		try{
			begin();
			System.out.println("inside user login dao");
			Session session = (Session) DAO.sessionThread.get();
			Query query = null;
			List<User> list = new ArrayList<User>();
			String hql = "select role from user where emailId:emailId and password:password";
			query = session.createQuery(hql);
			query.setParameter("emailId", userName);
			query.setParameter("password", password);
			list = query.list();
			if(list.equals("Job Seeker")){
				return 
			}
			//List result = session.createQuery("select from User where emailId:emailId,password:password").list();
		}catch(HibernateException e){
			e.printStackTrace();
		}
		return 
	}
	*/
	
}
