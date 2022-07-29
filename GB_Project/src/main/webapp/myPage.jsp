<%@page import="com.smhrd.model.MyPage"%>
<%@page import="com.smhrd.model.MyPageDAO"%>
<%@page import="com.smhrd.model.Member"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Forty by HTML5 UP</title>
		<meta charset="UTF-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body style="text-align: center;">
		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Menu -->
					<nav id="Update">	
						<table>
							<caption><h2>마이페이지</h2></caption>
							<tr>
								<td>아이디</td>
								<td>비밀번호</td>
								<td>닉네임</td>							
								<td>이름</td>							
								<td>핸드폰번호</td>							
								<td>계좌번호</td>							
								<td>주민번호</td>							
								<td>회원온도</td>							
								<td>희망배송지역</td>							
							</tr>
					<!-- useBean 자바의 객체를 가져올 수 있음 -->
					<jsp:useBean id="MyPageDAO" class="com.smhrd.model.MyPageDAO"/>	
					<!-- jstl을 사용해서 변수 만들기 var="변수이름" value="실제값"-->
					<c:set var="MyPageList" value="${MyPageDAO.selectAllList()}"/>	
						
							<tr>
								<td>아이디 : ${MyPageList.MEM_ID}" </td>
								<td>비밀번호 : ${MyPageList.MEM_PW}" </td>
								<td>닉네임 : ${MyPageList.MEM_NICK}"</td>							
								<td>이름 : ${MyPageList.MEM_NAME}" </td>
								<td>핸드폰번호 : ${MyPageList.MEM_PHONE}" </td>
								<td>계좌번호 : ${MyPageList.MEM_BANK_NUM}" </td>							
								<td>주민번호 : ${MyPageList.MEM_JUMIN}"</td>
								<td>회원온도 : ${MyPageList.MEM_TEMPER}"</td>
								<td>희망배송지역 : ${MyPageList.MEM_AREA}" </td>							
							</tr>
					
					</table>
				
							<!-- 2.모든 회원의 이메일(email),전화번호(tel),주소(address)를 출력하시오. -->
						
						</table>
					</nav>		
					<a href="test_main.jsp" class="button next scrolly">되돌아가기</a>	
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


