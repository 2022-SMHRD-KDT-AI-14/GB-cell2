<%@page import="com.smhrd.controller.MyPageMemareaInput"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<h1>희망주소지</h1>
<button type="button" onclick="location.href='myPageMemAreainput.jsp';">희망배송지주소입력버튼</button>


	<%
	
	// tbl_mem >> select 희망배송지 
 	String result = (String) request.getAttribute("MEM_AREA");
	%>
	<%
	if (result != null) {
	%>
	<h1>
		배송지 :
		<%=result%></h1>
	<%
	}
	%>

	


</body>
</html>