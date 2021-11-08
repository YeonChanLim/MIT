package com.mit.domain;

public class Criteria {
	private int page; // ���� ��, ������ ������
	private int perPageNum; // ȭ�鿡 ������ �Խñ� ��
	
	private int startPage;// MyBatis(DB����)���� ����� ���� ������ 
	
	public Criteria() { // �����ڷ� ����¡ �ʱ�ȭ
		this.page = 1;
		this.perPageNum = 6;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page <= 0) { // ����¡�� ���� ���� ���� ó��; 0���� �۰ų� ���� ���
			this.page = 1;
			return;
		}
		
		this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	
	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	// method for MyBatis SQL Mapper
	public int getPageEnd() {
		return this.startPage +5;
	}
	
	public int getPageStart() {
		this.startPage = (this.page * this.perPageNum)-5;
		return this.startPage;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", startPage=" + startPage + "]";
	}
}
