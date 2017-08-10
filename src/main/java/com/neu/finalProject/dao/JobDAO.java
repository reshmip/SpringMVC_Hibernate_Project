package com.neu.finalProject.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.neu.finalProject.pojo.JobPost;
import com.neu.finalProject.pojo.JobSeeker;
import com.neu.finalProject.pojo.JobsApplied;

public class JobDAO extends DAO{
	
	public JobPost getJobById(long jobId){
		Session session = getSession();
		JobPost post = null;
		try{
			System.out.println("inside get job by id dao");
			begin();
			Query query = session.createQuery("from JobPost where jobId = :jobId");
			query.setLong("jobId", jobId);
			post = (JobPost)query.uniqueResult();
			System.out.println("title"+post.getJobTitle());
			commit();
		}catch(HibernateException e){
			e.printStackTrace();
			rollback();
			
		}
		return post;
	}
	
	public List<JobPost> getJobByKey(String key){
		List<JobPost> jobPost = new ArrayList<JobPost>();
		try{
			begin();
			Query query = getSession().createQuery("from JobPost where jobTitle LIKE :key"
					+ " and jobPostStatus='Active'");
			query.setString("key","%"+key+"%");
			
			jobPost = query.list();
			commit();
		}catch(HibernateException e){
			e.printStackTrace();
			rollback();
		}
		return jobPost;
	}
	
	public List<JobPost> getJobByLoc(String loc){
		List<JobPost> jobPost = new ArrayList<JobPost>();
		try{
			begin();
			Query query = getSession().createQuery("from JobPost where locationCity LIKE :loc "
					+ " and jobPostStatus='Active'");
			query.setString("loc","%"+loc+"%");
			
			jobPost = query.list();
			commit();
		}catch(HibernateException e){
			e.printStackTrace();
			rollback();
		}
		return jobPost;
	}
	 
	public List<JobPost> getJobByKeyLoc(String key,String loc){
		List<JobPost> jobPost = new ArrayList<JobPost>();
		try{
			begin();
			Query query = getSession().createQuery("from JobPost where jobTitle LIKE :key and locationCity LIKE :loc "
					+ " and jobPostStatus='Active'");
			query.setString("key","%"+key+"%");
			query.setString("loc","%"+loc+"%");
			
			jobPost = query.list();
			commit();
		}catch(HibernateException e){
			e.printStackTrace();
			rollback();
		}
		return jobPost;
	}
	
	public List<JobPost> getJobsPostedByEmployer(long employerId){
		Session session = getSession();
		List<JobPost> jobList = new ArrayList<JobPost>();
		try{
			System.out.println("inside jobs by employer dao");
			begin();
			Query query = session.createQuery("from JobPost where PersonId =:employerId");
			query.setLong("employerId",employerId);
			jobList = query.list();
			commit();
		}catch(HibernateException e){
			e.printStackTrace();
			rollback();
		}
		return jobList;
	}
	
	public List<JobPost> getPagedJobsList(long employerId,int firstRes, int maxRes){
		Session session = getSession();
		List<JobPost> jobList = new ArrayList<JobPost>();
		try{
			System.out.println("inside jobs by employer dao");
			begin();
			Query query = session.createQuery("from JobPost where PersonId =:employerId").setFirstResult(firstRes).setMaxResults(maxRes);
			query.setLong("employerId",employerId);
			jobList = query.list();
			commit();
		}catch(HibernateException e){
			e.printStackTrace();
			rollback();
		}
		return jobList;
	}
	
	public void applyToJob(JobSeeker js, JobPost post){
		try{
			System.out.println("inside appy to job dao:"+js.getPersonId()+"post id:"+post.getJobId());
			begin();
			//js.getApplications().add(post);
			//post.getApplicants().add(js);
			//sessionFactory.getCurrentSession().update(js);
			
			getSession().update(post);
			commit();
		}catch(Exception e) {
			rollback();
            System.out.println(e.getMessage());
		}
		
	}
	
	public List<JobsApplied> getApplicant(String user,long jobId){
		
		JobsApplied jobsApplied = new JobsApplied();
		List<JobsApplied> applicants = new ArrayList<JobsApplied>();
	
		try{
			begin();
			
			Query query = getSession().createQuery("from JobPost where jobId =:jobId");
			query.setLong("jobId", jobId);
			JobPost post = (JobPost)query.uniqueResult();
			
			Query q = getSession().createQuery("from JobsApplied where jobPost =:post");
			//q.setString("email", user);
			q.setLong("post",jobId);
			applicants = q.list();
			
			commit();
		}catch(Exception e) {
			rollback();
            System.out.println(e.getMessage());
		}
		return applicants;
	}
	
