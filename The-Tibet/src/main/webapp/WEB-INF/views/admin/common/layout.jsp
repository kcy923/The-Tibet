<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="X-UA-Compatible" content="IE=edge" />
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
 <meta name="description" content="" />
 <meta name="author" content="" />
 <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/admin/style.css" rel="stylesheet" type="text/css">


</head>
<body>
		<div>
			<tiles:insertAttribute name="header" />
		</div>
			<tiles:insertAttribute name="side" />
			<tiles:insertAttribute name="body" />
		<div>
		</div>
</body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="resources/js/admin/datatables-simple-demo.js"></script>
      	<script src="resources/js/admin/scripts.js"></script>
</html>