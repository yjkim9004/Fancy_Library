<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>게시글 목록</title>

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
<table border="1">
<tr>
<td colspan="4"><a href="write.do">[게시글쓰기]</a></td>
</tr>
<tr>
	<td>번호</td>
	<td>제목</td>
	<td>작성자</td>
	<td>조회수</td>
</tr>
<c:if test="${articlePage.hasNoArticles()}">
<tr>
	<td colspan="4">게시글이 없습니다.</td>
</tr>
</c:if>
<c:forEach var="article" items="${articlePage.content}">
<tr>
	<td>${article.number}</td>
	<td>
	<a href="read.do?no=${article.number}&pageNo=${articlePage.currentPage}">
		<c:out value="${article.title}" />
	</a>
	</td>
	<td>${article.writer.name}</td>
	<td>${article.readCount}</td>
</tr>
</c:forEach>
<c:if test="${articlePage.hasArticles()}">
	<tr>
		<td colspan="4">
			<c:if test="${articlePage.startPage> 5}">
			<a href="list.do?pageNo=${articlePage.startPage - 5 }">[이전]</a>
			</c:if>			
		<c:forEach var="pNo"
				begin="${articlePage.startPage}"
				end="${articlePage.endPage}">
			<a href="list.do?pageNo=${pNo}">[${pNo}]</a>
		</c:forEach>
	<c:if test="${articlePage.endPage < articlePage.totalPages}">
	<a href="list.do?pageNo=${articlePage.startPage + 5}">[다음]</a>
	</c:if>
	</td>
	</tr> 
	</c:if>
</table>
</div>
</body>
</html>