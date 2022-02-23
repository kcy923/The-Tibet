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
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/qnaDetail.css">
<link rel="stylesheet" href="resources/fontawesome/css/all.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>
	<section>
		<div class="notice-enter">
			<div class="notice-enter-table mgb10">
				<div class="enter-table-qna">
					<a href="${contextPath}/qna.do">Q&A</a>
				</div>
				<div class="enter-table-notice">
					<a href="${contextPath}/notice.do">공지사항</a>
				</div>
				<div class="enter-table-member">
					<a href="${contextPath}/membership.do">맴버쉽 안내</a>
				</div>
			</div>
		</div>
		<div class="enter-table">
			<div class="enter-table-not mgb15">
				<div class="enter-table-not-tit">
					<label class="enter-not01">제목</label> <label class="enter-not02"
						id="notice01">${qna.qna_title}</label>
				</div>
				<div class="enter-table-not-name">
					<label class="enter-not01">작성자</label> <label class="enter-not02">${qna.user_id}</label>
				</div>
				<div class="enter-table-not-date">
					<label class="enter-not01">작성일</label> <label class="enter-not02">
						<fmt:formatDate value="${qna.qna_date}" pattern="yyyy-MM-dd" />
					</label>
				</div>

				<div class="enter-table-content">${qna.qna_content}</div>
				<div class="enter-table-file">
					<c:choose>
						<c:when test="${qna.qna_img1 eq null || qna.qna_img1 eq ''}"></c:when>
						<c:otherwise>
							<div>
								<img alt="#" src="resources/img/${qna.qna_img1}">
							</div>

						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${qna.qna_img2 eq null || qna.qna_img2 eq ''}"></c:when>
						<c:otherwise>
							<div>
								<img alt="#" src="resources/img/${qna.qna_img2}">
							</div>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${qna.qna_img3 eq null || qna.qna_img3 eq ''}"></c:when>
						<c:otherwise>
							<div>
								<img alt="#" src="resources/img/${qna.qna_img3}">
							</div>
						</c:otherwise>
					</c:choose>
				</div>
				<c:choose>
					<c:when test="${comment.qna_num eq qna.qna_num}">
						<div class="enter-table-comment">
							<div class="comment-title">
								<div class="comment-title-title">
									<i class="fab fa-replyd"></i>${comment.user_id}
								</div>
								<div class="comment-title-date"><fmt:formatDate value="${comment.qna_comment_date}" pattern="yyyy-MM-dd HH:mm:ss" /></div>
							</div>
							<div>
								${comment.qna_comment_content}
							</div>
						</div>
					</c:when>
				</c:choose>
			</div>
				<!-- 본인일때 수정삭제 -->
			<div class="box-btn">
				<div class="box-btn-text">
					<button type="button"
						onclick="location.href='${contextPath}/qna.do'" class="btn-text">목차
					</button>
				</div>
				<div>
					<c:if test="${memberInfo.user_id eq qna.user_id}">
						<input type="button" id="btn-modify" value="수정" onclick="location.href='${contextPath}/qnaModifyForm${qna.qna_num}.do'">
						<input type="button" id="btn-delete" value="삭제" onclick="del(${qna.qna_num})">
					</c:if>
				</div>
			</div>
		</div>
	</section>
	
	<script>
	function del(qna_num) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href='delete?qna_num='+qna_num;
		}
	}	
</script>
	
</body>
</html>