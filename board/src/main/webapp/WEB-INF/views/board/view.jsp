<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 조회</title>
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
	<div id="nav">
		<%@ include file="../include/nav.jsp"%>
	</div>


	<div class="container">
		<div class="col-md-7 col-md-offset-2">
			<div class="page-hearder" style="padding-bottom: 20px;">
				<h1>글 조회</h1>
			</div>
			<div>
				<form class="form-group" method="post">
					<table class="table table-striped row">
						<tr>
							<th class="col-md-2">작성자</th>
							<td><input class="form-control" type="text"
								value="${view.writer}" readonly></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input class="form-control" type="text"
								value="${view.title}" readonly></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea class="form-control" name="content" rows="10"
									cols="" readonly>${view.content}</textarea></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>

	<div style="text-align: center;">
		<a href="/board/modify?bno=${view.bno}"><button class="btn btn-sm btn-primary">게시물 수정</button></a>
		<a href="/board/delete?bno=${view.bno}"><button class="btn btn-sm btn-primary">게시물 삭제</button></a>
	</div>

	<!-- 댓글 시작 -->
	<hr />
	<div class="page-hearder" style="padding-bottom: 20px;">
		<p>REPLY</p>
	</div>
	<c:forEach items="${reply}" var="reply">

		<table style="width: 50%; margin-left: 30px;"
			class="table table-striped row">
			<tr>
				<th class="col-md-2">작성자</th>
				<td><input class="form-control" type="text"
					value="${reply.writer}" readonly></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><input class="form-control" type="text"
					value="${reply.regDate}" readonly></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea class="form-control" name="content" readonly>${reply.content }</textarea></td>
			</tr>
		</table>


	</c:forEach>

	<%-- 	<ul>
		
			<li>
				<div>
					<p>${reply.writer}/<fmt:formatDate value="${reply.regDate}"
							pattern="yyyy-MM-dd" />
					</p>
					<p>${reply.content }</p>
				</div>
			</li>
		
	</ul> --%>


	<div class="card mb-2">
		<div class="card-header bg-light">
			<i class="fa fa-comment fa"></i> REPLY WRITE
		</div>
		<form method="post" action="/reply/write">
			<div class="card-body">
				<ul class="list-group list-group-flush">
					<li class="list-group-item">
						<div class="form-inline mb-2">
							<label for="replyId"><i class="fa fa-user-circle-o fa-2x"></i></label>
							<input type="text" class="form-control ml-2" placeholder="작성자"
								name="writer">
						</div> <textarea style="width: 20%;"class="form-control" name="content" rows="5" cols="50"
							placeholder="내용"></textarea>
						<p>
							<input type="hidden" name="bno" value="${view.bno}">
							<button type="submit" class="btn btn-dark mt-3">댓글 작성</button>
						</p>
					</li>
				</ul>
			</div>
		</form>
	</div>

	<%-- 	<div>

		<form method="post" action="/reply/write">

			<p>
				<label>댓글 작성자</label> <input type="text" name="writer">
			</p>
			<p>
				<textarea rows="5" cols="50" name="content"></textarea>
			</p>
			<p>
				<input type="hidden" name="bno" value="${view.bno}">
				<button type="submit">댓글 작성</button>
			</p>
		</form>

	</div> --%>




</body>
</html>