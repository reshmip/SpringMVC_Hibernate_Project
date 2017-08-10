package com.neu.finalProject.pojo;



import java.sql.Blob;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="jobs_applied")
public class JobsApplied {

	@Id
	@GeneratedValue
	@Column(name="job_applied_Id")
	private long jobAppliedId;
	
	@ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "person_Id")
	private JobSeeker jobSeeker;
	
	@ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "jobpost_Id")
	private JobPost jobPost;
	
	@Column(name="dateApplied")
	@Temporal(TemporalType.DATE)
	private Date dateApplied;
	
	private String status;
	
	@Column(name="resumeName")
	private String resumeName;
	
	@Lob
	@Column(name="resumeFile")
	private Blob resumeFile;
	
	@Column(name="filetype")
	private String fileType;
	
	private String emailId;
	
	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	@Column(name="phone")
	private String phone;
	
	@Column(name="name")
	private String name;
	
	@Column(name="higherEducation")
	private String higherEducation;
	
	@Column(name="universityName")
	private String universityName;
	
	@Column(name="yearsOfExp")
	private int yearsOfExp;
	
	private String concentration;
	
	private String location;
	
	private String recentEmployer;
	
	private String jobRole;
	
	private String jobLocation;
	
	private String skill1;
	
	private String skill2;
	
	private String skill3;
	
	private String skill4;
	
	private String skill5;
	
	private String profileStatus;
	
	public JobsApplied(){
		
	}
	
	

	public String getConcentration() {
		return concentration;
	}

	public void setConcentration(String concentration) {
		this.concentration = concentration;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getRecentEmployer() {
		return recentEmployer;
	}

	public void setRecentEmployer(String recentEmployer) {
		this.recentEmployer = recentEmployer;
	}

	public String getJobRole() {
		return jobRole;
	}

	public void setJobRole(String jobRole) {
		this.jobRole = jobRole;
	}

	public String getJobLocation() {
		return jobLocation;
	}

	public void setJobLocation(String jobLocation) {
		this.jobLocation = jobLocation;
	}

	public String getSkill1() {
		return skill1;
	}

	public void setSkill1(String skill1) {
		this.skill1 = skill1;
	}

	public String getSkill2() {
		return skill2;
	}

	public void setSkill2(String skill2) {
		this.skill2 = skill2;
	}

	public String getSkill3() {
		return skill3;
	}

	public void setSkill3(String skill3) {
		this.skill3 = skill3;
	}

	public String getSkill4() {
		return skill4;
	}

	public void setSkill4(String skill4) {
		this.skill4 = skill4;
	}

	public String getSkill5() {
		return skill5;
	}

	public void setSkill5(String skill5) {
		this.skill5 = skill5;
	}


	public long getJobAppliedId() {
		return jobAppliedId;
	}

	public void setJobAppliedId(long jobAppliedId) {
		this.jobAppliedId = jobAppliedId;
	}

	public JobSeeker getJobSeeker() {
		return jobSeeker;
	}

	public void setJobSeeker(JobSeeker jobSeeker) {
		this.jobSeeker = jobSeeker;
	}

	public JobPost getJobPost() {
		return jobPost;
	}

	public void setJobPost(JobPost jobPost) {
		this.jobPost = jobPost;
	}

	public Date getDateApplied() {
		return dateApplied;
	}

	public void setDateApplied(Date dateApplied) {
		this.dateApplied = dateApplied;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getResumeName() {
		return resumeName;
	}

	public void setResumeName(String resumeName) {
		this.resumeName = resumeName;
	}

	public Blob getResumeFile() {
		return resumeFile;
	}

	public void setResumeFile(Blob resumeFile) {
		this.resumeFile = resumeFile;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getHigherEducation() {
		return higherEducation;
	}

	public void setHigherEducation(String higherEducation) {
		this.higherEducation = higherEducation;
	}

	public String getUniversityName() {
		return universityName;
	}

	public void setUniversityName(String universityName) {
		this.universityName = universityName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getYearsOfExp() {
		return yearsOfExp;
	}

	public void setYearsOfExp(int yearsOfExp) {
		this.yearsOfExp = yearsOfExp;
	}

	public String getProfileStatus() {
		return profileStatus;
	}

	public void setProfileStatus(String profileStatus) {
		this.profileStatus = profileStatus;
	}

}
