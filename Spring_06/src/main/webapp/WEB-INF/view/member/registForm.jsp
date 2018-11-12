<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>

<h3 align = "center" >회원가입</h3>

<form action="${pageContext.request.contextPath}/member/regist" method="post" align="center">

	<p >ID : <input type="text" name="id" id="member_id">
			 <span id="idCheckMsg"></span> 
			 
	 </p>
	
	<p>NAME : <input type="text" name="name"></p>
	<button type="button" id="idCheckBtn">ID 중복 체크</button> 
	<button type="reset" value="reset">리셋</button>
	
</form>

<script type="text/javascript">
	$("#idCheckBtn").click(function () {
	//	alert("Button Click~!!!");
		var member_id = $("#member_id").val();
		// 비동기통신을 위한 ajax 호출 코드
		// 현재 페이지의 이동업싱 서버와 데이터를 주고받을 수 있습니다.
		// 데이터의 교환에는 일반적으로 JSON 형식의 데이터를 활용합니다.
		$.ajax({
			// 호출 방식
			type:"POST",
			// 호출 URL(서버)
			url: "${pageContext.request.contextPath}/member/checkId/"+ member_id,
			// 전달할 데이터 타입
			dataType: "json",
			// 서버에 전달하기 위한 데이터
			// 통신이 성공했을 경우 자동호출되는 이벤트 함수를 지정
			success: function (result) {
				// alert(result.value);
				$("#idCheckMsg").text(result.value);
			}, 
			// 통신이 실패했을 경우 자동호출되는 이벤트 함수를 지정
			error: function() {
				$("#idCheckMsg").text("ID 중복 체크 실패!!");
			}
		});
		
	});
</script>

</body>
</html>