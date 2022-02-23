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
<title>관리자-등록</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Roboto&display=swap"
	rel="stylesheet">

<style>
.content {
	width: 100%;
    display: inline-flex;
    justify-content: center;
    margin-top: 80px;
}
</style>
</head>
<body>
	<section>
		<div class="content">			
			<div>
				<div class="title">
					<h1>
						<b>회원정보</b>
					</h1>
				</div>
				<%-- <%
					session.getAttribute("memberInfo");
				%> --%>
				
				<div class="info-rect">
	
					<div class="form-group">
						<label for="id">아이디</label> <input type="text" class="form-control"
							id="user_id" name="user_id" value="${memberInfo.user_id}" disabled>
						<div class="eheck_font" id="pw2_check"></div>
					</div>
					<div class="form-group">
						<label for="pw">비밀번호</label> <input type="password"
							class="form-control" id="user_pw" name="user_pw"
							value="${memberInfo.user_pw}"> <label id="pwd-info">(영문
							대소문자/숫자/특수문자 중 <br>2가지 이상 조합, 10자~16자)
						</label>
					</div>
					<div class="form-group">
						<label for="pw2">비밀번호 확인</label> <input type="password"
							class="form-control" id="user_pw2" name="user_pw2"
							value="${memberInfo.user_pw}">
						<div class="eheck_font" id="pw2_check"></div>
					</div>
					<div class="form-group">
						<label for="mem_name">이름</label> <input type="text"
							class="form-control" id="user_name" name="user_name"
							value="${memberInfo.user_name}" disabled>
						<div class="eheck_font" id="name_check"></div>
					</div>
					<div class="form-group">
						<label for="mem_birth">생년월일</label> <input type="tel"
							class="form-control" id="user_birth" name="user_birth"
							value="${memberInfo.user_birth}">
						<div class="eheck_font" id="birth_check"></div>
					</div>
					<div class="form-group">
						<label for="mem_phone">휴대폰 번호</label> <input type="tel"
							class="form-control" id="user_phone" name="user_phone"
							placeholder=" '-'없이 번호만 입력해주세요 " value="${memberInfo.user_phone}">
						<div class="eheck_font" id="phone_check"></div>
					</div>
					<div class="form-group">
						<label for="mem_gender">성별 </label> <input type="radio"
							class="mem_gender" name="user_gender" value="0" <c:if test="${memberInfo.user_gender eq '0'}">checked="checked"</c:if>>남 <input
							type="radio" class="user_gender" name="user_gender" value="1" <c:if test="${memberInfo.user_gender eq '1'}">checked="checked"</c:if>>여
					</div>
					<div class="form-group">
						<label for="mem_address">주소 </label> <input class="form-control"
							placeholder="우편번호" name="user_zip" id="user_zip" type="text"
							value="${memberInfo.user_zip}" readonly="readonly">
						<button type="button" class="btn btn-default"
							onclick="execPostCode();">
							<i class="fa fa-search"></i> 우편번호 찾기
						</button>
					</div>
					<div class="form-group">
						<label></label> <input class="form-address" placeholder="도로명 주소"
							name="user_addr1" id="user_addr1" type="text"
							value="${memberInfo.user_addr1}" readonly="readonly" />
					</div>
					<div class="form-group">
						<label></label> <input class="form-address" placeholder="상세주소"
							name="user_addr2" id="user_addr2" value="${memberInfo.user_addr2}"
							type="text" />
					</div>
					<div class="form-group">
						<label for="mem_email">이메일 주소</label> <input type="email"
							class="form-control" id="user_email" name="user_email"
							value="${memberInfo.user_email}">
						<div class="eheck_font" id="email_check"></div>
					</div>
					<div class="form-group">
						<label>이메일 수신여부</label> <input type="radio" class="email_send"
							name="user_mailSend" value="1" <c:if test="${memberInfo.user_mailSend eq '1'}">checked="checked"</c:if>><span>수신함</span> <input
							type="radio" class="email_send" name="user_mailSend" value="0" <c:if test="${memberInfo.user_mailSend eq '0'}">checked="checked"</c:if>>
						<span class="mailsend-margin">수신안함</span> <label id="pwd-info">쇼핑몰에서
							제공하는 유익한 이벤트 <br>소식을 이메일로 받으실 수 있습니다.
						</label>
					</div>
				</div>
				
				<div class="secession">
					<button class="secession-btn">회원탈퇴</button>
				</div>
				
				<div class="box-btn">
					<div class="box-btn-text">
						<button type="button"
							onclick="button_event01(); location.href='${contextPath}/adminmain.do';"
							class="btn-text">수정</button>
						<button type="button"
							onclick="button_event02(); location.href='${contextPath}/adminmain.do';"
							class="btn-text">취소</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
        function button_event01(){
          
        if (confirm("등록 하시겠습니까?") == false){    //확인
            var form = document.test;
            form.submit();
        
        }else{   //취소
            return;
          }
        }
    </script>
<script>
        function button_event02(){
          
        if (confirm("취소 하시겠습니까?") == false){    //나가기
            var form = document.test;
            form.submit();
        
        }else{   //취소
            return;
          }
        }
    </script>
</body>
</html>