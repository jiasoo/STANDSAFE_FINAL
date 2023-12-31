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

    .content-row .conts {
    display: none;
    text-align: left;
    padding-left: 400px;
    font-size: 14px;
    background-color: #1b5ac2;
    color: white;
    
  }

.title {
  cursor: pointer; /* 링크인 제목에 마우스 커서를 손 모양으로 변경 */
}
table td:nth-child(3) {
  text-align: left;
  padding-left: 70px;
}

</style> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	 $('.title').click(function() {
		 
		 const toggleCell = $(this).closest('tr').next('.content-row').find('.conts');
		    
		    // 클릭한 행의 답변 상태 확인 후 처리
		    if (toggleCell.is(':visible')) {
		      toggleCell.hide(); // 이미 열려있는 경우 닫기
		    } else {
		      // 모든 답변 숨기기
		      $('.conts').hide();
		      toggleCell.show(); // 클릭한 행의 답변 열기
		    }
		  });
	 
	 
		});

	
</script>
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
	                    <option value="이용안내">이용안내FAQ</option>
	                    <option value="공지사항">공지사항</option>
	                    <option value="이벤트">이벤트</option>
	                    <option value="상품Q&A">상품Q&A</option>
	                    <option value="리뷰">리뷰</option>
	              
	                </select>
              <label for="searchKey" style="padding-left: 30px;">항목</label>
	                <select class="searchKey" name="s_type" title="검색항목선택">
	                    <option value="제목">제목</option>
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
							 	<th id="th1">번호</th><th id="th4">유형</th><th id="th2">제목</th><th id="th3">작성자</th><th id="th6">날짜</th>
							 </tr>
						</thead>
						<tbody class="mb_table">	
							<c:choose>
								<c:when test="${empty s_result1}">
									<tr>
										<td colspan="6"><p>"${word }" 의 검색결과가 존재하지 않습니다.</p></td>
									</tr>
								</c:when>
								<c:otherwise>
								<c:set var="index" value="${s_result1.size()}" />
									<c:forEach var="k" items="${s_result1}" varStatus="vs">
										<tr>
											<td>${index}</td>
											<td>${k.FA_TYPE}</td>
											<td>
													<a class="title">
													${k.FA_SUBJECT}</a>
												</td>																		 																															 												
												<td>${k.FA_WRITER}</td>
												<td>${k.FA_DATE.substring(0,10)}</td>
											<!--onelist 갈때 cPage 필요하다. 같이보내자. -->	
										</tr>
										<tr class="content-row">
												<td colspan="6" class="conts">
												<p style="margin-left: 50px;">${k.FA_ANSWER}</p>
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