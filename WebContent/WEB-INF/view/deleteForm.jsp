<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>게시글 삭제 확인</title>
</head>
<body>
정말 삭제 하시겠습니까?
<form action="delete.do" method="post">
<input type="hidden" name="no" value="${delReq.articleNumber}">



<input type="submit" value="확인">
</form>
</body>
</html>