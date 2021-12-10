
package com.mit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mit.domain.InfoFileVO;
import com.mit.domain.InfoVO;
import com.mit.domain.SearchCriteria;
import com.mit.persistence.InfoCommentDAO;
import com.mit.persistence.InfoDAO;

@Service
public class InfoServiceImpl implements InfoService {

	@Inject
	private InfoDAO dao;

	@Inject
	private InfoCommentDAO commDao;

	@Override
	public void create(InfoVO vo) throws Exception {
		// (1) �ؽ�Ʈ����� �ٹٲ� ����
		vo.setInfoContent(vo.getInfoContent().replace("\\r\\n", "<br>"));

		// (2) �⺻ ��û ���� ��� (���� ��� x) -> ��ϵ� ��û������ PK ��������
		int infoNo = dao.create(vo);

		// (3) �߰� �̹��� ���� ���� IF��
		if (vo.getFiles() != null) {

			// (4) �߰� �̹��� ���� FOR��
			for (int i = 0; i < vo.getFiles().length; i++) {

				// (4-1) �߰� �̹��� ����

				InfoFileVO fVo = new InfoFileVO();
				fVo.setInfoNo(infoNo);
				fVo.setFileName(vo.getFiles()[i]);

				// (4-2) �߰� �̹��� ����
				dao.insertFile(fVo);
			}
		}

	}

	@Override
	public InfoVO read(int infoNo) throws Exception {

		dao.updateViewCount(infoNo);
		return dao.read(infoNo);

	}

	@Override
	public void update(InfoVO vo) throws Exception {
		// (1) �ؽ�Ʈ����� �ٹٲ� ����
		vo.setInfoContent(vo.getInfoContent().replace("\\r\\n", "<br>"));

		// (2) ���α׷� �Խñ� ����
		dao.update(vo);

		// (3) ���α׷� �Ҽӵ� ÷������ ����
		dao.deleteFile(vo.getInfoNo());

		// (4) �߰� �̹��� ���� ���� IF��
		if (vo.getFiles() != null) {

			// (5) �߰� �̹��� ���� FOR��
			for (int i = 0; i < vo.getFiles().length; i++) {

				// (5-1)�߰� �̹��� ����

				InfoFileVO fVo = new InfoFileVO();
				fVo.setInfoNo(vo.getInfoNo());
				fVo.setFileName(vo.getFiles()[i]);

				// (5-2)�߰� �̹��� ����
				dao.insertFile(fVo);

			}
		}

	}

	@Override
	public void delete(int infoNo) throws Exception {
		// ÷�����ϰ�, ����� �ִ� ���Ǳ���

		// 1) ÷�� ���� ����
		dao.deleteFile(infoNo);

		// 2) ��� ����
		commDao.deleteAll(infoNo);

		// 3) �Խñ� ����
		dao.delete(infoNo);

	}

	@Override
	public List<InfoVO> listSearch(SearchCriteria cri) throws Exception {

		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {

		return dao.listSearchCount(cri);
	}

	@Override
	public List<InfoFileVO> fileList(int infoNo) throws Exception {
		return dao.fileList(infoNo);
	}

}