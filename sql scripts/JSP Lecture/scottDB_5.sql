CREATE TABLE MVC_BOARD(BID NUMBER(4) PRIMARY KEY,
                       BNAME VARCHAR2(20),
                       BTITLE VARCHAR2(100),
                       BCONTENT VARCHAR2(300),
                       BDATE DATE DEFAULT SYSDATE,
                       BHIT NUMBER(4) DEFAULT 0,
                       BGROUP NUMBER(4),
                       BSTEP NUMBER(4),
                       BINDENT NUMBER(4));
                       
CREATE SEQUENCE MVC_BOARD_SEQ;

INSERT INTO MVC_BOARD(BID, BNAME, BTITLE, BCONTENT, BHIT, BGROUP, BSTEP, BINDENT)
VALUES(MVC_BOARD_SEQ.NEXTVAL, 'abcd', 'is title', 'is content', 0, MVC_BOARD_SEQ.CURRVAL, 0, 0);

COMMIT;