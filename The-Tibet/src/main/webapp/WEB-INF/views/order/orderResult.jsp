<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주문완료</title>

<link rel="stylesheet" href="resources/css/orderResult.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

</head>
<body>
	<section>
		<div class="result-div">주문이 정상적으로 처리되었습니다.</div>
		
		<div class="result-table-div">
			<table class="result-table">
				<thead class="result-table-head">
					<tr>
						<th>주문번호</th>
						<th>주문자</th>
						<th>결제정보</th>
					</tr>
				</thead>
				<tbody class="result-table-body">
					<tr>
						<td>${orderLast.order_num}</td>
						<td>${memberInfo.user_name}</td>
						<td>${orderLast.order_pay}</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="btn-div">
			<button type="button" id="orderList-btn" onclick="location.href='${contextPath}/orderList${memberInfo.user_id}.do'">주문내역</button>
			<button type="button" id="main-btn" onclick="location.href='${contextPath}/main.do'">메인페이지</button>
		</div>
	</section>
</body>
</html>