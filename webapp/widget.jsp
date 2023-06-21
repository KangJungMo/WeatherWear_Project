<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"
	integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
	crossorigin="anonymous">
	
</script>
<script type="text/javascript">
function weather() {
    $.ajax({
    	url : "/api/weather",
    	type : "get",
    	timeout : 30000,
    	contentType : "application/json",
    	dataType : "json",
    	success : function(data, status, xhr){
    		let dataHeader = data.result.response.header.resultCode;
    		
    		if(dataHeader == "00"){
    			console.log("success ==>");
    			console.log(data);
    		}else{
    			console.log("fail ==>");
    			console.log(data);
    		}
    	},
    	error : function(e, status, xhr, data){
    		console.log("error ==>");
    		console.log(e);
    	}
    });
 }   
</script>

</head>
<body>

</body>
</html>