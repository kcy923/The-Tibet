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
<title>공지사항 등록</title>
<link rel="stylesheet" href="resources/css/admin/admin-layout.css">
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

<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <h2 class="text-center">게시글 작성</h2>
    <form action="${contextPath}/admin-noticeWrt.do" id="admin-noticeWrt" method="post">
          <table class="table table-striped">
            <tr>
                <td>제목</td>
                <td><input type="text"  class="form-control" name="notice_title"></td>
            </tr>
					<%
					session.getAttribute("memberInfo");
					%>
				<input type="hidden" id="관리자" name="user_id" value="${memberInfo.user_id}">
            <tr>
                <td>글내용</td>
                <td><textarea id="summernote" rows="10" cols="50" name="notice_content" class="form-control"></textarea></td>
            </tr>

            <tr>
                <td colspan="2"  class="text-center">
                    <input type="submit" value="글쓰기" class="btn btn-success"
              	onclick="javascript:submit_check('${contextPath}/notice.do')">
                    <input type="reset" value="취소" class="btn btn-warning"
                    	onclick="javascript:delete_check()">
                </td>
            </tr>
          </table>
					<div class="form-group form_file">
						<div>
							<label>이미지 첨부</label> 
							<input class="form-control form_point_color01" type="file" name="notice_img1">
						</div>
						<div>
							<label>이미지 첨부</label> 
							<input class="form-control form_point_color01" type="file" name="notice_img2">
						</div>
						<div>
							<label>이미지 첨부</label> 
							<input class="form-control form_point_color01" type="file" name="notice_img3">
						</div>
						</div>
        </form>
        </div>
        </div>
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
			answer = confirm("등록하시겠습니까?");
			if (answer == true) {

				document.getElementById('admin-noticeWrt').submit();
				location = url;
			}
		}
		function delete_check() {
			var answer;
			//페이지를 이동하기 전에 confirm()을 사용해 다시 한번 확인한다.
			//확인을 선택하면 answer에  true, 취소를 선택하면 false 값이 들어간다.
			answer = confirm("글 작성을 취소하시겠습니까?");
			//확인을 선택한 경우 자바스크립트를 호출할 때 같이 넘어온 url이라는 변수에 들어있는 주소로 페이지 이동
			if (answer == true) {
				history.go(-1);
			}
		}
	</script>
</body>
</html>