<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		if(${result > 0})
			alert("저장성공");
		else
			alsert("저장실패");
		
		location.href="../galleries/galleries_About.do";
	}
</script>
</head>
<body>
</body>
</html>