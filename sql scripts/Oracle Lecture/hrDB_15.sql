/* ���� */
-- ������ ���� ��Ģ
-- 1. �ݵ�� ���ڷ� �����ؾ� �Ѵ�.
-- 2. ���ڳ� ����, Ư�����ڸ� ���� �� �� �ִ�.
-- 3. �������� 30bytes ���Ͽ��� �Ѵ�.
-- 4. �����(Ű����)�� ����ϸ� �ȵȴ�.

-- ������ ������ �����(declare)���� ����ǰ�, ������ �ʱ�ȭ�� ����
-- ����ο��� ����� ��� ���� �Ҵ� �ȴ�.
-- �������α׷��� �Ķ���ͷ� ���޵Ǳ⵵ �ϸ�, ��� ����� �����ϱ⵵ �Ѵ�.

/* ������ ����ex */
-- EMP_NO NUMBER(6, 3)
-- ���ڸ� �����ϴ� ������ �� 6�ڸ��� �ǹ��ϸ�, �Ҽ��� ���� 3�ڸ��� �ǹ��մϴ�.

-- EMP_NAME VARCHAR2(5)
-- ���ڸ� �����ϴ� ������ �� byte ���̰� 5byte�� ������ �� �ִ�.

-- EMP_DATE DATE
-- ��¥�� �����ϴ� ����

/* ������ ������ Ÿ�� */
-- char: ���������� ���ڸ� ����, �⺻�ּҰ� 1, �ִ� 32,767byte�� ����
-- varchar2: ���������� ���ڸ� ����, �⺻���� ����, �ִ� 32,767byte�� ����
-- number(��ü�ڸ���, �Ҽ������� �ڸ���)
-- ��ü�ڸ����� �Ҽ������� �ڸ� ���� ���� ���ڸ� ����
-- ��ü�ڸ��� ������ 1 ~ 38���� �����ϰ�,
-- �Ҽ��� �ڸ����� ������ -84 ~ 127���� ����
-- binary_double: �ε� �Ҽ��� ���� ����, 9byte�� �ʿ���
-- date: ��¥ �� �ð��� ����, �� ������ ����, ��¥�� ������ 4712 B.C ~ 9999 A.D
-- timestamp
-- date Ÿ���� Ȯ���Ͽ� ����, ��, ��, ��, ��, ��, �Ҽ��� ǥ�õǴ� �� ������ ����
-- �ڸ����� ǥ�� �Ҷ��� 0 ~ 9������ ������ ���, �⺻���� 6

/* �������� */
--        ���̺��.�ʵ��%TYPE
-- EMP_NO EMPLOYEES.EMPLOYEE_ID%TYPE
-- employees���̺��� employee_id�� ������ ������ Ÿ������ �����ϰڴٴ� �ǹ�
-- EMPLOYEES.EMPLOYEE_ID%TYPE: emp_no�� ���� Ÿ���� �ȴ�.
-- %TYPE: employees.employee_id�� �ʵ�Ÿ���� �״�� �����´ٴ� �ǹ�

-- EMP_NAME EMPLOYEES.FIRST_NAME%TYPE
-- employees���̺��� first_name�� ������ ������ Ÿ������ �����ϰڴٴ� �ǹ�

-- EMP_ROW EMPLOYEES%ROWTYPE
-- employees���̺��� ��� column�� �Ѳ����� �����ϱ����� ������ �����Ѵٴ� �ǹ�

CREATE TABLE EMPLOYEES2 AS
SELECT EMPLOYEE_ID, SALARY, DEPARTMENT_ID
FROM EMPLOYEES;

SELECT * FROM EMPLOYEES2;

SET SERVEROUTPUT ON;

DECLARE
    EMP_NO EMPLOYEES2.EMPLOYEE_ID%TYPE;
    EMP_SALARY EMPLOYEES2.SALARY%TYPE;
BEGIN
    SELECT EMPLOYEE_ID, SALARY
    INTO EMP_NO, EMP_SALARY
    FROM EMPLOYEES2
    WHERE DEPARTMENT_ID = 10;
    DBMS_OUTPUT.PUT_LINE(EMP_NO || ' ' || EMP_SALARY);
END;
/


DECLARE
    EMP_ROW EMPLOYEES2%ROWTYPE;
BEGIN
    SELECT * INTO EMP_ROW
    FROM EMPLOYEES2
    WHERE EMPLOYEE_ID = 100;
    DBMS_OUTPUT.PUT_LINE(EMP_ROW.EMPLOYEE_ID || ' ' || EMP_ROW.SALARY || ' ' || EMP_ROW.DEPARTMENT_ID);
END;
/


CREATE TABLE ROW_TEST(NO NUMBER,
                      NAME VARCHAR2(20),
                      HDATE DATE);
                      
CREATE TABLE ROW_TEST2 AS SELECT * FROM ROW_TEST;

INSERT INTO ROW_TEST
VALUES(1, '�ƹ���', SYSDATE);

INSERT INTO ROW_TEST
VALUES(2, 'ȫ�浿', SYSDATE);

INSERT INTO ROW_TEST
VALUES(3, '��浿', SYSDATE);

SELECT * FROM ROW_TEST;

COMMIT;

DECLARE
    C_REC ROW_TEST%ROWTYPE;
BEGIN
    SELECT * INTO C_REC
    FROM ROW_TEST
    WHERE NO = 3;
    
    INSERT INTO ROW_TEST2
    VALUES C_REC;
END;
/

SELECT * FROM ROW_TEST2;