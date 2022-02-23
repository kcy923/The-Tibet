<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주문</title>

<link rel="stylesheet" href="resources/css/order.css">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>
<body>
	<section>
		<div class="checkout-full-wrp">
			<div class="favor-head border-btm-black mgb20">주문/결제</div>
			
			<div class="order-top-div">
				<table id="order-product-table">
					<thead class="order-product-table-head">
						<tr>
							<th class="order-product-img">상품이미지</th>
							<th class="order-product-info">상품정보</th>
							<th class="order-product-price">판매가</th>
							<th class="order-product-count">수량</th>
							<th class="order-product-point">적립금</th>
							<th class="order-product-total">합계</th>
						</tr>
					</thead>
					<tbody class="order-product-table-body">
						<c:forEach var="buy" items="${buyList}">
							<c:set var="i" value="${i + 1}"/>
							<tr id="tr">
								<td class="td-order-product-img"><a href="#"><img src="resources/${buy.product_thumbnail}" style="height:100px;"/></a></td> 
								<td class="td-order-product-info">
									<div>${buy.product_name}</div>
									<div class="product-option">[${buy.product_color}, ${buy.product_size}]</div>
								</td>
								<c:if test="${buy.product_sale eq 0}">
									<td class="td-order-product-price"><fmt:formatNumber value="${buy.product_price}" pattern="###,###,###원"/></td>
								</c:if>
								<c:if test="${buy.product_sale ne 0}">
									<td class="td-order-product-price">
										<div class="td-order-price-div"><fmt:formatNumber value="${buy.product_price}" pattern="###,###,###원"/></div>
										<div class="td-order-sale-div"><fmt:formatNumber value="${buy.product_price - buy.product_sale}" pattern="###,###,###원"/></div>
									</td>
								</c:if>
								<td class="td-order-product-count">
									<div class="table_text_align_center quantity_div">${buy.product_count}</div>
								</td>
								<td class="td-order-product-point"><fmt:formatNumber value="${buy.product_price * 0.05 * buy.product_count}" pattern="###,###,###원"/></td>
								<td class="td-order-product-total"><fmt:formatNumber value="${(buy.product_price - buy.product_sale) * buy.product_count}" pattern="###,###,###원"/></td>
								<td><input type="hidden" id="hidden-price${i}" value="${buy.product_price * buy.product_count}" /></td>
								<td><input type="hidden" id="hidden-discount${i}" value="${buy.product_sale * buy.product_count}" /></td>
								<td class="hidden-value-td">
									<input type="hidden" name="order_name" class="add_order_name">
									<input type="hidden" name="order_tel" class="add_order_tel">
									<input type="hidden" name="order_phone" class="add_order_phone">
									<input type="hidden" name="order_email" class="add_order_email">
									<input type="hidden" name="receiver_name" class="add_receiver_name">
									<input type="hidden" name="receiver_zip" class="add_receiver_zip">
									<input type="hidden" name="receiver_addr1" class="add_receiver_addr1">
									<input type="hidden" name="receiver_addr2" class="add_receiver_addr2">
									<input type="hidden" name="receiver_tel" class="add_receiver_tel">
									<input type="hidden" name="receiver_phone" class="add_receiver_phone">
									<input type="hidden" name="receiver_msg" class="add_receiver_msg">
									<input type="hidden" name="order_state" class="add_order_state" value="결제완료">
									<input type="hidden" name="order_pay" class="add_order_pay">
									<input type="hidden" name="product_num" class="add_product_num${i}" value="${buy.product_num}">
									<input type="hidden" name="product_name" class="add_product_name${i}" value="${buy.product_name}">
									<input type="hidden" name="product_thumbnail" class="add_product_thumbnail${i}" value="${buy.product_thumbnail}">
									<input type="hidden" name="product_price" class="add_product_price${i}" value="${buy.product_price}">
									<input type="hidden" name="product_sale" class="add_product_sale${i}" value="${buy.product_sale}">
									<input type="hidden" name="product_color" class="add_product_color${i}" value="${buy.product_color}">
									<input type="hidden" name="product_size" class="add_product_size${i}" value="${buy.product_size}">
									<input type="hidden" name="product_count" class="add_product_count${i}" value="${buy.product_count}">
									<input type="hidden" name="user_id" class="add_user_id" value="${memberInfo.user_id}">
									<input type="hidden" name="index${i}" value="${i}">
								</td>
							</tr>							
						</c:forEach>
					</tbody>
				</table>		
				<div class="order-middle-priceAll">
					<div>
						<div class="f15-555">상품구매금액&nbsp;<div id="middle-price">0</div>원</div>
						<input type="hidden" id="middle-hidden-price">
					</div>
					<span>+</span>
					<div>
						<div class="f15-555">배송비&nbsp;<div id="middle-delivery">2,500</div>원</div>
						<input type="hidden" id="middle-hidden-delivery">
					</div>
					<span>-</span>
					<div>
						<div class="f15-555">상품할인금액&nbsp;<div id="middle-discount">0</div>원</div>
						<input type="hidden" id="middle-hidden-discount">
					</div>
					<span>=</span>
					<div>
						<div class="order-middle-totalPrice pdl20 f25-bd-purple">합계&nbsp;<div class="f25-bd-purple" id="middle-total">0</div>원</div>
						<input type="hidden" id="middle-hidden-total">
					</div>
				</div>
			</div>
			<p class="order-middle-content">[상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.]</p>
			
			<div class="checkout-info-wrp">
				<!-- 하단좌측박스 시작 -->
				<div class="checkout-wrp-left">
					<h3 class="f20-bd-333">주문 정보</h3>
					<div class="left-section-delivery-info left-section-box">
						<div class="order-person">
							<label>주문하시는 분 *</label>
							<input type="text" id="input-order-person"/>
						</div>
						<div class="order-address">
							<label>주소 *</label>
							<input type="text" id="input-order-zipcode" name="input-order-zipcode" readonly="readonly"/>
							<button type="button" id="address-btn" onclick="order_execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button><br>
							<label></label>
							<input type="text" id="input-order-address1" name="input-order-address1" readonly="readonly"/>
							<span>기본주소</span>
							<br>
							<label></label>
							<input type="text" id="input-order-address2" name="input-order-address2"/>
							<span>나머지주소</span>
						</div>
						<div class="order-call">
							<label>일반전화</label>
							<input type="text" id="input-order-call" placeholder=" '-'없이 번호만 입력해주세요. "/>
						</div>
						<div class="order-phone">
							<label>휴대전화 *</label>
							<input type="text" id="input-order-phone" placeholder=" '-'없이 번호만 입력해주세요. "/>
						</div>
						<div class="order-email">
							<label>이메일 *</label>
							<input type="text" id="input-order-email"/>
							<p>- 이메일을 통해 주문처리과정을 보내드립니다.</p>
							<p>- 이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해 주세요.</p>
						</div>
					</div>
				</div>
				<!-- 하단우측박스 시작 -->
				<div class="checkout-wrp-right">
					<h3 class="f20-bd-333">배송 정보</h3>
					<div class="left-section-delivery-info left-section-box">
						<div class="delivery-checkbox">
							<label>배송지 선택</label>
							<span><input type="checkbox" id="delivery-same" name="delivery-checkbox-input" onclick="checkDelivery(this); checkInfo();" checked="checked"/> 주문자 정보와 동일</span>&nbsp;&nbsp;&nbsp;
							<span><input type="checkbox" id="delivery-not-same" name="delivery-checkbox-input" onclick="checkDelivery(this); checkInfo();"/> 새로운 배송지</span>
						</div>
						<div class="delivery-person">
							<label>받으시는 분 *</label>
							<input type="text" id="input-delivery-person" name="input-delivery-person"/>
						</div>
						<div class="delivery-address">
							<label>주소 *</label>
							<input type="text" id="input-delivery-zipcode" name="input-delivery-zipcode" readonly="readonly"/>
							<button type="button" class="address-btn" onclick="delivery_execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>	
							<br>
							<label></label>
							<input type="text" id="input-delivery-address1" name="input-delivery-address1" readonly="readonly"/>
							<span>기본주소</span>
							<br>
							<label></label>
							<input type="text" id="input-delivery-address2" name="input-delivery-address2"/>
							<span>나머지주소</span>
						</div>
						<div class="delivery-call">
							<label>일반전화</label>
							<input type="text" id="input-delivery-call" placeholder=" '-'없이 번호만 입력해주세요. "/>
						</div>
						<div class="delivery-phone">
							<label>휴대전화 *</label>
							<input type="text" id="input-delivery-phone" placeholder=" '-'없이 번호만 입력해주세요. "/>
						</div>
						<div class="delivery-msg">
							<label>배송메시지</label>
							<textarea id="delivery-msg-textarea"></textarea>
						</div>
					</div>
				</div>
			</div>
			
			<div class="total-div">
				<h3 class="f20-bd-333">결제 예정 금액</h3>
				<div class="total-table">
					<table>
						<thead class="price-table-head">
							<tr>
								<th class="total-order">총 주문 금액</th>
								<th class="total-discount">총 할인 + 부가결제 금액</th>
								<th class="total-price">총 결제예정 금액</th>
							</tr>
						</thead>
						<tbody id="price-table-body">
							<tr>
								<td id="total-order-td">0원</td>
								<td id="total-discount-td">- 0원</td>
								<td id="total-price-td">= 0원</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="total-discount-div1">
					<div class="total-discount-div2">총 할인금액</div>
					<div id="total-discount-div3">0원</div>
				</div>
			</div>
				
			<div class="order-bottom-div">
				<div class="discount-div">
					<h3 class="f20-bd-333">적립금&쿠폰</h3>
					<div class="discount-section-box">
						<div class="point-div">
							<label>적립금</label>
							<input type="text" id="input-use-point" placeholder="0"/>
							<button type="button" id="btn-use-point" onclick="usePoint()">사용</button>
							<div class="member-point-div">
								<div>[ 사용 가능한 적립금 :&nbsp;</div><div id="usable-point">0</div><div>원 ]</div>
							</div>
						</div>
						<div class="coupon-div">
							<label>쿠폰</label>
							<select>
								<option>:::선택해 주세요.:::</option>
								<option>oooo 할인권</option>
							</select>
						</div>
					</div>
				</div>
				<input type="hidden" id="hidden-point" value="${memberInfo.user_point}" />
			
				<div class="pay-div">
					<h3 class="f20-bd-333">결제 수단</h3>
					<div class="pay-section-box">
						<div class="pay-checkbox">
							<span><input type="checkbox" id="pay-card" name="pay-checkbox-input" value="카드결제" onclick="checkPay(this); setDisplay(); test();" checked="checked"/> 카드 결제</span>&nbsp;&nbsp;&nbsp;
							<span><input type="checkbox" id="pay-tongjang" name="pay-checkbox-input" value="무통장입금" onclick="checkPay(this); setDisplay(); test();"/> 무통장 입금</span>&nbsp;&nbsp;&nbsp;
							<span><input type="checkbox" id="pay-phone" name="pay-checkbox-input" value="휴대폰결제" onclick="checkPay(this); setDisplay(); test();"/> 휴대폰 결제</span>
						</div>
						<div id="card-div">
							<i class="fas fa-exclamation-circle"></i> 최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.<br><br>
							<i class="fas fa-exclamation-circle"></i> 소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.<br>
							<div class="total-span-div">
								<span class="total-title">카드 결제&nbsp;</span><span class="total-span">최종결제 금액</span>
							</div>		
						</div>
						<div id="tongjang-div">
							<div class="tongjang-top">
								<div>
									<label>입금자명</label>
									<input type="text" id="tongjang-person-input" />
								</div>
								<div>
									<label>입금은행</label>
									<select id="bank_select">
										<option>:::선택해 주세요.:::</option>
										<option value="1">신한은행:000-000-000000 (주)The Tibet</option>
									</select>
									<button type="button" id="bank-btn" onclick="goBank()">은행사이트 바로가기</button>
								</div>
								<i class="fas fa-exclamation-circle"></i> 최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.
							</div>
							<div class="tongjang-bottom">
								<div class="bottom-checkbox">
									<label id="receipt-label">현금영수증 신청</label>
									<div>
										<span><input type="checkbox" id="pay-tongjang-receipt" name="tongjang-checkbox-input" value="201" onclick="checkTongjang(this); setDisplay();"/> 현금영수증 신청</span>&nbsp;&nbsp;
										<span><input type="checkbox" id="pay-tongjang-nonreceipt" name="tongjang-checkbox-input" value="202" onclick="checkTongjang(this); setDisplay();" checked="checked"/> 신청안함</span>
									</div>
								</div>
								<div id="receipt-checkbox">
									<label>구분</label>
									<span><input type="checkbox" id="receipt-phone" name="receipt-checkbox-input" value="20101" onclick="checkReceipt(this); setDisplay();" checked="checked"/> 개인</span>&nbsp;&nbsp;
									<span><input type="checkbox" id="receipt-code" name="receipt-checkbox-input" value="20102" onclick="checkReceipt(this); setDisplay();"/> 사업자</span>
								</div>
								<div id="phoneNum-div">
									<label>휴대폰 번호</label>
									<input type="text" id="tongjang-phoneNum-input" placeholder=" '-'없이 번호만 입력해주세요. "/>
								</div>
								<div id="code-div">
									<label>사업자 번호</label>
									<input type="text" id="tongjang-code-input"/>
								</div>
							</div>
							<div class="total-span-div">
								<span class="total-title">무통장 입금&nbsp;</span><span class="total-span">최종결제 금액</span>		
							</div>
						</div>
						<div id="phone-div">
							<i class="fas fa-exclamation-circle"></i> 소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.	
							<div class="total-span-div">
								<span class="total-title">휴대폰 결제&nbsp;</span><span class="total-span">최종결제 금액</span>
							</div>		
						</div>
						<div id="total-price-div"></div>				
					</div>
				</div>
			</div>
			
			<!-- DB 주문번호 불러옴 -->
			<c:forEach var="list" items="${orderNumList}">
				<input type="hidden" id="get-num" value="${list.order_num}">
			</c:forEach>
			
			<!-- 주문번호 생성 -->
			<input type="hidden" id="generate-num">
			
			<div class="total-price-btn-div">
				<!-- <button type="button" id="total-price-btn" onclick="goOrder();">결제하기</button> -->
				<button type="button" id="total-price-btn" onclick="payment();">결제하기</button>
			</div>
			
			<!-- 주문 폼 -->
			<form action="${contextPath}/addOrderList.do" method="post" class="order_form">
			</form>
			
		</div>
	</section>
	
	<script>	
		/* 하나만 체크 */
		function checkDelivery(element) {
			const checkboxes = document.getElementsByName("delivery-checkbox-input");
			checkboxes.forEach((cb) => {
		    	cb.checked = false;
		    })
		    
		    element.checked = true;
		}
		
		function checkPay(element) {
			const checkboxes = document.getElementsByName("pay-checkbox-input");
			checkboxes.forEach((cb) => {
		    	cb.checked = false;
		    })
		    
		    element.checked = true;
		}
		
		function checkTongjang(element) {
			const checkboxes = document.getElementsByName("tongjang-checkbox-input");
			checkboxes.forEach((cb) => {
		    	cb.checked = false;
		    })
		    
		    element.checked = true;
		}
		
		function checkReceipt(element) {
			const checkboxes = document.getElementsByName("receipt-checkbox-input");
			checkboxes.forEach((cb) => {
		    	cb.checked = false;
		    })
		    
		    element.checked = true;
		}
		
		
		/* 체크마다 다른 div 띄우기 */
		function setDisplay(){
			if($('input:checkbox[id=pay-card]').is(':checked')){
				$('#card-div').show(),
				$('#tongjang-div').hide(),
				$('#phone-div').hide();				
			} else if($('input:checkbox[id=pay-tongjang]').is(':checked')){
				$('#card-div').hide(),
				$('#tongjang-div').show(),
				$('#phone-div').hide();
				
				if($('input:checkbox[id=pay-tongjang-receipt]').is(':checked')){
					$('#receipt-checkbox').show();
					
					if($('input:checkbox[id=receipt-phone]').is(':checked')){
						$('#phoneNum-div').show(),
						$('#code-div').hide();
					} else if($('input:checkbox[id=receipt-code]').is(':checked')){
						$('#phoneNum-div').hide(),
						$('#code-div').show();
					}
				} else if($('input:checkbox[id=pay-tongjang-nonreceipt]').is(':checked')){
					$('#receipt-checkbox').hide(),
					$('#phoneNum-div').hide(),
					$('#code-div').hide();
				}
			} else if($('input:checkbox[id=pay-phone]').is(':checked')){
				$('#card-div').hide(),
				$('#tongjang-div').hide(),
				$('#phone-div').show();	
			}
		}
		
		
		/* 우편번호 API */
		function order_execPostCode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	               // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	               var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	               var extraRoadAddr = ''; // 도로명 조합형 주소 변수

	               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                   extraRoadAddr += data.bname;
	               }
	               // 건물명이 있고, 공동주택일 경우 추가한다.
	               if(data.buildingName !== '' && data.apartment === 'Y'){
	                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	               }
	               // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	               if(extraRoadAddr !== ''){
	                   extraRoadAddr = ' (' + extraRoadAddr + ')';
	               }
	               // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	               if(fullRoadAddr !== ''){
	                   fullRoadAddr += extraRoadAddr;
	               }

	               // 우편번호와 주소 정보를 해당 필드에 넣는다.
	               console.log(data.zonecode);
	               console.log(fullRoadAddr);
	               
	               
	               $("[name=input-order-zipcode]").val(data.zonecode);
	               $("[name=input-order-address1]").val(fullRoadAddr);
	               
	               document.getElementById('input-order-zipcode').value = data.zonecode; //5자리 새우편번호 사용
	               document.getElementById('input-order-address1').value = fullRoadAddr;
	               /*document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress;*/
	           }
	        }).open();
	    }
		
		function delivery_execPostCode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	               // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	               var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	               var extraRoadAddr = ''; // 도로명 조합형 주소 변수

	               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                   extraRoadAddr += data.bname;
	               }
	               // 건물명이 있고, 공동주택일 경우 추가한다.
	               if(data.buildingName !== '' && data.apartment === 'Y'){
	                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	               }
	               // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	               if(extraRoadAddr !== ''){
	                   extraRoadAddr = ' (' + extraRoadAddr + ')';
	               }
	               // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	               if(fullRoadAddr !== ''){
	                   fullRoadAddr += extraRoadAddr;
	               }

	               // 우편번호와 주소 정보를 해당 필드에 넣는다.
	               console.log(data.zonecode);
	               console.log(fullRoadAddr);
	               
	               
	               $("[name=input-delivery-zipcode]").val(data.zonecode);
	               $("[name=input-delivery-address1]").val(fullRoadAddr);
	               
	               document.getElementById('input-delivery-zipcode').value = data.zonecode; //5자리 새우편번호 사용
	               document.getElementById('input-delivery-address1').value = fullRoadAddr;
	               /*document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress;*/
	           }
	        }).open();
	    }
		
		
		/* 은행사이트 이동 */
		function goBank(){
			var s = document.getElementById("bank_select");
			var bankOption = s.options[s.selectedIndex].value;
			
			if(bankOption == 1) {
				window.open('https://www.shinhan.com/index.jsp');
			}
		}
		
		
		/* 적립금 사용 */
		function usePoint(){
			// 적립금 유효성 검사
			var point = parseInt(document.getElementById('input-use-point').value);
			var usablePoint = parseInt(document.getElementById('hidden-point').value);
			
			if (point <= usablePoint) {				
				// 상품구매금액
				var priceSum = document.getElementById('middle-hidden-price').value;
				
				// 상품할인금액
				var discount = document.getElementById('middle-hidden-discount').value;
				
				// 배송비
				var delivery = document.getElementById('middle-hidden-delivery').value;
						
				// 합계
				var total = document.getElementById('middle-hidden-total').value;
				total = total - point;
				
				document.getElementById('total-price-div').innerText = total.toLocaleString() + "원";
			} else {
				alert("사용 가능한 적립금 금액을 확인해주세요.");
			}
		}
		
		
		/* 자동 실행 */
		window.onload = function(){
			/* 기본 체크박스 설정 */
			$('#card-div').show();
			$('#tongjang-div').hide();
			$('#phone-div').hide();
			
			
			/* 상품 총합계 */
			const table = document.getElementById('order-product-table');
			const tbodyRow = table.tBodies[0].rows.length;
			
			// 상품구매금액
			var priceSum = 0;
			for(var i=1; i<tbodyRow+1; i++){
				var price = parseInt(document.getElementById("hidden-price"+i).value);
				priceSum += price;
			}
			
			$("#middle-price").text(priceSum.toLocaleString());
			$("#middle-hidden-price").val(priceSum);
			
			// 상품할인금액
			var discountSum = 0;
			for(var j=1; j<tbodyRow+1; j++){
				var discount = parseInt(document.getElementById("hidden-discount"+j).value);
				discountSum += discount;
			}
			
			$("#middle-discount").text(discountSum.toLocaleString());
			$("#middle-hidden-discount").val(discountSum);
			
			// 배송비
			var delivery = 2500;
			if((priceSum-discountSum) >= 100000){
				delivery = 0;
				$("#middle-delivery").text(delivery.toLocaleString());
				$("#middle-hidden-delivery").val(delivery);
			} else{
				$("#middle-delivery").text(delivery.toLocaleString());
				$("#middle-hidden-delivery").val(delivery);
			}
					
			// 합계
			var total = priceSum - discountSum + delivery;
			$("#middle-total").text(total.toLocaleString());
			$("#middle-hidden-total").val(total);
			
			// 총 주문 금액(상품구매금액+배송비)
			bottom_total = priceSum + delivery;
			document.getElementById('total-order-td').innerText = bottom_total.toLocaleString() + "원";
			
			// 총 할인 + 부가결제 금액
			document.getElementById('total-discount-td').innerText = "- " + discountSum.toLocaleString() + "원";
			
			// 총 결제예정 금액
			document.getElementById('total-price-td').innerText = "= " + total.toLocaleString() + "원";
			
			// 총 할인금액
			document.getElementById('total-discount-div3').innerText = discountSum.toLocaleString() + "원";
			
			// 최종결제 금액
			document.getElementById('total-price-div').innerText = total.toLocaleString() + "원";
			
			/* 회원 정보 불러오기 */
			// 주문 정보
			$('#input-order-person').val('${memberInfo.user_name}');
			$('#input-order-zipcode').val('${memberInfo.user_zip}');
			$('#input-order-address1').val('${memberInfo.user_addr1}');
			$('#input-order-address2').val('${memberInfo.user_addr2}');
			$('#input-order-phone').val('${memberInfo.user_phone}');
			$('#input-order-email').val('${memberInfo.user_email}');
				
			// 배송 정보
			$('#input-delivery-person').val('${memberInfo.user_name}');
			$('#input-delivery-zipcode').val('${memberInfo.user_zip}');
			$('#input-delivery-address1').val('${memberInfo.user_addr1}');
			$('#input-delivery-address2').val('${memberInfo.user_addr2}');
			$('#input-delivery-phone').val('${memberInfo.user_phone}');
			
			// 적립금&쿠폰
			var point = document.getElementById("hidden-point").value;
			$("#usable-point").text(point.toLocaleString());
			
			// 주문번호 생성
			generateOrderNum();
		}	
		
		function checkInfo(){
			if($('input:checkbox[id=delivery-same]').is(':checked')){
				$('#input-delivery-person').val('${memberInfo.user_name}');
				$('#input-delivery-zipcode').val('${memberInfo.user_zip}');
				$('#input-delivery-address1').val('${memberInfo.user_addr1}');
				$('#input-delivery-address2').val('${memberInfo.user_addr2}');
				$('#input-delivery-phone').val('${memberInfo.user_phone}');
			} else if($('input:checkbox[id=delivery-not-same]').is(':checked')){
				$('#input-delivery-person').val('');
				$('#input-delivery-zipcode').val('');
				$('#input-delivery-address1').val('');
				$('#input-delivery-address2').val('');
				$('#input-delivery-phone').val('');
			}
		}
		
		
		/* 주문번호 생성 */
		function generateOrderNum() {
			// 날짜
			var today = new Date().toISOString().substring(0,10).replace(/-/g, '');
			
		    // 랜덤번호
		    let str = '';
			for (let i = 0; i < 6; i++) {
				str += Math.floor(Math.random() * 10);
			}
			
			for (j=1; j <= $('input[id=get-num]').length; j++) {
				if (str == $('#test-input'+j).val()) {
					for (let i = 0; i < 6; i++) {
						str += Math.floor(Math.random() * 10);
					}
				}
			}
			
			$('#generate-num').val(today + "-" + str);
		}
		
		
		/* 결제수단 */
		function payment(){
			// 결제수단 value 가져오기
			var orderPay;
			var obj_length = document.getElementsByName("pay-checkbox-input").length;
	        for (var j=0; j<obj_length; j++) {
	            if (document.getElementsByName("pay-checkbox-input")[j].checked == true) {
	            	orderPay = document.getElementsByName("pay-checkbox-input")[j].value;
	            }
	        }
	        
	        if(orderPay == '카드결제') {
	        	iamport();
	        } else {
	        	goOrder();
	        }
		}
		
		
		/* 주문 버튼 */
		function goOrder(){			
			const table = document.getElementById('order-product-table');
			const tbodyRow = table.tBodies[0].rows.length;
			
			/* 적립금 계산 */
			var priceSum = 0;
			for(var i=1; i<tbodyRow+1; i++){
				var price = parseInt(document.getElementById("hidden-price"+i).value);
				priceSum += price;
			}
			var user_point = parseInt(document.getElementById("hidden-point").value);
			var minus_point = $("#input-use-point").val();
			var plus_point = priceSum * 0.05;
			var update_point_var = user_point + plus_point - minus_point;
			
			/* form 생성 */	
			let form_contents = '';		
			let orderNum = $("#generate-num").val();
			let orderName = $("#input-order-person").val();
			let orderTel = $("#input-order-call").val();
			let orderPhone = $("#input-order-phone").val();
			let orderEmail = $("#input-order-email").val();
			let receiverName = $("#input-delivery-person").val();
			let receiverZip = $("#input-delivery-zipcode").val();
			let receiverAddr1 = $("#input-delivery-address1").val();
			let receiverAddr2 = $("#input-delivery-address2").val();
			let receiverTel = $("#input-delivery-call").val();
			let receiverPhone = $("#input-delivery-phone").val();
			let receiverMsg = $("#delivery-msg-textarea").val();
			let orderState = $(".add_order_state").val();
			let userId = $(".add_user_id").val();
			let orderPay;
			
			// 결제수단 value 가져오기
			var obj_length = document.getElementsByName("pay-checkbox-input").length;
	        for (var j=0; j<obj_length; j++) {
	            if (document.getElementsByName("pay-checkbox-input")[j].checked == true) {
	            	orderPay = document.getElementsByName("pay-checkbox-input")[j].value;
	            }
	        }
			
			for(var i=0; i<tbodyRow; i++){
				let productNum = $(".add_product_num"+(i+1)).val();
				let productName = $(".add_product_name"+(i+1)).val();
				let productThumbnail = $(".add_product_thumbnail"+(i+1)).val();
				let productPrice = $(".add_product_price"+(i+1)).val();
				let productSale = $(".add_product_sale"+(i+1)).val();
				let productColor = $(".add_product_color"+(i+1)).val();
				let productSize = $(".add_product_size"+(i+1)).val();
				let productCount = $(".add_product_count"+(i+1)).val();

				let orderNum_input = "<input name='orders[" +i + "].order_num' type='hidden' value='" + orderNum + "'>";
				form_contents += orderNum_input;
				let orderName_input = "<input name='orders[" +i + "].order_name' type='hidden' value='" + orderName + "'>";
				form_contents += orderName_input;
				let orderTel_input = "<input name='orders[" + i + "].order_tel' type='hidden' value='" + orderTel + "'>";
				form_contents += orderTel_input;
				let orderPhone_input = "<input name='orders[" + i + "].order_phone' type='hidden' value='" + orderPhone + "'>";
				form_contents += orderPhone_input;
				let orderEmail_input = "<input name='orders[" + i + "].order_email' type='hidden' value='" + orderEmail + "'>";
				form_contents += orderEmail_input;
				let receiverName_input = "<input name='orders[" + i + "].receiver_name' type='hidden' value='" + receiverName + "'>";
				form_contents += receiverName_input;
				let receiverZip_input = "<input name='orders[" + i + "].receiver_zip' type='hidden' value='" + receiverZip + "'>";
				form_contents += receiverZip_input;
				let receiverAddr1_input = "<input name='orders[" + i + "].receiver_addr1' type='hidden' value='" + receiverAddr1 + "'>";
				form_contents += receiverAddr1_input;
				let receiverAddr2_input = "<input name='orders[" + i + "].receiver_addr2' type='hidden' value='" + receiverAddr2 + "'>";
				form_contents += receiverAddr2_input;
				let receiverTel_input = "<input name='orders[" + i + "].receiver_tel' type='hidden' value='" + receiverTel + "'>";
				form_contents += receiverTel_input;
				let receiverPhone_input = "<input name='orders[" + i + "].receiver_phone' type='hidden' value='" + receiverPhone + "'>";
				form_contents += receiverPhone_input;
				let receiverMsg_input = "<input name='orders[" + i + "].receiver_msg' type='hidden' value='" + receiverMsg + "'>";
				form_contents += receiverMsg_input;
				let orderState_input = "<input name='orders[" + i + "].order_state' type='hidden' value='" + orderState + "'>";
				form_contents += orderState_input;
				let orderPay_input = "<input name='orders[" + i + "].order_pay' type='hidden' value='" + orderPay + "'>";
				form_contents += orderPay_input;
				let productNum_input = "<input name='orders[" + i + "].product_num' type='hidden' value='" + productNum + "'>";
				form_contents += productNum_input;
				let productName_input = "<input name='orders[" + i + "].product_name' type='hidden' value='" + productName + "'>";
				form_contents += productName_input;
				let productThumbnail_input = "<input name='orders[" + i + "].product_thumbnail' type='hidden' value='" + productThumbnail + "'>";
				form_contents += productThumbnail_input;
				let productPrice_input = "<input name='orders[" + i + "].product_price' type='hidden' value='" + productPrice + "'>";
				form_contents += productPrice_input;
				let productSale_input = "<input name='orders[" + i + "].product_sale' type='hidden' value='" + productSale + "'>";
				form_contents += productSale_input;
				let productColor_input = "<input name='orders[" + i + "].product_color' type='hidden' value='" + productColor + "'>";
				form_contents += productColor_input;
				let productSize_input = "<input name='orders[" + i + "].product_size' type='hidden' value='" + productSize + "'>";
				form_contents += productSize_input;
				let productCount_input = "<input name='orders[" + i + "].product_count' type='hidden' value='" + productCount + "'>";
				form_contents += productCount_input;
				let userId_input = "<input name='orders[" + i + "].user_id' type='hidden' value='" + userId + "'>";
				form_contents += userId_input;
			}
			let update_user_id_input = "<input type='hidden' id='update_user_id' name='update_user_id' value='${memberInfo.user_id}'>";
			form_contents += update_user_id_input;
			let update_point_input = "<input type='hidden' id='update_point' name='update_point'>";		
			form_contents += update_point_input;			
						
			
			/* 빈칸 확인 경고창 */
			// 배송 정보 확인
			if($("#input-delivery-person").val() == "") {
				alert("받으시는 분 성함을 입력해주세요.");
				$("#input-delivery-person").focus();
				return false;
			} else if($("#input-delivery-zipcode").val() == "") {
				alert("우편번호를 입력해주세요.");
				$("#input-delivery-zipcode").focus();
				return false;
			} else if($("#input-delivery-address1").val() == "") {
				alert("기본주소를 입력해주세요.");
				$("#input-delivery-address1").focus();
				return false;
			} else if($("#input-delivery-phone").val() == "") {
				alert("휴대폰 번호를 입력해주세요.");
				$("#input-delivery-phone").focus();
				return false;
			}
			
			// 결제 수단 확인
			if($("input:checkbox[id=pay-tongjang]").is(":checked") == true) {
				if($("#tongjang-person-input").val() == "") {
					alert("입금자명을 입력해주세요.");
					$("#tongjang-person-input").focus();
					return false;
				} else if($("#bank_select option:selected").val() != 1) {
					alert("입금 은행을 선택해주세요.");
					$("#bank_select").focus();
					return false;
				} else if($("input:checkbox[id=pay-tongjang-receipt]").is(":checked") == true && $("input:checkbox[id=receipt-phone]").is(":checked") == true) {
					if($("#tongjang-phoneNum-input").val() == "") {
						alert("휴대폰 번호를 입력해주세요.");
						$("#tongjang-phoneNum-input").focus();
						return false;
					}
				} else if($("input:checkbox[id=pay-tongjang-receipt]").is(":checked") == true && $("input:checkbox[id=receipt-code]").is(":checked") == true) {
					if($("#tongjang-code-input").val() == "") {
						alert("사업자 번호를 입력해주세요.");
						$("#tongjang-code-input").focus();
						return false;
					}
				}
			}
			
			/* Form Submit */
			$(".order_form").html(form_contents);		
			$("#update_point").val(update_point_var);			
			$(".order_form").submit();		
		}
		
		
		/* 결제 API */
		function iamport(){
			var total = document.getElementById('total-price-div').value;
			var email = document.getElementById('input-order-email').value;
			var name = document.getElementById('input-order-person').value;
			var phone = document.getElementById('input-order-phone').value;
			var addr1 = document.getElementById('input-order-address1').value;
			var addr2 = document.getElementById('input-order-address2').value;
			var zipcode = document.getElementById('input-order-zipcode').value;
				
			//가맹점 식별코드
			IMP.init('imp61062206');
			IMP.request_pay({
			    pg : 'html5_inicis',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : 'The Tibet 결제' , //결제창에서 보여질 이름
			    amount : 100, //실제 결제되는 가격
			    buyer_email : email,
			    buyer_name : name,
			    buyer_tel : phone,
			    buyer_addr : addr1 + ' ' + addr2,
			    buyer_postcode : zipcode
			}, function(rsp) {
				console.log(rsp);
			    if ( rsp.success ) {
			    	var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			        
			        goOrder();
			    } else {
			    	 var msg = '결제에 실패하였습니다.';
			         msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
		}
	</script>
</body>
</html>