<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 관리 목록</title>

<script language="JavaScript">

var checkflag = "false";
function check(field) {
if (checkflag == "false") {
for (i = 0; i < field.length; i++) {
field[i].checked = true;}
checkflag = "true";
return "전체체크"; }
else {
for (i = 0; i < field.length; i++) {
field[i].checked = false; }
checkflag = "false";
return "전체체크"; }
}

 
 function deleteAll() {
	
	    var ischeck = false;
	    var checkCount = 0;
	    var size = document.getElementsByName("checkbox").length;
	  
	

	     for(var i = 0; i < size; i++){
	    	
	    	if(document.getElementsByName("checkbox")[i].checked == true) {
	    	     ischeck = true; 
	    	     checkCount++;
	    	    
	    	     /*  var kvArray = [{key:i, value:document.getElementsByName("checkbox")[i].value}]; */
	    		  /* alert(document.getElementsByName("checkbox")[i].value);	 */ 
	     	}  		
	    }  
	     if(!ischeck) { return alert("삭제할 게시글을 체크해 주세요"); }
	   
	    var deleteConfirm = confirm('정말 삭제 하시겠습니까?')
	    
	    if(deleteConfirm == true) {
	    	form.method = "post";
		    form.action = "deleteAll.do?checkCount="+ checkCount;
		    form.submit();	
	    }
	    
	      

 }
 
 // 체크된 게시글이 없다면 안내 메시지 후 종료
 // 체크된 체크박스 글 번호 get 
 // delete.do로 체크된 글번호 전송
 // deleteHandler에서 전달 받은 글 번호 의 게시글 삭제
 

</script> 

<script>

function doSearch() {
	
	
	form.method = "post";
	form.action = "manager.do?search="+form.searchRequest.value;
	form.submit();
}

</script>

<script>

function doSort() {
	
	var recently = "Recently";
	var old = "Old";
	var category = "Category";
	
	/* if(form.sortArticle.value == recently) {
	   	
	} else if (form.sortArticle.value == old) {
	   
	} else if (form.sortArticle.value == category) {
	  
	} */
	form.method = "post";
	form.action = "manager.do";
	form.submit();
	
}

</script>

<!-- Bootstrap core CSS -->

<link href="bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">



<!-- Custom styles for this template -->

<link href="bootstrap-3.3.2-dist/css/jumbotron.css" rel="stylesheet">

<link rel="stylesheet" href="/css/bootstrap.css">

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<style>

}
a, a:hover {
	color: #000000;
	text-decoration: none;
}

#selet-box1 {
	width: 170px;
	height: 45px;
	text-align: center;
}

.button-type1 {
	style ="width: 100px;
	height: 50px;
	font-size: 18px;
}
/* table{border-spacing:5px;} */
</style>

