<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<meta name="description" content="MIT Website" />
<meta name="author" content="" />

<title>MIT</title>

<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
<link href="/resources/bootstrap/css/login.css" rel="stylesheet" />
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet">
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
			<div class="col-lg-11 login-btm login-text" ></div>
			<div style="font-size: 25px; color:#343a40;">
			<div onclick="history.go(-1)">
				<i class="bi bi-x-square-fill"></i>
			</div>
				<div class="col-lg-12 login-key" style="font-size: 60px; color:#343a40;">
						<i class="fas fa-smile fa-spin"></i>
						<script
							src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
				</div>
				<div class="col-lg-12 login-title">LOGIN</div>
				<div class="col-lg-12 login-form">
					<div class="col-lg-12 login-form">
						<form action="/member/loginPost" method="post">
							<div class="form-group">
								<label class="form-control-label">학번</label> <input type="text"
									class="form-control" name="memberNo">
							</div>
							<div class="form-group">
								<label class="form-control-label">비밀번호</label> <input
									type="password" class="form-control" name="memberPw">
							</div>
							<div class="col-lg-12 loginbttm">
								<div class="col-lg-6 login-btm login-text">
									<!-- Error Message -->
								</div>
								<div class="col-lg-6 login-btm login-button">
									<button type="submit" class="btn btn-outline-primary">로그인</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-2"></div>
		</div>
	</div>
	<script>
		function returnMain() {
			location.href="http://localhost:8181/";
		}
	</script>
</body>
</html>