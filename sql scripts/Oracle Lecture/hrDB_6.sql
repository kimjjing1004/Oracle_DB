/* join: �Ϲ������� inner join(���� ����) ����� �ǹ� */
SELECT emp.FIRST_NAME, emp.LAST_NAME, emp.EMAIL, dep.DEPARTMENT_NAME
FROM EMPLOYEES emp, DEPARTMENTS dep
WHERE emp.DEPARTMENT_ID = dep.DEPARTMENT_ID;

SELECT emp.FIRST_NAME, emp.LAST_NAME, emp.EMAIL,
       emp.DEPARTMENT_ID, dep.DEPARTMENT_NAME,
       emp.JOB_ID, job.JOB_TITLE, loc.CITY
FROM EMPLOYEES emp,
     DEPARTMENTS dep,
     JOBS job,
     LOCATIONS loc
WHERE emp.DEPARTMENT_ID = dep.DEPARTMENT_ID
  AND emp.JOB_ID = job.JOB_ID
  AND dep.LOCATION_ID = loc.LOCATION_ID -- join ����
  AND loc.CITY = 'Seattle'; -- �Ϲ� ����
  
/* self join */
SELECT emp1.EMPLOYEE_ID, emp1.FIRST_NAME,
       emp2.EMPLOYEE_ID ���id, emp2.FIRST_NAME
FROM EMPLOYEES emp1, EMPLOYEES emp2
WHERE emp1.MANAGER_ID = emp2.EMPLOYEE_ID;

/* outer join(�ܺ� ����) */
SELECT emp.EMPLOYEE_ID, emp.FIRST_NAME, emp.DEPARTMENT_ID, dep.DEPARTMENT_NAME, loc.CITY
FROM EMPLOYEES emp, DEPARTMENTS dep, LOCATIONS loc
WHERE emp.DEPARTMENT_ID = dep.DEPARTMENT_ID (+)
AND   dep.LOCATION_ID = loc.LOCATION_ID (+);

/* left/right join */
SELECT emp.EMPLOYEE_ID, emp.FIRST_NAME, emp.DEPARTMENT_ID, dep.DEPARTMENT_NAME, loc.CITY
  FROM EMPLOYEES emp LEFT OUTER JOIN DEPARTMENTS dep ON emp.DEPARTMENT_ID = dep.DEPARTMENT_ID
                     LEFT OUTER JOIN LOCATIONS loc ON dep.LOCATION_ID = loc.LOCATION_ID;
-- �ܺ����� ������ LEFT���� ������ �����Ͽ���, �Ȱ��� ����� ��Ÿ����.