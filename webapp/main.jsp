<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.File"%>
<%@ page import="ww.member.vo.*"%>
<%@ page import="ww.upload.controller.*"%>
<%@ page import="ww.upload.vo.*"%>
<%@ page import="ww.upload.model.*"%>
<%@ page import="ww.mypage.controller.*"%>


<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<%
String result = (String) request.getAttribute("uploadId");
Member login_member = (Member) session.getAttribute("login_member");
if (login_member == null) {
%>
<script type="text/javascript">
	alert("로그인 후 이용해주세요");
	location.href = "login.jsp";
</script>
<%
}
%>
<script type="text/javascript">
	function f1(this_img) {
		alert("img click");
		alert(this_img.src);

	}
</script>
<script src="https://code.jquery.com/jquery-1.12.4.js"
	integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
	crossorigin="anonymous">
	
</script>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>main page</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<script src="https://code.jquery.com/jquery-1.12.4.js"
	integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
	crossorigin="anonymous">
	
</script>
<script>
	var dt = new Date();
	var year = dt.getFullYear();
	var month = dt.getMonth() + 1; // 1을 더하여 실제 월 값을 얻음
	var date = dt.getDate();
	
	if (month < 10)
		month = "0"+month;
	if(date <10)
		date = "0"+date;
	var now = year + "-" + month + "-" + date;
	
	var tomorrow = year + "-" + month + "-" + (date + 1);
	
	var day_after_tomorrow = year + "-" + month + "-" + (date + 2)
	
</script>

<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<title>Weather Wear</title>
</head>
<body id="body-pd" class="main-app1">

	<!--  -->
	<header style="z-index: 1000">
		<div class="container px-4 px-lg-5 my-5" style="padding-top: 20px;">
			<div class="weather-screen" id="weather-screen">
			<!-- 
			<div class="screen-in"><br/>6시<br/>아이콘<br/>온도<br/>습도</div>
			<div class="screen-in" style="left: 12.5%; "><br/>9시<br/>아이콘<br/>온도<br/>습도</div>
			<div class="screen-in" style="left: 25%; "><br/>12시<br/>아이콘<br/>온도<br/>습도</div>
			<div class="screen-in" style="left: 37.5%; "><br/>15시<br/>아이콘<br/>온도<br/>습도</div>
			<div class="screen-in" style="left: 50%; "><br/>18시<br/>아이콘<br/>온도<br/>습도</div>
			<div class="screen-in" style="left: 62.5%; "><br/>21시<br/>아이콘<br/>온도<br/>습도</div>
			<div class="screen-in" style="left: 75%; "><br/>24시<br/>아이콘<br/>온도<br/>습도</div>
			<div class="screen-in" style="left: 87.5%;"><br/>3시<br/>아이콘<br/>온도<br/>습도</div>
			-->
		</div>
		<div class="cate-screen">
		<form name="select" method="post" action="realtimeControl"
					onsubmit="return realtime_weather()">
				<select name="local" id="local"
							class="form-control2" style="float: right; width: 80px; text-align: center;">
							<option value="">-지역-</option>
							<option value='서울'>서울</option>
						<option value='춘천'>춘천</option>
						<option value='강릉'>강릉</option>
						<option value='수원'>수원</option>
						<option value='청주'>청주</option>
						<option value='대전'>대전</option>
						<option value='전주'>전주</option>
						<option value='광주'>광주</option>
						<option value='목포'>목포</option>
						<option value='여수'>여수</option>
						<option value='안동'>안동</option>
						<option value='대구'>대구</option>
						<option value='울산'>울산</option>
						<option value='부산'>부산</option>
						<option value='제주'>제주</option>
						</select> 
							<select class="form-control2" name="day" id="day" style="float: right; width: 80px; text-align: center;">
						
							<option value="">-날짜-</option>
							<option value="now" id="nowOption">오늘</option>
							<option value="tomorrow" id="tomorrowOption">내일</option>
							<option value="dayafter_tomorrow" id="dayAfterTomorrowOption">모레</option>
					</select><br/><br/>
					<script>
						document.getElementById("nowOption").value = now;
						document.getElementById("tomorrowOption").value = tomorrow;
						document.getElementById("dayAfterTomorrowOption").value = day_after_tomorrow;
					</script>
					<input type="button" value="선택" onclick="realtime_weather();"
						style="float: right; width: 160px; background-color: #337ab7" class="btn btn-primary">
				</form>
		</div>
		<div class="icon-screen">
		<a href="main.jsp">
			<img src="img/icon.png" style="left: 0%; width: 120px; height: 90px;">
			</a>
		</div>
		
				
			
						
		</div>
		
	</header>


	<!-- sidebar -->
	<div class="l-navbar" id="navbar">
		<nav class="nav">
			<div>
				<div class="nav__brand">
					<ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
					<a href="#" class="nav__logo">Weather Wear</a>
				</div>
				<div class="nav__list">
					<a href="main.jsp" class="nav__link active"> <ion-icon
							name="home-outline" class="nav__icon"></ion-icon> <span
						class="nav_name">Home</span>
					</a> <a href="myPageControl" class="nav__link callapse"> <ion-icon
							name="person-outline" class="nav__icon"></ion-icon> <span
						class="nav_name">My Page</span>
					</a> <a href="upload.jsp" class="nav__link"> <ion-icon
							name="arrow-up-circle-sharp" class="nav__icon"></ion-icon> <span
						class="nav_name">Upload</span>
					</a>


				</div>
				<a href="logoutControl" class="nav__link"> <ion-icon
						name="log-out-outline" class="nav__icon"></ion-icon> <span
					class="nav_name">Log out</span>
				</a>
			</div>
		</nav>
	</div>

	<!-- Section-->
	<section>
		<div class="container px-4 px-lg-5 mt-5">
		<hr/>
			<div class="box">
