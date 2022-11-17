CREATE SEQUENCE SEQ_BOARD;
CREATE TABLE TBL_BOARD(BNO NUMBER(10, 0),
                       TITLE VARCHAR2(200) NOT NULL,
                       CONTENT VARCHAR2(2000) NOT NULL,
                       WRITER VARCHAR2(50) NOT NULL,
                       REGDATE DATE DEFAULT SYSDATE,
                       UPDATEDATE DATE DEFAULT SYSDATE);
                       
ALTER TABLE TBL_BOARD ADD CONSTRAINT PK_BOARD PRIMARY KEY(BNO);

INSERT INTO TBL_BOARD(BNO, TITLE, CONTENT, WRITER)
VALUES(SEQ_BOARD.NEXTVAL, '테스트 제목', '테스트 내용', 'USER00');

COMMIT;

SELECT * FROM TBL_BOARD
WHERE BNO > 0;

SELECT * FROM TBL_BOARD
ORDER BY BNO
DESC;

-- 재쉬 복사를 통해서 데이터의 개수를 늘린다. 반복해서 여러 번 실행
INSERT INTO TBL_BOARD (BNO, TITLE, CONTENT, WRITER)
(SELECT SEQ_BOARD.NEXTVAL, TITLE, CONTENT, WRITER FROM TBL_BOARD);

COMMIT;

SELECT COUNT(*) FROM TBL_BOARD;

SELECT * FROM TBL_BOARD
ORDER BY BNO
DESC;

SELECT
    /*+ INDEX_DESC(TBL_BOARD PK_BOARD) */
    *
FROM TBL_BOARD
WHERE BNO > 0;

SELECT * FROM TBL_BOARD
WHERE BNO = 100;

SELECT * FROM TBL_BOARD
ORDER BY BNO
DESC;

SELECT /*+ INDEX_DESC (TBL_BOARD PK_BOARD) */ *
FROM TBL_BOARD;

SELECT /*+ FULL(tbl_board) */ *
FROM tbl_board
ORDER BY bno
DESC;

SELECT /*+ INDEX_ASC(tbl_board pk_board) */ *
FROM tbl_board
WHERE bno > 0;

SELECT rownum rn, bno, title
FROM tbl_board;

SELECT /*+ FULL(tbl_board) */
rownum rn, bno, title
FROM tbl_board
WHERE bno > 0
ORDER BY bno;

SELECT /*+ INDEX_ASC(tbl_board pk_board) */
rownum rn, bno, title, content
FROM tbl_board;

SELECT /*+ INDEX_ASC(tbl_board pk_board) */
rownum rn, bno, title, content
FROM tbl_board
WHERE bno > 0;

SELECT /*+ INDEX_DESC(tbl_board pk_board) */
rownum rn, bno, title, content
FROM tbl_board
WHERE bno > 0;

SELECT /*+ INDEX_DESC(tbl_board pk_board) */
rownum rn, bno, title, content
FROM tbl_board
WHERE rownum <= 10;

SELECT /*+ INDEX_DESC(tbl_board pk_board) */
rownum rn, bno, title, content
FROM tbl_board
WHERE rownum > 10 and rownum <= 20;

--ROWNUM은 반드시 1이 포함되도록 해야 한다.
SELECT /*+ INDEX_DESC(tbl_board pk_board) */
rownum rn, bno, title, content
FROM tbl_board
WHERE rownum <= 20;

SELECT bno, title, content
FROM (SELECT /*+ INDEX_DESC(tbl_board pk_board) */
      rownum rn, bno, title, content
      FROM tbl_board
      WHERE rownum <= 20)
WHERE rn > 10;

COMMIT;