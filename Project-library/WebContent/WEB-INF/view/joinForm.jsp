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
    
<body>


<div class="container">
<form class ="form-signin" action ="login.do" method = "post">
<h2 class="form-signin-heading">Please sign in</h2>
<c:if test ="${errors.idOrPwNotMatch}">
아이디와 암호가 일치하지 않습니다.
</c:if>
<p>
<label for="inputID" class="sr-only">ID</label>
<br /> <input type = "id" id="inputID" class="form-control" placeholder="ID" name = "id" value = "${param.id}" required autofocus>
<c:if test ="${errors.id}">ID를 입력하세요.</c:if>
</p>
<p>
<label for="inputPassword" class="sr-only">Password</label>
<br /><input type ="password" id="inputPassword" class="form-control" placeholder="Password" name = "password" required>
<c:if test="${errors.password}">암호를 입력하세요.</c:if>
</p>
<div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>
</div>


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>



<form action="join.do" method ="post">
	<div style = "text-align:center">
	
<p>
	<b>
	ID :<br /><input type ="text" name="id" value="${param.id}">
	<c:if test ="${errors.id}">아이디를 입력하세요.</c:if>
	<c:if test ="${errors.duplicateId}">이미 사용중인 아이디입니다.</c:if>
	</b> 
</p>

<p>
	<b>
	NAME :<br /><input type ="text" name="name" value="${param.name}">
	<c:if test ="${errors.name}">이름을 입력하세요.</c:if>
	</b>
</p>

<p>
	<b>
	PASSWORD :<br /><input type ="password" name="password" >
	<c:if test ="${errors.password}">패스워드를 입력하세요.</c:if>
	</b>
</p>

<p>
	<b>
	CONFIRM :<br /><input type ="password" name="confirmPassword" >
	<c:if test ="${errors.confirmPassword}">확인을 입력하세요.</c:if>
	<c:if test ="${errors.notMatch}">암호와 확인된 암호가 일치하지 않습니다.</c:if>
	</b>
</p>
<b><input type="submit" value ="SUBMIT"></b>
<b><button type="button" onclick="location.href='index.jsp'">LOGIN PAGE</button></b>
<b><button type="button" onclick="location.href='main.jsp'">HOME</button></b>
	</div>
</form>
</body>
</html>