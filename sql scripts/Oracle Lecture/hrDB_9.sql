/* DML(Data Manipulation Language): ������ ���۾�
SELECT��, DELETE��, INSERT��, UPDATE��

-- ���� --
SELECT �÷�1, �÷�2, ...
FROM ���̺�1, ���̺�2, ...
WHERE ����...;

INSERT INTO ���̺��(�÷�1, �÷�2, �÷�3, ...)
VALUES (��1, ��2, ��3, ...);
-- table�� record/row�� �Է�

UPDATE ���̺��
   SET �÷�1 = ��1,
       �÷�2 = ��2,
       ...
WHERE ����...;
-- ���� ����

DELETE (FROM) ���̺��
WHERE ����;
-- table�� record/row�� ����
*/

/* table �� column�� �Ӽ� ����*/
CREATE TABLE SAMPLE(deptNo NUMBER(20),
                    deptName VARCHAR2(20),
                    deptLoc VARCHAR2(20),
                    deptManager VARCHAR2(20));
                    
INSERT INTO SAMPLE(deptNo, deptName, deptLoc, deptManager)
VALUES(10, '��ȹ��', '����', 'ȫ�浿');
-- �� column ��ġ�� �´� ���� ���� ��� �־��ش�

INSERT INTO SAMPLE
VALUES(20, '�����', '�λ�', '�踻��');
-- table�̸� ���� ���θ� �����ϸ� ��� column�� �������� �ִ´ٴ� �ǹ�

INSERT INTO SAMPLE
VALUES(30, '������', '����', 'null');

UPDATE SAMPLE SET deptNo = 50
WHERE deptNo = 30;
-- �����ؾ��� ���� ���� �� where���ǿ� �־���� �Ѵ�

UPDATE SAMPLE SET deptLoc = '��õ'
WHERE deptName = '������';
-- �����ؾ��� ���� ���� �� where���ǿ� �־���� �Ѵ�

DELETE SAMPLE
WHERE deptName = '������';
-- �ش� table�ȿ� ���ǿ� �ش�Ǵ� �ุ �����

DELETE SAMPLE;
-- �ش� table�ȿ� �ִ� ��� �����͸� �����

COMMIT;
-- SAVE ó��

ROLLBACK;
-- COMMIT�� �������� �ٽ� �ǵ��ư���(����)

SELECT * FROM SAMPLE;