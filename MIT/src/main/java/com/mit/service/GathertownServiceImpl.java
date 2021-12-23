package com.mit.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mit.domain.GathertownVO;
import com.mit.persistence.GathertownDAO;

@Service
public class GathertownServiceImpl implements GathertownService {
	
	@Inject
	private GathertownDAO dao;
	
	@Override
	public void register(GathertownVO vo) throws Exception {
		vo.setGroupContent(vo.getGroupContent().replace("\\r\\n", "<br>"));
		
		dao.create(vo);
	}

	@Override
	public GathertownVO read(int gathertownNo) throws Exception {
		return dao.read(gathertownNo);
	}

	@Override
	public void modify(GathertownVO vo) throws Exception {
		vo.setGroupContent(vo.getGroupContent().replace("\\r\\n", "<br>"));
		
		dao.update(vo);
	}

	@Override
	public void remove(int gathertownNo) throws Exception {
		dao.delete(gathertownNo);
	}

	@Override
	public List<GathertownVO> list() throws Exception {
		return dao.list();
	}
}
