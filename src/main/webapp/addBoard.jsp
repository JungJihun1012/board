<%@page import="VO.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2 align="center">등록</h2>
	<form name="form" action="AddBoardCtrl" method="post">
		<table>
			<tr>
				<th>제목</th>
				<td>
					<input name="title" type="text" />
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<input name="content" type="text"/>
				</td>
			</tr>
			<tr>
				<th>등록일자</th>
				<td>
					<input name="regdate" type="datetime-local" />
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="등록"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>