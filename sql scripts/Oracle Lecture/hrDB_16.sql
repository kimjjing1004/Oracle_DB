/* rowtype 변수를 활용한 데이터의 변경 */
DECLARE
    C_REC ROW_TEST%ROWTYPE;
BEGIN
    SELECT * INTO C_REC
    FROM ROW_TEST
    WHERE NO = 3;
    
    C_REC.NAME := '강길동';
    
    UPDATE ROW_TEST2
    SET ROW = C_REC
    WHERE NO = 3;
END;
/

SELECT * FROM ROW_TEST2;

/* 사용자로 부터 두개의 숫자를 입력 받아서 합을 구하는 예 */
-- 치환연산자 & 사용
DECLARE
    NO1 NUMBER := &NO1;
    NO2 NUMBER := &NO2;
    VSUM NUMBER;
BEGIN
    VSUM := NO1 + NO2;
    DBMS_OUTPUT.PUT_LINE('첫번째 수: ' || NO1 || ', 두번째 수: ' || NO2 || ', 합: ' || VSUM || '입니다');
END;
/

SET SERVEROUTPUT ON;

/* 복합변수 */
-- record type 변수 지정 방법
-- 1. type 타입명 is record
-- 2. 식별자 타입명

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
    DBMS_OUTPUT.PUT_LINE('사번        이름         업무아이디');
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
    SELECT EMPLOYEE_ID, LAST_NAME, NVL(EMAIL, '없음'), SALARY
    INTO REC2
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = VEMP_ID;
    
    DBMS_OUTPUT.PUT_LINE('사번: ' || REC2.EMP_ID);
    DBMS_OUTPUT.PUT_LINE('이름: ' || REC2.EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('이메일: ' || REC2.EMP_EMAIL);
    DBMS_OUTPUT.PUT_LINE('급여: ' || REC2.EMP_SALARY);
END;
/