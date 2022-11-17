CREATE SEQUENCE SEQ_BOARD;
CREATE TABLE TBL_BOARD(BNO NUMBER(10, 0),
                       TITLE VARCHAR2(200) NOT NULL,
                       CONTENT VARCHAR2(2000) NOT NULL,
                       WRITER VARCHAR2(50) NOT NULL,
                       REGDATE DATE DEFAULT SYSDATE,
                       UPDATEDATE DATE DEFAULT SYSDATE);
                       
ALTER TABLE TBL_BOARD ADD CONSTRAINT PK_BOARD PRIMARY KEY(BNO);

INSERT INTO TBL_BOARD(BNO, TITLE, CONTENT, WRITER)
VALUES(SEQ_BOARD.NEXTVAL, '�׽�Ʈ ����', '�׽�Ʈ ����', 'USER00');

COMMIT;

SELECT * FROM TBL_BOARD
WHERE BNO > 0;

SELECT * FROM TBL_BOARD
ORDER BY BNO
DESC;

-- �罬 ���縦 ���ؼ� �������� ������ �ø���. �ݺ��ؼ� ���� �� ����
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

--ROWNUM�� �ݵ�� 1�� ���Եǵ��� �ؾ� �Ѵ�.
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