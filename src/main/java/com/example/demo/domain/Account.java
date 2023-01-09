package com.example.demo.domain;

public class Account {
	  private int id;
	  private int memberId;
	  private int employeeId;
	  private String account;
	  private String password;
	  private String checkCode;
	  private String iv;
	  private int accountType;
	  private Member member;

	  public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Account() {}

	  public int getId() {
	    return this.id;
	  }

	  public void setId(int id) {
	    this.id = id;
	  }

	  public int getMemberId() {
	    return this.memberId;
	  }

	  public void setMemberId(int memberId) {
	    this.memberId = memberId;
	  }

	  public int getEmployeeId() {
	    return this.employeeId;
	  }

	  public void setEmployeeId(int employeeId) {
	    this.employeeId = employeeId;
	  }

	  public String getAccount() {
	    return this.account;
	  }

	  public void setAccount(String account) {
	    this.account = account;
	  }

	  public String getPassword() {
	    return this.password;
	  }

	  public void setPassword(String password) {
	    this.password = password;
	  }

	  public String getCheckCode() {
	    return this.checkCode;
	  }

	  public void setCheckCode(String checkCode) {
	    this.checkCode = checkCode;
	  }

	  public String getIv() {
	    return this.iv;
	  }

	  public void setIv(String iv) {
	    this.iv = iv;
	  }

	  public int getAccountType() {
	    return this.accountType;
	  }

	  public void setAccountType(int accountType) {
	    this.accountType = accountType;
	  }
	}

	  

