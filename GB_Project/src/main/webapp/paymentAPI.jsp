<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
//세션값아닌 request가 받아온값(서브쿼리로 들어온값)은 JSP HTML태그에서 el표기법 먹히나???? param.써야할듯
		System.out.println("paymentAPI, 게시글번호 >> "+request.getParameter("board_seq"));
%>

	
		
  <form method="get" action="https://openapi.openbanking.or.kr/oauth/2.0/authorize" target="_blank">
  <input type="hidden" name="response_type" value="code"/>
  <input type="hidden" name="client_id" value="{9b7f2376-6bbc-4b51-9c71-28c0c1865615}"/>
  <input type="hidden" name="redirect_uri" value="{https://developers.kftc.or.kr/dev/mypage/apikey}"/>
  <input type="hidden" name="scope" value="login inquiry transfer"/>
  <input type="hidden" name="state" value="1234567890123456789012"/>
  <input type="hidden" name="auth_type" value="0"/>
  <input type="submit" value="requestAuth"/>
  </form>
  
							

<p><h1>참여자수 : ${cnt}</h1></p><br>
<p><h1>원래가격 :</h1></p><br>
<p><h1>1/n금액 :</h1></p><br>

</div>
입력값: 1자 아이디, 게시글번호, 금액, 참여자인원
등록한 게시글조회보기 + 진행상태(진행 완료 취소 공백)
								
								(참여버튼 눌러서 확인가능)참여한 게시글조회보기 + 진행상태(거리상태의 진행 완료 취소 공백)
								1.1자 거래상태는 공백 상태로 올리기
								2.2자가 채팅으로 참여버튼 누르기
								3.1자가 인원수 확정후 금액 브로커에게 보내기 (계좌이체 API)/돈 받음완료 상태변경하기
								4.브로커는 계산해서 2자에게 금액알리기/
								5.2자는 진행상태를 취소(언제까지?)할 수 있는 UI구성
								6.1자는 거래완료후 브로커에 알리기 > 거래정보 공유하기
								7.2자는 거래완료 버튼 누르기
								8.1자에게 거래금액 돌려주기(계좌이체 API)
								
								등록한 게시글조회보기 + 진행상태(진행 완료 취소 공백)
								
								(참여버튼 눌러서 확인가능)참여한 게시글조회보기 + 진행상태(거리상태의 진행 완료 취소 공백)
</body>
</html>