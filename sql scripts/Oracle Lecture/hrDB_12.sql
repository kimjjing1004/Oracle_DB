/* Sequence: 연속적인 번호를 만들어주는 기능 */

-- 구문형식
-- CREATE SEQUENCE sequence이름

-- INCREMENT BY N <- N: 증가값을 설정(N씩 증가) / default값: 1

-- START WITH N <- 시작값 설정 / default값: 1

-- MAXVALUE N | NOMAXVALUE <- sequence 최대값을 설정
-- (nomaxvalue는 최대값을 설정하지 않고 계속 증가 시킨다)

-- MINVALUE N | NOMINVALUE <- sequence 최소값을 설정
-- (최대값에 도달하면 그 이후에 최소값을 증가시킨다: cycle옵션일 경우 최소값 증가)

-- CYCLE | NOCYCLE <- sequence순환 여부를 설정

-- CACHE N | NOCACHE <- sequence속도 개선을 위해 캐싱여부 지정

/* sequence생성: 제품번호 생성하는 sequence 만들기 */
CREATE SEQUENCE SEQ_SERIAL_NO
INCREMENT BY 1
START WITH 100
MAXVALUE 110
MINVALUE 99
CYCLE
CACHE 2;

CREATE TABLE GOOD(GOOD_NO NUMBER(3),
                  GOOD_NAME VARCHAR2(10));

/* nextval: 다음값 */
INSERT INTO GOOD
VALUES(SEQ_SERIAL_NO.NEXTVAL, '제품12');

SELECT * FROM GOOD;

/* currval: 현재값 */
INSERT INTO GOOD
VALUES(SEQ_SERIAL_NO.CURRVAL, '제품2');

SELECT SEQ_SERIAL_NO.CURRVAL FROM DUAL;

CREATE TABLE GOOD2(GOOD_NO NUMBER(3),
                   GOOD_NAME VARCHAR2(10));
                   
CREATE SEQUENCE SEQ_SERIAL_NO2
INCREMENT BY 1
START WITH 100
MAXVALUE 105
CACHE 2;

INSERT INTO GOOD2
VALUES(seq_serial_no2.nextval, '제품1');
COMMIT;

SELECT * FROM GOOD2;

/* 비정상 종료 후 cache에 의한 sequence의 변화 */
-- cache 2이고 테이블에 100 제품1이 있다고 가정하면
-- cmd에서 sys계정을 sysdba로 접속 후
-- shutdown abort;
-- startup 으로 강제종료 및 재시작하고
-- conn hr; 으로 원래 시퀀스가 있던 스키마로 접속
-- INSERT INTO GOOD2 VALUES(SEQ_SERIAL_NO2.NEXTVAL, '제품2');
-- 추가한 이후 다시 조회 해보면
-- 102 제품2
-- 100 제품1
-- 이렇게 101이 아니라 102가 나오는 걸 알 수 있다.

/* sequence삭제 */
-- DROP SEQUENCE 시퀀스명;
-- increament을 -n(음수)로 하여 sequence를 감소시키는 방법도 있다.