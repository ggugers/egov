<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function deleteBoard() {
	if(!confirm("삭제하시겠습니까?")) {
		return;
	}
	document.search.action="/board/delete.do";
	document.search.method="post";
	document.search.target="processIframe";
	document.search.submit();
}
function updateBoard() {
	document.search.action="/board/write.do";
	document.search.method="get";
	document.search.target="_self";
	document.search.submit();
}
function result(cnt) {
	if (cnt == "0" || cnt == "") {
		alert("삭제 중 오류가 발생하였습니다.");
	} else {
		alert("삭제되었습니다.");
		listPage();
	}
}
function listPage(){
	document.search.action="/board/list.do";
	document.search.method="get";
	document.search.target="_self";
	document.search.submit();
}
</script>
</head>
<body>
게시판 상세 <br>
<form name="search" method="get" action="./list.do">
	<input type="hidden" name="idx" value="<c:out value="${data.idx }" />">
	<input type="hidden" name="pageNo" value='<c:out value="${param.pageNo }" />'>
	<input type="hidden" name="searchType" value='<c:out value="${param.searchType }" />'>
	<input type="hidden" name="searchText" value='<c:out value="${param.searchText }" />'>
</form>
<table border="1">
	<tr><th>번호</th><td><c:out value="${data.idx }" /></td></tr>
	<tr><th>등록일</th><td><c:out value="${data.regDate }" /></td></tr>
	<tr><th>제목</th><td><c:out value="${data.title }" /></td></tr>
	<tr><th>내용</th><td><c:out value="${data.content }" /></td></tr>
</table>
<a href="javascript:;" onclick="deleteBoard();">삭제</a>
<a href="javascript:;" onclick="updateBoard();">수정</a>
<a href="javascript:;" onclick="listPage();">목록</a>
<iframe name="processIframe" boarder="0" style="display:none;"></iframe>
</body>
</html>