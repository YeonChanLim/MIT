package com.mit.service;

import java.util.List;

import com.mit.domain.FreeFileVO;
import com.mit.domain.FreeVO;
import com.mit.domain.SearchCriteria;

public interface FreeService {
	public void create(FreeVO vo) throws Exception;
	
	public FreeVO read(int freeNo) throws Exception;
	
	// �����Խ��� : �Խù� ����
	public void update(FreeVO vo) throws Exception;
	
	public void delete(int freeNo) throws Exception;
	
	public List<FreeVO> listSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	// ÷������ ���
	public List<FreeFileVO> fileList(int freeNo) throws Exception;
}
