<%@page import="java.util.List"%>
<%@page import="VO.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post">
		<table class="table" style="width: 800px">
			<tr>
				<td align="right">
					<select name="searchCondition">
						<option value="TITLE">제목</option>
						<option value="CONTENT">내용</option>
					</select>
					<input name="searchKeyword" type="text"/>
					<input type="submit" value="검색"/>
				</td>
			</tr>
		</table>
	</form>
	<table class="table" style="width:800px">
		<tr>
			<th width="100">번호</th>
			<th width="200">제목</th>
			<th width="150">작성자</th>
			<th width="150">등록일</th>
			<th width="100">조회수</th>
		</tr>
		<%
			for(int i = 0; i < list.size(); i++) {
				Board bo = list.get(i);
		%>
		<tr>
			<td><a href="index.jsp?seq=<%=bo.getSeq()%>"><%=bo.getSeq() %></a></td>
			<td><%=bo.getTitle()%></td>
			<td><%=bo.getContent()%></td>
			<td><%=bo.getCnt()%></td>
		</tr>
		<% } %>
	</table>
</body>
</html>