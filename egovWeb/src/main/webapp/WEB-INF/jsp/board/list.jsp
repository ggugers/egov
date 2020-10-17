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
		location.href = "./list.do?pageNo="+pageNo;
	}	
</script>
</head>
<body>
board/list.do <br>
<table border="1">
	<tr><td>번호</td><td>제목</td><td>작성일</td></tr>
<c:forEach items="${list }" var="map">
	<tr><td>${map.idx }</td><td><a href="/board/view.do?idx=${map.idx }">${map.title }</a></td><td>${map.regDate }</td></tr>	
</c:forEach>
</table>
<a href="javascript:;" onclick="location.href='/board/write.do';">등록</a><br>

<ui:pagination paginationInfo = "${paginationInfo}"
	type="text"
	jsFunction="linkPage"/>
</body>
</html>