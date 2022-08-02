<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body> 	

	<form action="updateStateCon?board_seq=${board_seq}&article_state=${article_state}">
	${board_seq}는 ${article_state} 상태임
	<c:out value=" ${board_seq}"/>는 ${article_state} 상태임
	입금액<input type="text" name="input">
	<input type="submit" value="이체API 되었다 하고 상태변화하러가기">
	</form>
	<script>alert('dkssud')</script>



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