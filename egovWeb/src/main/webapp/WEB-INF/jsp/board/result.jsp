<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function result() {
	parent.result(document.frm.cnt.value);
}
</script>
</head>
<body onload="result()">
board/write.do <br>
<form name="frm">
<input type="hidden" name="cnt" value="<c:out value="${cnt }" />">
</form>
</body>
</html>