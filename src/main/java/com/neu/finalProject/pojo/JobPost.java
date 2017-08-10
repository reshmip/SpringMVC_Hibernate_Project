package com.neu.finalProject.pojo;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "jobpost")

public class JobPost {

	@Id
	@GeneratedValue
	@Column(name = "jobId", unique = true, nullable = false)
	private long jobId;

	@Column(name = "jobTitle")
	private String jobTitle;

	@Column(name = "city")
	private String locationCity;

	@Column(name = "companyName")
	private String companyName;

	@Column(name = "description")
	private String jobDescription;

	@Column(name = "jobtype")
	private String jobType;

	@Column(name = "education")
	private String eduLevel;

	@Column(name = "experience")
	private String expYears;

	/*
	@ManyToMany(mappedBy="applications") 
	private Set<JobSeeker> applicants = new HashSet<JobSeeker>();
	*/
	@OneToMany(mappedBy="jobPost")
	private Set<JobsApplied> jobApplied = new HashSet<JobsApplied>();
	 
	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "personId")
	private Employer employer;

	@Column(name="postedDate")
	private Date jobPostedDate;
	
	private String jobPostStatus;

	public JobPost() {

	}

	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	public long getJobId() {
		return jobId;
	}

	public void setJobId(long jobId) {
		this.jobId = jobId;
	}

	public String getLocationCity() {
		return locationCity;
	}

	public void setLocationCity(String locationCity) {
		this.locationCity = locationCity;
	}

	public String getJobDescription() {
		return jobDescription;
	}

	public void setJobDescription(String jobDescription) {
		this.jobDescription = jobDescription;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public String getEduLevel() {
		return eduLevel;
	}

	public void setEduLevel(String eduLevel) {
		this.eduLevel = eduLevel;
	}

	public String getExpYears() {
		return expYears;
	}

	public void setExpYears(String expYears) {
		this.expYears = expYears;
	}

	public Employer getEmployer() {
		return employer;
	}

	public void setEmployer(Employer employer) {
		this.employer = employer;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public Set<JobsApplied> getJobApplied() {
		return jobApplied;
	}

	public void setJobApplied(Set<JobsApplied> jobApplied) {
		this.jobApplied = jobApplied;
	}

	public Date getJobPostedDate() {
		return jobPostedDate;
	}

	public void setJobPostedDate(Date jobPostedDate) {
		this.jobPostedDate = jobPostedDate;
	}

	public String getJobPostStatus() {
		return jobPostStatus;
	}

	public void setJobPostStatus(String jobPostStatus) {
		this.jobPostStatus = jobPostStatus;
	}

	
}
