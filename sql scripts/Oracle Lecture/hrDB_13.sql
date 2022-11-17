/* 계층형 쿼리 */
CREATE TABLE BOM_SPHONE(ITEM_ID NUMBER(3) NOT NULL,
                        PARENT_ID NUMBER(3),
                        ITEM_NAME VARCHAR2(20) NOT NULL,
                        PRIMARY KEY(ITEM_ID));
    
INSERT INTO BOM_SPHONE VALUES(100, NULL, '스마트폰');
INSERT INTO BOM_SPHONE VALUES(101, 100, '메인PCB');
INSERT INTO BOM_SPHONE VALUES(102, 100, '배터리');
INSERT INTO BOM_SPHONE VALUES(103, 101, 'CPU');
INSERT INTO BOM_SPHONE VALUES(104, 101, '메모리');
INSERT INTO BOM_SPHONE VALUES(105, 101, '블루투스');

SELECT * FROM BOM_SPHONE;

SELECT S1.ITEM_NAME, S1.ITEM_ID, S2.ITEM_NAME PARENT_NAME
FROM BOM_SPHONE S1, BOM_SPHONE S2
WHERE S1.PARENT_ID = S2.ITEM_ID (+)
ORDER BY S1.ITEM_ID;
-- 정렬을 해도 보여주는데 한계가 있기 때문에 계층형 쿼리가 필요함

/* start with, connect by절을 이용해서 계층형 쿼리를 할 수 있다. */
SELECT LPAD(' ', 2 * (LEVEL - 1)) || ITEM_NAME ITEMNAMES
FROM BOM_SPHONE
START WITH PARENT_ID IS NULL
CONNECT BY PARENT_ID = PRIOR ITEM_ID;
-- CONNECT BY PRIOR ITEM_ID = PARENT_ID;

SELECT LEVEL,
       LPAD(' ', 4 * (LEVEL - 1)) || FIRST_NAME || ' ' || LAST_NAME 이름
FROM EMPLOYEES
START WITH MANAGER_ID IS NULL
CONNECT BY MANAGER_ID = PRIOR EMPLOYEE_ID;

SELECT JB.JOB_TITLE 직위,
       LPAD(' ', 4 * (LEVEL - 1)) || EMP.FIRST_NAME || ' ' || EMP.LAST_NAME 이름
FROM EMPLOYEES EMP, JOBS JB
WHERE EMP.JOB_ID = JB.JOB_ID
START WITH EMP.MANAGER_ID IS NULL
CONNECT BY EMP.MANAGER_ID = PRIOR EMP.EMPLOYEE_ID;