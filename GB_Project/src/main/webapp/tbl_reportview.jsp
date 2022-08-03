<%@page import="com.smhrd.model.tbl_report"%>
<%@page import="com.smhrd.model.tbl_reportDAO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.MemberDAO"%>
<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Forty by HTML5 UP</title>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload">
	<%
	tbl_reportDAO dao = new tbl_reportDAO();
	List<tbl_report> list = dao.selectAllListPage();
	%>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header"> <a href="tbl_main.jsp" class="logo"><strong>무언가
						나누고 싶어?</strong> 1/N !</a>
				<ul class="icons">
					<li><a href="logoutCon" class="icon solid fa-lock-open"><span
							class="label">Medium</span></a></li>

					<li><a href="#" class="icon solid fa-file-invoice-dollar"><span
							class="label">Medium</span></a></li>
					<li><a href="tbl_join.jsp" class="icon solid fa-user"><span
							class="label">Medium</span></a></li>
				</ul>
				</header>
				<section>
				<h2 style="text-align: center;">회원관리페이지</h2>
				</section>
				<table style="text-align: center;">

					
						<tr>
						<td><h5>제목</h5></td>
						<td><h5>내용</h5></td>
						<td><h5>신고자</h5></td>
						<td><h5>작성자</h5></td>
						<td><h5>신고상태</h5></td>
						</tr>
					
					
					<%
					for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%=list.get(i).getR_TITLE()%></td>
						<td><%=list.get(i).getR_CONTENT()%></td>
						<td><%=list.get(i).getMEM_ID()%></td>
						<td><%=list.get(i).getR_MEM_ID()%></td>
						<td><%=list.get(i).getR_STATE()%></td>
						<%
						if (list.get(i).getR_STATE().equals("미정")) {
						%>
						<td><a
							href="tbl_reportDeleteCon?BOARD_SEQ=<%=list.get(i).getBOARD_SEQ()%>">신고확정</a></td>
						<%
						}
						%>
					</tr>
					<%
					}
					%>
				</table>
				<div style="text-align: center;">
					<a href="tbl_main.jsp" class="button next scrolly">되돌아가기</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>

