<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록 보기</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>
<script type="text/javascript">
	
	var interval_id;
	
	$(document).ready(function(){
		interval_id = setInterval("loadMemberList()", 3000);
	});
	
	function loadMemberList() {
		clearInterval(interval_id);
		
		$.ajax({
			type: "POST",			
			url: "${pageContext.request.contextPath}/member/list",
			dataType: "json",
			success: function (result) {	
				
				var contents = "";
				
				$(".memberContents").remove();
				
				$.each(result, function (index, member) {
					//alert(index + ", " + member.id + ", " + member.pw + ", " + member.name);					
					contents += "<tr class='memberContents'>";
					contents += "<td>" + member.id + "</td>";
					contents += "<td>" + member.pw + "</td>";
					contents += "<td>" + member.name + "</td>";
					contents += "</tr>";			
				}); 
				
				$("#memberListTable").append(contents);		
				
				/*
				var size = result.length;				
				for(var i = 0 ; i < size ; i++ ) {
					var member = result[i];					
					var msg = i + ", " + member.id + ", " + member.pw + ", " + member.name;
					alert(msg);
				}
				*/
				
			},
			error: function () {
				alert("AJAX 통신 에러");
			}
		});
		
		interval_id = setInterval("loadMemberList()", 3000);
	}
</script>

<table border="1" id="memberListTable">
	<caption>회원목록</caption>
	<tr>
		<th>아이디</th>
		<th>패스워드</th>
		<th>이름</th>
	</tr>
</table>

<p><button id="memberListBtn">회원목록 불러오기</button></p>

<script type="text/javascript">
	$("#memberListBtn").click(function () {			
		$.ajax({
			type: "POST",			
			url: "${pageContext.request.contextPath}/member/list",
			dataType: "json",
			success: function (result) {	
				
				var contents = "";
				
				$(".memberContents").remove();
				
				$.each(result, function (index, member) {
					//alert(index + ", " + member.id + ", " + member.pw + ", " + member.name);					
					contents += "<tr class='memberContents'>";
					contents += "<td>" + member.id + "</td>";
					contents += "<td>" + member.pw + "</td>";
					contents += "<td>" + member.name + "</td>";
					contents += "</tr>";			
				}); 
				
				$("#memberListTable").append(contents);		
				
				/*
				var size = result.length;				
				for(var i = 0 ; i < size ; i++ ) {
					var member = result[i];					
					var msg = i + ", " + member.id + ", " + member.pw + ", " + member.name;
					alert(msg);
				}
				*/				
			},
			error: function () {
				alert("AJAX 통신 에러");
			}
		});		
	});
</script>

</body>
</html>








