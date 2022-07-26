<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
	integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ=="
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<style>
body {
	background-image: url('asset/img/bg.jpg');
	padding-left: 200px;
	padding-right: 200px;
	font-family: 'Do Hyeon', sans-serif;
}

.card-body {
	background-color: whitesmoke;
}

p {
	padding-top: 5px;
	padding-left: 20px;
	font-size: 30px;
}

#date{
	font-size : 20px;
	text-align : right;
}
</style>
</head>
<!-- ��ũ��Ʋ�� �Ⱦ����� ���� ���۾� �ϴ°���..JSP���� �ȿ��� ���� �����ϴ� �±� ��. id�� ������ -->
<!-- JSTL���� ������ �����ϴ� ��� var������ value��,�����ٰ�ELǥ������� �Ʊ� ���� ������ ������ �ִ´� -->
<!-- param.num url�� �ִ� �Ķ�����߿��� num�̶�� ���� �ҷ����ڴ�.. ���⼭ ������ ������ �ڹٺ����� �ƴϴ�.EL�� �ҷ����Ⱑ�� -->
<jsp:useBean id="BoardDAO" class="com.smhrd.model.BoardDAO"/>
<c:set var="board" value="${BoardDAO.selectOne(param.num)}"/>

<jsp:useBean id="ReplyDAO" class="com.smhrd.model.ReplyDAO"></jsp:useBean>
<c:set var="replyList" value="${ReplyDAO.selectReply(param.num)}"/>
<body>
	<form>
		<div class="card-body" style="margin-top: 100px; margin-bottom: 10px; height: 150px">
			<p>${board.name}/${board.writer}</p>
			<p id="date">�ۼ��� : ${board.uploadday}</p>
		</div>
	
		<!-- ����ۼ� -->
		<div class="card mb-2">
			<div class="card-body">
				<img src="img/${board.filename}">
				<!-- <img src="img/${BoardDAO.selectOne(param.num).filename}"> -->
				<ul class="list-group list-group-flush">
					<li class="list-group-item"><textarea class="form-control"
							id="exampleFormControlTextarea1" rows="3"></textarea>
						<button type="button" class="btn btn-dark mt-3" onclick="addReply()">post reply</button></li>
				</ul>
				<ul class="list-group list-group-flush" id="reply">
					<!-- ���⸦ �ۼ��ؾ� ���ΰ�ħ�ص� �״�� �������� -->
					<c:forEach items="${replyList}" var = "reply">
					<li class="list-group-item"><span>${reply.content}/${reply.writer}</span></li>
						
					</c:forEach>
					
		
				</ul>
			</div>
		</div>
	
	</form>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script>
		function addReply() {
		/* �������� �򰥸����� , ��ũ��Ʈ�ȿ��� elǥ��� ����, ǥ�������� �ڹٺ����������Ⱑ�� */
			let ta = $('textarea').val()
				
			$.ajax({
			//��û���
			url: 'ReplyCon',
			//��û������ (�Խù���ȣ, �ۼ����)
			data: {
				'boardnum':${param.num},
				'reply':ta
			},
			//��û���(get,post)
			type:'post',
			success:function(data){ //����� ����
				//alert(data) 
				$('#reply').prepend('<li class="list-group-item"><span>'+ta+'/${loginVO.id}</span></li>')
			},
			error :function(){ //����� ����
				alert('��Ž���')
			}
			
			})
		
		
		}
	</script>	
	
</body>
</body>
</html>