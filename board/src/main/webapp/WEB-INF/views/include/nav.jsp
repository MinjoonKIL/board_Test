<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<ul>
<!-- 	<li><a href="/board/list">글 목록</a></li>

	<li><a href="/board/write">글 작성</a></li>

	<li><a href="/board/listPage?num=1">글 목록(페이징)</a></li> -->
	
	<li><a href="/board/listPageSearch?num=1">글 목록(페이징 + 검색)</a></li>
	<li><a href="/board/write">글 작성</a></li>
	
	<c:if test="${member == null}">
	<li><a href="/board/loginform">회원가입</a></li>
	<li><a href="/">로그인</a></li>
	</c:if>
	
	<c:if test="${member != null}">
		<li><a href="/board/logout">로그아웃</a></li>
	</c:if>
</ul>