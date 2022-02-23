<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
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
<title>관리자-상품</title>
<link rel="stylesheet" href="resources/css/admin/admin-product.css">
</head>
<body>
	<form role="form" method="get">
	<!-- 등록 삭제 버튼 -->
	<div class="table-cont">
		<div align="right">
			<button type="button"
				onclick="location.href='${contextPath}/admin-product-register.do'"
				class="btn-lg btn-dark">등록</button>
			<input type="button" value="삭제" class="btn-lg btn-dark"
				onclick="deleteValue();">
		</div>
	</div>

		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">상품 목록</h3>
					</div>
				</div>
			</div>
			<div class="col-xs-4">
				<div id="example_filter" class="dataTables_filter">
					<label id="listLabel"> <input type="search"
						class="form-control input-sm" aria-controls="example" id="keyword"
						value="${cri.keyword}">
					</label>
					<button type="button" class="btn btn-dark" id="searchBtn">검색</button>
				</div>
			</div>
		</div>
		<table id="example" class="table table-striped table-bordered"
			cellspacing="0" width="100%">
			<thead>
				<tr>
					<th id="th1">상품번호</th>
					<th id="th2">카테고리</th>
					<th id="th4">상품명</th>
					<th id="th3">내용</th>
					<th id="th5">가격</th>
					<th id="th4">개수</th>
					<th id="th6">등록일</th>
				</tr>
			</thead>

			<tbody>

							<c:forEach items="${list}" var="pList">
								<tr>
									<td class="text_ct">${pList.num}</td>
									<td class="text_ct"><a href="${contextPath}/admin-memberDetail${nList.product_num}.do">${pList.product_name}</a></td>
									<td class="text_ct">${pList.product_detail}</td>
									<td class="text_ct">${pList.product_price}</td>
									<td class="text_ct">${pList.product_count}</td>
									<td class="text_ct">${pList.product_date}</td>
								</tr>
							</c:forEach>
						</table>
		 <!-- 페이징 -->
		 	<ul class="btn-group pagination">
				<c:if test="${pageMaker.prev}">
					<li><a href='<c:url value="/admin-product.do${pageMaker.makeSearch(pageMaker.startPage - 1)}"/>'><i class="fas fa-chevron-left"></i></a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<li><a href='<c:url value="/admin-product.do${pageMaker.makeSearch(idx)}"/>'>${idx}</a></li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a href='<c:url value="/admin-product.do${pageMaker.makeSearch(pageMaker.endPage + 1)}"/>'><i class="fas fa-chevron-right"></i></a></li>
				</c:if>
			</ul>

	</form>
</body>
</html>