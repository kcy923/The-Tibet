<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
session.getAttribute("memberInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/orderList.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>


<title>마이페이지</title>
</head>
<body>
	<section>
		
		<div class="mypage">
			<div class="mypage-table mgb10">
				<div class="mypage-front-fonter-orderList">
					<a href="#">주문내역</a>
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
					<a href="${contextPath}/orderList${memberInfo.user_id}.do">주문내역조회</a>
				</div>
				<div class="mypage-cancelList">
					<a href="${contextPath}/cancelList${memberInfo.user_id}.do" class="font-777">취소/교환/반품 내역</a>
				</div>
			</div>
		</div>


		<div class="orderList">
			<div class="orderList-titlebox">
				<div class="orderList-title">주문 상품 정보</div>
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
				<div class="orderList-tablebox">
					<table class="div-orderList">
						<tr class="orderList-table">
							<th class="orderNum-th">주문번호</th>
							<th class="orderDate-th">주문일자</th>
							<th class="orderImage-th">이미지</th>
							<th class="orderInfo-th">상품정보</th>
							<th class="orderCount-th">수량</th>
							<th class="orderCash-th">상품구매금액</th>
							<th class="orderPoint-th">적립금</th>
							<th class="orderState-th">주문처리상태</th>
						</tr>
						<c:forEach var="list" items="${list}">
						<input type="hidden" name="user_id" value="${memberInfo.user_id}">
						<tr class="orderList-tr">
							<td class="orderNum">${list.order_num}</td>
							<td class="orderDate"><fmt:formatDate value="${list.order_date}" pattern="yyyy-MM-dd" /></td>
							<td class="orderImage"><a href="" class="orderImage-a"><img src="resources/${list.product_thumbnail}"></a></td>
							<td class="orderInfo"><a href="" class="orderInfo-a">${list.product_name}</a><br><p>[ ${list.product_color} / ${list.product_size} ]</p></td>
							<td class="orderCount">${list.product_count}</td>
							<td class="orderCash"><fmt:formatNumber
										value="${(list.product_price - list.product_sale) * list.product_count}"
										pattern="###,###,###원" /></td>
							<td class="orderPoint"><fmt:formatNumber
										value="${list.product_price * 0.05}"
										pattern="###,###,###원" /></td>
							<c:choose>
								<c:when test="${list.order_state =='배송완료'}">
									<td class="orderState">${list.order_state}<br>우체국택배<br>[123456789]<br>
<button type="button" id="review-btn" data-order_num="${list.order_num}"data-product_num="${list.product_num}" data-product_name="${list.product_name}" data-product_option="[ ${list.product_color} / ${list.product_size} ]">리뷰쓰기</button>
<button type="button" id="cancel-btn">취소/교환/반품</button>
							<input type="hidden" value="${list.order_num}" name="order_num" id="order_num" />
							<input type="hidden" value="${list.product_num}" name="product_num" id="product_num" />
</td>
								</c:when>
								<c:otherwise>
									<td class="orderState">${list.order_state}</td>
								</c:otherwise>
							</c:choose>
						</tr>
						</c:forEach>
				</table>
			</div>
		</div>
		
		<div id="review-modal">
			<div class="div-title">Review</div>
			<br><br>
			<form action="${contextPath}/reviewWrt.do" method="POST">
			<div>
	            <label class="info-label">상품정보</label>
	            	<input type="hidden" id="review_product_num" name="product_num">
	            	<input type="hidden" id="review_order_num" name="order_num">
	            	
	            	<input type="text" class="info-input" id="review_product_name" name="product_name" value='' readonly>
            </div>
            <div>
	            <label class="writer-label">작성자</label>
	            	<input type="text" class="writer-input" name="user_id" value="${memberInfo.user_id}" readonly>
	            <label class="size-label">상품옵션</label>
	            	<input type="text" class="size-input" id="review_product_option" name="review_option" readonly>
            </div>
            <div>
	            <label class="height-label">키</label>
	            	<input type="text" class="height-input" name="review_height" onKeyup="this.value=this.value.replace(/[^0-9.]/g,'');" placeholder="숫자,소수점만 입력가능"/>
	            	<label id="user_height">cm</label>
	            <label class="weight-label">몸무게</label>
	            	<input type="text" class="weight-input" name="review_weight" onKeyup="this.value=this.value.replace(/[^0-9.]/g,'');" placeholder="숫자,소수점만 입력가능"/>
	            	<label id="user_weight">kg</label>
            </div>
            <div class="div-reviewtitle">
            	<label class="title-label">리뷰제목</label>
	            	<input type="text" class="title-input" id="review_title" name="review_title" value='' >
            </div>
            <div class="div-content">
	            <label class="content-label">내용</label>
	            	<textarea class="content-input" name="review_content"></textarea>
            </div>
            <div>
            	<label>이미지첨부&nbsp;&nbsp;</label>
            		<input type="file" name="review_img1">
            </div>
            <div>
            	<label>이미지첨부&nbsp;&nbsp;</label>
            		<input type="file" name="review_img2">
            </div>
            <div>
            	<label>이미지첨부&nbsp;&nbsp;</label>
            		<input type="file" name="review_img3">
            </div>
            <br><br>
            <div class="review-write">
            	<button type="submit" class="review-write-btn">
      				<p class="font-FFF">작성하기</p>
            	</button>
            </div>
            </form>
            <a class="modal_close_btn"><i class="fas fa-times"></i></a>
        </div>
        
        <div id="cancel-modal">
            <div class="div-title">취소/교환/반품</div>
			<br><br>
			<div class="div-cancel">
				<label class="cancel-label">선택</label>
				<select class="cancel-select">
					<option value="선택" selected>선택</option>
					<option value="취소">취소</option>
					<option value="교환">교환</option>
					<option value="반품">반품</option>
				</select>
			</div>
			<div>
	            <label class="content-label">내용</label>
	            	<input type="text" class="content-input">
	            </div>
            <div>
            	<label>이미지첨부&nbsp;&nbsp;&nbsp;</label>
            		<input type="file">
            </div>
            <br><br>
            <div class="cancel-write">
            	<button type="submit" class="cancel-write-btn" onclick="'${contextPath}/orderList.do'">
            		<a class="font-FFF">작성하기</a>
            	</button>
            </div>
            <a class="modal_close_btn"><i class="fas fa-times"></i></a>
        </div>

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
	</section>
	<script>

		
	$(document).on("click", "#review-btn", function () {
		var product_name = $(this).data('product_name'); 
		$("#review_product_name").val(product_name);
		var product_option = $(this).data('product_option');
		$("#review_product_option").val(product_option);
		var product_num = $(this).data('product_num');
		$("#review_product_num").val(product_num);
		var order_num = $(this).data('order_num');
		$("#review_order_num").val(order_num);
		
		// As pointed out in comments, 
		// it is superfluous to have to manually call the modal. 
		// $('#addBookDialog').modal('show'); 
		});

		function modal(id) {
			var zIndex = 9999;
			var modal = document.getElementById(id);

			// 모달 div 뒤에 희끄무레한 레이어
			var bg = document.createElement('div');
			bg.setStyle({
				position : 'fixed',
				zIndex : zIndex,
				left : '0px',
				top : '0px',
				width : '100%',
				height : '100%',
				overflow : 'auto',
				// 레이어 색깔은 여기서 바꾸면 됨
				backgroundColor : 'rgba(0,0,0,0.4)'
			});
			document.body.append(bg);

			// 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
			modal.querySelector('.modal_close_btn').addEventListener('click',
					function() {
						bg.remove();
						modal.style.display = 'none';
					});

			modal
					.setStyle({
						position : 'fixed',
						display : 'block',
						boxShadow : '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

						// 시꺼먼 레이어 보다 한칸 위에 보이기
						zIndex : zIndex + 1,

						// div center 정렬
						top : '50%',
						left : '50%',
						transform : 'translate(-50%, -50%)',
						msTransform : 'translate(-50%, -50%)',
						webkitTransform : 'translate(-50%, -50%)'
					});
		}

		// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
		Element.prototype.setStyle = function(styles) {
			for ( var k in styles)
				this.style[k] = styles[k];
			return this;
		};

		document.getElementById('review-btn').addEventListener('click',
				function() {
					// 모달창 띄우기
					modal('review-modal');
				});

		document.getElementById('cancel-btn').addEventListener('click',
				function() {
					// 모달창 띄우기
					modal('cancel-modal');
				});

	</script>
</body>
</html>