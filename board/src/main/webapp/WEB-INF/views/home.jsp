<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>이것은 메인페이지</h1>

	<P>지금 서버 시간은 ${serverTime}.</P>
	<p>
	<a href="/board/list">게시물 목록</a><br />
	<a href="/board/write">게시물 작성</a>
	</p>
	
</body>
</html>



