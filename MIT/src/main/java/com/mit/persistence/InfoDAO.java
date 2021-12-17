package com.mit.persistence;

import java.util.List;

import com.mit.domain.InfoFileVO;
import com.mit.domain.InfoVO;

public interface InfoDAO {

	public int create(InfoVO vo) throws Exception;

	public InfoVO read(int infoNo) throws Exception;

	public void update(InfoVO vo) throws Exception;

	public void delete(int infoNo) throws Exception;
	
	public List<InfoVO> list() throws Exception;
	
	// ���� ���
	public void insertFile(InfoFileVO fVo) throws Exception;

	// ���� ����
	public void deleteFile(int infoNo) throws Exception;

	// ���� ���
	public List<InfoFileVO> fileList(int infoNo) throws Exception;

	// �Խñ��� ��ȸ�� ������Ʈ ���
	public void updateViewCount(int infoNo) throws Exception;
}
