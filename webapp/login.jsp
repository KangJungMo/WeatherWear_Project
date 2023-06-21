<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="ww.member.vo.*" %>
<%@ page import="ww.member.model.*" %>

<%
String result = (String) request.getAttribute("result");
if(result!=null){
%>
<script>
alert("${result}");
</script>
<% }%>
<%
//session(일정시간 동안 데이터를 저장하고 있음)의 정보리턴
//로그인한 회원 정보 리턴(Member)session.getAttribute("login_member")
//해서 login_member에 저장
Member login_member=(Member)session.getAttribute("login_member");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Weather Wear</title>
</head>

<body >
	<img src="img/icon.png" style="width: 180px; height: 150px; margin-left: 20px;">
	<div style="
    justify-content: center;text-align: center;
    display: flex;
    min-height: 100vh;">
	<div class="container">
	
		<h1 style="text-align: center;">Weather Wear</h1>
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="loginControl">
					<h3 style="text-align: center;">로그인</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							name="id" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="pw" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control"
						value="로그인" />
				</form>
				<br />
				<form method="get" action="insertMemberControl">
					<input type="submit" class="btn btn-primary form-control"
						value="지금 회원가입하기!" />
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
</div>
</body>
</html>