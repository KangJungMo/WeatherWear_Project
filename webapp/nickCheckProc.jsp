<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="ww.member.model.MemberDAO" %>
<%@ page import="ww.member.vo.Member" %>
<html>
<head>
<meta charset="UTF-8">
<title>nickCheckProc.jsp</title>
<script>
function apply(n_name){
	opener.document.regForm.n_name.value=n_name;
	opener.document.regForm.nickDuplication.value="nickCheck";
    window.close(); //창닫기
}
</script>
</head>
<body>
	<div style="text-align: center"></div>
	<h3>아이디 중복 확인 결과</h3>

<%
	
    String n_name=request.getParameter("n_name");
    out.println("입력 닉네임 : <strong>" + n_name + "</stong>");
    MemberDAO dao = new MemberDAO();
    int cnt = dao.duplecateNickname(n_name);
    if(cnt==0){
    	out.println("<p style='color: blue'>사용 가능한 닉네임입니다.</p>");
	out.println("<a href='javascript:apply(\"" + n_name + "\")'><button type='button'>적용</button></a>");
    }else{
    	out.println("<p style='color: red'>해당 닉네임은 사용하실 수 없습니다.</p>");
    }
%>
 <hr>
 <a href="javascript:history.back()"><button type="button">다시시도</button></a>
 &nbsp; &nbsp;
 <a href="javascript:window.close()"><button type="button">창 닫기</button></a>
</body>
</html>