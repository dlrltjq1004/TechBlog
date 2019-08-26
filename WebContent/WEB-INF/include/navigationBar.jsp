<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Theme CSS -->
<link href="<%=request.getContextPath() %>/Resource/css/freelancer.min.css" rel="stylesheet">


  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="<%=request.getContextPath()%>/index.jsp">TechBlog</a>
      <button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto" style="margin-right:30px">
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="<%=request.getContextPath()%>/index.jsp">프로필</a>
          </li>
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="<%=request.getContextPath()%>/article/list.do?category=공부로그" value="공부로그">공부로그</a>
          </li>
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="<%=request.getContextPath()%>/article/list.do?category=프로젝트" value="프로젝트">프로젝트</a>
          </li>
        </ul>
        <c:if test="${! empty authUser }">
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                <a href="#" class = "dropdown-toggle"
                    data-toggle="dropdown" role ="button" 
                    aria-haspopup="true"
                    aria-expanded="false" style="color:#ffffff">관리자 메뉴<span class="caret" id=admin-color></span></a>
                    <ul class="dropdown-menu">
                        <li class="active"><a href="logout.do" style="color:#696969">로그아웃</a></li>
                        <li><a href="<%=request.getContextPath()%>/article/manager.do" style="color:#696969">게시글관리 </a></li>                    
                    </ul>
                    </c:if>
                </li>
            </ul>
      </div>
    </div>
  </nav>
  
