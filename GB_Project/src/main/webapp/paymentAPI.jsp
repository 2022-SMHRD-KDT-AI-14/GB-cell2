<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제시스템 가동중</title>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body> 	

<%
String board_seq = (String)request.getParameter("board_seq");
%>
	
	 
	입금금액 :<input type="text">
	<a href="AppToPay?board_seq=<%=board_seq%>">보내기</a>



<!--   <form method="post" action="#">
  <input type="text" name="response_type" value="code"/>
  <input type="hidden" name="client_id" value="37728506-fe37-4cb7-a422-16ba6d8ef106}"/>
  <input type="hidden" name="redirect_uri" value="{https://developers.kftc.or.kr/dev/mypage/apikey}"/>
  <input type="hidden" name="scope" value="login inquiry transfer"/>
  <input type="hidden" name="state" value="12345678901234567890123456789012"/>
  <input type="hidden" name="auth_type" value="0"/>
  <input type="submit" value="requestAuth"/>
  </form> -->
  
</body>
</html>