<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@include file="../include/header.jsp"%>

<style>
.preview-list {
	list-style: none;
	padding: 0 10px 0 10px;
}

.preview-size {
	width: auto;
	height: auto;
	max-width: 200px;
	max-height: 200px;
}

.preview-icon {
	width: auto;
	height: auto;
	max-width: 50px;
	max-height: 50px;
}
</style>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4" style='text-align: center; margin-bottom: 30px;'>스터디 게시판</h1>

			<form role="form" action="modify" method="post">
				<input type='hidden' id="studyNo" name="studyNo" value="${studyVO.studyNo}">
				<input type='hidden' id="memberNo" value="${studyVO.memberNo}">
				
				<div class="row g-0">
					<div class="col">
						<div class="input-group">
							<div class="input-group-text">작성자</div>
							<input type="text" class="form-control" value="${studyVO.memberName}" readonly="readonly">
						</div>
					</div>
					<div class="col">
						<div class="input-group">
							<div class="input-group-text">작성일</div>
							<input type="text" class="form-control" value="${studyVO.studyDate}" readonly="readonly">
						</div>
					</div>
					<div class="col">
						<div class="input-group">
							<div class="input-group-text">조회수</div>
							<input type="text" class="form-control" value="${studyVO.studyView}" readonly="readonly">
						</div>
					</div>
				</div>
				
				<div class="row g-0">
					<div class="col-lg-2">
						<div class="input-group">
							<div class="input-group-text" style="padding: 0 20px 0 20px;">유형</div>
							<c:if test="${1 eq studyVO.studyClass}">
                        		<input type="text" class="form-control" value="웹디자인" readonly="readonly">
                     		</c:if>
                     		<c:if test="${2 eq studyVO.studyClass}">
                     			<input type="text" class="form-control" value="파이썬 기초" readonly="readonly">
							</c:if>
						</div>
					</div>
					
					<div class="col-lg-10">
						<div class="input-group">
							<span class="input-group-text" id="inputGroup-sizing-default" style="padding: 0 20px 0 20px;">제목</span>
							<input type="text" class="form-control" value="${studyVO.studyTitle}" readonly="readonly">
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="input-group-text">내용</div>
					<textarea class="form-control" id="studyContent" readonly="readonly">${studyVO.studyContent}</textarea>
					<script>
						CKEDITOR.replace("studyContent", {
							height: 400
						});
					</script>
				</div>

				<c:if test="${!empty studyFileVO}">
					<div class="input-group">
						<div class="input-group-text" style="width: 100%;">첨부파일</div>
					</div>
					<div class="card">
						<ul class="dropzone-previews preview-list">
							<c:forEach items="${studyFileVO}" var="studyFileVO" varStatus="status">
								<c:set var="fileName" value="${studyFileVO.fileName}" />
								<c:set var="fileNo" value="${fn:toLowerCase(fileName)}" />

								<li class="dropzone-previews mt-3">
									<div class="card mt-1 mb-0 shadow-none border dz-processing dz-image-preview dz-success dz-complete">
										<div class="p-2">
											<div class="row align-items-center px-3">
												<c:forTokens var="token" items="${fileNo}" delims="." varStatus="status">
													<c:if test="${status.last}">
														<c:choose>
															<c:when test="${token eq 'hwp'}">
																<img data-dz-thumbnail="" class="avatar-sm rounded bg-light preview-icon" src="/resources/dist/img/hwp.png" alt="${fileName}" />
															</c:when>
															<c:when test="${token eq 'xls' || token eq 'xlsx' }">
																<img data-dz-thumbnail="" class="avatar-sm rounded bg-light preview-icon" src="/resources/dist/img/excelIcon.png" />
															</c:when>
															<c:when test="${token eq 'jpg' || token eq 'gif' || token eq 'png' || token eq 'bmp' }">
																<img data-dz-thumbnail="" class="avatar-sm rounded bg-light preview-size" src="/displayFile?fileName=${studyFileVO.fileLocation}">
															</c:when>
															<c:when test="${token eq 'pdf'}">
																<img data-dz-thumbnail="" class="avatar-sm rounded bg-light preview-icon" src="/resources/dist/img/pdf.png" alt="${fileName}" />
															</c:when>
															<c:when test="${token eq 'ppt' || token eq 'pptx'}">
																<img data-dz-thumbnail="" class="avatar-sm rounded bg-light preview-icon" src="/resources/dist/img/ppt.png" alt="${fileName}" />
															</c:when>
															<c:otherwise>
																<img data-dz-thumbnail="" class="avatar-sm rounded bg-light preview-icon" src="/resources/dist/img/file.svg" alt="${fileName}" />
															</c:otherwise>
														</c:choose>
													</c:if>
												</c:forTokens>
												<div class="col pl-0">
													<a href="/displayFile?fileName=${studyFileVO.fileLocation}" text-muted font-weight-bold data-dz-name="">
														${studyFileVO.fileName}
													</a>
												</div>
											</div>
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</c:if>
				<c:if test="${empty studyFileVO}"></c:if>

				<div style="text-align: right; margin: 17px 0 17px 0;">
					<c:if test="${login.memberNo eq studyVO.memberNo}">
						<button type="button" class="btn btn-outline-primary btn-modify">수정</button>
						<button type="button" class="btn btn-outline-danger">삭제</button>
					</c:if>
					<c:if test="${12345678 eq login.memberNo}">
						<button type="button" class="btn btn-outline-danger">삭제</button>
					</c:if>
					<button type="button" class="btn btn-outline-dark">목록</button>
				</div>
			</form>

			<div class="card mb-5">
				<div class="card-body">
					<form>
						<h5 class="mt-0">댓글 작성</h5>
						<input type="hidden" value="${login.memberNo}" id="newUserNo">
						<textarea class="form-control form-control-light mb-2" placeholder="Enter comment..." id="newReplyText" rows="3"></textarea>
						<div class="text-right">
							<div class="btn-group mb-2">
							</div>
							<div class="btn-group" style="float: right;">
								<a class="btn btn-outline-primary btn-rounded comentAddBtn">댓글 등록</a>
							</div>
						</div>
						<br><hr>
						<div class="col-lg-12">
							<div class="inbox-widget">
								<h5 class="mt-0">댓글 목록</h5>
								<div class="card">
									<ul class="mb-0 px-0 preview-list list-group list-group-flush" id="reply"></ul>
								</div>
								<div style="text-align: right;"></div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>

	<script>
		$(document).ready(function() {
			var formObj = $("form[role='form']");

			console.log(formObj);

			$(".btn-modify").on("click", function() {
				formObj.attr("action", "/study/modify");
				formObj.attr("method", "get");
				formObj.submit();
			});

			$(".btn-outline-danger").on("click", function() {
				formObj.attr("action", "/study/remove");
				formObj.attr("method", "post");
				formObj.submit();
			});

			$(".btn-outline-dark").on("click", function() {
				formObj.attr("action", "/study/list");
				formObj.attr("method", "get");
				formObj.submit();
			});
		});
	</script>

	<script>
		var studyNo = $("#studyNo").val(); // 게시글 번호
		var loginNo = $("#newUserNo").val(); // 댓글 작성자 학번
		var writeUser = $("#memberNo").val(); // 게시글 쓴 사람 정보 가져오기, 게시글 작성자 학번

		$.getJSON("/studyComment/all/" + studyNo, function(data) {
			var str = "";
			$(data).each(function() {
				var strbutton = "";
				
				str += "<li class='p-0 comment-list list-group-item' data-commentNo='" + this.commentNo + ">"
					+ "<div class='card border-dark'>"
					+ "<div class='card-header'>"
					+ "<span style='font-weight: bold;'>"
					+ this.memberName
					+ "</span>"
					+ " · "
					+ "<font size=2>"
					+ this.commentDate
					+ "</font>"
				
				if (loginNo == this.memberNo || loginNo == writeUser || loginNo == 12345678) {//댓글 작성자인 경우 OR 게시글 작성자인 경우 OR 관리자인 경우, 댓글 삭제 가능
					strbutton += "<i class='bi bi-x-square-fill' style='float: right; color: red;' onclick='deleteReply("
						+ this.commentNo
						+ ")'></i>";
				}
				
				str += strbutton;
				str += "</div>"
				str += "<div class='card-body text-dark'>"
				str += "<p class='card-text'>"
				str += this.commentText
				str += "</p>"
				str += "</div>"
				str += "</div>"
				str += "</li>";
			});
			
			var strtext = "";
			
			if (str == "") {
				strtext += "<p style='text-align: center; margin-top: 10px'>등록된 댓글이 없습니다.</p>";
			}
			
			str += strtext;
			
			$("#reply").html(str);
		});

		//댓글 저장 버튼 클릭 이벤트 submit [성공]
		$(".comentAddBtn").on("click", function() {
			// 입력 form 선택자
			var loginNo = $("#newUserNo");
			var replyTextObj = $("#newReplyText");

			var memberNo = loginNo.val();
			var commentText = replyTextObj.val();

			if (memberNo == "") { //로그인 정보 없을 경우
				alert("로그인 후 댓글 기능을 사용할 수 있습니다.");
				replyTextObj.val("");
				return;
			}

			// 댓글 입력처리 수행
			$.ajax({
				type : "post",
				url : "/studyComment/",
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : "text",
				data : JSON.stringify({
					studyNo : studyNo,
					memberNo : memberNo,
					commentText : commentText
				}),
				success : function(result) {
					if (result === "SUCCESS") {
						alert("댓글이 등록되었습니다.");
						$("#newReplyText").val(""); //댓글 입력창 공백처리
						getReplies(); //댓글 목록 호출
					}
				}
			});
		});

		function deleteReply(commentNo) {
			$.ajax({
				type : 'delete',
				url : '/studyComment/' + commentNo,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "DELETE"
				},
				dataType : 'text',
				success : function(result) {
					console.log("result: " + result);

					if (result == 'SUCCESS') {
						alert("댓글이 삭제되었습니다.");
						getReplies();
					}
				}
			});
		}

		function getReplies() {
			$.getJSON("/studyComment/all/" + studyNo, function(data) {
				var str = "";

				$(data).each(function() {
					var strbutton = "";
					
					str += "<li class='p-0 comment-list list-group-item' data-commentNo='" + this.commentNo + ">"
						+ "<div class='card border-dark'>"
						+ "<div class='card-header'>"
						+ "<span style='font-weight: bold;'>"
						+ this.memberName
						+ "</span>"
						+ " · "
						+ "<font size=2>"
						+ this.commentDate
						+ "</font>"
					
					if (loginNo == this.memberNo || loginNo == writeUser || loginNo == 12345678) {//댓글 작성자인 경우 OR 게시글 작성자인 경우 OR 관리자인 경우, 댓글 삭제 가능
						strbutton += "<i class='bi bi-x-square-fill' style='float: right; color: red;' onclick='deleteReply("
							+ this.commentNo
							+ ")'></i>";
					}
					
					str += strbutton;
					str += "</div>"
					str += "<div class='card-body text-dark'>"
					str += "<p class='card-text'>"
					str += this.commentText
					str += "</p>"
					str += "</div>"
					str += "</div>"
					str += "</li>";
				});

				$("#reply").html(str);
		});
	}
</script>

<%@include file="../include/footer.jsp"%>