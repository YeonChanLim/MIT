package com.mit.domain;

public class JoinVO {
	private int joinNo;
	private String joinPw;
	private String joinName;
	private String joinPhone;
	private int joinClass;
	private String joinText;
	private String joinDate;
	private String allowStatus;
	private int memberNo;
	
	private int rnum;

	public int getJoinNo() {
		return joinNo;
	}

	public void setJoinNo(int joinNo) {
		this.joinNo = joinNo;
	}

	public String getJoinPw() {
		return joinPw;
	}

	public void setJoinPw(String joinPw) {
		this.joinPw = joinPw;
	}

	public String getJoinName() {
		return joinName;
	}

	public void setJoinName(String joinName) {
		this.joinName = joinName;
	}

	public String getJoinPhone() {
		return joinPhone;
	}

	public void setJoinPhone(String joinPhone) {
		this.joinPhone = joinPhone;
	}

	public int getJoinClass() {
		return joinClass;
	}

	public void setJoinClass(int joinClass) {
		this.joinClass = joinClass;
	}

	public String getJoinText() {
		return joinText;
	}

	public void setJoinText(String joinText) {
		this.joinText = joinText;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	public String getAllowStatus() {
		return allowStatus;
	}

	public void setAllowStatus(String allowStatus) {
		this.allowStatus = allowStatus;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	@Override
	public String toString() {
		return "JoinVO [joinNo=" + joinNo + ", joinPw=" + joinPw + ", joinName=" + joinName + ", joinPhone=" + joinPhone
				+ ", joinClass=" + joinClass + ", joinText=" + joinText + ", joinDate=" + joinDate + ", allowStatus="
				+ allowStatus + ", memberNo=" + memberNo + ", rnum=" + rnum + "]";
	}
}
