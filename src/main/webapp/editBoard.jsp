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
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }
        input[type="submit"] {
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .edit-button {
            background-color: #5cb85c;
        }
        .edit-button:hover {
            background-color: #4cae4c;
        }
        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
            position: relative;
        }
        .delete-button {
            background-color: #d9534f;
            position: absolute;
            right: 0;
            top: -61.5px;
        }
        .delete-button:hover {
            background-color: #c9302c;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>글 수정</h2>
        <form action="UpdateBoardCtrl" method="post">
            <input type="hidden" name="seq" value="<%= board.getSeq() %>"/>
            <label for="title">제목:</label>
            <input type="text" name="title" value="<%= board.getTitle() %>" required/>
            <label for="content">내용:</label>
            <textarea name="content" required><%= board.getContent() %></textarea>
		    <input type="submit" value="수정" class="edit-button"/>
        </form>
         <div class="button-container">
		    <form action="DeleteBoardCtrl" method="post" style="display:inline;">
	        <input type="hidden" name="seq" value="<%=board.getSeq() %>" />
	        <input type="submit" value="삭제" class="delete-button"/>
		    </form>
		</div>

    </div>
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
