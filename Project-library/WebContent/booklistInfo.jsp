<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Book List - Show Box</title>

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
<body>
<form action ="booklist.do" method = "post">
<div align = "center">
<h2>Book List - Show Box</h2>
<h4>You can view a list of the books you have found.</h4>
<div style = "text-align:center" align ="center">
<table border="1" align="center"  style='letter-spacing:10px'>
<tr >
	
	<td>번호</td>
	<td>제목</td>
	<td>저자</td>
	<td>출판사</td>
	<td>가격</td>
	<td>도서이미지</td>
	<td>대여기간</td>

</tr>
<c:if test="${BookListPage.hasNoBookLists()}">
<tr>
	<td colspan="7">게시된 도서가 없습니다.</td>
</tr>
</c:if>
<c:forEach var="book" items="${BookListPage.content}">
<tr>
	<td>${book.book_id}</td>
	<td>
	<a href="read.do?no=${book.book_id}&pageNo=${BookListPage.currentPage}">
		<c:out value="${book.book_title}" />
	</a>
	</td>
	<td>${book.writer.name}</td>
	<td>${book.readCount}</td>
</tr>
</c:forEach>
<c:if test="${BookListPage.hasBookLists()}">
	<tr>
		<td colspan="7">
			<c:if test="${BookListPage.startPage> 5}">
			<a href="booklist.do?pageNo=${BookListPage.startPage - 5 }">[이전]</a>
			</c:if>			
		<c:forEach var="pNo"
				begin="${BookListPage.startPage}"
				end="${BookListPage.endPage}">
			<a href="booklist.do?pageNo=${pNo}">[${pNo}]</a>
		</c:forEach>
	<c:if test="${bookListPage.endPage < bookListPage.totalPages}">
	<a href="booklist.do?pageNo=${bookListPage.startPage + 5}">[다음]</a>
	</c:if>
	</td>
	</tr> 
	</c:if>
</table>
</div>

</div>
</form>
</body>
</html>