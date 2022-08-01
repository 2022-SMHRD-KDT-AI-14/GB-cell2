<%@page import="com.smhrd.model.tbl_share"%>
<%@page import="java.math.BigDecimal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<% //결
	tbl_share vo = (tbl_share)request.getAttribute("tbl_share");
	System.out.print("로그인 아이디 >> "+vo.getMEM_ID());
	System.out.print("게시글 번호 >> "+vo.getBOARD_SEQ().intValue());
%>

</body>
</html>