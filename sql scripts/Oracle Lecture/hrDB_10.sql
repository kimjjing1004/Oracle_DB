/* �÷��Ӽ�(���Ἲ ��������) */

-- not null: �ΰ��� �Էµ��� ���ϰ��ϴ� ����
-- unique: �ߺ��� ���� �Էµ��� ���ϰ� �ϴ� ����
-- primary key(�⺻Ű): not null + unique�� �ǹ�
-- foreign key(�ܷ�Ű): �ٸ� ���̺��� �ʵ�(�÷�)�� �����ؼ� ���Ἲ�� �˻�
-- check: �־��� ���� ����ϴ� ����

/* not null */
CREATE TABLE NULL_TEST(COL1 VARCHAR2(20) NOT NULL,
                       COL2 VARCHAR2(20) NULL,
                       COL3 VARCHAR2(20));
                       
INSERT INTO NULL_TEST(COL1, COL2)
VALUES('aa', 'bb');

SELECT * FROM NULL_TEST;

INSERT INTO NULL_TEST(COL2, COL3)
VALUES('cc', 'dd');
-- col1�� ���Ἲ �������� �� �ϳ��� not null �÷��Ӽ� ������ ���� ������
-- ���� �Է� ���ϸ� �ڵ����� null���� ������ �ϱ� ������ ���� �߻�!


/* unique */
CREATE TABLE UNIQUE_TEST(COL1 VARCHAR2(20) UNIQUE NOT NULL,
                         COL2 VARCHAR2(20) UNIQUE,
                         COL3 VARCHAR2(20) NOT NULL,
                         COL4 VARCHAR2(20) NOT NULL,
                         CONSTRAINTS TEMP_UNIQUE
                         UNIQUE(COL3, COL4));
-- constraints �����̸� ����(�÷�1, �÷�2, ...)
-- ()�� ��� ���������� �ְ� �׿� ���� ����� ���Ƿ� �̸��� ���Ѵ�
-- col3, col4 �Ѵ� �ߺ��� ���������, null���� ������� �ʴ´�
-- ������, col3, col4�� ���������� unique ������ �����Ͽ� �ߺ��� ������� �ʴ´�

INSERT INTO UNIQUE_TEST(COL1, COL2, COL3, COL4)
VALUES('aa', 'bb', 'cc', 'dd');

INSERT INTO UNIQUE_TEST(COL1, COL2, COL3, COL4)
VALUES('a2', 'b2', 'c2', 'd2');

SELECT * FROM UNIQUE_TEST;

UPDATE UNIQUE_TEST
SET COL1 = 'aa'
WHERE COL2 = 'b2';
-- col1�� �÷� �Ӽ��� unique�� �ߺ��� ���� �Ұ��� �÷��̶� ����!

INSERT INTO UNIQUE_TEST(COL1, COL2, COL3, COL4)
VALUES('a3', '', 'c3', 'd3');
-- col2�� �÷� �Ӽ��� unique�� null���� ����� �Ǳ� ������ ������ �����

INSERT INTO UNIQUE_TEST(COL1, COL2, COL3, COL4)
VALUES('a4', '', 'c4', 'd4');
-- unique���� null���� �񱳴�󿡼� ���ܵǱ� ������ null���� �� ���͵� �����


/* �⺻Ű(primary key): ���̺� ������ �⺻Ű ����*/
/* �ζ��� ��� */
CREATE TABLE PRIMARY_TEST(STUDENT_ID NUMBER(10) PRIMARY KEY,
                          NAME VARCHAR2(20));
-- �ζ��� ����� primary key�� �̸��� ���µ� SYS�� ���� ���·� �ڵ� ������ 

/* �ƿ����� ��� */         
CREATE TABLE PRIMARY_TEST(STUDENT_ID NUMBER(10),
                          NAME VARCHAR2(20),
                          CONSTRAINTS STUDENT_PK
                          PRIMARY KEY(STUDENT_ID));
-- �ƿ����� ����� primary key�� ���� �����Ͽ� ���

CREATE TABLE PRIMARY_TEST(STUDENT_ID NUMBER(10),
                          NAME VARCHAR2(20));
                          
/* ���̺��� �����ϰ� ���� ���Ŀ� �⺻Ű�� �����ϴ� ��� */
ALTER TABLE PRIMARY_TEST
ADD CONSTRAINTS STUDENT_PK PRIMARY KEY(STUDENT_ID);


/* �ܷ�Ű(foreign key) */
/* �ζ��� ��� */
CREATE TABLE FOREIGN_KEY(DEPARTMENT_ID CONSTRAINTS DEPT_FK
                         REFERENCES DEPARTMENTS(DEPARTMENT_ID));
-- �θ� ���̺��� departments�� department_id�÷��� �����Ͽ�
-- ���� �����ϴ� �ڽ� ���̺��� foreign_key�� department_id�÷���
-- dept_fk�� �ܷ�Ű �̸��� �����Ͽ� �θ� ���̺��� �����ϴ� �ܷ�Ű ������ ����

/* �ƿ����� ��� */
CREATE TABLE FOREIGN_KEY(DEPARTMENT_ID,
                         CONSTRAINTS DEPT_FK
                         FOREIGN KEY(DEPARTMENT_ID)
                         REFERENCES DEPARTMENTS(DEPARTMENT_ID));
                         
/* ���̺��� �����ϰ� ���� ���Ŀ� �ܷ�Ű�� �����ϴ� ��� */
ALTER TABLE FOREIGN_KEY
ADD CONSTRAINTS DEPT_FK FOREIGN KEY(DEPARTMENT_ID)
REFERENCES DEPARTMENTS(DEPARTMENT_ID);


/* check */
CREATE TABLE CHECK_TEST(GENDER VARCHAR2(10) NOT NULL
                        CONSTRAINTS CHECK_SEX CHECK(GENDER IN('M', 'F'));

CREATE TABLE CHECK_TEST(GENDER VARCHAR2(10) NOT NULL
                        CONSTRAINTS CHECK_SEX CHECK(GENDER IN('����', '����'));
                        
INSERT INTO CHECK_TEST VALUES('����');
-- check_test���̺� '����'���� ���ö� check���ǿ� ����
-- gender�÷��� �ִ� ���� �� '����' or '����'�̶�� ���� �ޱ� ������ ����!