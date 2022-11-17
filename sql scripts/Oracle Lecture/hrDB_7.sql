/* SubQuary */
SELECT ROUND(AVG(SALARY))
FROM EMPLOYEES; -- AVG(SALARY) ����ӱ�

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
FROM EMPLOYEES
WHERE SALARY < 6462; -- ��� �ӱ� ���� ���� ����

/* where�������� �����Լ� ���Ұ� */
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
FROM EMPLOYEES
WHERE SALARY < ROUND(AVG(SALARY)); -- Error

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
FROM EMPLOYEES
WHERE SALARY < (SELECT ROUND(AVG(SALARY))
                FROM EMPLOYEES); -- SubQuary
-- where�������� �����Լ��� ��� ���ϱ� ������ �̷��� SubQuary�� ���־�� �Ѵ�.

SELECT LOCATION_ID
FROM LOCATIONS
WHERE STATE_PROVINCE IS NULL;
-- state_province�� null���� location_id �� ��ȸ

SELECT *
FROM DEPARTMENTS
WHERE LOCATION_ID IN (1000, 1100, 1300, 2000, 2300, 2400);
-- location_id �� �� 6��

SELECT *
FROM DEPARTMENTS
WHERE LOCATION_ID IN (SELECT LOCATION_ID
                      FROM LOCATIONS
                      WHERE STATE_PROVINCE IS NULL);
-- �� location_id ������ SubQuary�� ������ �־ ��ȸ

SELECT *
FROM DEPARTMENTS
WHERE LOCATION_ID IN (1000, 1100, 1300, 2000, 2300, 2400);
                      
/* ������ ���� ���� ��� */
SELECT emp.FIRST_NAME, emp.LAST_NAME, job.JOB_TITLE
  FROM EMPLOYEES emp, JOBS job
 WHERE emp.SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES) -- SubQuary, min���
   AND emp.JOB_ID = job.JOB_ID; -- join ���
   
/* ��� �޿����� ���� �޴� ������� ��� ��ȸ */
SELECT emp.FIRST_NAME, emp.LAST_NAME, job.JOB_TITLE
  FROM EMPLOYEES emp, JOBS job
 WHERE emp.SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES) -- SubQuary, avg���
   AND emp.JOB_ID = job.JOB_ID; -- join ���
   
/* any, all */
SELECT SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 20; -- salary�� 13000, 6000 ��ȸ��

SELECT EMPLOYEE_ID, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE SALARY > ANY(SELECT SALARY
                   FROM EMPLOYEES
                   WHERE DEPARTMENT_ID = 20); -- ANY
-- 13000 or 6000 ���� salary�� ū ����(= 6000���� ū ����)

SELECT EMPLOYEE_ID, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT MIN(SALARY)
                FROM EMPLOYEES
                WHERE DEPARTMENT_ID = 20); -- ANY�� �Ⱦ��� MIN
-- 6000 ���� salary�� ū ����


SELECT EMPLOYEE_ID, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE SALARY > ALL(SELECT SALARY
                   FROM EMPLOYEES
                   WHERE DEPARTMENT_ID = 20); -- ALL
-- 13000 and 6000 ���� salary�� ū ����(= 13000���� ū ����)
                   
SELECT EMPLOYEE_ID, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT MAX(SALARY)
                FROM EMPLOYEES
                WHERE DEPARTMENT_ID = 20); -- ALL�� �Ⱦ��� MAX
-- 13000���� salary�� ū ����