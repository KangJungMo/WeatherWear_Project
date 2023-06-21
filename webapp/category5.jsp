<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.File"%>
<%@ page import="ww.member.vo.*"%>
<%@ page import="ww.upload.controller.*"%>
<%@ page import="ww.upload.vo.*"%>
<%@ page import="ww.upload.model.*"%>
<%@ page import="ww.mypage.controller.*"%>
<%@ page import="ww.category.controller.*"%>


<!DOCTYPE html>
<html>
<head>
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
	crossorigin="anonymous"></script>

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
			<div class="text-center ">
				<img class="weatherIcon" style="float: left;">
				<h4>
					<span class="weatherInfo" style="float: left;"></span>
				</h4>
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
				List category_list = (List) request.getAttribute("category");
				if (category_list != null) {
					File dir = new File("C:\\Users\\82109\\eclipse-workspace\\weather_wear\\src\\main\\webapp\\my_file");
					File files[] = dir.listFiles();
					for (int i = files.length - 1; i >= 0; i--) {
						String name = files[i].getPath();
						int idx = name.lastIndexOf("\\");
						String fName = name.substring(idx + 1, name.length());
						if (category_list.contains(fName)) {
					out.print("<div class=\"col mb-5\"><div><img class=\"card-img show1\" src=\"my_file/" + fName
							+ "\" alt=\"...\" /></div></div>");
						}
					}
				}
				%>



			</div>
		</div>

		<div class="background">
			<div class="window">
				<div class="popup">
					<div class="text-left1">
						<img src="#" id="pop_img" style="width: 520px; height: 620px;" />
					</div>

					<div class="text-right1">
						<button id="close" style="float: right;"
							class="btn btn-outline-dark">돌아가기</button>
						<br />
						<div class="text-right1">
							<div style="float: left; padding-left: 20px;">
								<h2 id="imgId"></h2>
								<h2 id="imgDate"></h2>
							</div>
							<br /> <br />
							<hr />
							<div id="aside" class="text-center1"
								style="padding-left: 20px; padding-right: 20px;">
								<h3>패션정보:</h3>
								<h6 id='imgText'></h6>
							</div>

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
	</script>

	<!-- IONICONS -->
	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
	<!-- JS -->
	<script src="js/main.js"></script>
</body>

</html>