	public JobsApplied getUserById(long personId){
		Session session = getSession();
		JobsApplied seeker = null;
		try{
			begin();
			Query query = session.createQuery("from JobsApplied where jobSeeker = :personId");
			query.setLong("personId", personId);
			seeker = (JobsApplied)query.uniqueResult();
			System.out.println("name"+seeker.getName());
			commit();
		}catch(HibernateException e){
			rollback();
			e.printStackTrace();
		}
		return seeker;
	}
	
	public List<JobsApplied> getJobsAppliedByUserId(long personId){
		Session session = getSession();
		List<JobsApplied> seekerJobs = new ArrayList<JobsApplied>();
		try{
			begin();
			Query query = session.createQuery("from JobsApplied where jobSeeker = :personId");
			query.setLong("personId", personId);
			
			seekerJobs = query.list();
			System.out.println("applied DAO size: "+seekerJobs.size());
			commit();
		}catch(HibernateException e){
			rollback();
			e.printStackTrace();
		}
		return seekerJobs;
	}

	public JobsApplied changeStatus(long personId,long jobId, String status){
		Session session = getSession();
		JobsApplied seeker = null;
		try{
			begin();
			Query query = session.createQuery("from JobsApplied where jobSeeker =:personId and jobPost =:jobId ");
			query.setLong("personId", personId);
			query.setLong("jobId", jobId);
			seeker = (JobsApplied)query.uniqueResult();
			seeker.setStatus(status);
			System.out.println("name"+seeker.getName());
			getSession().update(seeker);
			System.out.println("jobs applied updated");
			commit();
		}catch(HibernateException e){
			rollback();
			e.printStackTrace();
		}
		return seeker;
	}
	
	public List<JobPost> getPagedAppliedList(long personId,int firstRes,int maxRes){
		List<JobPost> jobList = null ;
		try {
            begin();
            Query q = getSession().createQuery("from JobPost j where j.jobId NOT IN" + "(select a.jobPost from JobsApplied a "
            		+ "where a.jobSeeker = :personId)"+"and jobPostStatus = 'Active'").setFirstResult(firstRes).setMaxResults(maxRes);
            q.setLong("personId", personId);
            jobList= q.list();
            System.out.println("paged list : "+jobList);
            commit();
            close();
            
        } catch (HibernateException e) {
            rollback();
            e.printStackTrace();
            
        }
		return jobList;
	}
	
	public List<JobPost> getNotAppliedList(long personId){
		List<JobPost> jobList = null ;
		try {
            begin();
            Query q = getSession().createQuery("from JobPost j where j.jobId NOT IN" + "(select a.jobPost from JobsApplied a "
            		+ "where a.jobSeeker = :personId)"+"and jobPostStatus = 'Active'");
            q.setLong("personId", personId);
            jobList= q.list();
            System.out.println("not applied list : "+jobList);
            commit();
            close();
            
        } catch (HibernateException e) {
            rollback();
            e.printStackTrace();
            
        }
		return jobList;
	}
	
	public boolean verifyJobApplication(long userId, long jobId){
		try{
			
			begin();
			Query query = getSession().createQuery("from JobsApplied where jobSeeker =:userId and jobPost =:jobId");
			query.setLong("userId", userId);
			query.setLong("jobId", jobId);
			JobsApplied ja = (JobsApplied)query.uniqueResult();
			System.out.println(ja);
			if(ja != null){
				return true;
			}
			commit();
		}catch(Exception e) {
			rollback();
            System.out.println(e.getMessage());
		}
		return false;
	}
	
