--DML(DATA MANIPULATION LANGUAGE)
--SELECT(READ), INSERT(CREATE), DELETE, UPDATE(UPDATE)

--CREATE 테이블 만들기
CREATE TABLE DEPT_TEMP
    AS SELECT * FROM DEPT;
SELECT * FROM DEPT_TEMP;

--EMP 테이블 데이터를 그대로 들고 와서 TABLE 만들기 EMP_TEMP10

CREATE TABLE EMP_TEMP10
    AS SELECT * FROM EMP;
SELECT * FROM EMP_TEMP10;

-- INSERT 테이블에 추가하기
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC) VALUES (50, 'DATABASE', 'SEOUL');
SELECT * FROM DEPT_TEMP;

INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC) VALUES (60, 'NETWORK' , 'BUSAN');

CREATE TABLE EMP_TEMP
AS SELECT * FROM EMP WHERE 1=0;

SELECT * FROM EMP_TEMP;

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) 
VALUES (9999, '홍길동', 'PRESIDENT', NULL, '2023/02/27', 5000, 1000, 10);

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) 
VALUES (9999, '이몽룡', 'PRESIDENT', NULL, '2023/02/27', 5000, 1000, 10);

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) 
VALUES (9999, '전우치', 'PRESIDENT', NULL, TO_DATE('27/02/2023',' DD/MM/YYYY'), 5000, 1000, 10);

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) 
VALUES (9999, '임꺽정', 'PRESIDENT', NULL, SYSDATE, 5000, 1000, 10);

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) 
VALUES ((SELECT MAX(EMPNO) -10 FROM EMP_TEMP), '성춘향', 'PRESIDENT', NULL, SYSDATE, 5000, 1000, 10);

SELECT MAX(EMPNO) + 1 FROM EMP_TEMP;

SELECT * FROM EMP_TEMP;

--UPDATE 테이블 수정하기
CREATE TABLE DEPT_TEMP02 AS SELECT * FROM DEPT;

UPDATE DEPT_TEMP02 SET LOC = 'SEOUL';

UPDATE DEPT_TEMP02 SET DNAME = 'DATABASE', LOC = 'ILSAN'
WHERE DEPTNO = 40;

SELECT * FROM DEPT_TEMP02;

COMMIT;

ROLLBACK; --TRANSACTION / COMMIT 하면 확정 롤백 불가능

-- EMP_TEMP11 급여가 2500 이하인 사람의 COMM 50으로 수정
CREATE TABLE EMP_TEMP11 AS SELECT * FROM EMP;

SELECT * FROM EMP_TEMP11;

UPDATE EMP_TEMP11 SET COMM = 50
WHERE SAL <= 2500;

UPDATE DEPT_TEMP02 SET 
DNAME = (SELECT DNAME FROM DEPT WHERE DEPTNO = '40'),
LOC = (SELECT LOC FROM DEPT WHERE DEPTNO = '40')
WHERE DEPTNO = 40;

--위에랑 같음
UPDATE DEPT_TEMP02 SET 
(DNAME, LOC) = (SELECT DNAME, LOC FROM DEPT WHERE DEPTNO = '40')
WHERE DEPTNO = 40;


--DELETE 테이블에 있는 데이터 삭제
DELETE FROM EMP_TEMP10
WHERE JOB = 'MANAGER';


ROLLBACK;
SELECT * FROM EMP_TEMP10;

--EMP_TEMP10 에서 급여가 3000 이상인 사람 해고
DELETE FROM EMP_TEMP10
WHERE SAL >= 3000;


--Q1
CREATE TABLE CHAP10HW_EMP AS SELECT * FROM EMP;
CREATE TABLE CHAP10HW_DEPT AS SELECT * FROM DEPT;
CREATE TABLE CHAP10HW_SALGRADE AS SELECT * FROM SALGRADE;

INSERT INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC) VALUES (50, 'ORACLE', 'BUSAN');
INSERT INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC) VALUES (60, 'SQL', 'ILSAN');
INSERT INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC) VALUES (70, 'SELECT', 'INCHEON');
INSERT INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC) VALUES (80, 'DML', 'BUNDANG');

SELECT * FROM CHAP10HW_DEPT;

--Q2
SELECT * FROM CHAP10HW_EMP;
DELETE FROM CHAP10HW_EMP;
DROP TABLE CHAP10HW_EMP;

INSERT INTO CHAP10HW_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES
(7201, 'TEST_USER1', 'MANAGER', 7788, '2016-01-02', 4500, NULL, 50);
INSERT INTO CHAP10HW_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES
(7202, 'TEST_USER2', 'CLERK', 7201, '2016-02-21', 1800, NULL, 50);
INSERT INTO CHAP10HW_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES
(7203, 'TEST_USER3', 'ANALYST', 7201, '2016-04-11', 3400, NULL, 60);
INSERT INTO CHAP10HW_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES
(7204, 'TEST_USER4', 'SALESMAN', 7201, '2016-05-31', 2700, 300, 60);
INSERT INTO CHAP10HW_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES
(7205, 'TEST_USER5', 'CLERK', 7201, '2016-07-20', 2600, NULL, 70);
INSERT INTO CHAP10HW_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES
(7206, 'TEST_USER6', 'CLERK', 7201, '2016-09-08', 2600, NULL, 70);
INSERT INTO CHAP10HW_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES
(7207, 'TEST_USER7', 'LECTURER', 7201, '2016-10-28', 2300, NULL, 80);
INSERT INTO CHAP10HW_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES
(7208, 'TEST_USER8', 'STUDENT', 7201, '2018-03-09', 1200, NULL, 80);

COMMIT;
--Q3
SELECT * FROM CHAP10HW_EMP
ORDER BY DEPTNO;

UPDATE CHAP10HW_EMP SET
DEPTNO = '70'
WHERE SAL > (SELECT AVG(SAL) FROM CHAP10HW_EMP WHERE DEPTNO = '50');

COMMIT;

--Q4
SELECT * FROM CHAP10HW_EMP;

UPDATE CHAP10HW_EMP SET
SAL = SAL*1.1, DEPTNO = '80'
WHERE HIREDATE > (SELECT MIN(HIREDATE) FROM CHAP10HW_EMP WHERE DEPTNO = '60'); 

ROLLBACK;

--Q5
SELECT * FROM CHAP10HW_SALGRADE;
SELECT * FROM CHAP10HW_EMP;

DELETE FROM CHAP10HW_EMP
WHERE EMPNO IN(SELECT E.EMPNO 
FROM CHAP10HW_EMP E, CHAP10HW_SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND GRADE = '5');

