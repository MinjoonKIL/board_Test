<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
	integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
	crossorigin="anonymous"></script>
<body>
	<div id="nav">
		<%@ include file="../include/nav.jsp"%>
	</div>
	<table class="table table-hover table-striped text-center"
		style="boarder: 1px solid;">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>작성자</th>
				<th>조회수</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.bno}</td>
					<td><a href="/board/view?bno=${list.bno}">${list.title}</a></td>
					<%-- 					<td>${list.title}</td> --%>
					<td><fmt:formatDate value="${list.regDate}"
							pattern="yyyy-MM-dd" /></td>
					<td>${list.writer}</td>
					<td>${list.viewCnt}</td>
				</tr>
			</c:forEach>
		</tbody>

	</table>
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:if test="${page.prev}">

				<li class="page-item"><a class="page-link"
					href="/board/listPageSearch?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a>
				</li>
			</c:if>

			<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}"
				var="num">
				<li class="page-item"><c:if test="${select != num}">
						<a class="page-link"
							href="/board/listPageSearch?num=${num}${page.searchTypeKeyword}">${num}</a>
					</c:if> <c:if test="${select == num}">
						<b class="page-link bg-primary text-light">${num}</b>
					</c:if></li>

			</c:forEach>

			<c:if test="${page.next}">
				<li class="page-item"><a class="page-link no-before"
					href="/board/listPageSearch?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a>

				</li>
			</c:if>
		</ul>
	</nav>
			<div class="w100" style="display: inline-block;">
			<select class="form-control form-control-sm" style="width:100px;" name="searchType" >
				<option value="title"
					<c:if test="${page.searchType eq 'title'}">selected</c:if>>제목</option>
				<option value="content"
					<c:if test="${page.searchType eq 'content'}">selected</c:if>>내용</option>
				<option value="title_content"
					<c:if test="${page.searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
				<option value="writer"
					<c:if test="${page.searchType eq 'writer'}">selected</c:if>>작성자</option>
			</select>
			</div>
			<input onkeyup="if(window.event.keyCode==13){test()}" class="form-control form-control-sm"  style="width:15%; display: inline-block;" type="text" name="keyword" value="${page.keyword}" />
			<button type="submit" onclick="test()" id="searchBtn" class="btn btn-sm btn-primary">검색</button>
		
<!-- 	<script>
	    function test() {
				let searchType = document.getElementsByName("searchType")[0].value;
				let keyword = document.getElementsByName("keyword")[0].value;

				location.href = "/board/listPageSearch?num=1" + "&searchType="
						+ searchType + "&keyword=" + keyword;
	    }
	</script> -->
	<script>
		function test(){
			let searchType = document.getElementsByName("searchType")[0].value;
			let keyword = document.getElementsByName("keyword")[0].value;

			location.href = "/board/listPageSearch?num=1" + "&searchType="
					+ searchType + "&keyword=" + keyword;
		};
	</script>

</body>
</html>