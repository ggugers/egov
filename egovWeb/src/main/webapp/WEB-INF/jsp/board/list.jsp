<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function linkPage(pageNo){
		document.search.pageNo.value = pageNo;
		document.search.submit();
	}
	function viewPage(idx) {
		document.search.idx.value = idx;
		document.search.action = "./view.do";
		document.search.submit();
	}
	function writePage(idx){
		document.search.idx.value = idx;
		document.search.action = "./write.do";
		document.search.method = "post";
		document.search.submit();
	}
</script>
</head>
<body>
게시판 목록 <br>
<form name="search" method="get" action="./list.do">
	<input type="hidden" name="idx" value="">
	<input type="hidden" name="pageNo" value='<c:out value="${param.pageNo }" />'>
	<select name="searchType">
		<option value="">선택</option>
		<option value="1" <c:if test="${param.searchType eq '1' }"> selected</c:if>>제목</option>
		<option value="2" <c:if test="${param.searchType eq '2' }"> selected</c:if>>내용</option>
		<option value="3" <c:if test="${param.searchType eq '3' }"> selected</c:if>>제목+내용</option>
	</select>
	<input type="text" name="searchText" value='<c:out value="${param.searchText }" />'>
	<a href="javascript:;" onclick="linkPage('1');">검색</a><br>
</form>
<table border="1">
	<tr><td>번호</td><td>제목</td><td>작성일</td></tr>
<c:forEach items="${list }" var="map">
	<tr><td><c:out value="${map.idx}"/></td><td><a href="javascript:;" onclick="viewPage('<c:out value="${map.idx}"/>');"><c:out value="${map.title}"/></a></td><td><c:out value="${map.regDate}"/></td></tr>	
</c:forEach>
</table>
<a href="javascript:;" onclick="writePage('');">등록</a><br>

<ui:pagination paginationInfo = "${paginationInfo}"
	type="text"
	jsFunction="linkPage"/>
</body>
</html>