</head>
<body>
<form id="form" method="post">
	<jsp:include page="../include/navigationBar.jsp" />

	<%--  <a href="modify.do?no=${articleData.article.number}" class="btn btn-secondary" style="width: 150px; height: 50px; font-size: 18px; margin-left: 10px;">게시글수정</a> <a
				onclick="return confirm('정말 삭제하시겠습니까?')"
				href="delete.do?no=${articleData.article.number}" class="btn btn-secondary" style="width: 150px; height: 50px; font-size: 18px; margin-left: 10px;">게시글삭제</a> --%>
 
	<div class="post-top"
		style="margin-top: 220px; margin-left: 150px; float: : left;"></div>

	<div class="container" style="width: 1500px;">

		<div class="row" style="width:1250px;">
			<div style="width: 240px; margin-top: 5px;">
				<img class="post border_color img-1"
					src="<%=request.getContextPath()%>/Resource/img/post/border_color.PNG"
					width="40" height="40" align="left">
				<p style="text-align: left; padding-left: 3px; font-size: 25px;"><a style="text-decoration: none; color:#000000;" href="<%=request.getContextPath()%>/article/manager.do">게시물
					통합 관리</a></p>
			</div>
			<!-- Search form -->

			<input class="form-control" type="text" name="searchRequest"
				placeholder="Search" aria-label="Search"
				style="width: 370px; height: 50px;">
			<button class="btn btn-secondary" name="searchButton" onClick="doSearch()"
				style="width: 80px; height: 50px; margin-left: 10px; font-size: 18px;">검색</button>

			<!-- Button form  -->

			<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
		

			<a href="<%=request.getContextPath() %>/article/write.do"
				class="btn btn-secondary"
				style="width: 100px; height: 50px; font-size: 18px; margin-left: 10px;">글쓰기</a>

			<input type="button" name="button" id="checkAll" value="전체선택"
				class="check-all btn btn-secondary"  onClick="this.value=check(this.form.checkbox)"
				style="width: 110px; height: 50px; font-size: 18px; margin-left: 7px; text-align: center;">
				
				<!-- <input type="checkbox" name="all" class="check-all"> -->
				
			<input type="button" value="선택삭제" class="btn btn-secondary" onClick="deleteAll()"
				style="width: 110px; height: 50px; font-size: 18px; margin-left: 7px; text-align: center;">


            <input type="hidden" name="choisSortArticle" value="<%=request.getParameter("sortArticle")%>">

			<select name="sortArticle" class="custom-select custom-select-sm"
				id="selet-box1" onchange="doSort()"
				style="margin-left: 10px; width: 190px; height: 50px; font-size: 20px;">
				
				<option value="Recently" >최근 등록일 순</option>
				<option value="Old">오래된 순</option>
				<option value="Category">카테고리 순</option>
			</select>



			<table class="table table-striped"
				style="text-align: center; border: 1px; solid #dddddd; margin-top: 5px; 2fe3 ">
				<thead>
					<!-- 등록된 게시글이 없다면  -->
					<tr>

						<th style="background-color: #eeeeee; text-align: center; width:100px;">번호</th>

						<th style="background-color: #eeeeee; width: 300px;">제목</th>

						<th style="background-color: #eeeeee; text-align: center; width:280px;">작성일</th>

						<th style="background-color: #eeeeee; text-align: center; width:180px;">카테고리</th>

						<th
							style="background-color: #eeeeee; text-align: center; width: 350px;">관리</th>

						<th style="background-color: #eeeeee; text-align: center; width:100px;">선택</th>

					</tr>
				</thead>
				<tbody>

					<tr>
						<c:if test="${articlePage.hasNoArticles()}">

							<td></td>
							<td></td>
							<td style="text-align: left;">게시글이 없습니다.</td>
							<td></td>
							<td></td>
							<td></td>
					</tr>
					</c:if>
					<c:forEach var="article" items="${articlePage.content}">


						<tr style="background-color: #ffffff; font-size: 16px;">
							<td name="articleNumber" id="articleNumber2fe3">${article.number}</td>
							<td name="title" id="title" style="text-align: left;">${article.title}</td>
							
							<td>${article.regDate}</td>
							<td>${article.category}/${article.category2}</td>

							<c:if test="${article.number != null}">
								<c:set var="type" value="1" />
								<td><a class="btn btn-secondary"
									href="read.do?no=${article.number}&pageNo=${articlePage.currentPage}"
									style="width: 110px; height: 42px; font-size: 15px;">바로가기</a> <a
									href="modify.do?no=${article.number}" class="btn btn-secondary"
									href="#" style="width: 80px; height: 42px; font-size: 15px;">수정</a>
									<a href="delete.do?no=${article.number}"
									class="btn btn-secondary" href="#"
									style="width: 80px; height: 42px; font-size: 15px;"
									onClick="return confirm('정말 삭제 하시겠습니까?')">삭제</a></td>
								<td>
								
										<input type="checkbox" name="checkbox" value="${article.number}"
											style="width: 20px; height: 20px; margin-top: 10px;">
									</td>
									
						</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	</form>
</body>

<script>
	/* 체크박스 전체선택, 전체해제 */
	function cAll() {
		if ($("#checkAll").is(':checked')) {
			$("input[type=checkbox]").prop("checked", true);
		} else {
			$("input[type=checkbox]").prop("checked", false);
		}
	}
</script>

<script>

       if(form.choisSortArticle.value != "null"){
    	   form.sortArticle.value = form.choisSortArticle.value;
       }
  
   	   
</script>
</html>