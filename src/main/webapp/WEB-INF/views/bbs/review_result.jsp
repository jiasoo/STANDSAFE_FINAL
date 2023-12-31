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

	fieldset {
	  display: flex;
	  justify-content: center;
	  border: none;
	  margin: 0;
	  padding: 40px 20px;
	}

    label {
        display: inline;
        text-align: center;
    }

table td:nth-child(3) {
  text-align: left;
  padding-left: 70px;


</style> 
<script>
    function select_op(selectElement) {
        var select_c = selectElement.value;
        var type = document.getElementsByName("s_type")[0];

        // 모든 s_type 옵션을 초기화
        type.innerHTML = "";

        // 선택한 bbs_type에 따라 적절한 s_type 옵션 추가
        if (select_c === "공지사항" || select_c === "이벤트" || select_c === "이용안내") {
        	type.options.add(new Option("제목", "제목"));
        	type.options.add(new Option("내용", "내용"));
        } else if (select_c === "상품Q&A" || select_c === "리뷰") {
        	type.options.add(new Option("제목", "제목"));
        	type.options.add(new Option("작성자", "작성자"));
        	type.options.add(new Option("내용", "내용"));
        }
    }
</script>
<script type="text/javascript">
function checknick(lock, writer, nick) {
    // 게시물이 비밀글이고 작성자가 현재 사용자와 다른 경우 알림창 표시
    if (lock == 1 && writer !== nick) {
        alert("이 게시물은 비밀글로 다른 사용자의 접근이 제한됩니다.");
        event.preventDefault(); // 링크 이벤트 중단
    }
}

</script>
</head>
<body onload="InitializeStaticMenu();">
	<div id="mydiv">
		<jsp:include page="../Semantic/header.jsp"></jsp:include>
		<div style="text-align: center; padding-bottom: 20px;" >
		<h1 id="result">${bbs_type} 검색결과</h1> 
		</div>
	 <div class="custom-search"> 
        <!-- 검색 영역 -->
        <form  method="post" action="/bbs_search.do">
            <div class="search-input" >
            	<label for="searchKey">게시판</label>
	                <select class="searchKey" name="bbs_type" title="게시판선택" onchange="select_op(this)">
	                    <option value="리뷰">리뷰</option>
	                    <option value="공지사항">공지사항</option>
	                    <option value="이벤트">이벤트</option>
	                    <option value="이용안내">이용안내FAQ</option>
	                    <option value="상품Q&A">상품Q&A</option>

	                </select>
              <label for="searchKey" style="padding-left: 30px;">항목</label>
	                <select class="searchKey" name="s_type" title="검색항목선택">
	                    <option value="제목">제목</option>
	                    <option value="작성자">작성자</option>
	                    <option value="내용">내용</option>
	                </select>
	          </div>   
            <div class="input-wrapper">
               		
            	<label>검색어</label>
               		 <input type="text" id="fromDate" name="word"  placeholder="검색어를 입력하세요">	
           		</div>
     
		            <div class="date-picker">
		                <label for="searchDate">날　짜</label>
		                <input type="date" id="start" name="start"> ~ 
		                <input type="date" id="end" name="end">
		            </div>
		            <div class="button-container">
		              <button class="search-button" type="submit">검색</button>
		                <br>
		                 
		            </div>
   				 </form>
       		</div>
       </div>
					<hr class="hr">
					<!-- 메인 테이블 -->
					<table class="m_table">				
						<thead class="mh_table">
							 <tr>
							 	<th id="th1">번호</th><th id="th3">유형</th><th id="th2">제목</th><th id="th5">작성자</th><th id="th6">날짜</th><th id="th4">파일첨부</th>
							 </tr>
						</thead>
						<tbody class="mb_table">	
							<c:choose>
								<c:when test="${empty s_result5}">
									<tr>
										<td colspan="6"><p>"${word }" 의 검색결과가 존재하지 않습니다.</p></td>
									</tr>
								</c:when>
								<c:otherwise>
								<c:set var="index" value="${s_result5.size()}" />
									<c:forEach var="k" items="${s_result5}" varStatus="vs">
										<tr>
											<td>${index}</td>
											<td>${k.RE_TYPE }</td>
											<c:choose>
												  <c:when test="${k.RE_ST == 0}">
												    <td style="color: gray;">삭제된 게시물입니다.</td>
												  </c:when>
												  <c:otherwise>
												    <td>
												      <a href="/bbs_review_onelist.do?RE_NUM=${k.RE_NUM}&cPage=1" onclick="checknick('${k.RE_LOCK}', '${k.RE_WRITER}', '${nick}')">
												        ${k.RE_LOCK == 1 ? '[비밀] ' : ''}${k.RE_SUBJECT}
												      </a>
												    </td>
												  </c:otherwise>
												</c:choose>
											<!--onelist 갈때 cPage 필요하다. 같이보내자. -->
											<td>${k.RE_WRITER}</td>	
											 <c:choose>
											    <c:when test="${not empty k.RE_UPDATE}">
											      <!-- BOARD_UPDATE가 값이 있는 경우 -->
											      <td>${k.RE_UPDATE.substring(0,10)} [수정됨]</td>
											    </c:when>
											    <c:otherwise>											  
											     <td> ${k.RE_DATE.substring(0, 10)}</td>
											    </c:otherwise>
											  </c:choose>
											  <td>
												<c:choose>
													<c:when test="${empty k.RE_FILE}">
														없음
													</c:when>
													<c:otherwise>
														있음
													</c:otherwise>
												</c:choose>				
											</td>
										</tr>
										<c:set var="index" value="${index - 1}" />
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>	
					</table>
		<jsp:include page="../Semantic/quickmenu.jsp"></jsp:include>
		<script src="resources/js/quick.js"></script>
		<jsp:include page="../Semantic/footer.jsp"></jsp:include>
</div>
</body>
</html>