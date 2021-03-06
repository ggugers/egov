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
function listPage(){
	document.search.submit();
}
</script>
</head>
<body>
등록 / 수정 <br>
<form name="search" method="get" action="./list.do">
	<input type="hidden" name="idx" value="">
	<input type="hidden" name="pageNo" value='<c:out value="${param.pageNo }" />'>
	<input type="hidden" name="searchType" value='<c:out value="${param.searchType }" />'>
	<input type="hidden" name="searchText" value='<c:out value="${param.searchText }" />'>
</form>
<form name="frm" method="post" action="/board/save.do" target="processIframe">
<input type="hidden" name="idx" value="<c:out value="${data.idx }" />">
<table border="1">
	<tr><th>번호</th><td><c:out value="${data.idx }" /></td></tr>
	<tr><th>등록일</th><td><c:out value="${data.regDate }" /></td></tr>
	<tr><th>제목</th><td><input type="text" name="title" value="<c:out value="${data.title }" />"></td></tr>
	<tr><th>내용</th><td><textarea name="content" rows="" cols=""><c:out value="${data.content }" /></textarea></td></tr>
</table>
</form>
<a href="javascript:;" onclick="saveBoard();">저장</a>
<a href="javascript:;" onclick="listPage();">목록</a>
<iframe name="processIframe" boarder="0" style="display:none;"></iframe>
</body>
</html>