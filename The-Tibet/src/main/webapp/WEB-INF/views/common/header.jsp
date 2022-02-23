<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>티벳샵</title>

<link rel="stylesheet" href="resources/fontawesome/css/all.css">
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Roboto&display=swap" rel="stylesheet">

<script src="resources/js/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<title>header</title>
</head>
<body>
	<header>
		<ul class="top-menu">
			<!--  로그인시 로그아웃표시 -->
			<c:choose>
				<c:when test="${isLogOn==true and not empty memberInfo and memberInfo.user_id !='admin'}">
					<li><a href="${contextPath}/notice.do">SERVICE</a></li>
					<li>${memberInfo.user_name}님 환영합니다.</li>
					<li><a href="${contextPath}/logout.do">LOGOUT</a></li>
					<li><a href="${contextPath}/memModifyForm.do">MYPAGE</a></li>
					<li><a href="${contextPath}/cart${memberInfo.user_id}.do">CART</a></li>
				</c:when>
				<c:when test="${isLogOn==true and not empty memberInfo and memberInfo.user_id =='admin' }">
					<li><a href="${contextPath}/notice.do">SERVICE</a></li>
					<li><a href="${contextPath}/logout.do">LOGOUT</a></li>
					<li class="no_line"><a href="${contextPath}/admin-memberlist.do">Manager</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${contextPath}/notice.do">SERVICE</a></li>
					<li><a href="${contextPath}/login.do">LOGIN</a></li>
					<li><a href="${contextPath}/signupForm.do">SIGN UP</a></li>
				</c:otherwise>
			</c:choose>
			<!-- 관리자로 로그인시 관리자표시 -->

			<li><button id="open-button">
				<i class="fas fa-search"></i>
			</button></li>
		</ul>
		
		<div id="logo">
			<a href="${contextPath}/main.do">THE TIBET</a>
		</div>
		<ul class="nav-table">
			<li><input type="checkbox" id="menuicon" class="menuicon01">
            <label for="menuicon">
                <span></span>
                <span></span>
                <span></span>
            </label></li>
      		<li class="nav-table-menu"><a href="${contextPath}/new.do?p=1">NEW</a></li>
			<li class="nav-table-menu"><a href="${contextPath}/outer.do?p=1">OUTER</a></li>
			<li class="nav-table-menu"><a href="${contextPath}/top.do?p=1">TOP</a></li>
			<li class="nav-table-menu"><a href="${contextPath}/pants.do?p=1">PANTS</a></li>
			<li class="nav-table-menu"><a href="${contextPath}/bag.do?p=1">BAG</a></li>
			<li class="nav-table-menu"><a href="${contextPath}/acc.do?p=1">ACC</a></li>
			<li class="nav-table-menu"><a href="${contextPath}/sale.do?p=1">SALE</a></li>
		</ul>
		<div class="nav-table02">
			 <div class="nav-table01">
			 	<div class="submenu00" id="submenu10-0">
                    <ul>
                        <li><a></a></li>
                    </ul>
                </div>
			 	<div class="submenu01" id="submenu10-1">
                    <ul>
                        <li><a href="${contextPath}/new.do?p=1">신상품</a></li>
                    </ul>
                </div>
                <div class="submenu02" id="submenu10-1">
                    <ul>
                        <li><a href="${contextPath}/outer-1.do?p=1">재킷&점퍼</a></li>
                        <li><a href="${contextPath}/outer-2.do?p=1">코트</a></li>
                    </ul>
                </div>
                <div class="submenu03" id="submenu10-1">
                    <ul>
                        <li><a href="${contextPath}/top-1.do?p=1">티셔츠</a></li>
                        <li><a href="${contextPath}/top-2.do?p=1">셔츠</a></li>
                        <li><a href="${contextPath}/top-3.do?p=1">후드&맨투맨</a></li>
                        <li><a href="${contextPath}/top-4.do?p=1">니트&가디건</a></li>
                        <li><a href="${contextPath}/top-5.do?p=1">조끼</a></li>
                    </ul>
                </div>
                <div class="submenu04" id="submenu10-1">
                    <ul>
                        <li><a href="${contextPath}/pants-1.do?p=1">팬츠</a></li>
                        <li><a href="${contextPath}/pants-2.do?p=1">쇼츠</a></li>
                    </ul>
                </div>
                <div class="submenu05" id="submenu10-1">
                    <ul>
                        <li><a href="${contextPath}/bag-1.do?p=1">숄더백</a></li>
                        <li><a href="${contextPath}/bag-2.do?p=1">백팩</a></li>
                        <li><a href="${contextPath}/bag-3.do?p=1">크로스백</a></li>
                        <li><a href="${contextPath}/bag-4.do?p=1">메신저백</a></li>
                    </ul>
                </div>
                <div class="submenu06" id="submenu10-1">
                    <ul>
                        <li><a href="${contextPath}/acc-1.do?p=1">모자</a></li>
                        <li><a href="${contextPath}/acc-2.do?p=1">반지&팔찌</a></li>
                        <li><a href="${contextPath}/acc-3.do?p=1">선글라스</a></li>
                        <li><a href="${contextPath}/acc-4.do?p=1">벨트</a></li>
                    </ul>
                </div>
                <div class="submenu07" id="submenu10-1">
                    <ul>
                        <li><a href="${contextPath}/sale.do?p=1">세일</a></li>
                    </ul>
                </div>
			 </div>
		</div>
		<div class="drop-box"></div>
	</header>

	<div class="modal">
		<div class="modal_body">
			<h1>SEARCH</h1>
			<div class="close">
				<button id="close-button">
					<i class="fas fa-times"></i>
				</button>
			</div>
			<form method="GET" name="search" action="${contextPath}/searchForm.do">
			<div class="wraps">
				<div class="search">
					<input type="text" list="productlist" name="KeyWord" id="KeyWord" class="KeyWord"
							placeholder="What are you looking for?" style="width: 90%;">
							<datalist id="productlist">
								<option value="재킷">
								<option value="점퍼">
								<option value="코트">
								<option value="티셔츠">
								<option value="셔츠">
								<option value="후드">
								<option value="맨투맨">
								<option value="니트">
								<option value="가디건">
								<option value="조끼">
								<option value="팬츠">
								<option value="쇼츠">
								<option value="숄더백">
								<option value="백팩">
								<option value="크로스백">
								<option value="메신저백">
								<option value="모자">
								<option value="반지">
								<option value="팔찌">
								<option value="선글라스">
								<option value="벨트">
							</datalist>
						<button type="submit" class="searchButton">
							<i class="fas fa-search"></i>
						</button>
				</div>
			</div>
			</form>
			<div class="recommend-items">
				<ul>
					<li><a href="${contextPath}/new.do?p=1" class="font-777"># 다가오는 겨울에 함께 하기 좋은 윈터 룩</a></li>
					<li><a href="${contextPath}/sale.do?p=1" class="font-777"># 오늘의 신상 할인 5%~10%</a></li>
					<li><a href="${contextPath}/top-4.do?p=1" class="font-777"># 휘뚜루마뚜루 착용할 수 있는 데일리 니트</a></li>
					<li><a href="${contextPath}/pants.do?p=1" class="font-777"># 바지 맛집! 인기팬츠 보러가기!</a></li>
				</ul>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function(){
	        $(".menuicon01").on('click', function(){
	            if($(this).prop('checked')){
	                $(".nav-table02").css({"display":"block"});
	            } else {
	                $(".nav-table02").css({"display":"none"});
	            }
	        })
	    });

		$("#open-button").click(function() {
			$(".modal").attr("style", "display:block");
		});
		$("#close-button").click(function() {
			$(".modal").attr("style", "display:none");
		});
		
		$('html, body').css({'overflow': 'hidden', 'height': '100%'}); // 모달팝업 중 html,body의 scroll을 hidden시킴 
		$('#element').on('scroll touchmove mousewheel', function(event) { // 터치무브와 마우스휠 스크롤 방지     
			event.preventDefault();     
			event.stopPropagation();     
			return false; 
		});
		
		$('html, body').css({'overflow': 'auto', 'height': '100%'}); //scroll hidden 해제 $('#element').off('scroll touchmove mousewheel'); // 터치무브 및 마우스휠 스크롤 가능
	</script>

</body>
</html>