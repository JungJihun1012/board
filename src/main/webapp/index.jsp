<%@page import="VO.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.naming.directory.SearchControls"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
    	System.out.println(list);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./style/index.css"/>
<title>Notice Board</title>
</head>
<body>
	<h2>게시판</h2>
	<div class="content">
		<input type="button" class="addBtn" value="글 등록하러 가기!"/>	
	</div>
	<div class="article">
		<form method="post">
		<% 
			if(list != null) {
				for(Board bo : list) {
		%>
		
			<input name="seq" type="hidden" value="<%=bo.getSeq() %>"/>
			<ul>
				<li>제목</li>
				<input name="title" type="text" values="<%=bo.getTitle()%>"/>
				<li>내용</li>
				<textarea name="content" cols="40" rows="10"><%=bo.getContent()%></textarea>
				<li>등록일</li>
				<span><%=bo.getRegdate()%></span>
				<li>조회수</li>
				<span><%=bo.getCnt()%></span>
			</ul>
			<% }} %>
		</form>
	</div>
</body>
</html>