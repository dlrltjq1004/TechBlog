<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Blog Post - Start Bootstrap Template</title>

<!-- Bootstrap core CSS -->
<link href="../../Resource/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../../Resource/css/blog-post.css" rel="stylesheet">
<style>
a:link {
	text-decoration: none;
	color: #000000;
}

a:visited {
	text-decoration: none;
	color: #000000;
}

a:active {
	text-decoration: none;
	color: #000000;
}

a:hover {
	text-decoration: none;
	color: #EDA900;
}
</style>
</head>
<body>

	<!-- Navigation -->
	<jsp:include page="../include/navigationBar.jsp" />


	<br>
	<br>
	<br>
	<br>
	<!-- Page Content -->
	<div class="container" style="width: 1500px; margin-left: 250px;">

		<div class="row">

			<!-- Post Content Column -->
			<div class="col-lg-8">

				<!-- Title -->
				<h5 class="mt-4" style="width:1000px;">
					<c:out value='${articleData.article.title}' />
				</h5>

				<!-- Author -->
				<p class="lead" style="font-size: 20px; margin-top: 5px;">작성일:
					${articleData.article.regDate}</p>

				<hr style="width: 1000px;">

				<!-- Post Content -->
				${articleData.content}
				<%-- <p class="lead" style="width: 1000px;">
					<u:pre value='' />
				</p> --%>

				<br> <br> <br> <br>
				<c:set var="pageNo"
					value="${empty param.pageNo ? '1' : param.pageNo}" />
					
					
					<c:if test="${type != 1}">
				<a class="btn btn-secondary" style="width:90px; height:55px; color:#ffffff;" href="list.do?category=<%=request.getParameter("category")%>">목록</a>
					</c:if>
					
				<%-- 	<c:if test="${type == 1 }">
					<a href="articleManager.do">[목록]</a>
					</c:if> --%>
					
			
				
		<%-- 		<c:if test="${authUser.id == articleData.article.writer.id}">
					<a href="modify.do?no=${articleData.article.number}">[게시글수정]</a>

					<a onclick="return confirm('정말 삭제하시겠습니까?')"
						href="delete.do?no=${articleData.article.number}">[게시글삭제]</a> --%>
						

				<%-- </c:if> --%>
				<br>
				<br>
				<!-- Disqus comments Service -->
				<jsp:include page="../include/disqus_comments.jsp" />


				<!-- Bootstrap core JavaScript -->
				<script src="../../Resource/vendor/jquery/jquery.min.js"></script>
				<script
					src="../../Resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
<script>
	function doDelete() {

		var result = confirm("정말 삭제하시겠습니까?");
		if (result) {
			frm.action = "delete.do?no=${articleData.article.number}";
			frm.submit();
		} else {
			return;
		}
	}
</script>

</html>

