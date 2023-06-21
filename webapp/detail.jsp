<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.File"%>
<%@ page import="ww.member.vo.*"%>
<%@ page import="ww.upload.controller.*"%>
<%@ page import="ww.upload.vo.*"%>
<%@ page import="ww.upload.model.*"%>

<!DOCTYPE html>
<html>
<head>
<%
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
<script
  src="https://code.jquery.com/jquery-1.12.4.js"
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
<body class="main-app1">

	<!--  -->
	<header>
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<h1>날씨정보 시각화</h1>
				<p class="lead fw-normal text-white-50 mb-0"></p>
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
					</a> <a href="myPage.jsp" class="nav__link callapse"> <ion-icon
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
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4">

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
					<button id="close">팝업닫기</button>
					<div>

						<img src="#" id="pop_img" style="width: 400px; height: 500px;">
						<%
						ArrayList<Upload> upload_list = (ArrayList<Upload>) request.getAttribute("all_upload");
						String filename = request.getParameter("filename");
						if (upload_list != null) {
							for (int i = 0; i < upload_list.size(); i++) {
								Upload u = upload_list.get(i);
								if (u.getImage().equals(filename)) {
							String text = u.getI_text();
							//out.print(text);
							out.print(text);
								}
							}
						} else {
							out.print("몰라");
						}
						%>

					</div>
				</div>
			</div>
		</div>
	</section>

	<script>
		/*function show(this_img) {
			alert("show call");
			alert(this.src);
			//alert($("#pop_img").src);
			document.querySelector(".background").className = "background show";
		}

		function close() {
			alert("close call");
			document.querySelector(".background").className = "background";
		}*/
		var filename = "1234";
		$(".show1")
				.on(
						"click",
						function() {
							alert(this.src);

							alert(filename);

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
									alert(data);
									// 컨트롤러로 보낸 값을 처리하는 로직
									/*$("#imgText").text("<p>"+data+"</p>");
									alert("end");*/
								}
							});

						});

		

		$("#close").on("click", function() {

			$(".background").attr("class", "background");
		});

		/*document.querySelector(".show1").addEventListener(
				'click', show);
		document.querySelector("#close").addEventListener(
				'click', close);
		 */
	</script>

	<!-- IONICONS -->
	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
	<!-- JS -->
	<script src="js/main.js"></script>
</body>

</html>