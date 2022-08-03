<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" isELIgnored="false"%>
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
input[type=text]{
	width : 100%;
	height : 100%;
	font-size: 30px;
}
.mytest{
	displya: 'none'

}

</style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


</head>
<body>
	<!-- form action="BoardWC" method="post" enctype="multipart/form-data" accept-charset="UTF-8"> -->
	<%
	String num = (String)request.getParameter("num");
	session.setAttribute("num",num);
	%>
	 <form action="tbl_reportCon" method="post" > 
	
		<div class="card-body" style="margin-top: 100px; margin-bottom: 10px; height: 50px">
			<input type="text" placeholder="신고게시물 제목 작성" name="name">
		</div>
	
		<!-- 게시물 작성 -->
		<div class="card mb-2" style="width : 100%;">
			<div class="card-body">
			
                    
                                  
				
			
				
						
			
				
						<textarea name="content" rows="10" style="width : 100%;"></textarea>	
				<input type="submit" value="신고게시물작성" >
			</div>
		</div>
	</form>
	
</body>
</body>
</html>