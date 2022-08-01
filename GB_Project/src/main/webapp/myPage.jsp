<%@page import="com.smhrd.model.MyPage"%>
<%@page import="com.smhrd.model.MyPageDAO"%>
<%@page import="com.smhrd.model.Member"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Forty by HTML5 UP</title>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="assets/css/main.css" />
</head>

<jsp:useBean id="MyPageDAO" class="com.smhrd.model.MyPageDAO" />
<c:set var="MyPageList" value="${MyPageDAO.selectMyPageOne(param.MEM_ID)}" />

<body style="text-align: center;">
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Menu -->
		<nav id="MyPage">
		<table>


			<caption>
				<h2>마이페이지</h2>
			</caption>

			<tr>
				<td>아이디 : ${MyPageList.MEM_ID}</td>
				<td>비밀번호 : ${MyPageList.MEM_PW}</td>
				<td>닉네임 : ${MyPageList.MEM_NICK}</td>
				<td>이름 : ${MyPageList.MEM_NAME}</td>
				<td>핸드폰번호 : ${MyPageList.MEM_PHONE}</td>
				<td>계좌번호 : ${MyPageList.MEM_BANK_NUM}</td>
				<td>주민번호 : ${MyPageList.MEM_JUMIN}</td>
				<td>회원온도 : ${MyPageList.MEM_TEMPER}</td>

				<c:choose>
					<c:when test="${MyPageList.MEM_AREA eq 'earth'}">
						<td>희망배송지역 없음</td>
					</c:when>

					<c:otherwise>
						<td>희망배송지역 : 
						${MEM_AREA}</td>

					</c:otherwise>
				</c:choose>
			</tr>

		</table>


		<c:choose>
			<c:when test="${MyPageList.MEM_AREA eq 'earth'}">
				<button type="button"
					onclick="location.href='myPageMemAreainput.jsp';">희망배송지 설정</button>
			</c:when>

			<c:otherwise>
				<button type="button"
					onclick="location.href='myPageMemAreainput.jsp';">희망배송지 수정</button>
					
			</c:otherwise>
		</c:choose> </nav>
		<a href="tbl_main.jsp" class="button next scrolly">되돌아가기</a>
		
	</div>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>
</body>
</html>


