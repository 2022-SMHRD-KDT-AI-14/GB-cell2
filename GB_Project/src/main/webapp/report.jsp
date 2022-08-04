<%@page import="com.smhrd.model.tbl_reportDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
<head>
<title>board</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<a href="home.html" class="logo"><strong>무언가 나누고 싶어?</strong>
						1/N !</a>
					
				</header>

				<!-- Content -->
				<section>
					<header class="main">
						<h1 style="text-align: center;">신고기록</h1>
					</header>
<div style="text-align: center;">
					<%
					String R_MEM_ID = request.getParameter("R_MEM_ID");

					tbl_reportDAO dao = new tbl_reportDAO();
					int cnt = dao.selectreportcount(R_MEM_ID);
					%>

					신고당한 게시물 수 :
					<%=cnt%>개

</div>


				</section>
			</div>
		</div>
	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>