<%@page import="com.smhrd.model.tbl_share"%>
<%@page import="com.smhrd.model.tbl_coordinate"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.tbl_coordinateDAO"%>
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

<%

	String MEM_ID = request.getParameter("MEM_ID");
	tbl_coordinateDAO dao = new tbl_coordinateDAO();
	List<tbl_share> list = dao.selectlistshare(MEM_ID);
%>
 
  <%
  
  if(MEM_ID!=null){
  for(tbl_share b:list){ %>
  <tr>
      <td><%=b.getARTICLE_TITLE()%></td>
  </tr>
  <%} }%>
	
	
</body>
</html>