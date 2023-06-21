<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idCheckForm.jsp</title>
<script>
function pValue(){
	document.getElementById("id_check").value = opener.document.regForm.id.value;
}
</script>

</head>
<body onload="pValue()">
	<div style="text-align: center">
	<h3>아이디 중복확인</h3>
	<form method="post" action="idCheckProc.jsp">
    아이디 : <input type="text" name="id" id="id_check" maxlength="10" autofocus>
    <input type="submit" value="중복확인">
	</form>
	</div>

</body>
</html>