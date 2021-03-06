<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="MIT Website" />
	<meta name="author" content="MIT" />
	
	<title>MIT</title>
	
	<!-- MAIN JS -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<!-- startbootstrap-sb-admin-gh-pages -->
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="/resources/bootstrap/css/styles.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	
	<!-- Bootstrap Icons -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
</head>
<body>
<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4" style="text-align: center; margin-bottom: 30px;">스터디 그룹 등록하기</h1>
			
			<form role="form" method="post" name="form">
				<input type="hidden" value="${login.memberNo}" id="memberNo" name="memberNo"> 
				
				<div class="row g-0">
					<div class="col-9">
						<div class="input-group">
							<span class="input-group-text" id="inputGroup-sizing-default">스터디 그룹명</span>
							<input type="text" class="form-control" id="groupName" name="groupName" placeholder="Enter groupName...">
						</div>
					</div>
					
					<div class="col-3">
						<div class="input-group">
							<span class="input-group-text" id="inputGroup-sizing-default" style="padding: 0 20px 0 20px;">인원</span>
							<input type="number" class="form-control" id=groupNo name="groupNo">
						</div>
					</div>
				</div>
								
				<div class="input-group">
					<span class="input-group-text" id="inputGroup-sizing-default">게더타운 링크</span>
					<input type="text" class="form-control" id="gathertownLink" name="gathertownLink" placeholder="Enter Link...">
				</div>
				
				<div class="form-group">
					<div class="input-group-text">스터디 그룹소개</div>
					<textarea class="form-control" id="groupContent" name="groupContent" rows="10" placeholder="Enter content..."></textarea>
				</div>
				
				<div class="input-group uploadedList">
					<input type="file" class="form-control" id="fileUpload" name="fileUpload" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
					<button class="btn btn-outline-secondary" type="button" id="inputGroupFileAddon04" onclick="fileUpload.click()">
						<i class="bi bi-plus-lg"></i>
					</button>
				</div>
			
				<div style="text-align: right; margin: 17px 0 17px 0;">
					<button type="button" class="btn btn-outline-primary" id="btn_submit">등록</button>
					<button type="button" class="btn btn-outline-dark" onClick="window.close()">닫기</button>
				</div>
			</form>
		</div>
	</main>
	<footer class="py-4 bg-light mt-auto mb-0">
		<div class="container-fluid px-4">
			<div class="d-flex align-items-center justify-content-between small">
				<div class="text-muted">MIT Website</div>
			</div>
		</div>
	</footer>
</div>

<script>
	// 등록 유효성 검사 
	function validate() {
		var groupName = $("#groupName").val();
		var groupNo = $("#groupNo").val();
		var gathertownLink = $("#gathertownLink").val();

		if (groupName == "") {
			alert("스터디 그룹명을 입력해주세요.");
			document.getElementById("groupName").focus();
			return false;
		}
		
		if (groupNo == "") {
			alert("인원수를 입력해주세요.");
			document.getElementById("groupNo").focus();
			return false;
		}
		
		if (gathertownLink == "") {
			alert("접속링크를 입력해주세요.");
			document.getElementById("gathertownLink").focus();
			return false;
		}

		return true;
	}
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
<input type="hidden" name="files" id="uploadCount" href="{{fullName}}">
</script>

<script>
	$("input:text[numberOnly]").on("focus", function() {
		var x = $(this).val();
		x = removeCommas(x);
		$(this).val(x);
	}).on("focusout", function() {
		var x = $(this).val();
		if (x && x.length > 0) {
			if (!$.isNumeric(x)) {
				x = x.replace(/[^0-9]/g, "");
			}
			x = addCommas(x);
			$(this).val(x);
		}
	}).on("keyup", function() {
		$(this).val($(this).val().replace(/[^0-9]/g, ""));
	});
</script>

<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		formObj.submit(function(event) {
			event.preventDefault();
			
			//유효성 검사
			var val = validate();
			
			if (val) {
				var that = $(this);
				var str = "";

				$(".uploadedList").each(function() {
					str += "<input type='hidden' name='thumbnail'"
						+ " value='"
						+ $(this).attr("href")
						+ "'> ";
				});

				that.append(str);
				console.log(str);
				that.get(0).submit();
			}//if문 종료
		});
	});

	var template = Handlebars.compile($("#template").html());

	//dragenter dragover, drop 기본 동작 막기(기본적인 이벤트 처리 제한 preventDefault) 끌어다 놓으면 새로운 창이 열리는 동작
	$(".fileDrop").on("dragenter dragover", function(event) {
		event.preventDefault();
	});

	$(".fileDrop").on("drop", function(event) {
		event.preventDefault();

		var uploaded = $("#uploadCount").val();

		//event.dataTransfer=이벤트와 같이 전달된 데이터   
		//dataTransfer.files= 그안 에 포함된 전달된 파일 데이터를 찾아 가져오는 부분
		//jQuery를 이용하는 경우 envent가 순수한 DOM 이벤트가 아니기때문에 
		var files = event.originalEvent.dataTransfer.files;

		var file = files[0];

		//formData를 이용한 서버 호출 (기존 <form>태그로 만든 데이터 전송방식과 동일)
		var formData = new FormData();

		//file 이름으로 파일 객체 추가
		formData.append("file", file);

		//$.post()를 사용하지 않고 $.ajax() 사용하는 대신 processData,contentType: false로 지정
		$.ajax({
			url : '/uploadAjax',
			data : formData,
			dataType : 'text',
			processData : false, //데이터를 자동 변환 할 것인지(true:일반적인 query string / false:자동 변환 없이)
			contentType : false, //기본값(true) application/urlcod 타입으로 전송 / 파일의 경우(false) multipart/form_data 방식으로 전송
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

		if (uploaded > 1) {
			alert('이미지는 1개만 업로드할 수 있습니다.');
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
	
	//파일링크 처리(길이를 줄여줌)
	function getOriginalName(fileName) {
		if (checkImageType(fileName)) {
			return;
		}

		var idx = fileName.indexOf("_") + 1;
		return fileName.substr(idx);
	}
	
	//이미지파일 원본 파일 찾기
	function getImageLink(fileName) {
		if (!checkImageType(fileName)) {
			return;
		}
		
		//noticeFileName.substring(0,12)/년/월/일 경로 추출  
		//noticeFileName.substring(14) 파일 이름앞의 's_'제거
		var front = fileName.substr(0, 12);
		var end = fileName.substr(14);

		return front + end;
	}
</script>

<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		console.log(formObj);

		$("#btn_submit").on("click", function() {
			formObj.submit();
		});
	});
</script>
</body>
</html>