<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<h2 class="mt-4" style='text-align: center; margin-bottom: 30px;'>질문
			게시판 게시물 수정하기</h2>

		<form role="form" action="modify" method="post" name="frm">
			<input type='hidden' id="qnaNo" name='qnaNo' value="${qnaVO.qnaNo}"> 
			<input type='hidden' id="memberNo" name='memberNo' value="${login.memberNo}"> 

			<div class="row g-0">
					<div class="col">
						<div class="input-group">
							<div class="input-group-text">작성자</div>
						<label class="form-control">${login.memberName}</label>
						<div class="form-control" align="right">
							<input type="checkbox" name="ckhiddenStatus" id="ckhiddenStatus"
								value="1" /> <label for="ckhiddenStatus"
								style="font-size: 17px;">익명</label>
						</div>
					</div>
					</div>
					</div>
					
					<div class="row g-0">
					<div class="col-lg-2">
						<div class="input-group">
							<div class="input-group-text" style="padding: 0 20px 0 20px;">유형</div>
								<select class="form-select" id="qnaClass" name="qnaClass">
									<option value="" selected>선택</option>
									<option value="1">동아리</option>
									<option value="2">코딩오류</option>
									<option value="3">전공과목</option>
									<option value="4">학교생활</option>
								</select>
							</div>
						</div>
					<div class="col-lg-10">
						<div class="input-group">
							<span class="input-group-text" id="inputGroup-sizing-default" style="padding: 0 20px 0 20px;">제목</span>
						<input type="text" class="form-control" id="qnaTitle" name="qnaTitle"
							value="${qnaVO.qnaTitle}">
					</div>
					</div>
					</div>

					<div class="form-group">
						<div class="input-group-text">내용</div>
						<textarea class="form-control" id="qnaContent" name="qnaContent">${qnaVO.qnaContent}</textarea>
						<script>
							$(document).ready(function() {
								CKEDITOR.replace("qnaContent", {
									height : 400
								});
							});
						</script>
					</div>

					<div class="input-group">
						<input type="file" class="form-control" id="fileUpload"
							name="fileUpload" aria-describedby="inputGroupFileAddon04"
							aria-label="Upload">
						<button class="btn btn-outline-secondary" type="button"
							id="inputGroupFileAddon04" onclick="fileUpload.click()">
							<i class="bi bi-plus-lg"></i>
						</button>
					</div>
					<div class="card">
						<ul class="dropzone-previews clearfix uploadedList preview-list">
							<c:forEach items="${qnaFileVO}" var="fVo" varStatus="status">
								<c:set var="fileName" value="${fVo.fileName}" />
								<c:set var="fileNo" value="${fn:toLowerCase(fileName)}" />

								<li class="dropzone-previews mt-3">
									<div
										class="card mt-1 mb-0 shadow-none border dz-processing dz-image-preview dz-success dz-complete">
										<div class="p-2">
											<div class="row align-items-center px-3">
												<c:forTokens var="token" items="${fileNo}" delims="."
													varStatus="status">
													<c:if test="${status.last}">
														<c:choose>
															<c:when test="${token eq 'hwp'}">
																<img data-dz-thumbnail=""
																	class="avatar-sm rounded bg-light preview-icon"
																	src="/resources/dist/img/hwp.png" alt="${fileName}" />
															</c:when>
															<c:when test="${token eq 'doc' || token eq 'docx' }">
																<img data-dz-thumbnail=""
																	class="avatar-sm rounded bg-light preview-icon"
																	src="/resources/dist/img/doc.png" alt="${fileName}" />
															</c:when>
															<c:when test="${token eq 'xls' || token eq 'xlsx' }">
																<img data-dz-thumbnail=""
																	class="avatar-sm rounded bg-light preview-icon"
																	src="/resources/dist/img/excelIcon.png" />
															</c:when>
															<c:when
																test="${token eq 'jpg' || token eq 'gif' || token eq 'png' || token eq 'bmp' }">
																<img data-dz-thumbnail=""
																	class="avatar-sm rounded bg-light preview-size"
																	src="/displayFile?fileName=${qnaFileVO.fileLocation}">
															</c:when>
															<c:when test="${token eq 'psd'}">
																<img data-dz-thumbnail=""
																	class="avatar-sm rounded bg-light preview-icon"
																	src="/resources/dist/img/psd.png" alt="${fileName}" />
															</c:when>
															<c:when test="${token eq 'ai'}">
																<img data-dz-thumbnail=""
																	class="avatar-sm rounded bg-light preview-icon"
																	src="/resources/dist/img/ai.png" alt="${fileName}" />
															</c:when>
															<c:when test="${token eq 'pdf'}">
																<img data-dz-thumbnail=""
																	class="avatar-sm rounded bg-light preview-icon"
																	src="/resources/dist/img/pdf.png" alt="${fileName}" />
															</c:when>
															<c:when test="${token eq 'ppt' || token eq 'pptx'}">
																<img data-dz-thumbnail=""
																	class="avatar-sm rounded bg-light preview-icon"
																	src="/resources/dist/img/ppt.png" alt="${fileName}" />
															</c:when>
															<c:when test="${token eq 'mp4' || token eq 'avi'}">
																<img data-dz-thumbnail=""
																	class="avatar-sm rounded bg-light preview-icon"
																	src="/resources/dist/img/avi.png" alt="${fileName}" />
															</c:when>
															<c:when
																test="${token eq 'mp3' || token eq 'flac' || token eq 'wav'}">
																<img data-dz-thumbnail=""
																	class="avatar-sm rounded bg-light preview-icon"
																	src="/resources/dist/img/mp3.png" alt="${fileName}" />
															</c:when>
															<c:when test="${token eq 'zip'}">
																<img data-dz-thumbnail=""
																	class="avatar-sm rounded bg-light preview-icon"
																	src="/resources/dist/img/zip.png" alt="${fileName}" />
															</c:when>
															<c:otherwise>
																<img data-dz-thumbnail=""
																	class="avatar-sm rounded bg-light preview-icon"
																	src="/resources/dist/img/file.png" alt="${fileName}" />
															</c:otherwise>
														</c:choose>
													</c:if>
												</c:forTokens>
												<div class="col pl-0">
													<a href="/displayFile?fileName=${fVo.fileLocation}"
														text-muted font-weight-bold data-dz-name="">
														${fVo.fileName} </a>
												</div>
												<div class="col-auto">
													<a href="${fVo.fileLocation}"
														class="btn btn-default btn-xs pull-right delbtn"> <i
														class="far fa-trash-alt"></i>
													</a>
												</div>
											</div>
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>

					<div style="text-align: right; margin: 17px 0 17px 0;">
						<button type="submit" class="btn btn-outline-primary">수정</button>
						<button type="button" class="btn btn-outline-dark"
							onclick="location.href='/qna/list'">목록</button>
					</div>
		</form>
	</div>
	</main>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script type="text/javascript" src="/resources/upload.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script id="template" type="text/x-handlebars-template">
