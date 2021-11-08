package com.mit.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mit.domain.InfoFileVO;
import com.mit.domain.InfoVO;
import com.mit.domain.SearchCriteria;



@Repository
public class InfoDAOImpl implements InfoDAO {
	
	
	@Inject
	private SqlSession session;
	
	private static final String namespace = "com.mit.mapper.InfoMapper";
	

	@Override
	public int create(InfoVO vo) throws Exception {
		session.insert(namespace+".create", vo);
		return vo.getInfoNo();
		
	}

	@Override
	public InfoVO read(int infoNo) throws Exception {
		return session.selectOne(namespace+".read", infoNo);
	}

	@Override
	public void update(InfoVO vo) throws Exception {
		session.update(namespace+".update", vo);
		
	}

	@Override
	public void delete(int infoNo) throws Exception {
		session.delete(namespace+".delete", infoNo);
		
	}

	@Override
	public List<InfoVO> listSearch(SearchCriteria cri) throws Exception {
		
		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		
		return session.selectOne(namespace + ".listSearchCount", cri);
	}

	@Override
	public void insertFile(InfoFileVO fVo) throws Exception {
		session.insert(namespace+".insertFile", fVo);
		
	}

	@Override
	public void deleteFile(int infoNo) throws Exception {
		session.delete(namespace+".deleteFile", infoNo);
		
	}

	@Override
	public List<InfoFileVO> fileList(int infoNo) throws Exception {
		return session.selectList(namespace+".fileList", infoNo);
	}



}
