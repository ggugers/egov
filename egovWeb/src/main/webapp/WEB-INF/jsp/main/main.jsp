<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
main.do <br>
${date } <br>
<a href="/board/list.do">공지사항</a><br>
<c:forEach items="${list }" var="map">
	${map.idx } / ${map.title }<br>
</c:forEach>
</body>
</html>