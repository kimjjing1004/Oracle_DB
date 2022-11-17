/* 변수 */
-- 변수의 생성 규칙
-- 1. 반드시 문자로 시작해야 한다.
-- 2. 문자나 숫자, 특수문자를 포함 할 수 있다.
-- 3. 변수명은 30bytes 이하여야 한다.
-- 4. 예약어(키워드)를 사용하면 안된다.

-- 변수의 선언은 선언부(declare)에서 선언되고, 값으로 초기화가 가능
-- 실행부에서 실행될 경우 값이 할당 된다.
-- 서브프로그램의 파라미터로 전달되기도 하며, 출력 결과를 저장하기도 한다.

/* 변수의 선언ex */
-- EMP_NO NUMBER(6, 3)
-- 숫자를 저장하는 변수로 총 6자리를 의미하며, 소수점 이하 3자리를 의미합니다.

-- EMP_NAME VARCHAR2(5)
-- 문자를 저장하는 변수로 총 byte 길이가 5byte를 저장할 수 있다.

-- EMP_DATE DATE
-- 날짜를 저장하는 변수

/* 변수의 데이터 타입 */
-- char: 고정길이의 문자를 저장, 기본최소값 1, 최대 32,767byte를 저장
-- varchar2: 가변길이의 문자를 저장, 기본값은 없고, 최대 32,767byte를 저장
-- number(전체자리수, 소수점이하 자리수)
-- 전체자리수와 소수점이하 자리 수를 가진 숫자를 저장
-- 전체자리수 범위는 1 ~ 38까지 가능하고,
-- 소수점 자리수의 범위는 -84 ~ 127까지 가능
-- binary_double: 부동 소수점 수를 저장, 9byte가 필요함
-- date: 날짜 및 시간을 저장, 초 단위로 저장, 날짜의 범위는 4712 B.C ~ 9999 A.D
-- timestamp
-- date 타입을 확장하여 연도, 월, 일, 시, 분, 초, 소수로 표시되는 초 단위를 저장
-- 자리수를 표현 할때는 0 ~ 9범위의 정수를 사용, 기본값은 6

/* 참조변수 */
--        테이블명.필드명%TYPE
-- EMP_NO EMPLOYEES.EMPLOYEE_ID%TYPE
-- employees테이블의 employee_id와 동일한 데이터 타입으로 선언하겠다는 의미
-- EMPLOYEES.EMPLOYEE_ID%TYPE: emp_no의 변수 타입이 된다.
-- %TYPE: employees.employee_id의 필드타입을 그대로 가져온다는 의미

-- EMP_NAME EMPLOYEES.FIRST_NAME%TYPE
-- employees테이블의 first_name과 동일한 데이터 타입으로 선언하겠다는 의미

-- EMP_ROW EMPLOYEES%ROWTYPE
-- employees테이블의 모든 column을 한꺼번에 저장하기위한 변수로 선언한다는 의미

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
VALUES(1, '아무개', SYSDATE);

INSERT INTO ROW_TEST
VALUES(2, '홍길동', SYSDATE);

INSERT INTO ROW_TEST
VALUES(3, '고길동', SYSDATE);

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