package com.mit.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mit.domain.FreeVO;
import com.mit.domain.SearchCriteria;
import com.mit.persistence.FreeDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class FreeDAOTest {
	@Inject
	private FreeDAO dao;
	
	@Test
	public void testCreate() throws Exception {
		FreeVO vo = new FreeVO();
		vo.setFreeTitle("�����Խ��� �Խù� ����4");
		vo.setFreeContent("�׹�° �����Խ��� �Խù� �Դϴ�.");
		vo.setMemberNo(20136677); // ��ȸ�� �й�
		
		dao.create(vo);
	}
	
	@Test
	public void testRead() throws Exception {
		System.out.println(dao.read(1));
	}
	
	@Test
	public void testUpdate() throws Exception {
		FreeVO vo = new FreeVO();
		vo.setFreeNo(1);
		vo.setFreeTitle("[����]�����Խ��� �Խù� ����");
		vo.setFreeContent("������ �����Խ��� �Խù� �Դϴ�.");
		
		dao.update(vo);
	}
	
	@Test
	public void testDelete() throws Exception {
		dao.delete(3);
	}
	
	@Test
	public void testListSearch() throws Exception {
		SearchCriteria cri = new SearchCriteria();
		cri.setSearchType("t");
		cri.setKeyword("�����Խ���");
		
		List<FreeVO> list = dao.listSearch(cri);
		int totalCnt = dao.listSearchCount(cri);
		
		System.out.println("=====" + totalCnt);
		
		for (FreeVO vo : list) {
			System.out.println(vo);
		}
	}
	
	/*@Test
	public void testUpdateViewCount() throws Exception {
		dao.updateViewCount(1);
	}*/
}
