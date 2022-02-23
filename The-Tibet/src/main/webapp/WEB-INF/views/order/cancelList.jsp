<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  request.setCharacterEncoding("UTF-8");
%>
<%
session.getAttribute("memberInfo");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/cancelList.css">
<title>마이페이지</title>
</head>
<body>
	<section>
		<div class="mypage">
			<div class="mypage-table mgb10">
				<div class="mypage-front-fonter-orderList">
					<a href="${contextPath}/orderList${memberInfo.user_id}.do">주문내역</a>
				</div>
				<div class="mypage-front-fonter-memModify">
					<a href="${contextPath}/memModifyForm.do" class="font-777">회원정보</a>
				</div>
				<div class="mypage-front-fonter-delivery">
					<a href="" class="font-777">배송조회</a>
				</div>
			</div>
		</div>

		<div class="mypage-detail-table">
			<div class="mypage-detail-table mgb10">
				<div class="mypage-orderList">
					<a href="${contextPath}/orderList${memberInfo.user_id}.do" class="font-777">주문내역조회</a>
				</div>
				<div class="mypage-cancelList">
					<a href="${contextPath}/cancelList${memberInfo.user_id}.do">취소/교환/반품 내역</a>
				</div>
			</div>
		</div>

		<div class="orderList">
			<div class="cancelList-titlebox">
				<div class="orderList-title">취소/교환/반품 내역</div>
				<div class="select-date">
					<form action="" method="GET" name="searchFrm">
						<label for="From" class="cal-label">조회 기간 선택&nbsp;</label> 
						<input id="dateFrom" name="dateFrom" readonly>
						<label for="To" class="cal-label">&nbsp;~&nbsp;</label> 
						<input id="dateTo" name="dateTo" readonly>
						<button class="date-button" type="submit" onclick="">조회하기</button>
					</form>				
				</div>
			</div>
			<div class="cancelList-tablebox">
				<table class="div-orderList">
					<tr class="orderList-table">
						<th class="orderDate-th">주문일자</th>
						<th class="orderImage-th">이미지</th>
						<th class="orderInfo-th">상품정보</th>
						<th class="orderCount-th">수량</th>
						<th class="orderCash-th">상품구매금액</th>
						<th class="orderState-th">처리상태</th>
					</tr>
					<c:forEach var="list" items="${list}">
						<input type="hidden" name="user_id" value="${memberInfo.user_id}">
						<tr class="orderList-tr">
							<td class="orderDate"><fmt:formatDate value="${list.order_date}" pattern="yyyy-MM-dd" /></td>
							<td class="orderImage"><a href="" class="orderImage-a"><img src="resources/${list.product_thumbnail}"></a></td>
							<td class="orderInfo"><a href="" class="orderInfo-a">${list.product_name}</a></td>
							<td class="orderCount">${list.product_count}</td>
							<td class="orderCash"><fmt:formatNumber
										value="${(list.product_price - list.product_sale) * list.product_count}"
										pattern="###,###,###원" /></td>
							<td class="orderState">${list.order_state}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>

	</section>

	<script>
	$(function() {
		$.datepicker.setDefaults({
			dateFormat : 'yy-mm-dd',
			prevText : '이전 달',
			nextText : '다음 달',
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
					'8월', '9월', '10월', '11월', '12월' ],
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
					'7월', '8월', '9월', '10월', '11월', '12월' ],
			dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			showMonthAfterYear : true,
			yearSuffix : '년'
		});
		$('#dateFrom').datepicker();
		$('#dateTo').datepicker();
		
		if(${dateFrom == null && dateTo == null}) {
			$('#dateFrom').datepicker("setDate",'-7D');
			$('#dateTo').datepicker("setDate", 'today');
		}
		else{
			$('#dateFrom').datepicker("setDate",'${date.dateFrom}');
			$('#dateTo').datepicker("setDate", '${date.dateTo}');
		}

		
		$('#dateFrom').datepicker("option", "maxDate",
				$("#dateTo").val());
		$('#dateTo').datepicker("option", "maxDate",
				"today");
		$('#dateFrom').datepicker(
				"option",
				"onClose",
				function(selectedDate) {
					$("#dateTo").datepicker("option", "minDate",
							selectedDate);
				});

		$('#dateTo').datepicker("option", "minDate",
				$("#dateFrom").val());
		$('#dateTo').datepicker(
				"option",
				"onClose",
				function(selectedDate) {
					$("#dateFrom").datepicker("option", "maxDate",
							selectedDate);
				});
	});
	</script>
</body>
</html>