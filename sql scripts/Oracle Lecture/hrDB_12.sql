/* Sequence: �������� ��ȣ�� ������ִ� ��� */

-- ��������
-- CREATE SEQUENCE sequence�̸�

-- INCREMENT BY N <- N: �������� ����(N�� ����) / default��: 1

-- START WITH N <- ���۰� ���� / default��: 1

-- MAXVALUE N | NOMAXVALUE <- sequence �ִ밪�� ����
-- (nomaxvalue�� �ִ밪�� �������� �ʰ� ��� ���� ��Ų��)

-- MINVALUE N | NOMINVALUE <- sequence �ּҰ��� ����
-- (�ִ밪�� �����ϸ� �� ���Ŀ� �ּҰ��� ������Ų��: cycle�ɼ��� ��� �ּҰ� ����)

-- CYCLE | NOCYCLE <- sequence��ȯ ���θ� ����

-- CACHE N | NOCACHE <- sequence�ӵ� ������ ���� ĳ�̿��� ����

/* sequence����: ��ǰ��ȣ �����ϴ� sequence ����� */
CREATE SEQUENCE SEQ_SERIAL_NO
INCREMENT BY 1
START WITH 100
MAXVALUE 110
MINVALUE 99
CYCLE
CACHE 2;

CREATE TABLE GOOD(GOOD_NO NUMBER(3),
                  GOOD_NAME VARCHAR2(10));

/* nextval: ������ */
INSERT INTO GOOD
VALUES(SEQ_SERIAL_NO.NEXTVAL, '��ǰ12');

SELECT * FROM GOOD;

/* currval: ���簪 */
INSERT INTO GOOD
VALUES(SEQ_SERIAL_NO.CURRVAL, '��ǰ2');

SELECT SEQ_SERIAL_NO.CURRVAL FROM DUAL;

CREATE TABLE GOOD2(GOOD_NO NUMBER(3),
                   GOOD_NAME VARCHAR2(10));
                   
CREATE SEQUENCE SEQ_SERIAL_NO2
INCREMENT BY 1
START WITH 100
MAXVALUE 105
CACHE 2;

INSERT INTO GOOD2
VALUES(seq_serial_no2.nextval, '��ǰ1');
COMMIT;

SELECT * FROM GOOD2;

/* ������ ���� �� cache�� ���� sequence�� ��ȭ */
-- cache 2�̰� ���̺� 100 ��ǰ1�� �ִٰ� �����ϸ�
-- cmd���� sys������ sysdba�� ���� ��
-- shutdown abort;
-- startup ���� �������� �� ������ϰ�
-- conn hr; ���� ���� �������� �ִ� ��Ű���� ����
-- INSERT INTO GOOD2 VALUES(SEQ_SERIAL_NO2.NEXTVAL, '��ǰ2');
-- �߰��� ���� �ٽ� ��ȸ �غ���
-- 102 ��ǰ2
-- 100 ��ǰ1
-- �̷��� 101�� �ƴ϶� 102�� ������ �� �� �� �ִ�.

/* sequence���� */
-- DROP SEQUENCE ��������;
-- increament�� -n(����)�� �Ͽ� sequence�� ���ҽ�Ű�� ����� �ִ�.