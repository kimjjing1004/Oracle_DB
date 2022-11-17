CREATE TABLE tbl_reply (
    rno NUMBER(10, 0),
    bno NUMBER(10, 0) NOT NULL,
    reply VARCHAR2(1000) NOT NULL,
    replyer VARCHAR2(50) NOT NULL,
    replyDate DATE DEFAULT SYSDATE,
    updateDate DATE DEFAULT SYSDATE
);

CREATE SEQUENCE seq_reply;

ALTER TABLE tbl_reply ADD CONSTRAINT pk_reply PRIMARY KEY (rno);

ALTER TABLE tbl_reply ADD CONSTRAINT fk_reply_board FOREIGN KEY (bno) REFERENCES tbl_board (bno);

SELECT * FROM tbl_board
WHERE ROWNUM < 10
ORDER BY bno
DESC;

SELECT * FROM tbl_reply
ORDER BY rno
DESC;

CREATE INDEX idx_reply on tbl_reply (bno desc, rno asc);

SELECT /*+INDEX(tbl_reply idx_reply) */
    ROWNUM rn, bno, rno, reply, replyer, replyDate, updatedate
    FROM tbl_reply
    WHERE bno = 3145745 --(게시물 번호)
    AND rno > 0;

SELECT rno, bno, reply, replyer, replydate, updatedate
FROM (
        SELECT /*+INDEX(tbl_reply idx_reply) */
            ROWNUM rn, bno, rno, reply, replyer, replyDate, updatedate
        FROM tbl_reply
        WHERE bno = 442307
              AND rno > 0
              AND rownum <= 20
    )
WHERE rn > 10;

COMMIT;