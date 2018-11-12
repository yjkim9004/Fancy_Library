<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 읽기</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>LOGIN PAGE By Fancy Yong Library</title>

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
<div style = "text-align:center">
<table border="1" width = "100%">
<tr>
	<td>번호</td> 
	<td>${articleData.article.number}</td>
</tr> 
<tr>
	<td>작성자</td>  
	<td>${articleData.article.writer.name}</td>
</tr>
<tr>
	<td>제목</td> 
	<td><c:out value = '${articleData.article.title}' /></td>
</tr>
<tr>
	<td>내용</td> 
	<td><u:pre value= '${articleData.content}' /></td>
</tr>
<tr>
	<td colspan="2">
	<c:set var="pageNo" value ="${empty param.pageNo?'1':param.pageNo}" />
		<a href="list.do?pageNo=${pageNo}">[목록]</a>
		<c:if test="${authUser.id == articleData.article.writer.id}">
		<a href="modify.do?no=${articleData.article.number}">[게시글수정]</a>
		<a href="delete.do?no=${articleData.article.number}">[게시글삭제]</a>
	</c:if>
	</td>
</tr>
</table>
</div>
</body>
</html>