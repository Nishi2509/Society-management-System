package com.society.models;

import javax.persistence.*;

@Entity
@Table(name = "membervo")
public class MemberVo {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "memberId")
	private int id;

	@Column(name = "memberName")
	private String memberName;

	@Column(name = "memberPhoneNo")
	private String memberPhoneNo;

	@Column(name = "memberEmail")
	private String memberEmail;


	@Column(name = "fileName")
	private String fileName;

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@ManyToOne
	@JoinColumn(name = "ownerId")
	private OwnerVo ownerVo;

	@ManyToOne
	@JoinColumn(name = "loginId")
	private LoginVo loginVo;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberPhoneNo() {
		return memberPhoneNo;
	}

	public void setMemberPhoneNo(String memberPhoneNo) {
		this.memberPhoneNo = memberPhoneNo;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public OwnerVo getOwnerVo() {
		return ownerVo;
	}

	public void setOwnerVo(OwnerVo ownerVo) {
		this.ownerVo = ownerVo;
	}

	public LoginVo getLoginVo() {
		return loginVo;
	}

	public void setLoginVo(LoginVo loginVo) {
		this.loginVo = loginVo;
	}

}
