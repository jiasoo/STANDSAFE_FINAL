<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>STANDSAFE</title>
<!-- <meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" /> -->
<!-- Link Swiper's CSS -->

<link rel="stylesheet" href="resources/css/slide.css" />
<link rel="stylesheet" href="resources/css/basis.css" />
<link rel="stylesheet" href="resources/css/userlogin.css" />

<script type="text/javascript">
	function member_login() {
		location.href = "admin_loginok.do";
	}
</script>
</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<section id="contents">
			<article>
				<div class="find-header">
					<h1
						style="text-align: center; font-size: 30px; margin-bottom: 20px; margin-top: 100px;">아이디
						찾기</h1>
				</div>
				<h3>아이디를 모르시나요?</h3>
				<p>이름과 이메일로 아이디 찾기</p>
				<div class="find-box">
					<div class="centered-content">
						<form action="/find_id_result" method="post">
							<tr>
								<td><input type="text" name="M_NAME"
									placeholder="이름을 입력해주세요."></td>
							</tr>
							<tr>
								<td><input type="text" name="MAIL"
									placeholder="이메일을 전부 입력해주세요."></td>
							</tr>
							<tr>
								<td><button type="submit" class="find-button">아이디
										찾기</button></td>
							</tr>
						</form>

					</div>
				</div>
				<div>
					비밀번호를 찾으시나요? <a href="find_pw_form.do" class="find-links">
						<p>비밀번호 찾기</p>
					</a>
				</div>
				<br>
			</article>
		</section>
		<jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>