<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    <title>암호 변경</title>

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
<div align="center">
<form action = "changePwd.do" method ="post">
<p>
 	<b>현재 암호 : </b><br /><input type = "password" name = "curPwd">
 	<c:if test ="${errors.curPwd}">현재 암호를 입력하세요</c:if>
 	<c:if test ="${errors.badCurPwd}">현재 암호가 일치하지 않습니다.</c:if>
</p>

<p>
 	<b>새 암호 : </b><br /><input type = "password" name = "newPwd">
 	<c:if test ="${errors.newPwd}">새 암호를 입력하세요</c:if>
</p>
<input type = "submit" value = "암호 변경">


</form>
</div>
</body>
</html>