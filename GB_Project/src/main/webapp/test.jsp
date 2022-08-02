<%@page import="com.smhrd.model.tbl_applicantselectDAO"%>
<%@page import="com.smhrd.model.tbl_applicantDAO"%>
<%@page import="com.smhrd.model.tbl_applicantselect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>

<head>
    <title>boardBuy</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
</head>
<jsp:useBean id="BoardDAO" class="com.smhrd.model.BoardDAO"/>
<c:set var="board" value="${BoardDAO.selectOne(param.num*2)}"/>

<jsp:useBean id="WritebuyDAO" class="com.smhrd.model.tbl_shareWriteDAO"/>
<c:set var="boardbuy" value="${WritebuyDAO.selectBuyOne(param.num*2)}"/>

<jsp:useBean id="WriteaccountDAO" class="com.smhrd.model.tbl_shareWriteDAO"/>
<c:set var="boardaccount" value="${WriteaccountDAO.selectAccountOne(param.num*2)}"/>

<jsp:useBean id="WritefreeDAO" class="com.smhrd.model.tbl_shareWriteDAO"/>
<c:set var="boardfree" value="${WritefreeDAO.selectFreeOne(param.num*2)}"/>

<jsp:useBean id="WritearbeitDAO" class="com.smhrd.model.tbl_shareWriteDAO"/>
<c:set var="boardarbeit" value="${WritearbeitDAO.selectArbeitOne(param.num*2)}"/>
<body class="is-preload">
    <!-- Wrapper -->
    <div id="wrapper">

        <!-- Main -->
        <div id="main">
            <div class="inner">

                <!-- Header -->
                <header id="header">
                    <a href="tbl_main.jsp" class="logo"><strong>무언가 나누고
                            싶어?</strong> 1/N !</a>
                    <ul class="icons">
                        <c:choose>
                            <c:when test="${empty loginMember}">
                                <li><a href="tbl_login.jsp" class="icon solid fa-lock"><span
                                            class="label">로그인</span></a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="logoutCon" class="icon solid fa-lock-open"><span
                                            class="label">Medium</span></a></li>
                            </c:otherwise>
                        </c:choose>
                        <li><a href="#" class="icon solid fa-file-invoice-dollar"><span class="label">Medium</span></a>
                        </li>
                        <li><a href="tbl_join.jsp" class="icon solid fa-user"><span class="label">Medium</span></a></li>
                    </ul>
                </header>
                        <section>
                    <div class="col-10 col-12-medium">
                        <img src="https://m.bunjang.co.kr/pc-static/resource/f1f8a93028f0f6305a87.png" width="15" height="15">
                        <img src="https://m.bunjang.co.kr/pc-static/resource/c5ce9d5a172b0744e630.png" width="6" height="10">  게시판 이동  
                        <img src="https://m.bunjang.co.kr/pc-static/resource/c5ce9d5a172b0744e630.png" width="6" height="10">  구매/계정/알바/자유  

                        <img src="https://m.bunjang.co.kr/pc-static/resource/c5ce9d5a172b0744e630.png" width="6" height="10">  공유하기
                    </div>
                </section>
                    <section>
                    <div>
                    </div>
                    <header class="main">
                        <br>
                        <h2>게시판</h2>
                    </header>
                    <section>
                        <span class="image left">
                            <img style="height: 340px" src="images/pic01.jpg"/>
                        </span>
                        <span class="image left">
                            
                        
                        </span>
                        <h2><%
int num = Integer.parseInt(request.getParameter("num"));
int real_num = num*2;
String MEM_ID = (String)session.getAttribute("loginMember");
tbl_applicantselect vo = new tbl_applicantselect(MEM_ID,real_num);
tbl_applicantselectDAO dao = new tbl_applicantselectDAO();
%></h2>
                        <hr class="major" />
                        <p style="margin: 1px">가격<p>
                        <p>작성자</p>
                        <p>작성일자</p>
                        <p>배송지</p>
                        <div style="text-align: center;">
                            <a href="#" class="button">찜하기</a>
                            <a href="#" class="button primary">공유참여</a>
                        </div>
                        
                    </section>
                    <!-- <hr class="major" /> -->
                </section>
                <section>
                    <p>공유내용</p>
                </section>
                <br>
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
                        <li><span class="opener">공유하기</span>
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
                <section>
                    <header class="major">
                        <h2>추천상품</h2>
                    </header>
                    <div class="mini-posts">
                        <article>
                            <a href="#" class="image"><img src="images/pic07.jpg" alt="" /></a>
                            <p>상품1</p>
                        </article>
                        <article>
                            <a href="#" class="image"><img src="images/pic08.jpg" alt="" /></a>
                            <p>상품2</p>
                        </article>
                        <article>
                            <a href="#" class="image"><img src="images/pic09.jpg" alt="" /></a>
                            <p>상품3</p>
                        </article>
                    </div>
                    <ul class="actions">
                        <li><a href="#" class="button">공유참여</a></li>
                    </ul>
                </section>

                <!-- Section -->
                <section>
                    <header class="major">
                        <h2>문의주세요</h2>
                    </header>
                    <p>사이트의 이상이 있다면 아래 연락처로 연락 부탁 드립니다</p>
                    <ul class="contact">
                        <li class="icon solid fa-envelope"><a href="#">이메일</a></li>
                        <li class="icon solid fa-phone">연락처</li>
                        <li class="icon solid fa-home">주소<br /> 상세주소
                        </li>
                    </ul>
                </section>

                <!-- Footer -->
                <footer id="footer">
                    <p class="copyright">
                        &copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>.
                        Design: <a href="https://html5up.net">HTML5 UP</a>.
                    </p>
                </footer>

            </div>
        </div>

    </div>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script src="assets/js/browser.min.js"></script>
    <script src="assets/js/breakpoints.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>
    <script>
		function addReply() {
		/* 占쏙옙占쏙옙占쏙옙占쏙옙 占쏠갈몌옙占쏙옙占쏙옙 , 占쏙옙크占쏙옙트占싫울옙占쏙옙 el표占쏙옙占� 占쏙옙占쏙옙, 표占쏙옙占쏙옙占쏙옙占쏙옙 占쌘바븝옙占쏙옙占쏙옙占쏙옙占쏙옙占썩가占쏙옙 */
			let ta = $('textarea').val()
				
			$.ajax({
			//占쏙옙청占쏙옙占�
			url: 'ReplyCon',
			//占쏙옙청占쏙옙占쏙옙占쏙옙 (占쌉시뱄옙占쏙옙호, 占쌜쇽옙占쏙옙占�)
			data: {
				'boardnum':${param.num},
				'reply':ta
			},
			//占쏙옙청占쏙옙占�(get,post)
			type:'post',
			success:function(data){ //占쏙옙占쏙옙占� 占쏙옙占쏙옙
				//alert(data) 
				$('#reply').prepend('<li class="list-group-item"><span>'+ta+'/${loginVO.id}</span></li>')
			},
			error :function(){ //占쏙옙占쏙옙占� 占쏙옙占쏙옙
				alert('占쏙옙탐占쏙옙占�')
			}
			
			})
		
		
		}
		
		function B() {
			alert("참석완료!")
		}
		
		function I() {
			alert("참석완료!")
		}
		
		function A() {
			alert("참석완료!")
		}
		
		function F() {
			alert("참석완료!")
		}
	</script>

</body>

</html>