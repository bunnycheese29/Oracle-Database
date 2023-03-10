--SYSDATE() 날짜 함수 
SELECT SYSDATE AS NOW,
SYSDATE-1 AS YESTERDAY,
SYSDATE+1 AS TOMORROW
FROM DUAL;
 
--ADD_MONTHS 
SELECT SYSDATE AS NOW,
ADD_MONTHS(SYSDATE, 3) AS 삼개월뒤
FROM DUAL;

SELECT EMPNO, ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 120) AS WORK10YEAR
FROM EMP;

--MONTHS_BETWEEN
SELECT EMPNO, ENAME, HIREDATE, SYSDATE,
MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTH01,
MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTH02,
TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTH03
FROM EMP;

--NEXT_DAY(), LAST_DAY()
SELECT SYSDATE, NEXT_DAY(SYSDATE, '일요일'),
LAST_DAY(SYSDATE)
FROM DUAL;

--TO_CHAR() , TO_NUMBER() , TO_DATE() 형변환 함수 
SELECT '12345', TO_NUMBER('12345') FROM DUAL;

SELECT EMPNO, ENAME, EMPNO + '500' FROM EMP;

SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS') FROM DUAL;

SELECT SYSDATE,
TO_CHAR(SYSDATE, 'MM') AS MM,
TO_CHAR(SYSDATE, 'MON') AS MON, --JAN
TO_CHAR(SYSDATE, 'MONTH') AS MONTH, --JANUARY
TO_CHAR(SYSDATE, 'DD') AS DD,
TO_CHAR(SYSDATE, 'DY') AS DY, --FRI
TO_CHAR(SYSDATE, 'DAY') AS DAY --FRIDAY
FROM DUAL;

SELECT SYSDATE,
TO_CHAR(SYSDATE, 'MM') AS MM,
TO_CHAR(SYSDATE, 'MON','NLS_DATE_LANGUAGE = ENGLISH') AS MON, --JAN
TO_CHAR(SYSDATE, 'MON','NLS_DATE_LANGUAGE = KOREAN') AS MON, --JAN
TO_CHAR(SYSDATE, 'MON','NLS_DATE_LANGUAGE = JAPANESE') AS MON, --JAN
TO_CHAR(SYSDATE, 'MONTH') AS MONTH, --JANUARY
TO_CHAR(SYSDATE, 'DD') AS DD,
TO_CHAR(SYSDATE, 'DY') AS DY, --FRI
TO_CHAR(SYSDATE, 'DAY') AS DAY --FRIDAY
FROM DUAL;

SELECT SAL,
TO_CHAR(SAL, '$999,999') AS SAL_$,
TO_CHAR(SAL, 'L999,999') AS SAL_L,
TO_CHAR(SAL, '999,999.00') AS SAL_01
FROM EMP;

SELECT 1300 - '1500',
'1300' + '1500'
FROM DUAL;

SELECT TO_NUMBER('1,300','999,999') - TO_NUMBER('1,500','999,999') FROM DUAL;

--날짜로 바꾸기
SELECT
TO_DATE('2023-02-24','YYYY-MM-DD'),
TO_DATE('2023-02-24','YYYY-MM-DD HH:MI:SS')
FROM DUAL;

SELECT * FROM EMP
WHERE HIREDATE > TO_DATE('1981/06/01', 'YYYY/MM/DD');

--NULL 연산 안됨 IS NULL , IS NOT NULL , NVL(COMM, 0)
SELECT EMPNO, ENAME, SAL, COMM, 
SAL + COMM,NVL(COMM,0),
SAL*12+ NVL(COMM, 0 ) AS ANNUSAL
FROM EMP;

SELECT EMPNO, ENAME, NVL2(COMM, 'O', 'X') AS COMMM FROM EMP;

SELECT EMPNO, ENAME, SAL, COMM, 
SAL+COMM,NVL(COMM,0),
NVL2(COMM, SAL*12+COMM, SAL*12 ) AS ANNUSAL
FROM EMP;

--DECODE IF ELSE
--보너스 차등 지급 MANAGER 10 / SALESMAN 5 / ANALYIST 0 / 나머지 3
SELECT EMPNO, ENAME, JOB, SAL,
DECODE(JOB,
        'MANAGER', SAL*1.1,
        'SALESMAN', SAL*1.05,
        'ANALYSIT', SAL*1,
        SAL*1.03
        ) AS BONUS
