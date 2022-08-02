<%@page import="com.smhrd.model.tbl_share"%>
<%@page import="java.util.Random"%>
<%@page import="com.smhrd.model.tbl_coordinate"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.tbl_coordinateDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>join2</title>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
</head>

<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<a href="tbl_main.jsp" class="logo"><strong>무언가 나누고 싶어?</strong> 1/N !</a>
					<ul class="icons">
						<li><a href="tbl_login.jsp" class="icon solid fa-lock"><span class="label">Medium</span></a></li>
						<li><a href="#" class="icon solid fa-file-invoice-dollar"><span class="label">Medium</span></a>
						</li>
						<li><a href="tbl_join.jsp" class="icon solid fa-user"><span class="label">Medium</span></a></li>
					</ul>
				</header>

				<!-- Content -->
				<section>
					<header class="main">
						<h1>회원이 아니신가요?</h1>
					</header>
					<p> 저희 사이트에 가입하시면 다양한 서비스를 이용하실 수 있습니다.</p>
					<table boder="" bgcolor="#ffffff" cellspacing="1" width: 100%;>
						<form action="test_JoinCon" method="post">
							<tr><td>회원가입</td></tr>
							<tr>
								<td text-align="center">아이디 </td>
								<td>
									<div class="row">
										<div class="col-6 col-12-small">
											<input type="text" id="inputE"
							placeholder="id를 입력하세요" name="id">
										</div>
										<div class="col-6 col-12-small">
											<input type="button" value="중복확인" />
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td> 비밀번호 </td>
								<td>
									<div class="row">
										<div class="col-6 col-12-small">
											<input type="password" placeholder="PW를 입력하세요" name="pw">
										</div>
									</div>
								</td>
								
							</tr>
							<tr>
								<td> 비밀번호 확인 </td>
								<td>
									<div class="row">
										<div class="col-6 col-12-small">
											<input type="password" placeholder="PW를 입력하세요" name="pw">*비밀번호를 다시입력하여주세요. 
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td> 성명 </td>
								<td> 
									<div class="row">
										<div class="col-6 col-12-small">
											<input type="text" placeholder="이름을 입력하세요" name="name">
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td> 닉네임 </td>
								<td>
									<div class="row">
										<div class="col-6 col-12-small">
											<input type="text" placeholder="닉네임을 입력하세요" name="nick">
										
								</td>
							</tr>
							
								<td> 휴대폰 </td>
								<td>
									<div class="row">
										<div class="col-6 col-12-small">
											<input type="text" placeholder="전화번호를 입력하세요" name="phone">
										</div>
										<div>
											<a href="mobilePhoneAPI.jsp"><input type="button" name="certification" value="인증받기"></a>
										</div>
									</div>
									
								</td>
							</tr>
							<tr>
								<td> 계좌번호 </td>
								<td>
									<div class="row">
										<div class="col-6 col-12-small">
											<select style="margin-bottom: 10px;">
												<option> 선택 </option>
												<option> 카카오 </option>
												<option> 농협 </option>
												<option> 국민 </option>
												<option> 신한 </option>
												<option> 우리 </option>
												<option> 기업 </option>
												<option> 하나 </option>
												<option> 새마을 </option>
												<option> 우체국 </option>
												<option> SC제일 </option>
												<option> 대구 </option>
												<option> 신협 </option>
											</select>
										</div>
										<div>
											<input type="button" name="certification" value="인증받기">
										</div>
										<div class="col-6 col-12-small">
											<input type="text" placeholder="계좌번호를 입력하세요" name="account">
										</div>
									</div>
									
								</td>
							</tr>
							<tr>
								<td> 주민번호 </td>
								<td>
									<div class="row">
										<div class="col-6 col-12-small">
											<input type="text" placeholder="주민번호를 입력하세요" name="jumin">
										</div>
										<div>
											<input type="button" name="certification" value="인증받기">
										</div>
									</div>
								</td>
							</tr>
							<br>
							<br />
							</td>
							</tr>
							
						</form>
					</table>
					<div style="text-align: center;">
						<a href="tbl_main.jsp" class="button">메인으로 가기</a></li>
					<input type="submit" class="button primary" value="회원가입" class="button fit">
						
					</div>
					

					<!-- Content -->
					
					<div class="row">
						<div class="col-6 col-12-small">
						</div>
						<div class="col-6 col-12-small">
						</div>
						<!-- Break -->
						<div class="col-4 col-12-medium">
						</div>
						<div class="col-4 col-12-medium">
						</div>
						<div class="col-4 col-12-medium">
						</div>
					</div>

					<hr class="major" />

					<!-- Elements -->
					
					<div class="row gtr-200">
						<div class="col-6 col-12-medium">
						</div>
						<div class="col-6 col-12-medium">
							</code></pre>

						</div>
					</div>

				</section>

			</div>
		</div>

		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">

				<!-- Search -->
				<section id="search" class="alt">
					<form method="post" action="#">
						<input type="text" name="query" id="query" placeholder="Search" />
					</form>
				</section>

				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>Menu</h2>
					</header>
					<ul>
						<li><a href="tbl_main.jsp">홈페이지</a></li>
						<li><a href="tbl_boardwrite.jsp">글작성</a></li>
						<li>
							<span class="opener">공유하기</span>
							<ul>
                                <li><a href="tbl_boardBuy.jsp">구매 게시판</a></li>
                                <li><a href="tbl_boardId.jsp">계정공유 게시판</a></li>
                                <li><a href="tbl_boardArbeit.jsp">알바 게시판</a></li>
                                <li><a href="tbl_boardFree.jsp">자유 게시판</a></li>
                            </ul>
						</li>
						<li><a href="#">문의하기</a></li>
						

					</ul>
				</nav>

				<!-- Section -->
				<%if(session.getAttribute("MEM_ID")!=null&&session.getAttribute("loginMember")!=null){ 
				
					
						String MEM_ID = (String)session.getAttribute("MEM_ID");
						int MEM_LATITUDE = (int)session.getAttribute("MEM_LATITUDE");
						int MEM_LONGITUDE = (int)session.getAttribute("MEM_LONGITUDE");



						tbl_coordinateDAO dao = new tbl_coordinateDAO();

							ArrayList<String> id = new ArrayList<String>();
							List<tbl_coordinate> tbl_coordinate = dao.selectAllList();
							
							int cnt = 0;
							
						for(int i = 0 ; i<tbl_coordinate.size();i++){
							if(!tbl_coordinate.get(i).getMEM_ID().equals(MEM_ID)){
							if(tbl_coordinate.get(i).getMEM_LATITUDE()<MEM_LATITUDE+3&&tbl_coordinate.get(i).getMEM_LATITUDE()>MEM_LATITUDE-3
								&&tbl_coordinate.get(i).getMEM_LONGITUDE()<MEM_LONGITUDE+3&&tbl_coordinate.get(i).getMEM_LONGITUDE()>MEM_LONGITUDE-3){
								id.add(cnt, tbl_coordinate.get(i).getMEM_ID());
								cnt++;
							}
							}
						}
							
						int num1 = 0;
						int num2 = 0;
						int num3 = 0;
						int num11 = 0;
						int num22 = 0;
						int num33 = 0;
						int a = 0;
						int b = 0;
						int c = 0;
						List<tbl_share> list1 = new ArrayList<tbl_share>();
						List<tbl_share> list2 = new ArrayList<tbl_share>();
						List<tbl_share> list3 = new ArrayList<tbl_share>();
						
						  Random r = new Random();
						  if(id.size()>0){
						  num1 = r.nextInt(id.size());
						  num2 = r.nextInt(id.size());
						  num3 = r.nextInt(id.size());
						  list1 = dao.selectListshare(id.get(num1));
						  list2 = dao.selectListshare(id.get(num2));
						  list3 = dao.selectListshare(id.get(num3));
						  }
						  if(list1.size()>0){
						  num11 = r.nextInt(list1.size());
						  a = list1.get(num11).getBOARD_SEQ().intValue();
						  }
						  if(list2.size()>0){
						  num22 = r.nextInt(list2.size());
						  b = list2.get(num22).getBOARD_SEQ().intValue();
						  }
						  if(list3.size()>0){
						 num33 = r.nextInt(list3.size());
						  c = list3.get(num33).getBOARD_SEQ().intValue();
						  
						  }
						 
						 int board_seq1 =a/2;
						  int board_seq2 = b/2;
						  int board_seq3 = c/2;
						  
						  session.setAttribute("board_seq1", board_seq1);
						  session.setAttribute("board_seq2", board_seq2);
						  session.setAttribute("board_seq3", board_seq3);
							
				
				%>
				
				<section>
					<header class="major">
						<h2>추천상품</h2>
					</header>
					<div class="mini-posts">
						<%if(list1.size()>0) {%>
						<article>
							<a href="boardView.jsp?num=${board_seq1}" class="image"><img src="images/pic07.jpg" alt="" /></a>
							<p>제목 : <%=list1.get(num11).getARTICLE_TITLE() %></p>
							<p>작성자 : <%=list1.get(num11).getMEM_ID() %></p>
							<%} %>
						</article>
						<%if(list2.size()>0) {%>
						<article>
							<a href="boardView.jsp?num=${board_seq2}" class="image"><img src="images/pic08.jpg" alt="" /></a>
							<p>제목 : <%=list2.get(num22).getARTICLE_TITLE() %></p>
							<p>작성자 : <%=list2.get(num22).getMEM_ID() %></p>
							<%} %>
						</article>
						<%if(list3.size()>0) {%>
						<article>
							<a href="boardView.jsp?num=${board_seq3}" class="image"><img src="images/pic09.jpg" alt="" /></a>
							<p>제목 : <%=list3.get(num33).getARTICLE_TITLE() %></p>
							<p>작성자 : <%=list3.get(num33).getMEM_ID() %></p>
						</article>
							<%} %>
					</div>
					<ul class="actions">
						<li><a href="#" class="button">공유참여</a></li>
					</ul>
				</section>
				<%} %>
				<!-- Section -->
				<section>
					<header class="major">
						<h2>문의주세요</h2>
					</header>
					<p>사이트의 이상이 있다면 아래 연락처로 연락 부탁 드립니다</p>
					<ul class="contact">
						<li class="icon solid fa-envelope"><a href="#">이메일</a></li>
						<li class="icon solid fa-phone">연락처</li>
						<li class="icon solid fa-home">주소<br />
							상세주소</li>
					</ul>
				</section>


				<!-- Footer -->
				<footer id="footer">
					<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a
							href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5
							UP</a>.</p>
				</footer>

			</div>
		</div>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>