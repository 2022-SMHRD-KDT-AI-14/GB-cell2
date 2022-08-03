<%@page import="com.smhrd.model.tbl_reportDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String R_MEM_ID = request.getParameter("R_MEM_ID");
	
	tbl_reportDAO dao = new tbl_reportDAO();
	int cnt = dao.selectreportcount(R_MEM_ID);
	%>
	
	신고당한 게시물 수 : <%=cnt%>개
	
	
</body>
</html>