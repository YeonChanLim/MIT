package com.mit.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.mit.domain.QnaCommentVO;
import com.mit.service.QnaCommentService;

@RestController
@RequestMapping("/qcomment")
public class QnaCommentController {
	
	@Inject
	private QnaCommentService service;
	
	private static final Logger logger = LoggerFactory.getLogger(QnaCommentController.class);
	
	// 1. QnA - 댓글 생성
		@RequestMapping(value = "", method = RequestMethod.POST)
		public ResponseEntity<String> register(@RequestBody QnaCommentVO qcvo) {
			ResponseEntity<String> entity = null;

			try {
				service.add(qcvo);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);

				logger.info("reply get.,...........");
			}
			return entity;

		}

		// 2. QnA - 댓글 삭제
		@RequestMapping(value = "/{qnaCommentNo}", method = RequestMethod.DELETE)
		public ResponseEntity<String> remove(@PathVariable("qnaCommentNo") int commentNo) {

			ResponseEntity<String> entity = null;
			try {
				service.remove(commentNo);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			return entity;
		}

		// 3. QnA - 댓글 전체 보기
		@RequestMapping(value = "/all/{qnaNo}", method = { RequestMethod.GET, RequestMethod.POST })
		public ResponseEntity<List<QnaCommentVO>> list(@PathVariable("qnaNo") int qnaNo) {
			ResponseEntity<List<QnaCommentVO>> entity = null;
			try {
				entity = new ResponseEntity<>(service.list(qnaNo), HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}

}