<a href = "categoryControl0">			
<div class="box1" style="background: white; float: left; margin-left: 60px; ">
<input type="image" class="profile1 cate" src="/cate_img/민소매.png" name="민소매">
</div>
</a>
<a href = "categoryControl1">
<div class="box1" style="background: white; float: left; margin-left: 35px; ">
<input type="image" class="profile1 cate" src="/cate_img/반팔티.png" name="반팔상의" >
</div>
</a>
<a href = "categoryControl2">
<div class="box1" style="background: white; float: left; margin-left: 35px;">
<input type="image" class="profile1 cate" src="/cate_img/긴팔티.png" name="긴팔상의" >
</div>
</a>
<a href = "categoryControl3">
<div class="box1" style="background: white; float: left; margin-left: 35px;">
<input type="image" class="profile1 cate" src="/cate_img/긴바지.png" name="긴바지" >
</div>
<a href = "categoryControl4">
<div class="box1" style="background: white; float: left; margin-left: 35px;">
<input type="image" class="profile1 cate" src="/cate_img/짧은바지.png" name="짧은바지" >
</div>
<a href = "categoryControl5">
<div class="box1" style="background: white; float: left; margin-left: 35px;">
<input type="image" class="profile1 cate" src="/cate_img/긴치마.png" name="긴치마" >
</div>
</a>
<a href = "categoryControl6">
<div class="box1" style="background: white; float: left; margin-left: 35px;">
<input type="image" class="profile1 cate" src="/cate_img/짧은치마.png" name="짧은치마" >
</div>
</a>
<a href = "categoryControl7">
<div class="box1" style="background: white; float: left; margin-left: 35px;">
<input type="image" class="profile1 cate" src="/cate_img/긴원피스.png" name="긴원피스" >
</div>
</a>
<a href = "categoryControl8">
<div class="box1" style="background: white; float: left; margin-left: 35px;">
<input type="image" class="profile1 cate" src="/cate_img/짧은원피스.png" name="짧은원피스" >
</div>
</a>
<a href = "categoryControl9">
<div class="box1" style="background: white; float: left; margin-left: 35px;">
<input type="image" class="profile1 cate" src="/cate_img/아우터.png" name="아우터" >
</div>
</a>
</div>
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4" id="label_img">

				<%
				// webapp/image 경로 전체 복사해서 넣어주세요
				File dir = new File("C:\\Users\\82109\\eclipse-workspace\\weather_wear\\src\\main\\webapp\\my_file");

				File files[] = dir.listFiles();

				for (int i = files.length - 1; i >= 0; i--) {

					String name = files[i].getPath();
					int idx = name.lastIndexOf("\\");
					String fName = name.substring(idx + 1, name.length());

					out.print("<div class=\"col mb-5\"><div><img class=\"card-img show1\" src=\"my_file/" + fName + "\""
					+ "alt=\"...\"  /></div></div>");
				}
				%>

			</div>
		</div>

		<div class="background">
			<div class="window">
				<div class="popup">
					<div class="text-left1">
						<img src="#" id="pop_img" style="width: 440px; height: 620px; " />

					</div>

					<div class="text-right1">

						<button id="close" style="float: right;"
							class="btn btn-outline-dark">돌아가기</button>
							
						<br />
						
						<div style="float: left; padding-left: 20px;">
					
						<h6 id="imgId"></h6>
						<h6 id="imgDate"></h6>
						
						</div>
						<br/><br/>
						<hr/>
						

						<div id="aside" class="text-center1" style="padding-left: 20px; padding-right: 20px;">
							<h5 id='imgText'></h5>
							
							
						</div>
						
						
					</div>
				</div>
			</div>
		</div>
	</section>

	<script>
		var filename = "1234";
		$(".show1")
				.on(
						"click",
						function() {

							filename = this.src.substring(this.src
									.lastIndexOf('/') + 1);
							$("#pop_img").attr("src", this.src);
							document.querySelector(".background").className = "background show";
							$.ajax({

								url : '/uploadListControl',
								type : 'POST',
								data : {
									filename : filename
								},
								success : function(data) {

									// 컨트롤러로 보낸 값을 처리하는 로직
									$("#imgText").text(data);

								}
							});
						});

		$("#close").on("click", function() {

			$(".background").attr("class", "background");
		});
	</script>

	<script>
		var filename = "1234";
		$(".show1")
				.on(
						"click",
						function() {

							filename = this.src.substring(this.src
									.lastIndexOf('/') + 1);
							$("#pop_img").attr("src", this.src);
							document.querySelector(".background").className = "background show";
							$.ajax({

								url : '/uploadIdControl',
								type : 'POST',
								data : {
									filename : filename
								},
								success : function(data) {

									// 컨트롤러로 보낸 값을 처리하는 로직
									$("#imgId").text(data);

								}
							});
							$.ajax({

								url : '/uploadDayControl',
								type : 'POST',
								data : {
									filename : filename
								},
								success : function(data) {

									// 컨트롤러로 보낸 값을 처리하는 로직
									$("#imgDate").text(data);
								}
							});
						});
		$("#close").on("click", function() {

			$(".background").attr("class", "background");
		});
		$(".cate").on("click", function() {

		});
	</script>

	<script type="text/javascript">
		function realtime_weather() {
			
			
			var local = document.getElementById("local").value;
			
			var day = document.getElementById("day").value;
			

			axios({
				method : "post",
				url : "viewControl",
				params : {
					"view_area" : local,
					"view_date" : day
				}
				
			}).then(
					function(response) {
						
						var labe_img = response.data.tmp.label;
						
						for(var i=0; i<response.data.v_list.length;i++){
							var tmp = response.data.v_list[i].tmp;
						
							var wet = response.data.v_list[i].wet;
						
							
							var img = "sun";
							if ((Number(response.data.v_list[i].view_time)/100)==3 || (Number(response.data.v_list[i].view_time)/100)==0 || (Number(response.data.v_list[i].view_time)/100)==21){
								img = "night";
							}
								
							
							
							$("#weather-screen").append(
									'<div class="screen-in" style="left: '
									+(i*12.5)+'%; "><br/>'
									+'<div class="text-center3">'
									+(Number(response.data.v_list[i].view_time)/100)
									+'시<br/>'+'<input type="image" src="img/'+img+'.png" style="width: 40px; height: 40px; align-items: center;"><br/>'+'<br/>'
									+tmp+"'C"+'<br/>'+wet+'%'+'</div></div>'
									);
						}
						
						$("#label_img").empty();
						
						for(var i=0; i<response.data.i_list.length;i++){
							
							$("#label_img").append(
									"<div class=\"col mb-5\"><div><img class=\"card-img show1\" src=\"my_file/"
									+ response.data.i_list[i].image + "\""
									+ "alt=\"...\" /></div></div>"
									);
						}
						
					});
		
			//document.select.submit();
		}
		
	</script>
	
	<script>
		var filename = "1234";
		$(".show1")
				.on(
						"click",
						function() {

							filename = this.src.substring(this.src
									.lastIndexOf('/') + 1);
							$("#pop_img").attr("src", this.src);
							document.querySelector(".background").className = "background show";
							$.ajax({

								url : '/uploadIdControl',
								type : 'POST',
								data : {
									filename : filename
								},
								success : function(data) {

									// 컨트롤러로 보낸 값을 처리하는 로직
									$("#imgId").text(data);

								}
							});
							$.ajax({

								url : '/uploadDayControl',
								type : 'POST',
								data : {
									filename : filename
								},
								success : function(data) {

									// 컨트롤러로 보낸 값을 처리하는 로직
									$("#imgDate").text(data);
								}
							});
						});
		$("#close").on("click", function() {

			$(".background").attr("class", "background");
		});
		$(".cate").on("click", function() {

		});
	</script>
<div class="background">
			<div class="window">
				<div class="popup">
					<div class="text-left1">
						<img src="#" id="pop_img" style="width: 440px; height: 620px; " />

					</div>

					<div class="text-right1">

						<button id="close" style="float: right;"
							class="btn btn-outline-dark">돌아가기</button>
							
						<br />
						
						<div style="float: left; padding-left: 20px;">
					
						<h6 id="imgId"></h6>
						<h6 id="imgDate"></h6>
						
						</div>
						<br/><br/>
						<hr/>
						

						<div id="aside" class="text-center1" style="padding-left: 20px; padding-right: 20px;">
							<h5 id='imgText'></h5>
							
							
						</div>
						
						
					</div>
				</div>
			</div>
		</div>
	<!-- IONICONS -->
	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
	<!-- JS -->
	<script src="js/main.js"></script>

</body>

</html>