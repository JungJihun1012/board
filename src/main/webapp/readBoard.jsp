<%@page import="VO.Board"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="utill.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    int seq = Integer.parseInt(request.getParameter("seq"));
    Connection conn = DBConnection.getConnection();
    String sql = "select * from board where seq = ?";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setInt(1, seq);
    ResultSet rs = stmt.executeQuery();
    Board board = null;
    if(rs.next()) {
        board = new Board();
        board.setSeq(rs.getInt("seq"));
        board.setTitle(rs.getString("title"));
        board.setContent(rs.getString("content"));
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 보기</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 600px;
            margin: 0 auto;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        label {
            display: block;
            margin: 10px 0 5px;
            color: #555;
        }
        .title, .content {
            width: calc(100% - 20px);
            padding: 10px;
            border-bottom: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            background-color: #f9f9f9;
            color: #333;
            cursor: not-allowed; /* Readonly input style */
        }
        a {
            display: inline-block;
            margin-top: 20px;
            text-align: center;
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border-radius: 4px;
            text-decoration: none;
            transition: background-color 0.3s;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>게시물</h2>
        <input type="hidden" name="seq" value="<%=board.getSeq()%>"/>
        <label for="title">제목:</label>
        <div class="title" name="title"><%=board.getTitle() %></div>
        <label for="content">내용:</label>
        <div class="content" name="content"><%=board.getContent()%></div>
        <a href="editBoard.jsp?seq=<%=rs.getInt("seq")%>">수정하기</a>
        <a href="getBoardList.jsp">목록으로</a>
    </div>
</body>
</html>