FROM EMP;

--한국 사람
SELECT EMPNO, ENAME, JOB, SAL,
DECODE(JOB,
        'MANAGER', '관리자',
        'PRESIDENT', '최고 관리자',
        'ANALYSIT', '분석가',
        'CLERK', '사원',
        '영업사원' --ELSE
        ) AS 한국어
FROM EMP;

--CASE문 WHEN~END
SELECT EMPNO, ENAME, JOB, SAL,
    CASE JOB
        WHEN 'MANAGER' THEN SAL*1.1
        WHEN 'SALESMAN' THEN SAL*1.05
        WHEN 'ANALYST' THEN SAL
        ELSE SAL*1.03
    END AS BONUS
FROM EMP;

SELECT EMPNO, ENAME, JOB, SAL,
    CASE
        WHEN JOB = 'MANAGER' THEN SAL*1.1
        WHEN JOB = 'SALESMAN' THEN SAL*1.05
        WHEN JOB = 'ANALYST' THEN SAL
        ELSE SAL*1.03
    END AS BONUS
FROM EMP;

--COMM이 NULL이면 해당사항 없음, COMM 0이면 보너스 없음 COMM이 있으면 BONUS : 300
SELECT EMPNO, ENAME, COMM,
    CASE 
        WHEN COMM IS NULL THEN '해당사항 없음'
        WHEN COMM = 0 THEN '보너스 없음'
        WHEN COMM > 0 THEN 'BONUS : ' || COMM    
    END AS 보너스
FROM EMP;

--SAL 2900 DIAMOND 2700 GOLD 2000 SILVER
SELECT EMPNO, ENAME, SAL,
    CASE 
        WHEN SAL > 2900 THEN 'DIAMOND'
        WHEN SAL > 2700 THEN 'GOLD'
        WHEN SAL > 2000 THEN 'SILVER'
        ELSE '등급 없음'
    END AS 등급
FROM EMP;

--1, 2, 3, 4분기 입사
SELECT ENAME, HIREDATE, TO_CHAR(HIREDATE, 'Q'),
    CASE
        WHEN TO_CHAR(HIREDATE, 'Q') = '1' THEN '1분기 입사'
        WHEN TO_CHAR(HIREDATE, 'Q') = '2' THEN '2분기 입사'
        WHEN TO_CHAR(HIREDATE, 'Q') = '3' THEN '3분기 입사'
        WHEN TO_CHAR(HIREDATE, 'Q') = '4' THEN '4분기 입사'
        ELSE '해당 사항 없음'
    END AS 분기별_입사
FROM EMP;

--Q1
SELECT
EMPNO,
RPAD((SUBSTR(EMPNO,1,2)),LENGTH(EMPNO),'*') AS MASKING_EMPNO,
ENAME,
RPAD((SUBSTR(ENAME,1,1)), LENGTH(ENAME),'*') AS MASKING_ENAME
FROM EMP WHERE ENAME LIKE '_____';

--Q2
SELECT
EMPNO,
ENAME,
SAL,
TRUNC((SAL/21.5),2) AS DAY_PAY,
ROUND((SAL/21.5/8),1) AS TIME_PAY
FROM EMP;

--Q3
SELECT
EMPNO, ENAME, TO_CHAR(HIREDATE, 'YYYY/MM/DD') AS HIREDATE,
TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 3), 2), 'YYYY-MM-DD') AS R_JOB,
CASE 
        WHEN COMM IS NULL THEN 'N/A'
        WHEN COMM = 0 THEN '0'
        WHEN COMM > 0 THEN '' || COMM   
    END AS COMM
--NVL(TO_CHAR(COMM),'N/A') AS COMM
FROM EMP;

--Q4
SELECT
EMPNO, ENAME, NVL(TO_CHAR(MGR), ' ') AS MGR,
    CASE
        WHEN MGR IS NULL THEN '0000'
        WHEN SUBSTR(MGR,1,2) = 75 THEN '5555'
        WHEN SUBSTR(MGR,1,2) = 76 THEN '6666'
        WHEN SUBSTR(MGR,1,2) = 77 THEN '7777'
        WHEN SUBSTR(MGR,1,2) = 78 THEN '8888'
        ELSE '' || MGR
        --TO_CHAR(MGR)
    END AS CHG_MGR
FROM EMP;


