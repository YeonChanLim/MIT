package com.mit.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	private int totalCount; // �Խñ��� ��ü ��
	private int startPage;
	private int endPage;
	private boolean prev; // ���� �������� �ִ��� ������
	private boolean next; // ���� �������� �ִ��� ������
	
	private int displayPageNum = 10; // ȭ�� �ϴܿ� ������ ��ũ ��� �������� ����
	
	private Criteria cri; // ���� ������ ������ ���ϰ� �ִ� cri

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		// ��ü �Խñ� ���� �����Ǹ� ����¡�� ����Ѵ�.
		calcData();
	}
	
	//����¡�� ����ϴ� method
	private void calcData() {
		// ������ ��ư�� ���۰� �� ���
		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
		
		// ������ ��ư�� 10�� �̻� �� ��� ó��
		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
		
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		// prev, next ��ư ���
		prev = startPage == 1 ? false : true; // startPage�� 1�̸� false, �ƴϸ� true
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	}
	
	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	// ����¡ ��ư���� ����� ������ �̵� ��ũ(QueryString) ����� �� jsp���� ���
	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page).queryParam("perPageNum", cri.getPerPageNum()).build();
		
		return uriComponents.toUriString();
	}
	
	// ����¡ ��ư���� ����� ������ �̵� ��ũ (�˻� ���(searchType, keyword) ����) ����� �� jsp���� ���
	public String makeSearch(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
			.queryParam("perPageNum", cri.getPerPageNum())
			.queryParam("searchType", ((SearchCriteria)cri).getSearchType())
			.queryParam("keyword", ((SearchCriteria)cri).getKeyword()).build();
		
		return uriComponents.toUriString();
	}

	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", cri=" + cri + "]";
	}
	
	
}
