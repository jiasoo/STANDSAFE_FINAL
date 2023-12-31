<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.menu>li:hover .submenu {
	background-color: rgb(240, 240, 240);
	height: 350px; /*서브메뉴 li한개의 높이 50*5*/
	transition-duration: 1s;
}
</style>
</head>
<body>
	<header id="header">
		<div id="top_gnb">
			<b style="font-size: 14px;">관리자이름</b>
			<a href="/mainform.do" style="margin-left: 8px;">로그아웃</a>
		</div>
		<div id="nav">
			<a href="/admin_loginok.do" style="margin-left: 8px;"><img id="logo"
				src="resources/images/admin_logo.png"></a>
			<ul class="menu">
				<li><a href="/userManagement.do">회원관리</a>
					<ul class="submenu">
						<li><a href="/userManagement.do">사용자 관리</a></li>
						<li><a href="/adminManagement.do">관리자 권한 관리</a></li>
					</ul></li>
				<li><a href="/product_list.do">상품관리</a>
					<ul class="submenu">
						<li><a href="/product_list.do">상품등록</a></li>
						<li><a href="/inventory_management.do">재고관리</a></li>
					</ul></li>
				<li><a href="/order_list.do">주문관리</a>
					<ul class="submenu">
						<li><a href="/order_list.do">주문내역조회</a></li>
						<li><a href="/return_list.do">반품관리</a></li>
						<li><a href="/exchange_list.do">교환관리</a></li>

					</ul></li>
				<li><a href="/admin_notice.do">게시판관리</a>
					<ul class="submenu">
						<li><a href="/admin_notice.do">공지사항</a></li>
						<li><a href="/admin_qa.do">상품Q&A</a></li>
						<li><a href="/admin_faq.do">이용안내FAQ</a></li>
						<li><a href="/admin_event.do">이벤트</a></li>
						<li><a href="/admin_reivew.do">리뷰</a></li>
						<li><a href="/admin_popslide.do">팝업/슬라이드 관리</a></li>
						<li><a href="/admin_report.do" style="color: red">신고센터</a></li>
					</ul></li>
				<li><a href="/statistics.do">피드백 및 재난</a>
					<ul class="submenu">
						<li><a href="/statistics.do">통계 관리</a></li>
						<!--<li><a href="/jaenan_fire.do">화재</a></li>
						<li><a href="/jaenan_jijinlive.do">지진</a></li>
						<li><a href="/jaenan_rainlive.do">강수</a></li>  -->
					</ul></li>
			</ul>
		</div>
	</header>
</body>
</html>