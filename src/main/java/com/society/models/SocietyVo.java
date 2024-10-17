package com.society.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "SocietyVo")
public class SocietyVo {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	private String societyName;

	private String socityAddress;

	private String constructedBy;

	private String RERANumber;

	private String contactNumber;

	private String emailAddress;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSocietyName() {
		return societyName;
	}

	public void setSocietyName(String societyName) {
		this.societyName = societyName;
	}

	public String getSocityAddress() {
		return socityAddress;
	}

	public void setSocityAddress(String socityAddress) {
		this.socityAddress = socityAddress;
	}

	public String getConstructedBy() {
		return constructedBy;
	}

	public void setConstructedBy(String constructedBy) {
		this.constructedBy = constructedBy;
	}

	public String getRERANumber() {
		return RERANumber;
	}

	public void setRERANumber(String rERANumber) {
		RERANumber = rERANumber;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	
	

}
