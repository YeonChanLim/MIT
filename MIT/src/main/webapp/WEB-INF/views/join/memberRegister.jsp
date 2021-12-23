<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<meta name="description" content="MIT Website" />
	<meta name="author" content="MIT" />
	
	<title>MIT</title>
	
	<!-- Bootstrap 3.3.6 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
	<link href="/resources/bootstrap/css/login.css" rel="stylesheet" />
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
	<!-- Bootstrap Icons -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	<!-- JQuery -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-2"></div>
			<div class="col-lg-6 col-md-8 register-box">
				<div class="col-lg-11 login-btm login-text"></div>
				<div style="font-size: 25px; color: #343a40;">
					<div onclick="history.go(-1)">
						<i class="bi bi-x-square-fill"></i>
					</div>
					<div class="col-lg-12 login-key" style="font-size: 60px; color: #343a40;">
						<i class="fas fa-smile fa-spin"></i>
						<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
					</div>
					<div class="col-lg-12 login-title">CREATE ACCOUNT</div>
					<div class="col-lg-12 login-form">
						<div class="col-lg-12 login-form">
							<form action="memberRegister" method="post" name="form" onsubmit="return sendIt();">
								<div class="form-group">
									<label class="form-control-label">학번</label>
									<input type="text" class="form-control" id="joinNo" name="joinNo" placeholder="20201234">
								</div>
								<div class="form-group">
									<label class="form-control-label">비밀번호</label>
									<input type="password" class="form-control" id="pw1" name="joinPw">
								</div>
								<div class="form-group">
									<label class="form-control-label">비밀번호 확인</label>
									<input type="password" class="form-control" id="pw2">
								</div>
								<div class="form-group">
									<label class="form-control-label">이름</label>
									<input type="text" class="form-control" id="joinName" name="joinName" placeholder="홍길동">
								</div>
								<div class="form-group">
									<label class="form-control-label">연락처</label>
									<input type="text" class="form-control" id="joinPhone" name="joinPhone" placeholder="010-1234-1234">
								</div>
								<div class="form-group">
									<label class="form-control-label">가입자 유형</label>
									<p><input type="radio" name="joinClass" id="joinClass1" value="1" checked="checked">
									<label class="form-control-label">재학생</label> &nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="joinClass" id="joinClass2" value="2">
									<label class="form-control-label">졸업생</label></p>
								</div>   
								<div class="form-group">
									<label class="form-control-label">가입 사유</label>
									<textarea class="form-control" id="joinText" name="joinText" rows="5" placeholder="사유를 반드시 써주세요." style="font-weight: bold;"></textarea>
								</div>
								<div class="form-group">
									<label class="form-control-label">
										한남대 학생이 아닌 가입 희망자는 다음 연락처로 연락 바랍니다.
										<a href="mailto:hnumitcircle@gmail.com">
											hnumitcircle@gmail.com
										</a>
									</label>
								</div>
								<div class="col-lg-12 loginbttm">
									<div class="col-lg-6 login-btm login-text"></div>
									<div class="col-lg-6 login-btm login-button">
										<button type="submit" class="btn btn-outline-primary" name="submit">회원가입</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-2"></div>
			</div>
		</div>
	</div>

	<script>
		function returnMain() {
			location.href = "http://localhost:8181/";
		}
	</script>
	<script>      
		// 아이디 중복체크 알림
		var result = '${warning}';
		
		if (result == "사용할 수 없는 정보입니다.") {
			alert("사용할 수 없는 정보입니다.");
		}
	</script>
	<script>
		function sendIt() {
			// 아이디 입력여부 검사
			if (document.form.joinNo.value == "") {
				alert("학번을 입력해주세요.");
				form.joinNo.focus();
				return false;
			}
			      
			// 아이디 유효성 검사
			for(var i=0; i<document.form.joinNo.value.length; i++) {
				ch = document.form.joinNo.value.charAt(i)
				if(!(ch >= '0' && ch <='9')) {
					alert("학번에는 숫자만 입력해주세요!");
					document.form.joinNo.value = "";
					document.form.joinNo.focus();
					return false;
				}
			}
			
			// 아이디 길이 체크(8자)
			if(document.form.joinNo.value.length != 8) {
				alert("학번은 숫자 8자입니다.");
				document.form.joinNo.select();
				document.form.joinNo.focus();
				return false;
			} 
			
			// 비밀번호 입력여부 체크
			if(document.form.pw1.value == "") {
				alert("비밀번호를 입력해주세요.");
				document.form.pw1.focus();
				return false;
			}
			
			// 비밀번호 길이 체크(20자 까지 허용)
			if(document.form.pw1.value.length > 12) {
				alert("비밀번호는 12자 이하로 입력해주세요.");
				document.form.pw1.value = "";
				document.form.pw1.focus();
				return false;
			}
			
			// 비밀번호와 비밀번호 확인 일치 여부 체크
			if(document.form.pw1.value != document.form.pw2.value) {
				alert("비밀번호가 서로 일치하지 않습니다.");
				document.form.pw2.value = "";
				document.form.pw2.focus();
				return false;
			}
			
			// 이름 입력여부 체크
			if(document.form.joinName.value == "") {
				alert("이름을 입력해주세요.");
				document.form.joinName.focus();
				return false;
			}
			
			// 연락처 입력여부 체크
			if(document.form.joinPhone.value == "") {
				alert("연락처를 입력해주세요.");
				document.form.joinPhone.focus();
				return false;
			}
			
			// 연락처 유효성 검사
			var phoneRegExp = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/;
			var phone = document.form.joinPhone.value;
			if(!phoneRegExp.test(phone)) {
				alert("전화번호가 올바르지 않습니다. ex) 010-1234-1234");
				document.form.joinPhone.select();
				document.form.joinPhone.focus();
				return false;
			}
			
			// 가입자 유형 입력여부 체크
			if(document.getElementById('joinClass1').checked) {	
			
				
			}else if(document.getElementById('joinClass2').checked) {	
				
			
			}else{
				alert("가입자 유형을 선택해 주세요.");
				return false;
			}
			
			// 사유 입력여부 체크
			if(document.form.joinText.value.length == 0){
				alert('사유를 반드시 써주세요.');
				document.form.joinText.focus();
				return false;
			}
			
			return true;
			
		}
	</script>
</body>
</html>