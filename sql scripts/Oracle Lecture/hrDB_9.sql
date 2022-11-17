/* DML(Data Manipulation Language): 데이터 조작어
SELECT문, DELETE문, INSERT문, UPDATE문

-- 형식 --
SELECT 컬럼1, 컬럼2, ...
FROM 테이블1, 테이블2, ...
WHERE 조건...;

INSERT INTO 테이블명(컬럼1, 컬럼2, 컬럼3, ...)
VALUES (값1, 값2, 값3, ...);
-- table의 record/row를 입력

UPDATE 테이블명
   SET 컬럼1 = 값1,
       컬럼2 = 값2,
       ...
WHERE 조건...;
-- 값을 수정

DELETE (FROM) 테이블명
WHERE 조건;
-- table의 record/row를 삭제
*/

/* table 및 column과 속성 생성*/
CREATE TABLE SAMPLE(deptNo NUMBER(20),
                    deptName VARCHAR2(20),
                    deptLoc VARCHAR2(20),
                    deptManager VARCHAR2(20));
                    
INSERT INTO SAMPLE(deptNo, deptName, deptLoc, deptManager)
VALUES(10, '기획실', '서울', '홍길동');
-- 각 column 위치에 맞는 값을 순서 대로 넣어준다

INSERT INTO SAMPLE
VALUES(20, '전산실', '부산', '김말똥');
-- table이름 옆에 가로를 생략하면 모든 column에 빠짐없이 넣는다는 의미

INSERT INTO SAMPLE
VALUES(30, '영업부', '광주', 'null');

UPDATE SAMPLE SET deptNo = 50
WHERE deptNo = 30;
-- 변경해야할 기존 값을 꼭 where조건에 넣어줘야 한다

UPDATE SAMPLE SET deptLoc = '인천'
WHERE deptName = '영업부';
-- 변경해야할 기존 값을 꼭 where조건에 넣어줘야 한다

DELETE SAMPLE
WHERE deptName = '영업부';
-- 해당 table안에 조건에 해당되는 행만 지운다

DELETE SAMPLE;
-- 해당 table안에 있는 모든 데이터를 지운다

COMMIT;
-- SAVE 처리

ROLLBACK;
-- COMMIT한 시점으로 다시 되돌아간다(복구)

SELECT * FROM SAMPLE;