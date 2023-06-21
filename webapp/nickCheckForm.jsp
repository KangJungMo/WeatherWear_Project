<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nickCheckForm.jsp</title>
<script>
function pValue(){
	document.getElementById("nick_check").value = opener.document.regForm.n_name.value;
}
</script>
</head>
<body onload="pValue()">
	<div style="text-align: center">
	<h3>닉네임 중복확인</h3>
	<form method="post" action="nickCheckProc.jsp">
    닉네임 : <input type="text" name="n_name" id="nick_check" maxlength="10" autofocus>
    <input type="submit" value="중복확인">
	</form>
	</div>

</body>
</html>