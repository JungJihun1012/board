<%@page import="VO.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 등록</title>
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
        }
        form {
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 600px;
            margin: 0 auto;
        }
        table {
            width: 100%;
            margin: 20px 0;
        }
        th {
            text-align: left;
            padding: 10px;
            color: #555;
        }
        td {
            padding: 10px;
        }
        input[type="text"],
        input[type="datetime-local"] {
            width: calc(100% - 20px);
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #5cb85c;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #4cae4c;
        }
    </style>
</head>
<body>
    <h2>등록</h2>
    <form name="form" action="AddBoardCtrl" method="post">
        <table>
            <tr>
                <th>제목</th>
                <td>
                    <input name="title" type="text" required />
                </td>
            </tr>
            <tr>
                <th>내용</th>
                <td>
                    <input name="content" type="text" required />
                </td>
            </tr>
            <tr>
                <th>등록일자</th>
                <td>
                    <input name="regdate" type="datetime-local" required />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <input type="submit" value="등록" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
