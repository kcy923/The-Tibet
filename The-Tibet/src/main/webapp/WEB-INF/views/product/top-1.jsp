<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/fontawesome/css/all.css">
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/style.css">
<style>
section .MainMenu {
	display: flex;
	justify-content: center;
	text-align: center;
	font-weight: bold;
	font-size: 40px;
	background: white;
	color: black;
	margin-bottom: 30px;
	padding-top: 2%;
}

section .SubMenu {
	display: flex;
	justify-content: space-around;
	margin-bottom: 60px;
	position: relative;
	color: black;
	flex-wrap: 5;
}

section .SubMenu li {
	display: block;
	padding: 10px 20px;
}

section .sort {
	display: flex;
	flex-direction: row;
	justify-content: flex-end;
}

section .sort p {	
	width: 1px;	
	margin: 0 0 1% 0;	
}

.hr {
	margin-top: -10px;
}

section .noProd {
	color: black;
}

section .page_wrap {
	display: flex;
	justify-content: space-around;
}

.page_nation {
	display: inline-block;
	margin-bottom: 150px;
}

.page_nation .none {
	display: none;
}

.page_nation a {
	display: block;
	margin: 0 3px;
	float: left;
	border: 1px solid #e6e6e6;
	width: 28px;
	height: 28px;
	line-height: 28px;
	text-align: center;
	background-color: #fff;
	font-size: 13px;
	color: #999999;
	text-decoration: none;
}

.page_nation a.active {
	background-color: #42454c;
	color: #fff;
	border: 1px solid #42454c;
}

.paging {
	margin-top: 50px;
	font-size: 0px;
	text-align: center;
	color: rgb(150, 150, 150);
}

.paging a {
	display: inline-block;
	margin-left: 5px;
	padding: 5px 7px;
	font-size: 14px;
	font-weight: 400;
}

.paging .num-on {
	color: black;
	font-weight: 700;
}

.SubMenu li:hover {
	text-decoration: underline #999;
}

section .SelectMenu {
	font-weight: bold;
	padding: 0 1%;
}

.SubMenu li:hover {
	text-decoration: underline #999;
}

.items {
	width: 20%;
	height: 410px;
	/* border: solid 1px blue; */
	margin: 50px 2.5%;
	float: left;
	justify-content: center;
}

.items img {
	max-width: 100%;
	height: 331px;
	display: block;
}

.items li {
	font-family: "돋움";
	color: #666666;
}

.items .a {
	font-weight: bold;
	color: black;
	margin-top: 20px;
}

.items .b {
	font-weight: bold;
	color: black;
	margin-top: 5px;
}

.items .b span {
	color: #a26f59;
}

.items .c {
   font-weight: bold;
   color: black;
   margin-top: 5px;
   text-decoration: line-through;
   
}

.items .d {
   color: #ff5100;
   font-weight: bold;
   margin-top: 5px;
}

.clear {
	clear: both;
}

.UnSelectMenu-chk {
	padding: 0 1%;
}

.UnSelectMenu {
	border-left: 2px solid #e6e6e6;
	padding: 0 1%;
}
</style>
</head>
<body>
	<section>
		<div class="MainMenu">티셔츠</div>
		<ul class="SubMenu">
			<li><a href="${contextPath}/top.do?p=1">ALL</a></li>
			<li class="SelectMenu"><a href="${contextPath}/top-1.do?p=1">티셔츠</a></li>
			<li><a href="${contextPath}/top-2.do?p=1">셔츠</a></li>
			<li><a href="${contextPath}/top-3.do?p=1">후드&맨투맨</a></li>
			<li><a href="${contextPath}/top-4.do?p=1">니트&가디건</a></li>
			<li><a href="${contextPath}/top-5.do?p=1">조끼</a></li>
		</ul>

		<div>
			<ul class="sort">
				<li class="UnSelectMenu-chk"><a href="${contextPath}/top.do?p=2">low price</a></li>
				<li class="UnSelectMenu"><a href="${contextPath}/top.do?p=3">high price</a></li>
				<li class="UnSelectMenu"><a href="${contextPath}/top.do?p=4">name</a></li>
				<li class="UnSelectMenu"><a href="${contextPath}/top.do?p=1">new arrival</a></li>
			</ul>
		</div>

		<hr>
		<div class="wrap">
			<ul>
				<c:forEach var="list" items="${list}">
					<li>
						<ul class="items">
							<li><a
								href="${contextPath}/productDetail${list.product_num}.do"> <img
									src="resources/${list.product_thumbnail}"></a></li>
							<li class="a"><a href="${contextPath}/productDetail${list.product_num}.do">${list.product_name}</a></li>
							<c:if test="${list.product_sale eq 0}">
								<li class="b"><fmt:formatNumber value="${list.product_price}" pattern="###,###,###원" /></li>
							</c:if>
							<c:if test="${list.product_sale ne 0}">
								<li class="c"><fmt:formatNumber value="${list.product_price}" pattern="###,###,###원" /></li>
								<li class="d"><fmt:formatNumber value="${list.product_price - list.product_sale}" pattern="###,###,###원" /></li>
							</c:if>
						</ul>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div class="clear"></div>
	</section>
</body>
</html>