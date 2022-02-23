<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<head>
	<link href="resources/css/style-product.css" rel="stylesheet" type="text/css">
	<script type="text/javascipt" src="resources/js/jquery-3.6.0.min.js"></script>
</head>

<body>
	<%
		//session.getAttribute("isLogOn");
    	//session.getAttribute("memberInfo");
    %>
	<section>
		<!-- 전체 박스 시작 -->
		<div class="products-detail">
			<!-- 상단 박스 시작 -->
			<div class="products-detail-box">
				<div class="products-box-info">
					<!-- 이미지, 브랜드, 상품명, 가격, 사이즈선택  -->
					<div class="products-info-image swiper-container">
						<!-- 이미지 -->
						<div class="product-img">
							<img src="resources/${vo.product_thumbnail}"/>
						</div>
					</div>
				</div>
				<div class="products-box-detail">
					
					<div class="products-box-detail-name">
						<!-- 상품명 -->
						<span>${vo.product_name}</span>
					</div>
					<!-- 가격 -->
					<div class="products-box-detail-price">
						<div>
							<span class="products-box-detail-allPrice-title">상품 금액</span> 
						</div>
						<div>
							<c:if test="${vo.product_sale eq 0}">
								<span id="products-price"><fmt:formatNumber value="${vo.product_price}" pattern="###,###,###원"/></span>
							</c:if>
							<c:if test="${vo.product_sale ne 0}">
								<span id="products-sale-span"><fmt:formatNumber value="${vo.product_price}" pattern="###,###,###원"/></span>
								<div class="product-sale-div"><fmt:formatNumber value="${vo.product_price - vo.product_sale}" pattern="###,###,###원"/></div>
							</c:if>
						</div>
					</div>
					<div class="products-reserves border-btm-e1e1e1">
						<!-- 판매량 -->
						<span>적립금</span>
						<span class="products-box-detail-soldCount-figure"><fmt:formatNumber value="${vo.product_price * 0.05}" pattern="###,###,###원"/></span>
					</div>
					<div class="products-box-detail-postInfo border-btm-e1e1e1">
						<span class="products-box-detail-postInfo-title">배송정보</span> <span
							class="products-box-detail-postInfo-content">일반배송</span>
					</div>
					<div class="products-box-detail-realInfo border-btm-e1e1e1">
						<span class="products-box-detail-realInfo-title">정품인증</span> <span
							class="products-box-detail-realInfo-content">The Tibet 내 모든
							상품은 100% 정품입니다.</span> <span
							class="products-box-detail-realInfo-popover"
							onclick="realInfoBox();"><i class="fas fa-sort-down"></i></span>
						<div id="realInfo-box">
							&lt;The Tibet 정품인증&gt;<br /> The Tibet에서 판매되는 모든 브랜드 상품은 정식제조, <br />
							정식수입원을 통해 유통되는 100% 정품임을 보증합니다.
						</div>
					</div>

					<!-- 옵션 -->
					<div class="dropdown-option">
						<div>
							<span>color</span>
						</div>
						<div class="selectbox">
							<label for="color_select">-옵션을 선택해주세요-</label>
							<select id="color_select">
								<option value="선택" selected>-옵션을 선택해주세요-</option>
								<c:forEach var="c" items="${color}" varStatus="i">
									<option value="${c.product_color}">${c.product_color}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="dropdown-option">
						<div>
							<span>size</span>
						</div>
						<div class="selectbox">
							<label for="size_select">-옵션을 선택해주세요-</label>
							<select id="size_select">
								<option value="선택" selected>-옵션을 선택해주세요-</option>
								<c:forEach var="s" items="${size}" varStatus="i">
									<option value="${s.product_size}">${s.product_size}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="count">
						<span>수량</span>
						<input type='button' id='minus-btn' onclick='count("minus")' value='-' />
						<!-- <div id='quantity-input'>1</div> -->
						<input type="text" id="quantity-input" value="1">
						<input type='button' id='plus-btn' onclick='count("plus")' value='+' /> 
					</div>
					<div class="total">
						<div>
						<span class="total-price">Total</span> 
						</div>
						<div>
							<div id="total-products-price"><fmt:formatNumber value="${vo.product_price - vo.product_sale}" pattern="###,###,###원"/></div>
						</div>
					</div>
					<br><br>
					
					<!-- 버튼 시작 -->
					<div id="products-btn">
						<c:if test="${isLogOn eq true}">
							<button type="button" class="buy-btn-yes" data-num="${vo.product_num}" data-name="${vo.product_name}" data-thumbnail="${vo.product_thumbnail}" data-price="${vo.product_price}" data-sale="${vo.product_sale}">
								바로구매
							</button>
						</c:if>
						<c:if test="${isLogOn eq false || isLogOn eq null}">
							<button type="button" class="buy-btn-no" onclick="goLogin()">바로구매</button>
						</c:if>
						<!-- 장바구니 버튼 시작 -->
						<c:if test="${isLogOn eq true}">
							<button type="button" class="cart-btn-yes" data-num="${vo.product_num}" data-name="${vo.product_name}" data-thumbnail="${vo.product_thumbnail}" data-price="${vo.product_price}" data-sale="${vo.product_sale}" 
									onclick="goCart()">
								<i class="fas fa-shopping-cart">&nbsp;장바구니</i>
							</button>
						</c:if>
						<c:if test="${isLogOn eq false || isLogOn eq null}">
							<button type="button" class="cart-btn-no" onclick="goLogin()">
								<i class="fas fa-shopping-cart">&nbsp;장바구니</i>
							</button>
						</c:if>
						<!-- 장바구니 버튼 끝 -->
					</div>
					<!-- 버튼 끝 -->
				</div>
			</div>
			<!-- 상단 박스 끝 -->
			
			
			<!-- 아래 박스 전체 시작-->
			<div class="wrap-detail-info">
				<!-- 상품정보/리뷰/Q&A/주문정보 시작 -->
				<div class="tab-detail-info">
					<ul class="tab">
						<li class="active" id="tab-img-text"><a
							href="#detail-img-text-box" id="tab-img-text-a">상품정보</a></li>
						<li class="active" id="tab-review"><a
							href="#detail-review-box" id="tab-review-a">리뷰</a></li>
						<li class="active" id="tab-qna"><a href="#detail-qna-box"
							id="tab-qna-a">Q&amp;A</a></li>
						<li class="active" id="tab-purchaseInfo"><a
							href="#detail-purchaseInfo-box" id="tab-purchaseInfo-a">주문정보</a></li>
					</ul>
				</div>
				<!-- 상품정보/리뷰/Q&A/주문정보 끝 -->

				<!-- 상품 상세 설명 이미지/글 시작 -->
				<!-- 우측 하단 sticky  -->
				<div class="detail-sticky-go-to-top-btn-box">
					<button type="button" onclick="$('html,body').animate({scrollTop : 0}, 500)" id="arrow_btn">
						<img class="detail-sticky-go-to-top-btn-img" src="resources/img/arrowUp.png" />
					</button>
				</div>
				<!-- 우측 하단 sticky 끝 -->
				
				<!-- 상품 상세 설명 이미지/글 시작 -->
				<div id="detail-img-text-box">${prodDto.detail}</div>
				<div class="productDetail-img">
					<img src="resources/${vo.product_img1}"/>
					<img src="resources/${vo.product_img2}"/>
					<!-- <img src="resources/${vo.product_img3}"/> -->
					<br><br><br><br><br><br><br><br><br><br>
					<img src="resources/${vo.product_detail}"/>
				</div>
				<!-- 상품 상세 설명 이미지/글 끝 -->

				<!-- 리뷰 시작 -->
				<div id="detail-review-box">
					<div class="detail-review-header">
						리뷰
						<c:if test="${sessionScope.principal != null}">
							<a
								href="<%=request.getContextPath()%>/review?cmd=reviewWrite&prodNo=${prodDto.prodId}"
								class="detail-qna-header-a" id="detail-qna-write">리뷰작성</a>
						</c:if>
					</div>
					<br>
					<div class="service-review">
						<table class="service-review-front">
							<thead class="service-review-title mgb15">
								<tr >
									<th class="review-no">번호</th>
									<th class="review-tit">제목</th>
									<th class="review-nm">작성자</th>
									<th class="review-date">작성일</th>
								</tr>
							</thead>
							<tbody class="service-review-content mgb20">
								<c:choose>
									<c:when test="${prodReviewsList == null}">
										<tr>
											<td>
												<p>
													<b><span>등록된 글이 없습니다.</span></b>
												</p>
											</td>
										</tr>
									</c:when>
									<c:when test="${prodReviewsList != null}">
										<c:forEach var="review" items="${prodReviewsList}">
										<c:if test="${review.product_num eq vo.product_num }">
											<c:set var="i" value="${i + 1}"/>
											<tr>
												<td class="review-no">${i}</td>
												<td class="review-tit-td"><a href="#">${review.review_title}</a></td>
												<td class="review-nm">${review.user_id}</td>
												<td class="review-date"><fmt:formatDate value="${review.review_date}" pattern="yyyy-MM-dd"/></td>
											</tr>
										</c:if>
										</c:forEach>
									</c:when>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
				<!-- 리뷰 끝 -->

				<!-- Q&A 시작 -->
				<div id="detail-qna-box">
					<div class="detail-qna-header">
						Q&amp;A
						<c:if test="${sessionScope.principal != null}">
							<a
								href="<%=request.getContextPath()%>/qna?cmd=qnawrite&prodNo=${prodDto.prodId}"
								class="detail-qna-header-a" id="detail-qna-write">문의하기</a>
						</c:if>
						<a class="detail-qna-header-a"
							href="${contextPath}/qna.do">전체보기</a>
					</div>
					<br>
					<div class="service-qna">
						<table class="service-qna-front">
							<thead class="service-qna-title mgb15">
								<tr >
									<th class="qna-no">번호</th>
									<th class="qna-tit">제목</th>
									<th class="qna-nm">작성자</th>
									<th class="qna-date">작성일</th>
								</tr>
							</thead>
							<tbody class="service-qna-content mgb20">
								<c:choose>
									<c:when test="${prodQnasList == null}">
										<tr>
											<td>
												<p>
													<b><span>등록된 글이 없습니다.</span></b>
												</p>
											</td>
										</tr>
									</c:when>
									<c:when test="${prodQnasList != null}">
										<c:forEach var="qna" items="${prodQnasList}">
										<c:if test="${qna.product_num eq vo.product_num }">
											<c:set var="j" value="${j + 1}"/>
											<tr>
												<td class="qna-no">${j}</td>
												<c:choose>
													<c:when test="${qna.qna_lock eq 0}">
														<td class="qna-tit-td"><i class="fas fa-lock-open"></i><a
															href="#">&nbsp;&nbsp;${qna.qna_title}</a></td>
													</c:when>
													<c:when test="${qna.qna_lock eq 1}">
														<td class="qna-tit-td"><i class="fas fa-lock"></i><a
															href="#">&nbsp;&nbsp;비밀글입니다.</a></td>
													</c:when>
												</c:choose>
												<td class="qna-nm">${qna.user_id}</td>
												<td class="qna-date"><fmt:formatDate value="${qna.qna_date}" pattern="yyyy-MM-dd"/></td>
											</tr>
											</c:if>
										</c:forEach>
									</c:when>
								</c:choose>
							</tbody>
						</table>
						<br>
						<div class="qna-write">
							<button type="button" onclick="location.href='${contextPath}/prodQnaWrite${vo.product_num}.do'" class="qna-btn">문의하기</button>
						</div>
					</div>
				</div>
				<!-- Q&A 끝 -->

				<!-- 주문정보 시작 -->
				<div id="detail-purchaseInfo-box">
					<div class="detail-purchaseInfo-header">
						주문정보 <span class="products-box-detail-realInfo-popover"
							onclick="addressInfoBox();"><i class="fas fa-sort-down"></i></span>
					</div>
					<div id="addressInfo-box">
						<b class="bld">[ 배송 정보 ]</b><br />
						<p>
							고객센터 연락이 어려우니 게시판에 문의주시면 빠르게 답변드리도록 하겠습니다.<br />
							CJ대한통운(1588-1255)택배를 이용하며, 매일 오후 1시 전 주문까지만 당일발송합니다.<br />
							발송한날로부터 1~3일 이내 받아보실수 있습니다.<br /> (택배사의 영업사정에 따라 배송지연이 있을 수
							있습니다.)
						</p>
						<b class="bld">[ 교환/환불 정보 ]</b><br />
						<p>
							상품가치가 현저히 훼손된 경우를 제외한 모든 사유에 대해 환불이 가능합니다.<br /> 환불요청 가능 기간은 상품
							수령 후(배송완료 시점으로부터) 7일 이내입니다.<br /> 교환/환불이 발생하는 경우 그 원인을 제공한 자가
							배송비를 부담합니다.<br /> - 고객변심 : 최초 배송비+반품 배송비+(교환의 경우) 교환 배송비는 고객이 부담<br />
							- 판매자귀책 : 최초 배송비+반품 배송비+(교환의 경우) 교환 배송비는 판매자가 부담<br /> 다음의 경우는
							예외적으로 교환 및 환불이 불가능합니다.<br /> - 상품가치가 소비자의 귀책사유로 인해 현저하게 감소한 경우<br />
							- 소비자 과실로 인한 옷의 변색(예 : 착색, 화장품, 오염 등)<br /> - 착용으로 인한 니트류 상품의
							늘어남 발생 및 가죽 제품의 주름 발생<br /> - 기타 착용 흔적 : 택 제거 등<br /> - 구매확정된
							주문의 경우<br /> - 귀금속류의 경우는 소비자분쟁조정기준에 의거 교환만 가능합니다.<br /> (단,
							함량미달의 경우에는 환불이 가능함)<br /> 구매자 단순변심은 상품수령후 7일이내(구매자 반품배송비 부담)
						</p>
					</div>
				</div>
				<!-- 주문정보 끝 -->

			</div>
			<!-- 아래 박스 전체 끝 -->
			
			<!-- 장바구니 이동 폼 -->
			<form action="${contextPath}/addCart.do" method="post" class="cart_form">
				<input type="hidden" name="product_num" class="cart_product_num">
				<input type="hidden" name="product_name" class="cart_product_name">
				<input type="hidden" name="product_thumbnail" class="cart_product_thumbnail">
				<input type="hidden" name="product_price" class="cart_product_price">
				<input type="hidden" name="product_sale" class="cart_product_sale">
				<input type="hidden" name="product_color" class="cart_product_color">
				<input type="hidden" name="product_size" class="cart_product_size">
				<input type="hidden" name="product_count" class="cart_product_count">
				<input type="hidden" name="user_id" value="${memberInfo.user_id}">
			</form>
			
			<!-- 바로구매 이동 폼 -->
			<form action="${contextPath}/nowBuy.do" method="post" class="order_form">
				<input type="hidden" name="product_num" class="cart_product_num">
				<input type="hidden" name="product_name" class="cart_product_name">
				<input type="hidden" name="product_thumbnail" class="cart_product_thumbnail">
				<input type="hidden" name="product_price" class="cart_product_price">
				<input type="hidden" name="product_sale" class="cart_product_sale">
				<input type="hidden" name="product_color" class="cart_product_color">
				<input type="hidden" name="product_size" class="cart_product_size">
				<input type="hidden" name="product_count" class="cart_product_count">
				<input type="hidden" name="user_id" value="${memberInfo.user_id}">
			</form>
		</div>
	</section>
	
