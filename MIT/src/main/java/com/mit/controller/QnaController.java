package com.mit.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mit.domain.MemberVO;
import com.mit.domain.QnaVO;
import com.mit.service.QnaService;

@Controller
@RequestMapping("/qna/*")
public class QnaController {

	@Inject
	private QnaService service;

	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage(Model model) throws Exception {

		logger.info("qna list...");

		model.addAttribute("list", service.listSearch());
	}

	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("qnaNo") int qnaNo, Model model)
			throws Exception {
		logger.info("qna read........");

		model.addAttribute(service.read(qnaNo));
		
		model.addAttribute("qnaFileVO", service.fileList(qnaNo));

	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGET(int qnaNo, HttpSession session,
			 Model model, RedirectAttributes rttr) throws Exception {
		
		logger.info("notice modify...");

		MemberVO member = (MemberVO) session.getAttribute("login");

		QnaVO qna = service.read(qnaNo);

		if (member.getMemberNo() == qna.getMemberNo()) {
			// 작성자와 로그인 정보 같음
			model.addAttribute(qna);
			model.addAttribute("qnaFileVO", service.fileList(qnaNo));
			// 수정 페이지로 이동
			return "/qna/modify";
		} else {
			// 로그인 정보와 게시글 작성자가 일치 하지 않은 경우 -> 강제이동
			rttr.addAttribute("qnaNo", qnaNo);

			rttr.addFlashAttribute("msg", "CANNOT");

			return "redirect:/qna/list";
		}

	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(QnaVO vo, RedirectAttributes rttr)
			throws Exception {

		service.update(vo);

		rttr.addFlashAttribute("msg", "MODIFY");

		return "redirect:/qna/list";

	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)

	public void registerGET(QnaVO vo, Model model) throws Exception {

		logger.info("register get......");

	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)

	public String registerPOST(QnaVO vo, RedirectAttributes rttr) throws Exception {

		service.create(vo);
		rttr.addFlashAttribute("msg", "REGISTER");

		return "redirect:/qna/list";
	}

	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("qnaNo") int qnaNo, HttpSession session,
			RedirectAttributes rttr) throws Exception {
		
		// 1) 로그인 정보 가져오기
		MemberVO member = (MemberVO)session.getAttribute("login");
		
		// 2) 게시글의 작성자 id와 로그인 정보 id를 비교
		// 2-1) 게시글 정보 가져오기
		QnaVO qna = service.read(qnaNo);
		
		// 2-2) 게시글 작성자 id와 로그인 정보 id 비교
		if(member.getMemberNo() == qna.getMemberNo()) {
			//작성자와 로그인 정보 같음-> 게시글 삭제
			service.delete(qnaNo);

			rttr.addFlashAttribute("msg", "REMOVE");
			
			return "redirect:/qna/list";
			
		} else {
			// 로그인 정보와 게시글 작성자가 일치 하지 않은 경우 -> 삭제 하지 않고 강제이동
			rttr.addAttribute("qnaNo", qnaNo);
			rttr.addFlashAttribute("msg", "CANTDELETE");
			
			return "redirect:/qna/list";
			
		}

		
	}

}
