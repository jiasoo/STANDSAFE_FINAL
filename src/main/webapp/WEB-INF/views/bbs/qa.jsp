<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STANDSAFE</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="resources/css/basis.css" />
<link rel="stylesheet" href="resources/css/bbs.css" />
<style type="text/css">
label {
	line-height: 2rem;
	padding: 0.2em 0.4em;
}

fieldset {
	display: flex;
	justify-content: center;
	border: none;
	margin: 0;
	padding: 40px 20px;
}

table td:nth-child(3) {
	text-align: left;
	padding-left: 70px;
}

/* paging */
table tfoot ol.paging {
	list-style: none;
	text-align: center; /* 가운데 정렬을 위한 변경 */
}

table tfoot ol.paging li {
	display: inline-block; /* 가로 정렬을 위해 float 제거하고 inline-block으로 변경 */
	margin-right: 8px;
}

table tfoot ol.paging li a {
	display: block;
	padding: 3px 7px;
	border: 1px solid #6c98c2;
	color: #2f313e;
	font-weight: bold;
}

table tfoot ol.paging li a:hover {
	background: #6c98c2;
	color: white;
	font-weight: bold;
}

.disable {
	padding: 3px 7px;
	border: 1px solid silver;
	color: silver;
}

.now {
	padding: 3px 7px;
	border: 1px solid #1b5ac2;
	background: #1b5ac2;
	color: white;
	font-weight: bold;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var qaonelist = "${qaonelist}";
		if(qaonelist == "not"){
			alert("다른사람이 작성한 (비밀)글입니다. 조회권한이 없습니다. ");
			
			return ;
		}else if(qaonelist=="view") {
			return;
		}

	});
</script>
<script type="text/javascript">

	function bbs_go_qa_writeform() {
		location.href="/bbs_qa_writeform.do";
	}

	
	
	function wordchk() {
    var word = document.getElementById("s_bar").value; // 검색어 필드의 값 가져오기

    // 검색어가 비어 있으면 알림창 표시
    if (!word || word.trim() === "") {
        alert("검색어를 입력하세요.");
        return false; // 폼 제출을 취소합니다.
    }

    // 검색어가 입력되었으면 폼 제출을 허용
    return true;
}

</script>
</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<section id="contents">
			<article>
				<div id="bbs_top">
					<div id="bbs_sub">
						<h1>상품 Q&A</h1>
					</div>
					<form action="/bbs_qa_search.do" method="post"
						onsubmit="return wordchk()">
						<fieldset>
							<label> <input type="radio" name="searchType" value="제목"
								id="type_title" checked /> <span>제목</span>
							</label> <label> <input type="radio" name="searchType" value="내용"
								id="type_content" /> <span>내용</span>
							</label> <label> <input type="radio" name="searchType"
								value="작성자" id="type_writer" /> <span>작성자</span>
							</label>
							<div id="search_bar">
								<input type="text" id="s_bar" name="word" placeholder="검색어입력">
								<input type="hidden" name="bbs_type" value="상품Q&A">
								<button id="s_btn" type="submit">검색</button>

							</div>
						</fieldset>
					</form>
				</div>
				<!--  제목및 버튼검색창의 끝 -->
				<div>
					<button class="btn" onclick="bbs_go_qa_writeform()">글쓰기</button>
				</div>
				<hr class="hr">
				<!-- 메인 테이블 -->
				<table class="m_table">
					<thead class="mh_table">
						<tr>
							<th id="th1">번호</th>
							<th id="th5">유형</th>
							<th id="th2">제목</th>
							<th id="th3">작성자</th>
							<th id="th6">날짜</th>
							<th id="th4">파일첨부</th>
						</tr>
					</thead>
					<tbody class="mb_table">
						<c:choose>
							<c:when test="${empty list}">
								<tr>
									<td colspan="6"><p>자료가 존재하지 않습니다.</p></td>
								</tr>
							</c:when>

							<c:otherwise>
								<c:forEach var="k" items="${list}" varStatus="vs">
									<tr>
										<td>${paging.totalRecord -((paging.nowPage-1)*paging.numPerPage + vs.index) }</td>

										<td>${k.BOARD_TYPE }</td>
										<c:choose>
											<c:when test="${k.BOARD_ST == 0}">
												<td style="color: gray;text-align: left;">삭제된 게시물입니다.</td>
											</c:when>
											<c:otherwise>
												<%--  <td>
												      <a href="/bbs_qa_onelist.do?BOARD_NUM=${k.BOARD_NUM}&cPage=${paging.nowPage}">
												        ${k.BOARD_LOCK == 1 ? '[비밀] ' : ''}${k.BOARD_SUBJECT}
												      </a>
												    </td> --%>
												<td style="text-align: left; padding-left: 20px;"><c:forEach
														begin="1" end="${k.BOARD_STEP}">
														<!--step만큼 들여쓰기  -->
												&nbsp;&nbsp;&nbsp;[Re]
											</c:forEach> <a
													href="/bbs_qa_onelist.do?BOARD_NUM=${k.BOARD_NUM}&cPage=${paging.nowPage}">
													${k.BOARD_LOCK == 1 ? '[비밀] ' : ''}${k.BOARD_SUBJECT}</a>
												</td>
											</c:otherwise>
										</c:choose>
										<!--onelist 갈때 cPage 필요하다. 같이보내자. -->
										<td>${k.BOARD_WRITER}</td>
										<%-- <td>${k.BOARD_DATE.substring(0,10)}</td> --%>
										<c:choose>
											<c:when test="${not empty k.BOARD_UPDATE}">
												<!-- BOARD_UPDATE가 값이 있는 경우 -->
												<td>${k.BOARD_UPDATE.substring(0,10)}[수정됨]</td>
											</c:when>
											<c:otherwise>
												<td>${k.BOARD_DATE.substring(0, 10)}</td>
											</c:otherwise>
										</c:choose>
										<td><c:choose>
												<c:when test="${empty k.BOARD_FILE}">
														없음
													</c:when>
												<c:otherwise>
														있음
													</c:otherwise>
											</c:choose></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="6">
								<ol class="paging">
									<!-- 이전버튼 : 첫블럭이면 비활성화-->
									<c:choose>
										<c:when test="${paging.beginBlock <= paging.pagePerBlock }">
											<li class="disable">이전으로</li>
										</c:when>
										<c:otherwise>
											<li><a
												href="/bbs_qa_go.do?cPage=${paging.beginBlock-paging.pagePerBlock }">이전으로</a></li>
										</c:otherwise>
									</c:choose>
									<c:forEach begin="${paging.beginBlock }"
										end="${paging.endBlock }" step="1" var="k">
										<c:if test="${k == paging.nowPage }">
											<!--현재페이지와 같으면  -->
											<li class="now">${k }</li>
										</c:if>
										<c:if test="${k != paging.nowPage }">
											<li><a href="/bbs_qa_go.do?cPage=${k }"> ${k }</a></li>
										</c:if>
									</c:forEach>

									<!-- 이후버튼  -->
									<c:choose>
										<c:when test="${paging.endBlock >= paging.totalPage }">
											<li class="disable">다음으로</li>
										</c:when>
										<c:otherwise>
											<li><a
												href="/bbs_qa_go.do?cPage=${paging.beginBlock+paging.pagePerBlock }">다음으로</a></li>
										</c:otherwise>
									</c:choose>
								</ol>
							</td>
						</tr>
					</tfoot>
				</table>
			</article>
		</section>
		<jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
	</div>
</body>
</html>