	public void applyJob(String user, long jobId){
		JobSeekerDAO jsDao = new JobSeekerDAO();
		EmployerDAO empDao = new EmployerDAO();
		JobsApplied jobsApplied = new JobsApplied();
		
		try{
			System.out.println("inside appy to job dao:"+user+"post id:"+jobId);
			begin();
			Query query = getSession().createQuery("from JobSeeker where emailId =:email");
			query.setString("email", user);
			JobSeeker jobSeeker = (JobSeeker)query.uniqueResult();
			 //jobSeeker = jsDao.getUserByUserName(user);
			
			
		//	JobPost post =  getJobById(jobId);
			
			Query query1 = getSession().createQuery("from JobPost where jobId =:jobId");
			query1.setLong("jobId", jobId);
			JobPost post = (JobPost)query1.uniqueResult();
			
		
			System.out.println("jobseeker "+jobSeeker.getPersonId()+" postId: "+post.getJobId());
			
			jobsApplied.setJobSeeker(jobSeeker);
			jobsApplied.setJobPost(post);
			jobsApplied.setDateApplied(new Date());
			jobsApplied.setResumeFile(jobSeeker.getResumeFile());
			jobsApplied.setHigherEducation(jobSeeker.getHigherEducation());
			jobsApplied.setUniversityName(jobSeeker.getUniversityName());
			jobsApplied.setPhone(jobSeeker.getPhone());
			jobsApplied.setStatus("Applied");
			jobsApplied.setYearsOfExp(jobSeeker.getYearsOfExp());
			jobsApplied.setResumeName(jobSeeker.getResumeName());
			jobsApplied.setName(jobSeeker.getFirstName() +" " +jobSeeker.getLastName());
			jobsApplied.setEmailId(jobSeeker.getEmailId());
			jobsApplied.setConcentration(jobSeeker.getConcentration());
			//jobsApplied.setGpa(jobSeeker.getGpa());
			jobsApplied.setLocation(jobSeeker.getLocation());
			jobsApplied.setRecentEmployer(jobSeeker.getRecentEmployer());
			jobsApplied.setJobRole(jobSeeker.getJobRole());
			jobsApplied.setJobLocation(jobSeeker.getJobLocation());
			jobsApplied.setSkill1(jobSeeker.getSkill1());
			jobsApplied.setSkill2(jobSeeker.getSkill2());
			jobsApplied.setSkill3(jobSeeker.getSkill3());
			jobsApplied.setSkill4(jobSeeker.getSkill4());
			jobsApplied.setSkill5(jobSeeker.getSkill5());
			//jobSeeker.getJobApplied().add(post);
			//jobSeeker.getApplications().add(post);
			//post.getApplicants().add(jobSeeker);
			//sessionFactory.getCurrentSession().update(js);
			
			getSession().update(jobSeeker);
			System.out.println("Jobseeker updated");
			getSession().update(post);
			System.out.println("Post updated");
			getSession().save(jobsApplied);
			System.out.println("jobsApplied saved");
			commit();
		}catch(Exception e) {
			rollback();
            System.out.println(e.getMessage());
		}
		
	}
	
	public JobsApplied getAppliedResume(long jobId) {
		JobsApplied jobApplied=new JobsApplied();
		try{
			
			begin();
			Query query=getSession().createQuery("from JobsApplied where id=:jobId");
			query.setLong("jobId",jobId);
			jobApplied=(JobsApplied) query.uniqueResult();
			commit();
			
		}
		catch(Exception e){
			e.printStackTrace();
			rollback();
		}
		
		return jobApplied;
		
	}
	
	public JobsApplied getJobsApplied(long jobAppliedId) {
		JobsApplied ja=new JobsApplied();
		try{
			begin();
			System.out.println("inside view applicant details dao");
			Query q=getSession().createQuery("from JobsApplied where jobAppliedId=:jobAppliedId");
			q.setLong("jobAppliedId",jobAppliedId);
			ja=(JobsApplied) q.uniqueResult();
			commit();
		}
		catch(Exception e){
			e.printStackTrace();
			rollback();
			
		}
		return ja;

	}
	
	public JobPost getJobDetails(long jobId) {
		JobPost ja=new JobPost();
		try{
			begin();
			System.out.println("inside view job details dao");
			Query q=getSession().createQuery("from JobPost where jobId=:jobId");
			q.setLong("jobId",jobId);
			ja=(JobPost) q.uniqueResult();
			commit();
		}
		catch(Exception e){
			e.printStackTrace();
			rollback();
			
		}
		return ja;

	}
	
public void statusChange(String status, long id) {
		JobsApplied ja=new JobsApplied();
		try{
			begin();
			System.out.println("inside status change dao");
			Query q=getSession().createQuery("from JobsApplied where jobAppliedId=:jobAppliedId");
			q.setLong("jobAppliedId", id);
			ja=(JobsApplied) q.uniqueResult();
			ja.setStatus(status);
			getSession().update(ja);
			commit();
		}
		catch(Exception e){
			e.printStackTrace();
			rollback();
		}

	}



public void statusJobChange(String status, long id) {
	JobPost jp=new JobPost();
	try{
		begin();
		System.out.println("inside post status change dao");
		Query q=getSession().createQuery("from JobPost where jobId=:jobId");
		q.setLong("jobId", id);
		jp=(JobPost) q.uniqueResult();
		jp.setJobPostStatus(status);
		getSession().update(jp);
		commit();
	}
	catch(Exception e){
		e.printStackTrace();
		rollback();
	}

}

}