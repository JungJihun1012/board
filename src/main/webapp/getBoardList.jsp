<%@page import="utill.DBConnection"%>
<%@page import="java.util.List"%>
<%@page import="VO.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String searchCondition = request.getParameter("searchCondition");
	String searchKeyword = request.getParameter("searchKeyword");
	
	if(searchCondition == null) 
		searchCondition = "TITLE";
	
	Connection conn = DBConnection.getConnection();
	
	String sql = "select * from board ";
	if(searchCondition.equals("TITLE"))
		sql += "where title like '%'||?||'%'";
	else
		sql += "where content like '%'||?||'%'";
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	stmt.setString(1, searchKeyword);
	ResultSet rs = stmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	* {
		margin: 0;
		padding: 0;
		list-style: none;
		color: inherit;
		text-decoration: none;
		box-sizing: border-box;
	}
	.table {
		width: 1200px;
	}
	.select {
		width: 100px;
		outline: none;
		cursor: pointer;
		background-color:rgb(251, 204, 147);
		padding: 9px 20px;
		border-radius: 5px;
		border: none;
	}
	.text {
		border: none;
		border-bottom: 1px solid black;
		padding: 10px 15px;
		outline: none;
		background: transparent;
	}
	body {
		display: flex;
		justify-content: center;
		flex-direction: column;
		align-items: center;
		width: 100vw;
		height: 100vh;
		background-color: bisque;
	}
	form > .table {
		margin-bottom: 4em;
	}
	.submit {
		padding: 9px 20px;
		background-color: rgb(255, 221, 180);
		border: none;
		border-radius: 5px;
		cursor: pointer;	
	}
	.tableSecond {
		text-align: center;
		line-height: 1.5rem;
	}
	.select > option {
		cursor: pointer;
	}
</style>
</head>
<body>
	<form method="post">
		<table class="table">
			<tr>
				<td align="right">
					<select name="searchCondition" class="select">
						<option value="TITLE">제목</option>
						<option value="CONTENT">내용</option>
					</select>
					<input name="searchKeyword" type="text" class="text"/>
					<input type="submit" value="검색" class="submit"/>
				</td>
			</tr>
		</table>
	</form>
	<table class="tableSecond">
		<tr>
			<th width="100">번호</th>
			<th width="200">제목</th>
			<th width="150">내용</th>
			<th width="150">등록일</th>
			<th width="100">조회수</th>
		</tr>
		<%
			while(rs.next()) {
		%>
		<tr>
			<td><a href="index.jsp?seq=<%=rs.getInt("seq")%>"><%=rs.getInt("seq")%></a></td>
    		<td><a href="editBoard.jsp?seq=<%=rs.getInt("seq")%>"><%=rs.getString("title")%></a></td>
    		<td><%=rs.getString("content")%></td>
    		<td><%=rs.getDate("regdate") %></td>
    		<td><%=rs.getInt("cnt")%></td>
		</tr>
		<% } %>
	</table>
</body>
</html>