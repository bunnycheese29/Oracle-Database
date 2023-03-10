CREATE TABLE EMP_DDL (
    EMPNO NUMBER(4),
    ENAME VARCHAR2(30),
    JOB VARCHAR2(20),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(10),
    COMM NUMBER(10),
    DEPTNO NUMBER(2)
);

--테이블 구조 확인
DESC EMP_DDL;

CREATE TABLE DEPT_DDL
AS SELECT * FROM DEPT;

DESC DEPT DDL;
SELECT * FROM DEPT_DDL;

CREATE TABLE EMP_DDL_30
AS SELECT * FROM EMP WHERE DEPTNO=30;

SELECT * FROM EMP_DDL_30;

--테이블 열만 복제

CREATE TABLE EMPDEPT_DDL
AS SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE,
            E.SAL, E.COMM, D.DEPTNO, D.DNAME, D.LOC
        FROM EMP E, DEPT D
        WHERE 1<>1;

SELECT * FROM EMPDEPT_DDL;

CREATE TABLE EMP_ALTER
AS SELECT * FROM EMP;

SELECT * FROM EMP_ALTER;

DESC EMP_ALTER;

--ALTER TABLE 테이블 변경
ALTER TABLE EMP_ALTER
ADD HP VARCHAR2(20);

ALTER TABLE EMP_ALTER
RENAME COLUMN HP TO TEL;

ALTER TABLE EMP_ALTER
MODIFY EMPNO NUMBER(5);

ALTER TABLE EMP_ALTER
DROP COLUMN TEL;

--테이블 이름 변경
RENAME EMP_ALTER TO EMP_RENAME;

--TRUNCATE TABLE 테이블 안에 있는 DATA 삭제 (DELETE와 달리 롤백 불가능)
SELECT * FROM EMP_RENAME;

TRUNCATE TABLE EMP_RENAME;

--TABLE 아예 삭제
DROP TABLE EMP_RENAME;

--Q1
CREATE TABLE EMP_HW (
EMPNO NUMBER(4),
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR NUMBER(4),
HIREDATE DATE,
SAL NUMBER(7,2),
COMM NUMBER(7,2),
DEPTNO NUMBER(2)
);

--Q2
SELECT * FROM EMP_HW;

ALTER TABLE EMP_HW
ADD BIGO VARCHAR2(2);

--Q3
ALTER TABLE EMP_HW
MODIFY BIGO VARCHAR(30);

--Q4
ALTER TABLE EMP_HW
RENAME COLUMN BIGO TO REMARK;

--Q5
INSERT INTO EMP_HW
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, NULL
FROM EMP;

--Q6
DROP TABLE EMP_HW;

FLASHBACK TABLE EMP_HW TO BEFORE DROP;
