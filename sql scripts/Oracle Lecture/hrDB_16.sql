/* rowtype ������ Ȱ���� �������� ���� */
DECLARE
    C_REC ROW_TEST%ROWTYPE;
BEGIN
    SELECT * INTO C_REC
    FROM ROW_TEST
    WHERE NO = 3;
    
    C_REC.NAME := '���浿';
    
    UPDATE ROW_TEST2
    SET ROW = C_REC
    WHERE NO = 3;
END;
/

SELECT * FROM ROW_TEST2;

/* ����ڷ� ���� �ΰ��� ���ڸ� �Է� �޾Ƽ� ���� ���ϴ� �� */
-- ġȯ������ & ���
DECLARE
    NO1 NUMBER := &NO1;
    NO2 NUMBER := &NO2;
    VSUM NUMBER;
BEGIN
    VSUM := NO1 + NO2;
    DBMS_OUTPUT.PUT_LINE('ù��° ��: ' || NO1 || ', �ι�° ��: ' || NO2 || ', ��: ' || VSUM || '�Դϴ�');
END;
/

SET SERVEROUTPUT ON;

/* ���պ��� */
-- record type ���� ���� ���
-- 1. type Ÿ�Ը� is record
-- 2. �ĺ��� Ÿ�Ը�

DECLARE
    TYPE EMP_REC IS RECORD(EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE,
                           EMP_NAME EMPLOYEES.FIRST_NAME%TYPE,
                           EMP_JOB EMPLOYEES.JOB_ID%TYPE);
     
    REC1 EMP_REC;
BEGIN
    SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
    INTO REC1
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID = 10;
    DBMS_OUTPUT.PUT_LINE('���        �̸�         �������̵�');
    DBMS_OUTPUT.PUT_LINE(REC1.EMP_ID || ' ' || REC1.EMP_NAME || ' ' ||
                         REC1.EMP_JOB);
END;
/

DECLARE
    TYPE EMP_REC2 IS RECORD(EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE,
                            EMP_NAME EMPLOYEES.LAST_NAME%TYPE,
                            EMP_EMAIL EMPLOYEES.EMAIL%TYPE,
                            EMP_SALARY EMPLOYEES.SALARY%TYPE);
                            
    REC2 EMP_REC2;
    
    VEMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE := '&EMPID';
BEGIN
    SELECT EMPLOYEE_ID, LAST_NAME, NVL(EMAIL, '����'), SALARY
    INTO REC2
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = VEMP_ID;
    
    DBMS_OUTPUT.PUT_LINE('���: ' || REC2.EMP_ID);
    DBMS_OUTPUT.PUT_LINE('�̸�: ' || REC2.EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('�̸���: ' || REC2.EMP_EMAIL);
    DBMS_OUTPUT.PUT_LINE('�޿�: ' || REC2.EMP_SALARY);
END;
/