<script>
	/* 수량 조절 */
	function count(type){
		  const countElement = document.getElementById('quantity-input');
		  const totalElement = document.getElementById('total-products-price');
		  let number = countElement.value;
		  let total = countElement.innerText;
		  
		  if(parseInt(number) > 1){
			  if(type === 'plus') {				  
			      number = parseInt(number) + 1;
			  } else if(type === 'minus')  {
			      number = parseInt(number) - 1;
			  }
		  } else if(parseInt(number) == 1){
			  if(type === 'plus') {
				  number = parseInt(number) + 1;
			  }
		  }
		  
		  countElement.value = number;
		  
		  var var_total = parseInt(number) * ${vo.product_price - vo.product_sale};
		  totalElement.innerText = var_total.toLocaleString() + "원";
	}
	
	/* 바로구매 이동 버튼 */
	$(".buy-btn-yes").on("click", function(){
		let productNum = $(this).data("num");
		let productName = $(this).data("name");
		let productThumbnail = $(this).data("thumbnail");
		let productPrice = $(this).data("price");
		let productSale = $(this).data("sale");
		let productColor = $("#color_select option:selected").val();
		let productSize = $("#size_select option:selected").val();
		let productCnt = $(this).parents(".products-detail-box").find("#quantity-input").val();
		
		$(".cart_product_num").val(productNum);
		$(".cart_product_name").val(productName);
		$(".cart_product_thumbnail").val(productThumbnail);
		$(".cart_product_price").val(productPrice);
		$(".cart_product_sale").val(productSale);
		$(".cart_product_color").val(productColor);
		$(".cart_product_size").val(productSize);
		$(".cart_product_count").val(productCnt);
		
		var color = $("#color_select option:selected").val();
		var size = $("#size_select option:selected").val();
		
		if(color=="선택" || size=="선택") {
		    alert("옵션을 선택해주세요.");
		    location.reload();
		} else{
			$(".order_form").submit();
		}		
	});
	
	/* 장바구니 이동 버튼 */
	$(".cart-btn-yes").on("click", function(){
		let productNum = $(this).data("num");
		let productName = $(this).data("name");
		let productThumbnail = $(this).data("thumbnail");
		let productPrice = $(this).data("price");
		let productSale = $(this).data("sale");
		let productColor = $("#color_select option:selected").val();
		let productSize = $("#size_select option:selected").val();
		let productCnt = $(this).parents(".products-detail-box").find("#quantity-input").val();
		
		$(".cart_product_num").val(productNum);
		$(".cart_product_name").val(productName);
		$(".cart_product_thumbnail").val(productThumbnail);
		$(".cart_product_price").val(productPrice);
		$(".cart_product_sale").val(productSale);
		$(".cart_product_color").val(productColor);
		$(".cart_product_size").val(productSize);
		$(".cart_product_count").val(productCnt);
		
		var color = $("#color_select option:selected").val();
		var size = $("#size_select option:selected").val();
		
		if(color=="선택" || size=="선택") {
		    alert("옵션을 선택해주세요.");
		    location.reload();
		} else{
			var result1 = confirm("장바구니에 담으시겠습니까?");	
			
			if(result1 == true){
				$(".cart_form").submit();
			} else{
				location.reload();
			}
		}		
	});
	
	/* 로그인 이동 버튼 */  
	function goLogin(){
		var result = confirm("로그인 후 이용 가능합니다.");	
		
		if(result){
			location.href = "${contextPath}/login.do";
		} else{
			location.reload();
		}	
	}
</script>

<script type="text/javascript" src="resources/js/product.js"></script>
</body>