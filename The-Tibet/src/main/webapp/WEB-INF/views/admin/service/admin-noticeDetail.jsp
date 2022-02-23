<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>
<body>
	<table class="table table-hover table-responsive">
		<tr>
			<th>제목</th>
			<td>${notice.notice_title}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${notice.user_id}</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><fmt:formatDate value="${notice.notice_date}"
					pattern="yyyy-MM-dd" /></td>
		<tr>
			<th>내용</th>
			<td>${notice.notice_content}</td>
		</tr>
			<c:choose>
				<c:when
					test="${notice.notice_img1 eq null || notice.notice_img1 eq ''}"></c:when>
				<c:otherwise>
					<div>
						<img alt="#" src="resources/img/${notice_notice_img1}">
					</div>

				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when
					test="${notice_notice_img2 eq null || notice_notice_img2 eq ''}"></c:when>
				<c:otherwise>
					<div>
						<img alt="#" src="resources/img/${notice_notice_img2}">
					</div>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when
					test="${notice_notice_img3 eq null || notice_notice_img3 eq ''}"></c:when>
				<c:otherwise>
					<div>
						<img alt="#" src="resources/img/${notice_notice_img3}">
					</div>
				</c:otherwise>
			</c:choose>
	</table>
	<input type="button" value="수정" class="btn btn-dark btn-lg"
		onclick="location.href='${contextPath}/noticeModifyForm${notice.notice_num}.do'">
	<input type="button" value="삭제" class="btn btn-dark btn-lg"
		onclick="del(${notice.notice_num})">
	<script>
	function del(notice_num) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href='noticedelete?notice_num='+notice_num;
		}
	}	
</script>
</body>
</html>