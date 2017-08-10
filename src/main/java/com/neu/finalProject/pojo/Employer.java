package com.neu.finalProject.pojo;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;


@Entity
@Table(name="employer")
@PrimaryKeyJoinColumn(name="personId")
public class Employer extends User{

	@Column(name = "companyname")
	private String companyName;
	
	@Column(name = "location")
	private String location;
	

	@OneToMany(fetch = FetchType.EAGER,mappedBy="employer")
	private Set<JobPost> posts = new HashSet<JobPost>();
	
	public Employer(){
		
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Set<JobPost> getPosts() {
		return posts;
	}

	public void setPosts(Set<JobPost> posts) {
		this.posts = posts;
	}
	
	
}
