<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>
	<p>
		<a href="/board/listPageSearch?num=1">게시물 목록</a> <a
			href="/board/write">게시물 작성</a>
	</p>
	<c:if test="${member == null}">
		<form role="form" method="post" autocomplete="off"
			action="/board/login">
			<p>
				<label for="userId">아이디</label> <input type="text" id="userId"
					name="userId" />
			</p>
			<p>
				<label for="userPwd">패스워드</label> <input type="password"
					id="userPwd" name="userPwd" />
			</p>
			<c:if test="${msg == false }">
				<p style="color: red;">로그인 실패</p>
			</c:if>
			<p>
				<button type="submit">로그인</button>
			<p>
				<a href="/board/loginform">회원가입</a>
		</form>
	</c:if>


	<c:if test="${member != null}">
		<p>${member.userName}님환영합니다.</p>
		<a href="/board/logout">로그아웃</a>
	</c:if>
</body>
</html>
