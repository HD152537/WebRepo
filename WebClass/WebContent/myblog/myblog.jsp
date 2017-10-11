<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.dimigo.vo.UserVO" %>
<!DOCTYPE html>
<html>
<head>
 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
       <link rel="stylesheet" href="/WebClass/css/projectcss.css">
       <link href="https://fonts.googleapis.com/css?family=Abril+Fatface" rel="stylesheet">
       <link href="https://fonts.googleapis.com/css?family=Carrois+Gothic+SC" rel="stylesheet">
       <link href="https://fonts.googleapis.com/css?family=Libre+Barcode+39+Text" rel="stylesheet">
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
		<script type="text/javascript" src="/WebClass/js/projectjs.js"></script>
	<title>JeongWoo's Blog</title>
</head>
<body>
<%
	String id = (request.getParameter("id") == null) ? "" : (String)request.getParameter("id");
%>
	<nav class="navbar navbar-expand-lg navbar-white bg-white">
  <a class="navbar-brand" href="#">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <%@ include file="menu.jsp" %>

	    <%-- 세션에 사용자정보가 없는 경우 --%>
    <%
    	UserVO user = (UserVO) session.getAttribute("user");
    	if(user == null) {
    %>
    	<form class="form-inline my-2 my-lg-0" action="/WebClass/bloglogin" method="post">
	      <input class="form-control mr-sm-2" value = "<%= id %>" type="text" placeholder="ID" aria-label="ID" name ="id" id="id" required>
	      <input class="form-control mr-sm-2" type="password" placeholder="PWD" aria-label="PWD" id="pwd" required>
	      <a class="btn btn-outline-success my-2 my-sm-0" href="/WebClass/myblog/signup.html" role="button">SignUp</a>
	      <button class="btn btn-outline-success my-2 my-sm-0" type="submit" id="login">login</button>
	    </form>
    <%} else { %>
    <%-- 세션에 사용자 정보가 있는 경우 --%>
	    <ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
	    <li class="nav-item dropdown">
	      <a class="nav-item nav-link dropdown-toggle mr-md-2" href="#" id="bd-versions" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	    	<%= user.getName() + "님" %>
	      </a>
	      <div class="dropdown-menu dropdown-menu-right" aria-labelledby="bd-versions">
	      <form action="/WebClass/bloglogout" method="post">
	      		<button type="submit" class="dropdown-item">Sign out</button>
	      </form>
	       	<div class="dropdown-divider"></div>
	        <button type="button" class="dropdown-item">Action1</button>
	        <button type="button" class="dropdown-item">Action2</button>
	      </div>
	    </li>
	    </ul>
	    <% } %>
	  </div>
	</nav>
	 <div id="p1">
	  <h1 id="title">HalfMoon's Blog</h1>
	  </div>
	  <h1 class="main"> Veni, vidi, vici </h1>
	  <%@ include file="modal.jsp" %>
	  <script>
	<%-- 로그인이 실패한 경우 처리 추가 --%>
	<%
	if("error".equals(request.getAttribute("msg")))
	{
	%>
		var myModal = $('#myModal');
		myModal.find('.modal-title').text('Login Error');
		myModal.find('.modal-body').text('Invalid username or password');
		myModal.modal();
   <%}%>
</script>
  </body>
</html>