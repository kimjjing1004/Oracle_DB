/* view */

-- view�� table�� �����ϸ�, ���̺� ó�� ����Ѵ�.
-- ���̺����� �޸� �����͸� �����ϱ� ����
-- �������� ������ �ʿ����� ���� ���� ���̺��̴�.
-- �����͸� ���������� ���� ������ �������� ������ ���´�.
-- ���̺��� ���������� SELECT, INSERT, UPDATE, DELETE ������ �����ϴ�.

-- ���Ȱ����� ���� ��
/* ���ȵ�޿� ���߾� �÷� �� ������ ���Ͽ� ��ȸ �ϵ��� ��
   �������� �����ϰ� �˰������� ����� ���� ���
   SELECT LIST�� �Լ��� �����Ͽ� UPDATE, INSERT�� ���ϵ��� ��
   ���̺� ���̳� �÷� ���� ���⵵�� �� */

-- ��� ���Ǽ��� ���� ��
/* �˻������� �ܼ�ȭ�Ͽ� ����� �� �ֵ��� ��.
   ������ �ܼ�ȭ
   ����ڸ� ���� �÷����̳� ���̺��� ���� */
   
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

/* view������ create or alter���: create or replace view */
CREATE OR REPLACE VIEW V_EMP(EMP_ID, FIRST_NAME, JOB_ID, HIREDATE, DEPT_ID) AS
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, HIRE_DATE, DEPARTMENT_ID
FROM EMPLOYEES
WHERE JOB_ID = 'ST_CLERK';

/* nvl(column, value): column�� null�̸� value��� */
/* nvl2(column, value, value2) column�� null�̸� value��� �ƴϸ� value2��� */
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

/* read only: ���̺� �� �� ���� �Ұ��� */
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


/* column1||' '||column2: column1 column2���� ���ļ� ��� */
CREATE VIEW ���(���, �̸�, �μ���ȣ, �Ի���) AS
SELECT EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME, DEPARTMENT_ID, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50;

SELECT * FROM ���;

/* view������ join�� ������ */
CREATE VIEW V_JOIN(���, �̸�, �μ���ȣ, �μ���, �Ի���) AS
SELECT EMP.EMPLOYEE_ID, EMP.FIRST_NAME||' '||EMP.LAST_NAME, EMP.DEPARTMENT_ID, DEPT.DEPARTMENT_NAME, EMP.HIRE_DATE
FROM EMPLOYEES EMP, DEPARTMENTS DEPT
WHERE EMP.DEPARTMENT_ID = DEPT.DEPARTMENT_ID;

SELECT * FROM V_JOIN;