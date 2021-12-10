
package com.mit.domain;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

public class InfoVO {

	private int infoNo;
	private int infoClass;
	private String infoTitle;
	private String infoContent;
	private Date infoDate;
	private int infoView;
	private int memberNo;
	private String memberName;

	private String[] files;
	private ArrayList<InfoFileVO> filList;
	private int commentNo;
	private int rnum;

	public int getInfoNo() {
		return infoNo;
	}

	public void setInfoNo(int infoNo) {
		this.infoNo = infoNo;
	}

	public int getInfoClass() {
		return infoClass;
	}

	public void setInfoClass(int infoClass) {
		this.infoClass = infoClass;
	}

	public String getInfoTitle() {
		return infoTitle;
	}

	public void setInfoTitle(String infoTitle) {
		this.infoTitle = infoTitle;
	}

	public String getInfoContent() {
		return infoContent;
	}

	public void setInfoContent(String infoContent) {
		this.infoContent = infoContent;
	}

	public Date getInfoDate() {
		return infoDate;
	}

	public void setInfoDate(Date infoDate) {
		this.infoDate = infoDate;
	}

	public int getInfoView() {
		return infoView;
	}

	public void setInfoView(int infoView) {
		this.infoView = infoView;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	public ArrayList<InfoFileVO> getFilList() {
		return filList;
	}

	public void setFilList(ArrayList<InfoFileVO> filList) {
		this.filList = filList;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	@Override
	public String toString() {
		return "InfoVO [infoNo=" + infoNo + ", infoClass=" + infoClass + ", infoTitle=" + infoTitle + ", infoContent="
				+ infoContent + ", infoDate=" + infoDate + ", infoView=" + infoView + ", memberNo=" + memberNo
				+ ", memberName=" + memberName + ", files=" + Arrays.toString(files) + ", filList=" + filList
				+ ", commentNo=" + commentNo + ", rnum=" + rnum + "]";
	}

}
