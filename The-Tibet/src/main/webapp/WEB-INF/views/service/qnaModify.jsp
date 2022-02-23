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
<title>q&a 등록</title>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/qnaWrite.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" href="resources/fontawesome/css/all.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="resources/summernote/summernote-lite.js"></script>
<script src="resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="resources/summernote/summernote-lite.css">

</head>
<body>
<%-- <section>
	<h1>조회 페이지</h1>
	<form id="modifyForm" action="${contextPath}/qnaModify.do" method="post">
	<div class="input_wrap">
		<label>게시판 번호</label>
		<input name="qna_num" readonly="readonly" value='<c:out value="${qna.qna_num}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 제목</label>
		<input name="qna_title" value='<c:out value="${qna.qna_title}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 내용</label>
		<textarea rows="3" name="qna_content"><c:out value="${qna.qna_content}"/></textarea>
	</div>
	<div class="input_wrap">
		<label>게시판 작성자</label>
		<input name="user_id" readonly="readonly" value='<c:out value="${memberInfo.user_id}"/>' >
	</div>
		
	<div class="btn_wrap">
		<a class="btn" id="modify_btn" onclick="submit_check()">수정 완료</a>
	</div>
	</form>

</section>
<script>

	
			function submit_check() {

			var answer;
			answer = confirm("수정하시겠습니까?");
			if (answer == true) {	
				document.getElementById('modifyForm').submit();
			}
		}
				function delete_check() {
			var answer;
			//페이지를 이동하기 전에 confirm()을 사용해 다시 한번 확인한다.
			//확인을 선택하면 answer에  true, 취소를 선택하면 false 값이 들어간다.
			answer = confirm("글 수정을 취소하시겠습니까?");
			//확인을 선택한 경우 자바스크립트를 호출할 때 같이 넘어온 url이라는 변수에 들어있는 주소로 페이지 이동
			if (answer == true) {
				history.go(-1);
			}
		}
		function btnActive() {
			const target = document.getElementById('password');
			target.disabled = false;
		}
		function btnDisabled() {
			const target = document.getElementById('password');
			target.disabled = true;
		}
		
		   $('#summernote').summernote({
			height: 450,
			lang: "ko-KR",
            toolbar: [
                ['fontname', ['fontname']],
                ['fontsize', ['fontsize']],
                ['style', ['bold', 'italic', 'underline', 'clear']],
                ['color', ['color']],
                ['para', ['paragraph']],
                ['insert', ['link', 'picture']],
                ['view', []]
            ]
		});

	
</script> --%>

 	<section>
		
			<div class="service_qna">
				<div class="service-qna_ask-table mgb10">
					<div class="service-front-fonter-qna_ask">Q&amp;A</div>
				</div>
			</div>
		<form id="modifyForm" action="${contextPath}/qnaModify.do" method="post">
			<div class="qna-ask">
				<div class="form">
					<div class="qna-ask-form">
						<label>제목</label> <input type="text" class="input" id="qna_title"
							name="qna_title" value="배송문의" readonly>
							<input type="hidden" name="qna_num" value='<c:out value="${qna.qna_num}"/>' >
					</div>
					<%
					session.getAttribute("memberInfo");
					%>
					
 					<div class="qna-ask-form">
						<label>공개여부</label> 
						<input type="radio" name="qna_lock"
							class="lock-radio" id="lock-radio-open" value="0"
							onclick='btnDisabled()' <c:if test="${qna.qna_lock eq '0'}">checked="checked"</c:if> /> <label class="lock-label">공개</label>
						<input type="radio" name="qna_lock" class="lock-radio"
							id="lock-radio-close" value="1" onclick='btnActive()' <c:if test="${qna.qna_lock eq '1'}">checked="checked"</c:if> />
						<label class="lock-label">비공개</label>
						<input type="hidden" name="qna_lock" value="${qna.qna_lock}"/>
					</div>
					<div class="qna-ask-form">
						<label>비밀번호</label> <input type="password" name="qna_pw"
							class="input" id="password" maxlength="4" value='<c:out value="${qna.qna_pw}"/>'
							placeholder="비밀번호는 4자리 숫자로 설정해주세요." />
							
					</div>
					<div class="qna-ask-form">
						<label>내용</label>
						<textarea id="summernote" name="qna_content"><c:out value="${qna.qna_content}"/></textarea>
						
					</div>
					<div class="qna-ask-form-img">
						<div>
						<label>이미지 첨부</label><input class="qna-ask-form-img-btn"
							type="file" name="qna_img1" value='<c:out value="${qna.qna_img1}"/>'>
						</div>
						<div>	
							<label>이미지 첨부</label><input class="qna-ask-form-img-btn"
							type="file" name="qna_img2" value='<c:out value="${qna.qna_img2}"/>'>
						</div>
						<div>
							<label>이미지 첨부</label><input class="qna-ask-form-img-btn"
							type="file" name="qna_img3" value='<c:out value="${qna.qna_img3}"/>'>
						</div>	
					</div>
				</div>
			</div>

		<div class="box-btn">
			<div class="box-btn-text">
				<button type="button" class="btn-text" id="button-reg"
					onclick="submit_check()">수정</button>
				<button type="button" class="btn-text" id="button-can"
					onclick="delete_check()">취소</button>
			</div>
		</div>
		</form>
	</section>



	<script>
	   $('#summernote').summernote({
			height: 450,
			lang: "ko-KR",
            toolbar: [
                ['fontname', ['fontname']],
                ['fontsize', ['fontsize']],
                ['style', ['bold', 'italic', 'underline', 'clear']],
                ['color', ['color']],
                ['para', ['paragraph']],
                ['insert', ['link', 'picture']],
                ['view', []]
            ]
		});
		
		function submit_check() {

			var answer;
			answer = confirm("수정하시겠습니까?");
			if (answer == true) {	
				document.getElementById('modifyForm').submit();
			}
		}
		function delete_check() {
			var cancel;
			//페이지를 이동하기 전에 confirm()을 사용해 다시 한번 확인한다.
			//확인을 선택하면 answer에  true, 취소를 선택하면 false 값이 들어간다.
			cancel = confirm("글 수정을 취소하시겠습니까?");
			//확인을 선택한 경우 자바스크립트를 호출할 때 같이 넘어온 url이라는 변수에 들어있는 주소로 페이지 이동
			if (cancel == true) {
				history.go(-1);
			}
		}
		function btnActive() {
			const target = document.getElementById('password');
			target.disabled = false;
		}
		function btnDisabled() {
			const target = document.getElementById('password');
			target.disabled = true;
		}
	</script>
</body>
</html>