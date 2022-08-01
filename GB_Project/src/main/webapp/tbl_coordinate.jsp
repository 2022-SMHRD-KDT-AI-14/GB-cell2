<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="tbl_coordinateDAO" class="com.smhrd.model.tbl_coordinateDAO"/>
	<c:set var="coordinate" value="${tbl_coordinateDAO.selectArbeitOne(param.num)}"/>

	<div class="card-body" style="margin-top: 100px; margin-bottom: 10px; height: 150px">
		<p>제목 : ${board.ARTICLE_TITLE}</p>
		<p>작성자 : ${board.MEM_ID}</p>
		<p id="date">작성날짜 : ${board.ARTICLE_DATE}</p>
	</div>
	
	
</body>
</html>