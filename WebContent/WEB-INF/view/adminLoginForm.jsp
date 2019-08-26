<%@ page  contentType="text/html; charset=UTF-8"%>    

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1" >        

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->



<title>관리자 로그인</title>
</head>


<%@ include file="../include/navigationBar.jsp" %>

<link href="./Resource/css/loginForm.css" rel="stylesheet">



<form action=login.do method=post>
<div  class="simple-login-container" style="margin-top:220px">
    <h2>관리자 로그인</h2>
    <br>
    <c:if test="${errors.idOrPwNotMatch}">
           아이디 또는 암호가 일치하지 않습니다.
    </c:if>
    <div class="row">
        <div class="col-md-12 form-group">
            <input type="text" class="form-control" placeholder="아이디" name="id" value="${param.id}">
            <br>
            <c:if test="${errors.id}">ID를 입력하세요.</c:if>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 form-group">
            <input type="password" placeholder="비밀번호" class="form-control" name="password">
            <br>
            <c:if test="${errors.password}">암호를 입력하세요.</c:if>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 form-group">
            <input type="submit" class="btn btn-block btn-login"  value="로그인">
        </div>
    </div>
</div>
</form>