DROP TABLE board;

CREATE TABLE board(
	seq number(5) PRIMARY KEY,
	title varchar2(200) NOT NULL,
	content varchar2(2000) NOT NULL,
	regdate date DEFAULT SYSDATE,
	cnt number(5) DEFAULT 0
);


INSERT INTO board (seq, title, content, regdate)
VALUES (1, '첫 번째 예제 게시물', '게시물 내용', '2024-12-02');

INSERT INTO board(seq, title, content, regdate)
VALUES (2, '두 번째 에제 게시물', '게시물 내용', '2024-11-02');

INSERT INTO board(seq, title, content, regdate)
VALUES (3, '세 번째 에제 게시물', '게시물 내용', '2024-10-12');

INSERT INTO board(seq, title, content, regdate)
VALUES (4, '네 번째 예제 게시물', '게시물 내용', '2024-12-04');

INSERT INTO board(seq, title, content, regdate)
VALUES (5, '다섯 번채 에제 게시물', '게시물 내용', '2024-11-30');

INSERT INTO board(seq, title, content, regdate)
VALUES (6, '여섯 번째 에제 게시물', '게시물 내용', '2024-05-23');

INSERT INTO board(seq, title, content, regdate)
VALUES

SELECT * FROM BOARD;

SELECT * FROM board ORDER BY seq;