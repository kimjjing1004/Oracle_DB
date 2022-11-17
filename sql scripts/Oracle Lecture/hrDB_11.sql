/* view */

-- view는 table과 유사하며, 테이블 처럼 사용한다.
-- 테이블과는 달리 데이터를 저장하기 위한
-- 물리적인 공간이 필요하지 않은 가상 테이블이다.
-- 데이터를 물리적으로 갖지 않지만 논리적인 집합을 갖는다.
-- 테이블과 마찬가지로 SELECT, INSERT, UPDATE, DELETE 명령이 가능하다.

-- 보안관리를 위한 뷰
/* 보안등급에 맞추어 컬럼 및 범위를 정하여 조회 하도록 함
   연산결과만 제공하고 알고리즘을 숨기기 위해 사용
   SELECT LIST를 함수로 가공하여 UPDATE, INSERT를 못하도록 함
   테이블 명이나 컬럼 명을 숨기도록 함 */

-- 사용 편의성을 위한 뷰
/* 검색조건을 단순화하여 사용할 수 있도록 함.
   조인을 단순화
   사용자를 위한 컬럼명이나 테이블명 제공 */
   
CREATE VIEW V_EMP(EMP_ID, FIRST_NAME, JOB_ID, HIREDATE, DEPT_ID) AS
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, HIRE_DATE, DEPARTMENT_ID
FROM EMPLOYEES
WHERE JOB_ID = 'ST_CLERK';

CREATE VIEW V_EMP2(EMP_ID, FIRST_NAME, JOB_ID, HIREDATE, DEPT_ID) AS
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, HIRE_DATE, DEPARTMENT_ID
FROM EMPLOYEES
WHERE JOB_ID = 'SH_CLERK';

SELECT * FROM V_EMP;
DROP VIEW V_EMP2;

/* view에서의 create or alter기능: create or replace view */
CREATE OR REPLACE VIEW V_EMP(EMP_ID, FIRST_NAME, JOB_ID, HIREDATE, DEPT_ID) AS
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, HIRE_DATE, DEPARTMENT_ID
FROM EMPLOYEES
WHERE JOB_ID = 'ST_CLERK';

/* nvl(column, value): column이 null이면 value출력 */
/* nvl2(column, value, value2) column이 null이면 value출력 아니면 value2출력 */
CREATE OR REPLACE VIEW V_EMP3(EMP_ID, FIRST_NAME, JOB_ID, HIREDATE, DEPT_ID) AS
SELECT NVL(EMPLOYEE_ID, NULL), NVL(FIRST_NAME, NULL), JOB_ID, HIRE_DATE, DEPARTMENT_ID
FROM EMPLOYEES
WHERE JOB_ID = 'SH_CLERK';

DESC V_EMP3;

UPDATE V_EMP3 SET FIRST_NAME = 'Kim'
WHERE FIRST_NAME = 'Julia';

UPDATE V_EMP SET FIRST_NAME = 'Kim'
WHERE FIRST_NAME = 'Julia';

CREATE VIEW V_EMP_SALARY(EMP_ID, LAST_NAME, ANNUAL_SAL) AS
SELECT EMPLOYEE_ID, LAST_NAME, (SALARY + NVL(COMMISSION_PCT, 0)) * 12
FROM EMPLOYEES;

SELECT * FROM V_EMP_SALARY;

/* read only: 테이블 내 값 수정 불가능 */
CREATE VIEW V_EMP_READONLY(EMP_ID, LAST_NAME, ANNUAL_SAL) AS
SELECT EMPLOYEE_ID, LAST_NAME, (SALARY + NVL(COMMISSION_PCT, 0)) * 12
FROM EMPLOYEES
WITH READ ONLY;

DESC V_EMP_READONLY;

SELECT * FROM V_EMP_READONLY;

UPDATE V_EMP_READONLY SET LAST_NAME = 'Kim'
WHERE LAST_NAME = 'Grant';

CREATE OR REPLACE VIEW V_SAMPLE AS
SELECT EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID, HIRE_DATE
FROM EMPLOYEES
WHERE (SALARY + NVL(COMMISSION_PCT, 0)) * 12 > 40000
AND DEPARTMENT_ID = 50
AND JOB_ID = 'ST_CLERK'
AND SYSDATE - 365 * 5 > HIRE_DATE;

SELECT * FROM V_SAMPLE;


/* column1||' '||column2: column1 column2으로 합쳐서 출력 */
CREATE VIEW 사원(사번, 이름, 부서번호, 입사일) AS
SELECT EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME, DEPARTMENT_ID, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50;

SELECT * FROM 사원;

/* view에서는 join도 가능함 */
CREATE VIEW V_JOIN(사번, 이름, 부서번호, 부서명, 입사이) AS
SELECT EMP.EMPLOYEE_ID, EMP.FIRST_NAME||' '||EMP.LAST_NAME, EMP.DEPARTMENT_ID, DEPT.DEPARTMENT_NAME, EMP.HIRE_DATE
FROM EMPLOYEES EMP, DEPARTMENTS DEPT
WHERE EMP.DEPARTMENT_ID = DEPT.DEPARTMENT_ID;

SELECT * FROM V_JOIN;