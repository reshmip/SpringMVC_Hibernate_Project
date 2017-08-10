package com.neu.finalProject.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;

@Entity
@Table(name="user")
@Inheritance(strategy=InheritanceType.JOINED)
public class User{

	@Id
	@GeneratedValue
	@Column(name="personId",nullable=false,unique=true)
	private long personId;
	
	@Column(name="firstname")
	private String firstName;
	
	@Column(name="lastname")
	private String lastName; 
	
	@Column(name="emailId",unique=true)
	private String emailId;
	
	@Column(name="password")
	private String password;
	
	@Column(name="role")
	private String role;
	
	public User(){
		
	}
	
	public User(String emailId, String password){
		this.emailId = emailId;
		this.password = password;
	}
	
	public User(String emailId, String password, String role, String firstName, String lastName){
		this.emailId = emailId;
		this.password = password;
		this.role = role;
		this.firstName = firstName;
		this.lastName = lastName;
	}
	
	

	public long getPersonId() {
		return personId;
	}

	public void setPersonId(long personId) {
		this.personId = personId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
}
