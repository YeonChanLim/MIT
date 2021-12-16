package com.mit.service;

import java.util.List;

import com.mit.domain.FreeFileVO;
import com.mit.domain.FreeVO;

public interface FreeService {
	
	public void register(FreeVO vo) throws Exception;
	
	public FreeVO read(int freeNo) throws Exception;
	
	// �����Խ��� : �Խù� ����
	public void modify(FreeVO vo) throws Exception;
	
	public void remove(int freeNo) throws Exception;
	
	public List<FreeVO> list() throws Exception;
	
	// ÷������ ���
	public List<FreeFileVO> fileList(int freeNo) throws Exception;
}
