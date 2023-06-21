<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>


<!DOCTYPE html>
<%@ page import="ww.member.model.*" %>
<%@ page import="ww.member.vo.Member" %>
<html>
<head>
<meta charset="UTF-8">
<title>idCheckProc.jsp</title>
<script>
function apply(id){
	opener.document.regForm.id.value=id;
	opener.document.regForm.idDuplication.value="idCheck";
    window.close(); //창닫기
}
</script>
</head>
<body>
	<div style="text-align: center"></div>
	<h3>아이디 중복 확인 결과</h3>

<%
	
    String id=request.getParameter("id");
    out.println("입력 ID : <strong>" + id + "</stong>");
    MemberDAO dao = new MemberDAO();
    int cnt = dao.duplecateId(id);
    if(cnt==0){
    	out.println("<p style='color: blue'>사용 가능한 아이디입니다.</p>");
	out.println("<a href='javascript:apply(\"" + id + "\")'><button type='button'>적용</button></a>");
    }else{
    	out.println("<p style='color: red'>해당 아이디는 사용하실 수 없습니다.</p>");
    }
%>
 <hr>
 <a href="javascript:history.back()"><button type="button">다시시도</button></a>
 &nbsp; &nbsp;
 <a href="javascript:window.close()"><button type="button">창 닫기</button></a>
</body>
</html>