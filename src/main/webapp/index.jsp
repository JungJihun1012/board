<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice Board</title>
<style>
	* {
		margin: 0;
		padding: 0;
		list-style: none;
		box-sizing: border-box;
		text-decoration: none;
		color: inherit;
	}
	.container > a {
		background-color: rgb(236, 234, 234);
		padding: 10px 15px;
		border-radius: 6px;
	}
	.content {
		display: flex;
		flex-direction: column;
		background-color: lightgray;
		align-items: center;
		justify-content: center;
		width: 100vw;
		height: 100vh;
	}
	.gesi {
		padding: 4em 3em 4em 3em;
		line-height: 7rem;
		background-color: #fff;
		border-radius: 5px;
	}
	.gesi > h2 {
		text-align: center;
	}
</style>
</head>
<body>
	<div class="content">
		<div class="gesi">
			<h2>Board</h2>
			<div class="container">
				<a href="getBoardList.jsp">글 목록 보기</a>
				<a href="addBoard.jsp">글 등록하러 가기</a>
			</div>
		</div>
	</div>
</body>
</html>
