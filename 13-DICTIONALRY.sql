SELECT * FROM DICT;

SELECT TABLE_NAME
FROM USER_TABLES;

SELECT * FROM ALL_TABLES;
SELECT OWNER, TABLE_NAME FROM ALL_TABLES;

--INDEX는 검색을 빨리 해야할 때
SELECT * FROM USER_INDEXES;

--INDEX 만들기
CREATE INDEX IDX_EMP_SAL
ON EMP(SAL);

SELECT * FROM USER_IND_COLUMNS;

DROP INDEX IDX_EMP_SAL;

--VIEW 
CREATE VIEW VW_EMP20 AS
(SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE DEPTNO=20);

SELECT * FROM VW_EMP20;
DROP VIEW VW_EMP20;

--ROWNUM (인덱스) 생성
SELECT * FROM EMP;
SELECT ROWNUM, E.*
FROM EMP E;

SELECT ROWNUM, E.*
FROM EMP E
ORDER BY SAL DESC;

--FROM절에 쓰인 서브쿼리를 INLINE VIEW라고도 함
SELECT ROWNUM, E.*
FROM (SELECT * FROM EMP ORDER BY SAL DESC) E
WHERE ROWNUM <= 5;

--WITH 가상 테이블 (VIEW) 
WITH E AS (SELECT * FROM EMP ORDER BY SAL DESC)
SELECT ROWNUM, E.*
FROM E
WHERE ROWNUM <= 5;

--SEQUENCE AUTO-INCREMENT
CREATE SEQUENCE SEQ_DEPT_SEQUENCE
    INCREMENT BY 10
    START WITH 10
    MAXVALUE 90
    MINVALUE 0
    NOCYCLE
    CACHE 2;
    
SELECT * FROM USER_SEQUENCES;

CREATE TABLE DEPT_SEQUENCE AS SELECT * FROM DEPT WHERE 1 = 0;
SELECT * FROM DEPT_SEQUENCE; 

INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

DROP SEQUENCE SEQ_DEPT_SEQUENCE;

--동의어
CREATE SYNONYM E FOR EMP;
SELECT * FROM E;

--Q1
CREATE TABLE EMPIDX AS SELECT * FROM EMP WHERE 1=1;

SELECT * FROM EMPIDX;

CREATE INDEX IDX_EMPIDX_EMPNO
ON EMPIDX(EMPNO);

SELECT * FROM USER_INDEXES;

--Q2
CREATE VIEW EMPIDX_OVER15K
AS (SELECT EMPNO, ENAME, JOB, DEPTNO, SAL, NVL2(COMM,'O', 'X') AS COMM
    FROM EMPIDX 
    WHERE SAL > 1500);

--Q3
CREATE TABLE DEPTSEQ AS SELECT * FROM DEPT WHERE 1=1;

SELECT * FROM DEPTSEQ;

CREATE SEQUENCE DEPTSEQ02
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 99
    MINVALUE 1
    NOCYCLE
    NOCACHE;
    
INSERT INTO DEPTSEQ (DEPTNO, DNAME, LOC)
VALUES (DEPTSEQ02.NEXTVAL, 'DATABASE', 'SEOUL');

INSERT INTO DEPTSEQ (DEPTNO, DNAME, LOC)
VALUES (DEPTSEQ02.NEXTVAL, 'WEB', 'BUSAN');

INSERT INTO DEPTSEQ (DEPTNO, DNAME, LOC)
VALUES (DEPTSEQ02.NEXTVAL, 'MOBILE', 'ILSAN');


    

