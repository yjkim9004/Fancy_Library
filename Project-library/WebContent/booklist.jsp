<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Search the Books</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<div align="center">
<p>
<h2 class="form-signin-heading">Search the book you want to find.</h2> 
<h5 class="form-signin-heading">(찾고 싶은 책을 검색해주세요.) </h5> 
<label for="searchBook" class="sr-only">Search Book</label>
<br /> <input type = "text" id="searchBook" class="form-control" placeholder="Search Book" name ="Bookname" value = "${param.Book}" required autofocus>
<br /> <c:if test ="${errors.book}">Book Name을 입력하세요.</c:if>
<br /> <button class="btn btn-lg btn-primary btn-block" type="submit" onclick="location.href='booklistInfo.jsp'">Search</button>
</p> 
</div>
</body>
</html>