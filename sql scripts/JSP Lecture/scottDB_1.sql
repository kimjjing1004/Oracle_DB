CREATE TABLE MEMBER_TEST(ID VARCHAR2(20),
                         PW VARCHAR2(20),
                         NAME VARCHAR2(20),
                         PHONE VARCHAR2(20));
                         
INSERT INTO MEMBER_TEST(ID, PW, NAME, PHONE)
VALUES('abc', '123', 'ȫ�浿', '010-1234-5678');

INSERT INTO MEMBER_TEST(ID, PW, NAME, PHONE)
VALUES('def', '456', 'ȫ���', '010-9012-3456');

INSERT INTO MEMBER_TEST(ID, PW, NAME, PHONE)
VALUES('ghi', '789', 'ȫ����', '010-7890-1234');

INSERT INTO MEMBER_TEST(ID, PW, NAME, PHONE)
VALUES('jkl', '234', 'ȫ���', '010-5678-9012');

commit;