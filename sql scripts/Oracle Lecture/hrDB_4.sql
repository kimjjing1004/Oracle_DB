SELECT * FROM EMPLOYEES;

/* sysdate */
SELECT SYSDATE FROM DUAL;

/* months_between(date1, date2) */
SELECT FIRST_NAME, LAST_NAME, MONTHS_BETWEEN(SYSDATE, HIRE_DATE)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50;

/* add_months() */
SELECT ADD_MONTHS(SYSDATE, 7) FROM DUAL;

/* next_day() */
SELECT NEXT_DAY(SYSDATE, '�Ͽ���') FROM DUAL;

/* last_day() */
SELECT LAST_DAY(SYSDATE) FROM DUAL;

/* to_char() */
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') FROM DUAL;

/* to_date() */
SELECT TO_DATE('2015/03/04', 'YYYY/MM/DD') FROM DUAL;

/* nvl(): null���� �ٸ� �����ͷ� �����ϴ� �Լ� */
SELECT FIRST_NAME, LAST_NAME, NVL(COMMISSION_PCT, 0) COMMISSION FROM EMPLOYEES;

/* decode(): switch���� ������ �ϴ� �Լ� */
SELECT DEPARTMENT_ID, DECODE(DEPARTMENT_ID, 20, '�����ú�', 60, '����', 90, '�濵��', '�μ�')
FROM EMPLOYEES;

/* case(): else if���� ���� ���� �Լ� */
SELECT FIRST_NAME, DEPARTMENT_ID,
    CASE WHEN DEPARTMENT_ID = 20 THEN '�����ú�'
         WHEN DEPARTMENT_ID = 60 THEN '�����'
         WHEN DEPARTMENT_ID = 90 THEN '�濵��'
         ELSE ''
         END "�μ���"
FROM EMPLOYEES;