<li class="dropzone-previews mt-3">
<div class="card mt-1 mb-0 shadow-none border dz-processing dz-image-preview dz-success dz-complete">
<div class="p-2">
<div class="row align-items-center">
<div class="col-auto">
<img data-dz-thumbnail="" class="avatar-sm rounded bg-light" src="{{imgsrc}}">
</div>
<div class="col pl-0">
<a href="/displayFile?fileName={{fullName}}" text-muted font-weight-bold" data-dz-name="">{{fileName}}</a>
</div>
<div class="col-auto">
<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn"><i class="far fa-trash-alt"></i></a>
</div>
</div>
</div>
</div>
</li>
</script>

	<script>
		function validate() {
			var qnaClass = $("#qnaClass").val();
			var qnaTitle = $("#qnaTitle").val();
			var qnaContent = CKEDITOR.instances.qnaContent.getData();

			alert(hiddenStatus)

			if (qnaClass == "") {
				alert("유형을 선택해주세요.");
				document.getElementById("qnaClass").focus();
				return false;
			}

			if (qnaTitle == "") {
				alert("제목을 입력해주세요 .");
				document.getElementById("qnaTitle").focus();
				return false;
			}

			if (qnaContent == "") {
				alert("내용을 입력해주세요 .");
				return false;
			}

			if (hiddenStatus) {
				$("#hiddenStatus").val("1");
				alert($("#hiddenStatus").val());
				return true;

			} else {
				alert('false')
				$("#hiddenStatus").val("0");
				alert($("#hiddenStatus").val());
				return true;

			}

			return true;
		}

		function checkImageType(fileName) {
			var pattern = /jpg|gif|png|jpeg/i;
			return fileName.match(pattern);
		}
	</script>

	<script>
		$(document).ready(
				function() {
					var formObj = $("form[role='form']");
					formObj.submit(function(event) {
						event.preventDefault();
						var that = $(this);
						var str = "";

						$(".uploadedList .delbtn").each(
								function(index) {
									str += "<input type='hidden' name='files'"
											+ " value='" + $(this).attr("href")
											+ "'> ";
								});

						that.append(str);
						that.get(0).submit();
					});
				});

		$('#mydropzone').click(function(event) {
			document.frm.fileUpload.click();
		});

		var template = Handlebars.compile($("#template").html());

		$(".fileDrop").on("dragenter dragover", function(event) {
			event.preventDefault();
		});

		$(".fileDrop").on("drop", function(event) {
			event.preventDefault();

			var uploaded = $("#uploadCount").val();
			var files = event.originalEvent.dataTransfer.files;
			var file = files[0];
			var formData = new FormData();

			formData.append("file", file);

			$.ajax({
				url : '/uploadAjax',
				data : formData,
				dataType : 'text',
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {
					var fileInfo = getFileInfo(data);
					var html = template(fileInfo);
					var str = "";

					$(".uploadedList").append(html);

					uploaded++;

					$("#uploadCount").attr("value", uploaded);

					$(".uploadedList").append(str);
				}
			});
		});

		//클릭으로 파일 업로드할 때 호출되는 함수
		$("#fileUpload").on("change", function(event) {
			event.preventDefault();

			var uploaded = $("#uploadCount").val();

			if (uploaded >= 3) {
				alert('첨부파일은 3개 까지 업로드할 수 있습니다.');
				return;
			}

			// 파일업로드 인풋에서 파일을 받음
			var file = document.getElementById("fileUpload").files[0];

			// 새로운 폼데이터를 생성
			var formData = new FormData();

			// 폼데이터에 파일을 붙임
			formData.append("file", file);

			// AJAX로 uploadAjax 메소드를 호출해서 파일을 업로드함
			$.ajax({
				url : '/uploadAjax',
				data : formData,
				dataType : 'text',
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {
					var fileInfo = getFileInfo(data);
					var html = template(fileInfo);
					var str = "";

					$(".uploadedList").append(html);

					uploaded++;

					$("#uploadCount").attr("value", uploaded);

					$(".uploadedList").append(str);
				}
			});
		});

		//파일 삭제 버튼 클릭 시 
		$(".uploadedList").on("click", ".delbtn", function(event) {
			event.preventDefault();

			var that = $(this);
			var uploaded = $("#uploadCount").val();

			$.ajax({
				url : "/deleteFile",
				type : "post",
				data : {
					fileName : $(this).attr("href")
				},
				dataType : "text",
				success : function(result) {
					if (result == 'deleted') {
						that.closest("li").remove();
						uploaded--;

						$("#uploadCount").attr("value", uploaded);
					}
				}
			});
		});

		function getOriginalName(fileName) {
			if (checkImageType(fileName)) {
				return;
			}

			var idx = fileName.indexOf("_") + 1;

			return fileName.substr(idx);
		}

		function getImageLink(fileName) {
			if (!checkImageType(fileName)) {
				return;
			}

			var front = fileName.substr(0, 12);
			var end = fileName.substr(14);

			return front + end;
		}
	</script>

	<%@include file="../include/footer.jsp"%>