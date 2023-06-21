<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String result = (String) request.getAttribute("uploadId");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Weather Wear</title>
<script type="text/javascript">
	function a(){
		alert("회원수정이 완료되었습니다.");
	}
	
	function idCheck(){
		window.open("idCheckForm.jsp", "idwin", "width=400", height="350");
	}
	
	function nickCheck(){
		window.open("nickCheckForm.jsp", "nickwin", "width=400", height="350");
	}
	
	function passConfirm() {
		/* 비밀번호, 비밀번호 확인 입력창에 입력된 값을 비교해서 같다면 비밀번호 일치, 그렇지 않으면 불일치 라는 텍스트 출력.*/
		/* document : 현재 문서를 의미함. 작성되고 있는 문서를 뜻함. */
		/* getElementByID('아이디') : 아이디에 적힌 값을 가진 id의 value를 get을 해서 password 변수 넣기 */
			var password = document.getElementById('password');					//비밀번호 
			var passwordConfirm = document.getElementById('passwordConfirm');	//비밀번호 확인 값
			var confrimMsg = document.getElementById('confirmMsg');				//확인 메세지
			var msgColor ="#ff0000";	
			
			if(password.value == passwordConfirm.value){//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
				confirmMsg.style.color = msgColor;/* span 태그의 ID(confirmMsg) 사용  */
				confirmMsg.innerHTML ="비밀번호 일치";/* innerHTML : HTML 내부에 추가적인 내용을 넣을 때 사용하는 것. */
			}else{
				confirmMsg.style.color = msgColor;
				confirmMsg.innerHTML ="비밀번호 불일치";
			}
		}
	
	function Validation(){
		var regForm = document.regForm;
		var pw = document.getElementById("password")
		var pw_ck = document.getElementById("passwordConfirm")
		var email = document.getElementById("email")
		var n_name = document.getElementById("n_name")
		var id_check = document.getElementById("id_check")
		var nick_check = document.getElementById("nick_check")

		if(pw.value==""){
			alert("비밀번호를 입력하세요")
			pw.focus();
			return false;
		}
		if(pw_ck.value==""){
			alert("비밀번호를 확인해주세요")
			pw.focus();
			return false;
		}
		if(email.value==""){
			alert("메일주소를 입력하세요")
			emial.focus();
			return false;
		}
		if(email.value.indexOf("@") == -1 || email.value.indexOf(".") == -1 || email.value.length <=5){
            alert("잘못된 이메일 형식입니다.")
            email.focus();
            return false;
        }
		if(n_name.value==""){
			alert("닉네임을 입력하세요")
			n_name.focus();
			return false;
		}
		if(nick_check.value!="nickCheck"){
			alert("닉네임 중복체크를 해주세요");
			nick_check.focus();
			return false;
		}
		document.regForm.submit();
		alert("회원수정이 완료되었습니다");
		return true;
	}
</script>
</head>
<body >
<a href="main.jsp">
<img src="img/icon.png" style="width: 180px; height: 150px; margin-left: 20px;">
</a>
	<div style="
    justify-content: center;text-align: center;
    display: flex;
    min-height: 100vh;">
	
	<div class="container">
	<h1 style="text-align: center;">회원수정</h1>
		<div class = "col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="updateMemberControl" name="regForm" onsubmit="return Validation()">
					<h3 style="text-align: center"></h3>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="pw" id="password" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호 확인" name="pw_ck" id="passwordConfirm" onkeyup="passConfirm()" maxlength="20"><span id="confirmMsg"></span>
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일" name="email" id="email" maxlength="50">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="닉네임" name="n_name" id="n_name" maxlength="20">
					</div>
					<button type="button" class="btn btn-primary form-control" value="nickCheck" onClick="nickCheck();">닉네임 중복확인</button>
					<input type="hidden" name="nickDuplication" id="nick_check" value="nickUncheck"/>	
					<br/>
					<br/>
					<input type="button" class="btn btn-primary form-control" value="회원정보수정" onclick="Validation();"/>
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	</div>
</body>
</html>