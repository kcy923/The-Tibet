<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
<link rel="stylesheet" href="resources/css/admin/admin-notice.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var chkObj = document.getElementsByName("RowCheck");
			var rowCnt = chkObj.length;
			
			$("input[name='allCheck']").click(function(){
				var chk_listArr = $("input[name='RowCheck']");
				for (var i=0; i<chk_listArr.length; i++){
					chk_listArr[i].checked = this.checked;
				}
			});
			$("input[name='RowCheck']").click(function(){
				if($("input[name='RowCheck']:checked").length == rowCnt){
					$("input[name='allCheck']")[0].checked = true;
				}
				else{
					$("input[name='allCheck']")[0].checked = false;
				}
			});
		});
		function deleteValue(){
			debugger;
			var url = "noticedelete";    // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
			var valueArr = new Array();
		    var list = $("input[name='RowCheck']");
		    for(var i = 0; i < list.length; i++){
		        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
		            valueArr.push(list[i].value);
		        }
		    }
		    if (valueArr.length == 0){
		    	alert("선택된 글이 없습니다.");
		    }
		    else{
		    	
		    	debugger;
				var chk = confirm("정말 삭제하시겠습니까?");				 
				
				if(!chk){
					return;
				}
				
				$.ajax({
				    url : url,                // 전송 URL
				    type : 'POST',                // GET or POST 방식
				    traditional : true,
				    data : {
				    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
				    },
	                success: function(jdata){
	                    if(jdata = 1) {
	                        alert("삭제 성공");
	                        location.replace("admin-notice.do")
	                    }
	                    else{
	                        alert("삭제 실패");
	                    }
	                }
				});
			}
		}
	</script>
<meta charset="UTF-8">
<title>목록</title>
</head>
<body>
	<section>
		<div class="content">
			</div>
		<!-- 등록 삭제 버튼 -->
		<div class="table-cont">
			<div align="right">
				<button type="button" onclick="location.href='${contextPath}/admin-noticeWrite.do'" class="btn-lg btn-dark">등록</button>
				<input type="button" value="삭제" class="btn-lg btn-dark" onclick="deleteValue();">
			</div>
		</div>
		<form role="form" method="get">
		<div class="service-notice">
			<table class="service-notice-front">
				<thead class="service-notice-title mgb15">
					<tr>
						<th scope="col"><input id="allCheck" type="checkbox" name="allCheck" /></th>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
		<!-- 게시판 목록조회 -->
				<tbody class="service-notice-content mgb20">
					<c:forEach items="${list}" var="nList">
						<tr>
							<td class="text_ct"><input name="RowCheck" type="checkbox" value="${nList.notice_num}" /></td>
							<td class="text_ct">${nList.num}</td>
							<td class="text_ct"><a href="${contextPath}/admin-noticeDetail${nList.notice_num}.do">${nList.notice_title}</a></td>
							<td class="text_ct">${nList.user_id }</td>
							<td class="text_ct">${nList.notice_date}</td>
						</tr>
					</c:forEach>
			</table>
		 <!-- 페이징 -->
		 	<ul class="btn-group pagination">
				<c:if test="${pageMaker.prev}">
					<li><a href='<c:url value="/admin-notice.do${pageMaker.makeSearch(pageMaker.startPage - 1)}"/>'><i class="fas fa-chevron-left"></i></a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<li><a href='<c:url value="/admin-notice.do${pageMaker.makeSearch(idx)}"/>'>${idx}</a></li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a href='<c:url value="/admin-notice.do${pageMaker.makeSearch(pageMaker.endPage + 1)}"/>'><i class="fas fa-chevron-right"></i></a></li>
				</c:if>
			</ul>
		</div>
		<!-- 검색기능 -->
  <div class="notice-search">
    <select name="searchType">
      <option value="all"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>전체</option>
      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
    </select>
    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
    <button id="searchBtn" type="button">검색</button>
  </div>
  </form>
	</section>
</body>
    <script>
      $(function(){
        $('#searchBtn').click(function() {
          self.location = "admin-notice.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
    </script>
</html>