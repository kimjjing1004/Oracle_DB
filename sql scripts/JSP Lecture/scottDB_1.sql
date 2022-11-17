CREATE TABLE MEMBER_TEST(ID VARCHAR2(20),
                         PW VARCHAR2(20),
                         NAME VARCHAR2(20),
                         PHONE VARCHAR2(20));
                         
INSERT INTO MEMBER_TEST(ID, PW, NAME, PHONE)
VALUES('abc', '123', '全辨悼', '010-1234-5678');

INSERT INTO MEMBER_TEST(ID, PW, NAME, PHONE)
VALUES('def', '456', '全辨鉴', '010-9012-3456');

INSERT INTO MEMBER_TEST(ID, PW, NAME, PHONE)
VALUES('ghi', '789', '全辨磊', '010-7890-1234');

INSERT INTO MEMBER_TEST(ID, PW, NAME, PHONE)
VALUES('jkl', '234', '全辨格', '010-5678-9012');

commit;