
package com.mit.persistence;

import java.util.List;

import com.mit.domain.InfoFileVO;
import com.mit.domain.InfoVO;
import com.mit.domain.SearchCriteria;

public interface InfoDAO {

	public int create(InfoVO vo) throws Exception;

	public InfoVO read(int infoNo) throws Exception;

	public void update(InfoVO vo) throws Exception;

	public void delete(int infoNo) throws Exception;

	// ����¡ + �˻��� ó���Ͽ� ����Ʈ �������� ���
	public List<InfoVO> listSearch(SearchCriteria cri) throws Exception;

	// ����¡ + �˻��� ���� ��ü �Խñ� �� �������� ���
	public int listSearchCount(SearchCriteria cri) throws Exception;

	public void insertFile(InfoFileVO fVo) throws Exception;

	// 8. ������ :: ���� ����
	public void deleteFile(int infoNo) throws Exception;

	// 9. ������ :: ���� ���
	public List<InfoFileVO> fileList(int infoNo) throws Exception;

	// �Խñ��� ��ȸ�� ������Ʈ ���
	public void updateViewCount(int infoNo) throws Exception;

}
