<%@page import="utill.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="VO.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    int seq = Integer.parseInt(request.getParameter("seq"));
    Connection conn = DBConnection.getConnection();
    String sql = "select * from board where seq = ?";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setInt(1, seq);
    ResultSet rs = stmt.executeQuery();
    Board board = null;
    if (rs.next()) {
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
    <title>Edit Board</title>
</head>
<body>
    <h2>글 수정</h2>
    <form action="UpdateBoardCtrl" method="post">
    
        <input type="hidden" name="seq" value="<%= board.getSeq() %>"/>
        <label for="title">제목:</label>
        <input type="text" name="title" value="<%= board.getTitle() %>" required/><br/>
        <label for="content">내용:</label>
        <textarea name="content" required><%= board.getContent() %></textarea><br/>
        <input type="submit" value="수정"/>
    </form>
    <form action="DeleteBoardCtrl" method="post">
    	<input type="hidden" name="seq" value="<%=board.getSeq() %>" disabled="disabled" />
    	<input type="submit" value="삭제"/>
    </form>
    <script>
    	function validate() {
    		let seq = document.querySelector('input[name="seq"]').value;
            if(!seq) {
                alert("Invalid board ID");
                return false;
            }
            return true;
    	}
    </script>
</body>
</html>
