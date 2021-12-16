package com.mit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mit.domain.StudyFileVO;
import com.mit.domain.StudyVO;
import com.mit.persistence.StudyCommentDAO;
import com.mit.persistence.StudyDAO;

@Service
public class StudyServiceImpl implements StudyService {
	
	@Inject
	private StudyDAO dao;
	
	@Inject
	private StudyCommentDAO commDao;
	
	@Override
	public void register(StudyVO vo) throws Exception {
		int studyNo = dao.create(vo);
		
		if(vo.getFiles() != null) {
			for(int i=0; i<vo.getFiles().length; i++) {
				StudyFileVO fVo = new StudyFileVO();
				fVo.setStudyNo(studyNo);
				fVo.setFileName(vo.getFiles()[i]);
				
				dao.insertFile(fVo);
			}
		}
	}

	@Override
	public StudyVO read(int studyNo) throws Exception {
		dao.updateViewCount(studyNo);
		return dao.read(studyNo);
	}

	@Override
	public void modify(StudyVO vo) throws Exception {
		// 2)�Խñ� ����
		dao.update(vo);

		// 3)÷������ ����
		dao.deleteFile(vo.getStudyNo());

		// 4)÷������ ���� ���� IF��
		if (vo.getFiles() != null) {
			// 5)÷������ ���� FOR��
			for (int i=0; i<vo.getFiles().length; i++) {
				// 5-1)÷������ ����
				StudyFileVO fVo = new StudyFileVO();
				fVo.setStudyNo(vo.getStudyNo());
				fVo.setFileName(vo.getFiles()[i]);
				
				// 5-2)÷������ ����
				dao.insertFile(fVo);
			}
		}
	}

	@Override
	public void remove(int studyNo) throws Exception {
		// 1)÷������ ����
		dao.deleteFile(studyNo);
		
		// 2)��� ����
		commDao.deleteAll(studyNo);
		
		// 3)�Խñ� ����
		dao.delete(studyNo);
	}

	@Override
	public List<StudyVO> list() throws Exception {
		return dao.list();
	}

	@Override
	public List<StudyFileVO> fileList(int studyNo) throws Exception {
		return dao.fileList(studyNo);
	}
}
