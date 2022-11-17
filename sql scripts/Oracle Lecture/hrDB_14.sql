/* PL/SQL(Procedural language/SQL) */
-- 오라클에서 제공하는 프로그래밍 언어
-- 일반 프로그래밍 언어적인 요소를 다 가지고 있고,
-- 데이터베이스 업무를 처리하기 위한 최적화된 언어

-- 기본구조
-- 선언부(Declare): 모든 변수나 상수를 선언하는 부분
-- 실행부(Executable): begin ~ end / 제어문, 반복문, 함수 정의 등의 로직을 기술하는 부분
-- 예외처리부(Exception): 실행도중에 에러 발생시 해결하기 위한 명령들을 기술하는 부분
-- declare, begin, exception 키워드들은 ;을 붙이지 않는다.
-- 나머지 문장들은 ;으로 처리한다.
-- 익명블록(anonymous PL/SQL Block): 주로 일회성으로 사용할 경우 많이 사용된다.
-- 저장블록(stored PL/SQL Block): 서버에 저장해 놓고 주기적으로 반복해서 사용할 경우 사용된다.

SET SERVEROUTPUT ON;
SET SERVEROUTPUT OFF;

DECLARE
    CNT INTEGER;
BEGIN
    CNT := CNT + 1;
    IF CNT IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('결과: cnt는 null이다');
    END IF;
END;
/
-- 할당 '='이 아니라 ':='이다.


DECLARE
    EMP_NO NUMBER(20);
    EMP_NAME VARCHAR(10);
BEGIN
    SELECT EMPLOYEE_ID, FIRST_NAME INTO EMP_NO, EMP_NAME
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 124;   
    DBMS_OUTPUT.PUT_LINE(EMP_NO || ' ' || EMP_NAME);
END;
/
