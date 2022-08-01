	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>boardwrite</title>
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
                        <li><a href="tbl_main.jsp" class="icon solid fa-home"><span class="label">Medium</span></a></li>
                        <li><a href="#" class="icon solid fa-file-invoice-dollar"><span class="label">Medium</span></a>
                        </li>
                        <li><a href="tbl_join.jsp" class="icon solid fa-user"><span class="label">Medium</span></a></li>
                    </ul>
                </header>

                <!-- Content -->
                <section>
                    <header class="main">
                        <h1>게시물 작성</h1>
                    </header>

                    <span class="image main"><img src="images/pic11.png" alt="" /></span>
                    <h2 id="content">무엇을 공유하고 싶으신가요?</h2>
                    <p>무엇을 공유하던 당신의 자유 입니다.<br>우리가 공유 할 수 있는 새로운 아이디어를 제시해주세요</p>

                    <div>
                        <a href="tbl_write.jsp" class="button">구매 게시판</a>
                        <a href="tbl_write.jsp" class="button">계정공유 게시판</a>
                        <a href="tbl_write.jsp" class="button">알바 게시판</a>
                        <a href="tbl_write.jsp" class="button">자유 게시판</a>
                        
                    </div>
                </section>
                <section>

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