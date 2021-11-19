<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div id="nav">
		<%@ include file="../include/nav.jsp"%>
	</div>
	<div class="container">
		<div class="col-md-7 col-md-offset-2">
			<div class="page-hearder" style="padding-bottom: 20px;">
				<h1>글 수정</h1>
			</div>
			<div>
				<form class="form-group" method="post">
					<table class="table table-striped row">
						<tr>
							<th class="col-md-2">작성자</th>
							<td><input class="form-control" type="text" name="writer" value="${view.writer}"></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input class="form-control" type="text" name="title"
								value="${view.title}"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea class="form-control" name="content" rows="10"
									cols="">${view.content}</textarea></td>
						</tr>
					</table>
					<button class="btn btn-sm btn-primary" type="submit">완료</button>
				</form>
			</div>
		</div>
	</div>


</body>
</html>