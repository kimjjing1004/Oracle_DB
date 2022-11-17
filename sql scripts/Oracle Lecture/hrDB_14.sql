/* PL/SQL(Procedural language/SQL) */
-- ����Ŭ���� �����ϴ� ���α׷��� ���
-- �Ϲ� ���α׷��� ������� ��Ҹ� �� ������ �ְ�,
-- �����ͺ��̽� ������ ó���ϱ� ���� ����ȭ�� ���

-- �⺻����
-- �����(Declare): ��� ������ ����� �����ϴ� �κ�
-- �����(Executable): begin ~ end / ���, �ݺ���, �Լ� ���� ���� ������ ����ϴ� �κ�
-- ����ó����(Exception): ���൵�߿� ���� �߻��� �ذ��ϱ� ���� ��ɵ��� ����ϴ� �κ�
-- declare, begin, exception Ű������� ;�� ������ �ʴ´�.
-- ������ ������� ;���� ó���Ѵ�.
-- �͸���(anonymous PL/SQL Block): �ַ� ��ȸ������ ����� ��� ���� ���ȴ�.
-- ������(stored PL/SQL Block): ������ ������ ���� �ֱ������� �ݺ��ؼ� ����� ��� ���ȴ�.

SET SERVEROUTPUT ON;
SET SERVEROUTPUT OFF;

DECLARE
    CNT INTEGER;
BEGIN
    CNT := CNT + 1;
    IF CNT IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('���: cnt�� null�̴�');
    END IF;
END;
/
-- �Ҵ� '='�� �ƴ϶� ':='�̴�.


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
