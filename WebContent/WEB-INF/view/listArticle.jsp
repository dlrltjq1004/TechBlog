<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>게시글 목록</title>
</head>
<style>
span.relative {
	position: relative;
	left: 10px;
	top: 10px;
}

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
<body>

	<link
		href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
		rel="stylesheet" id="bootstrap-css">
	<!-- NavigationBar -->
	<jsp:include page="../include/navigationBar.jsp" />



	<script
		src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<!------ Include the above in your HEAD tag ---------->

	<link rel="stylesheet"
		href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css" />

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<!-- 등록된 게시글이 없다면  -->
	<c:if test="${articlePage.hasNoArticles()}">
		<div class="container">
			<div class="well">
				<div class="media">
					<a class="pull-left" href="#"> <img class="media-object"
						src="http://placekitten.com/150/150">
					</a>
					<div class="media-body" style="height: 150px;">
						<h2 class="media-heading"></h2>
						<br>

						<h1 style="height: 75px;">게시글이 없습니다.</h1>
	</c:if>

	<!-- 게시글 목록  -->
	<c:forEach var="article" items="${articlePage.content}">
		<!-- div 영역에 링크 걸기 onclick="location.href='read.do?no=${article.number}&pageNo=${articlePage.currentPage}';"  -->
		<div class="container">
			<div class="well">
				<div class="media">
					<a class="pull-left"
						href="read.do?no=${article.number}&pageNo=${articlePage.currentPage}&category=${article.category}">
						<img class="media-object" style="width: 170px; height: 180px;"
						src='<%=request.getContextPath()%><c:out value="${article.representative_image}"/>'
						onerror=this.src='http://placekitten.com/150/150'>

					</a>
					<div class="media-body" style="height: 180px;">
						<h4 class="media-heading">
							<c:out value="${article.category}" /> / <c:out value="${article.category2}" />
						</h4>
						<br> <a
							href="read.do?no=${article.number}&pageNo=${articlePage.currentPage}&category=${article.category}">
							<h3 style="height: 100px;">
								<c:out value="${article.title}" />
							</h3>
						</a> <br>
						<ul class="list-inline list-unstyled">
							<li><span><i class="glyphicon glyphicon-calendar"
									style="font-size: 15px;"></i style="font-size:40px; ">
								<c:out value="  ${article.regDate}" /> </span></li>
						</ul>
					</div>
				</div>
			</div>

		</div>

	</c:forEach>



	<br>
	<br>


	<!-- 페이징  -->
	<%-- <c:if test="${articlePage.startPage} > 5">

</c:if> 
 --%>

</body>
</html>