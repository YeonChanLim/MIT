package com.mit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mit.domain.HistoryVO;

import com.mit.persistence.HistoryDAO;

@Service
public class HistoryServiceImpl implements HistoryService {
	
	@Inject
	private HistoryDAO dao;

	@Override
	public void register(HistoryVO vo) throws Exception {
		vo.setHistoryContent(vo.getHistoryContent().replace("\\r\\n", "<br>"));
		dao.create(vo);
	}

	@Override
	public HistoryVO read(int historyNo) throws Exception {
		return dao.read(historyNo);
	}

	@Override
	public void modify(HistoryVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void remove(int historyNo) throws Exception {
		dao.delete(historyNo);
	}

	@Override
	public List<HistoryVO> list() throws Exception {
		return dao.list();
	}
}
