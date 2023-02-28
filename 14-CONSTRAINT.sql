--데이터 입력 시 제약을 걸어서 무조건 입력 받게 하기

CREATE TABLE TABLE_NOTNULL (
    LOGIN_ID    VARCHAR2(20) NOT NULL,
    LOGIN_PWD   VARCHAR2(20) NOT NULL,
    TEL         VARCHAR2(20)
);
DESC TABLE_NOTNULL;

INSERT INTO TABLE_NOTNULL (LOGIN_ID, LOGIN_PWD, TEL)
VALUES ('HELLO', '1234', '010-1111-2222');

INSERT INTO TABLE_NOTNULL (LOGIN_ID, LOGIN_PWD, TEL)
VALUES ('TEST2', '1234');

UPDATE TABLE_NOTNULL
SET TEL = '010-1111-222';

ALTER TABLE TABLE_NOTNULL
MODIFY (TEL NOT NULL);

SELECT * FROM TABLE_NOTNULL;

SELECT * FROM USER_CONSTRAINTS;

--UNIQUE 중복 허용 안 함
CREATE TABLE TABLE_UNIQUE (
    LOGIN_ID     VARCHAR2(20) UNIQUE,
    LOGIN_PWD   VARCHAR2(20) NOT NULL,
    TEL         VARCHAR2(20)
);

DESC TABLE_UNIQUE;
DROP TABLE TABLE_UNIQUE;

INSERT INTO TABLE_UNIQUE(LOGIN_ID, LOGIN_PWD, TEL) VALUES
    ('AAA','1234','010-1111-2222');
INSERT INTO TABLE_UNIQUE(LOGIN_ID, LOGIN_PWD, TEL) VALUES
    (NULL,'1234','010-1111-2222');
    
SELECT * FROM TABLE_UNIQUE;

--PRIMARY KEY / UNIQUE, NOT NULL, INDEX 다 설정
CREATE TABLE TABLE_PK (
    LOGIN_ID      VARCHAR2(20) PRIMARY KEY,
    LOGIN_PWD      VARCHAR2(20) NOT NULL,
    TEL             VARCHAR2(20)
    );
SELECT * FROM TABLE_PK;

INSERT INTO TABLE_PK(LOGIN_ID, LOGIN_PWD, TEL)
VALUES ('JJANG052','1234','1111');


--FOREIGN KEY 테이블 정규화 (중복 제거)
SELECT * FROM EMP;

INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (9999, 'HONG', 'CLERK' , '7788', TO_DATE('2023-02-28', 'YYYY/MM/DD'), 1200, NULL, 50);

SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN ('EMP','DEPT');

SELECT * FROM DEPT;

CREATE TABLE DEPT_FK(
    DEPTNO NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK PRIMARY KEY,
    DNAME VARCHAR2(20),
    LOC VARCHAR2(20)
);

CREATE TABLE EMP_FK (
    EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(10),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK REFERENCES DEPT_FK (DEPTNO)
);

INSERT INTO DEPT_FK VALUES (10, 'AAA','DANGSAN');
INSERT INTO DEPT_FK VALUES (20, 'AAA','DANGSAN');
INSERT INTO EMP_FK VALUES (1111, 'TEST_USER','TEST_JOB', NULL, TO_DATE('2023-02-28', 'YYYY-MM-DD'),
                            3000, NULL, 10
);
INSERT INTO EMP_FK VALUES (1112, 'TEST_USER','TEST_JOB', NULL, TO_DATE('2023-02-28', 'YYYY-MM-DD'),
                            3000, NULL, 20
);


--CHECK
CREATE TABLE TABLE_CHECK(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TABLE_CHECK_LOGIN_PK PRIMARY KEY,
    LOGIN_PWD VARCHAR2(20) CONSTRAINT TABLE_LOGINPWD_CHECK CHECK (LENGTH(LOGIN_PWD) > 3),
    TEL VARCHAR2(20)
);

INSERT INTO TABLE_CHECK VALUES ('TEST_ID', '1234','010-111-2222');

SELECT * FROM TABLE_CHECK;


--DEFAULT
CREATE TABLE TABLE_DEFAULT(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TABLE_DEFAULT_LOGIN_PK PRIMARY KEY,
    LOGIN_PWD VARCHAR2(20) CONSTRAINT TABLE_LOGINPWD_DEFAULT CHECK (LENGTH(LOGIN_PWD) > 3),
    TEL VARCHAR2(20),
    REGDATE DATE DEFAULT SYSDATE
);
INSERT INTO TABLE_DEFAULT(LOGIN_ID, LOGIN_PWD, TEL) VALUES ('TEST_ID02', '1234','010-111-2222');
SELECT * FROM TABLE_DEFAULT;


--Q1
CREATE TABLE DEPT_CONST(
    DEPTNO NUMBER(2) CONSTRAINT DEPTCONST_DEPTNO_PK PRIMARY KEY,
    DNAME VARCHAR2(14) CONSTRAINT DEPTCONST_DNAME_UNQ UNIQUE,
    LOC VARCHAR2(13) CONSTRAINT DEPTCONST_LOG_NN NOT NULL
);

CREATE TABLE EMP_CONST(
    EMPNO NUMBER(4) CONSTRAINT EMPCONST_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10) CONSTRAINT EMPCONST_ENAME_NN NOT NULL,
    JOB VARCHAR2(9),
    TEL VARCHAR2(20) CONSTRAINT EMPCONST_TEL_UNQ UNIQUE,
    HIREDATE DATE,
    SAL NUMBER(7, 2) CONSTRAINT EMPCONST_SAL_CHK CHECK (SAL BETWEEN 1000 AND 9999),
    COMM NUMBER(7, 2),
    DEPTNO NUMBER(2) CONSTRAINT EMPCONST_DEPTNO_FK REFERENCES DEPT_CONST (DEPTNO)
);

SELECT TABLE_NAME, CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE TABLE_NAME LIKE '%CONST%'
ORDER BY TABLE_NAME;