<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<title>reportWrite</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body class="is-preload">
	<%
	String num = (String) request.getParameter("num");
	session.setAttribute("num", num);
	%>
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<a href="tbl_main.jsp" class="logo"><strong>���� ������
							�;�?</strong> 1/N !</a>
					<ul class="icons">
						<li><a href="logoutCon" class="icon solid fa-lock-open"><span
								class="label">Medium</span></a></li>
						<li><a href="#" class="icon solid fa-file-invoice-dollar"><span
								class="label">Medium</span></a></li>
						<li><a href="tbl_join.jsp" class="icon solid fa-user"><span
								class="label">Medium</span></a></li>
					</ul>
				</header>
				<section>
					<header class="main">
						<h2>�Ű� �ۼ�</h2>
					</header>
					<form action="tbl_reportCon" method="post">
						<div class="col-6 col-12-small">
							<input type="text" placeholder="�Ű����� �ۼ�" name="name">
						</div>
						<br>

						<!-- �Խù� �ۼ� -->
						<div class="card mb-2" style="width: 100%;">
							<textarea name="content" rows="10" style="width: 100%;"></textarea>
							<br> <input type="submit" value="�Ű��û">
						</div>
					</form>
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
						<li><a href="tbl_main.jsp">Ȩ������</a></li>
						<li><a href="tbl_boardwrite.jsp">���ۼ�</a></li>
						<li><span class="opener">�����ϱ�</span>
							<ul>
								<li><a href="tbl_boardBuy.jsp">���� �Խ���</a></li>
								<li><a href="tbl_boardId.jsp">�������� �Խ���</a></li>
								<li><a href="tbl_boardArbeit.jsp">�˹� �Խ���</a></li>
								<li><a href="tbl_boardFree.jsp">���� �Խ���</a></li>
							</ul></li>
						<li><a href="#">�����ϱ�</a></li>
					</ul>
				</nav>
				<!-- Section -->

				<section>
					<header class="major">
						<h2>�����ּ���</h2>
					</header>
					<p>����Ʈ�� �̻��� �ִٸ� �Ʒ� ����ó�� ���� ��Ź �帳�ϴ�</p>
					<ul class="contact">
						<li class="icon solid fa-envelope"><a href="#">�̸���</a></li>
						<li class="icon solid fa-phone">����ó</li>
						<li class="icon solid fa-home">�ּ�<br /> ���ּ�
						</li>
					</ul>
				</section>


				<!-- Footer -->
				<footer id="footer">
					<p class="copyright">
						&copy; Untitled. All rights reserved. Demo Images: <a
							href="https://unsplash.com">Unsplash</a>. Design: <a
							href="https://html5up.net">HTML5 UP</a>.
					</p>
				</footer>

			</div>
		</div>
	</div>

</body>
</body>
</html>