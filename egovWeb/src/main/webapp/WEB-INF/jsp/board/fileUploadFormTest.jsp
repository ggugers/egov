<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function saveBoard() {
	if(!confirm("저장하시겠습니까?")) {
		return;
	}
	document.frm.submit();
}
function result(cnt) {
	if (cnt == "0" || cnt == "") {
		alert("저장 중 오류가 발생하였습니다.");
	} else {
		alert("저장되었습니다.");
		listPage();
	}
}
</script>
</head>
<body>
파일업로드테스트 <br>

<form name="frm" method="post" action="/board/saveFileUploadTest.do" target="processIframe" enctype="multipart/form-data">
<input type="hidden" name="idx" value="<c:out value="${data.idx }" />">
<table border="1">
	<tr><th>번호</th><td><c:out value="${data.idx }" /></td></tr>
	<tr><th>등록일</th><td><c:out value="${data.regDate }" /></td></tr>
	<tr><th>제목</th><td><input type="text" name="title" value="<c:out value="${data.title }" />"></td></tr>
	<tr><th>내용</th><td><textarea name="content" rows="" cols=""><c:out value="${data.content }" /></textarea></td></tr>
	<tr><th>파일</th><td><input type="file" name=""></td></tr>
	<tr><th>파일2</th><td><input type="file" name="addFile2"></td></tr>
</table>
</form>
<a href="javascript:;" onclick="saveBoard();">저장</a>
<iframe name="processIframe" boarder="0" style="display:none;"></iframe>
</body>
</html>