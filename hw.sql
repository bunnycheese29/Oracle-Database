
--  Q1 사원들이 근무하고 있는 근무 부서의 번호를 중복없이 가져오시오.  
SELECT DISTINCT DEPTNO FROM EMP;

-- Q2 사원들의 이름과 직무를 다음 양식으로 가져온다. 000 사원의 담당 직무는 XXX 입니다.  
SELECT ENAME || ' 사원의 담당 직무는 ' || JOB || ' 입니다.'
FROM EMP;

-- Q3 각 사원들의 급여액과 급여액에서 1000을 더한 값, 200을 뺀 값, 2를 곱한 값, 2로 나눈 값을 가져오시오.  
SELECT ENAME, SAL, SAL+1000, SAL-200, SAL*2, SAL/2
FROM EMP;

-- Q4 각 사원의 급여액, 커미션, 급여 + 커미션 액수를 가져오시오. 
SELECT ENAME, SAL, COMM, SAL+COMM
FROM EMP;

-- Q5 사원의 이름과 사원 번호를 가져온다.
SELECT EMPNO, ENAME
FROM EMP;

-- Q6 사원의 이름과 사원 번호, 직무, 급여를 가져온다.
SELECT ENAME, EMPNO, JOB, SAL
FROM EMP;

-- Q7 부서 번호와 부서 이름을 가져온다.
SELECT DEPTNO, DNAME
FROM DEPT;

-- Q8 부서의 모든 정보를 가져온다.
SELECT * FROM DEPT;

-- Q9 사원의 모든 정보를 가져온다.
SELECT * FROM EMP;

-- Q10 근무 부서가 10번인 사원들의 사원번호, 이름, 근무 부서를 가져온다. 
SELECT EMPNO, ENAME, DEPTNO
FROM EMP WHERE DEPTNO = 10;

-- Q11 근무 부서 번호가 10번이 아닌 사원들의 사원번호, 이름, 근무 부서 번호를 가져온다.
SELECT EMPNO, ENAME, DEPTNO
FROM EMP WHERE NOT DEPTNO = 10;

-- Q12 급여가 1500이상인 사원들의 사원번호, 이름, 급여를 가져온다.
SELECT EMPNO, ENAME, SAL
FROM EMP WHERE SAL > 1500;

-- Q13 이름이 SMITH 사원의 사원번호, 이름, 직무, 급여를 가져온다. 
SELECT EMPNO, ENAME, JOB, SAL
FROM EMP WHERE ENAME = 'SMITH';

-- Q14 직무가 SALESMAN인 사원의 사원번호, 이름, 직무를 가져온다. 
SELECT EMPNO, ENAME, JOB 
FROM EMP WHERE JOB = 'SALESMAN';

-- Q15 직무가 CLERK이 아닌 사원의 사원번호, 이름, 직무를 가져온다. 
SELECT EMPNO, ENAME, JOB
FROM EMP WHERE NOT JOB = 'CLERK';

-- Q16 1982년 1월 1일 이후에 입사한 사원의 사원번호, 이름, 입사일을 가져온다. 
SELECT EMPNO, ENAME, HIREDATE
FROM EMP WHERE HIREDATE > TO_DATE('1982/01/01', 'YYYY/MM/DD');

-- Q17 10번 부서에서 근무하고 있는 직무가 MANAGER인 사원의 사원번호, 이름, 근무부서, 직무를 가져온다.  
SELECT EMPNO, ENAME, DEPTNO, JOB
FROM EMP WHERE DEPTNO = 10 AND JOB = 'MANAGER';

-- Q18 입사년도가 1981년인 사원중에 급여가 1500 이상인 사원의 사원번호, 이름, 급여, 입사일을 가져온다.  
SELECT EMPNO, ENAME, SAL, TO_CHAR(HIREDATE, 'YYYY/MM/DD') 
FROM EMP WHERE SAL > 1500 AND TO_CHAR(HIREDATE, 'YYYY') = '1981';

-- Q19 20번 부서에 근무하고 있는 사원 중에 급여가 1500 이상인 사원의 사원번호, 이름, 부서번호, 급여를 가져온다.
SELECT EMPNO, ENAME, DEPTNO, SAL
FROM EMP WHERE SAL > 1500 AND DEPTNO = 20;

-- Q20 상관 사원 번호가 7698번인 사원중에 직무가 CLERK인 사원의 사원번호, 이름, 직속상관번호, 직무를 가져온다.
SELECT EMPNO, ENAME, MGR, JOB 
FROM EMP WHERE MGR = 7698 AND JOB = 'CLERK';

-- Q21 급여가 2000보다 크거나 1000보다 작은 사원의 사원번호, 이름, 급여를 가져온다.
SELECT EMPNO, ENAME, SAL 
FROM EMP WHERE SAL > 2000 OR SAL < 1000;

-- Q22 부서번호가 20이거나 30인 사원의 사원번호, 이름, 부서번호를 가져온다.
SELECT EMPNO, ENAME, DEPTNO
FROM EMP WHERE DEPTNO IN(20,30);

-- Q23 직무가 CLERK, SALESMAN, ANALYST인 사원의 사원번호, 이름, 직무를 가져온다.
SELECT EMPNO, ENAME, JOB 
FROM EMP WHERE JOB IN('CLERK','SALESMAN','ANALYST');

-- Q24 사원 번호가 7499, 7566, 7839가 아닌 사원들의 사원번호, 이름을 가져온다
SELECT EMPNO, ENAME 
FROM EMP WHERE EMPNO NOT IN(7499,7566,7839);

-- Q25 이름이 F로 시작하는 사원의 이름과 사원 번호를 가져온다.
SELECT ENAME, EMPNO
FROM EMP WHERE ENAME LIKE 'F%';

-- Q26 이름이 S로 끝나는 사원의 이름과 사원 번호를 가져온다.
SELECT ENAME, EMPNO
FROM EMP WHERE ENAME LIKE '%S';

-- Q27 이름에 A가 포함되어 있는 사원의 이름과 사원 번호를 가져온다.
SELECT ENAME, EMPNO
FROM EMP WHERE ENAME LIKE '%A%';

-- Q28 이름의 두번째 글자가 A인 사원의 사원 이름, 사원 번호를 가져온다.
SELECT ENAME, EMPNO
FROM EMP WHERE ENAME LIKE '_A%';

-- Q29 이름이 4글자인 사원의 사원 이름, 사원 번호를 가져온다.
SELECT ENAME, EMPNO
FROM EMP WHERE ENAME LIKE '____';

-- Q30 사원중에 커미션을 받지 않는 사원의 사원번호, 이름, 커미션을 가져온다.
SELECT EMPNO, ENAME, COMM 
FROM EMP WHERE COMM IS NULL;

-- Q31 회사 대표(직속상관이 없는 사람)의 이름과 사원번호를 가져온다.
SELECT ENAME, EMPNO
FROM EMP WHERE MGR IS NULL;

-- Q32 사원의 사원번호, 이름, 급여를 가져온다. 급여를 기준으로 오름차순 정렬을 한다.
SELECT EMPNO, ENAME, SAL
FROM EMP ORDER BY SAL;

-- Q33 사원의 사원번호, 이름, 급여를 가져온다. 사원번호를 기준으로 내림차순 정렬을 한다.
SELECT EMPNO, ENAME, SAL
FROM EMP ORDER BY SAL DESC;

-- Q34 사원의 사원번호, 이름을 가져온다, 사원의 이름을 기준으로 오름차순 정렬을 한다.
SELECT EMPNO, ENAME 
FROM EMP ORDER BY ENAME;

-- Q35 사원의 사원번호, 이름, 입사일을 가져온다. 입사일을 기준으로 내림차순 정렬을 한다.
SELECT EMPNO, ENAME, HIREDATE
FROM EMP ORDER BY HIREDATE DESC;

-- Q36 직무가 SALESMAN인 사원의 사원이름, 사원번호, 급여를 가져온다. 급여를 기준으로 오름차순 정렬을 한다.
SELECT ENAME, EMPNO, SAL
FROM EMP WHERE JOB = 'SALESMAN'
ORDER BY SAL;

-- Q37 1981년에 입사한 사원들의 사원번호, 사원 이름, 입사일을 가져온다. 사원 번호를 기준으로 내림차순 정렬을 한다.
SELECT EMPNO, ENAME, HIREDATE
FROM EMP ORDER BY EMPNO DESC;

-- Q38 사원의 이름, 급여, 커미션을 가져온다. 커미션을 기준으로 오름차순 정렬을 한다.
SELECT ENAME, SAL, COMM
FROM EMP ORDER BY COMM;
 
-- Q39 사원의 이름, 급여, 커미션을 가져온다. 커미션을 기준으로 내림차순 정렬을 한다.
SELECT ENAME, SAL, COMM
FROM EMP ORDER BY COMM DESC;

-- Q40 전직원의 급여를 2000 삭감하고 삭감한 급여액의 절대값을 구한다.
SELECT ENAME,SAL, ABS(SAL-2000) AS NEW_SAL
FROM EMP ;

-- Q41 급여가 1500 이상인 사원의 급여를 15% 삭감한다. 단 소수점 이하 는 버린다.
SELECT ENAME, SAL, TRUNC(SAL-(SAL*0.15)) AS NEW_SAL
FROM EMP WHERE SAL > 1500;

-- Q42 급여가 2천 이하인 사원들의 급여를 20%씩 인상한다. 단 10의 자리를 기준으로 반올림한다.
SELECT ENAME, SAL, SAL*1.2, ROUND(SAL*1.2,-2) AS NEW_SAL
FROM EMP WHERE SAL < 2000;

-- Q43 전 직원의 급여를 10자리 이하를 삭감한다
SELECT ENAME, SAL, TRUNC(SAL, -2) AS NEW_SAL
FROM EMP;

-- Q44. 각 사원의 부서 이름을 가져온다. ex) 10 : 인사과, 20 : 개발부, 30 : 경원지원팀,    40 : 생산부
SELECT ENAME, DEPTNO,
    CASE 
        WHEN DEPTNO = 10 THEN '10 : 인사과'
        WHEN DEPTNO = 20 THEN '20 : 개발부'
        WHEN DEPTNO = 30 THEN '30 : 경원지원팀'
        WHEN DEPTNO = 40 THEN '40 : 생산부'
    END AS 부서이름
    
FROM EMP
ORDER BY DEPTNO;

-- Q45 직급에 따라 인상된 급여액을 가져온다. ex) CLERK : 10% / SALESMAN : 15% / PRESIDENT : 200% / MANAGER : 5% / ANALYST : 20%
SELECT ENAME, JOB, SAL,
    CASE
        WHEN JOB = 'CLERK' THEN SAL+(SAL*0.1)
        WHEN JOB = 'SALESMAN' THEN SAL+(SAL*0.15)
        WHEN JOB = 'PRESIDENT' THEN SAL+(SAL*2)
        WHEN JOB = 'MANAGER' THEN SAL+(SAL*0.05)
        WHEN JOB = 'ANALYST' THEN SAL+(SAL*0.2)
    END AS NEW_SAL
FROM EMP;

-- Q46 급여액 별 등급을 가져온다.  ex) 1000 미만 : C등급 / 1000 이상 2000미만 : B등급 / 2000 이상 : A등급
SELECT SAL,
    CASE
        WHEN SAL < 1000 THEN 'C등급'
        WHEN SAL >= 1000 AND SAL < 2000 THEN 'B등급'
        WHEN SAL >= 2000 THEN 'A등급'
    END AS 등급
FROM EMP;

-- Q47 직원들의 급여를 다음과 같이 인상한다.  ex) 1000 이하 : 100% / 1000 초과 2000미만 : 50% / 2000 이상 : 200%
SELECT ENAME, SAL, 
    CASE
        WHEN SAL < 1000 THEN SAL
        WHEN SAL >= 1000 AND SAL < 2000 THEN SAL*1.5
        WHEN SAL >= 2000 THEN SAL*2
    END AS 인상후
FROM EMP;

-- Q48 사원들의 커미션 총합을 구한다.
SELECT SUM(COMM) FROM EMP;

-- Q49 급여가 1500 이상인 사원들의 급여 총합을 구한다.
SELECT SUM(SAL) FROM EMP WHERE SAL > 1500;

-- Q50 20번 부서에 근부하고 있는 사원들의 급여 총합을 구한다.
SELECT SUM(SAL) FROM EMP WHERE DEPTNO = 20;

-- Q51 직무가 SALESMAN인 사원들의 급여 총합을 구한다.
SELECT SUM(SAL) FROM EMP WHERE JOB = 'SALESMAN';

--? Q52 직무가 SALESMAN인 사원들의 이름과 급여총합을 가져온다.
SELECT ENAME, SUM(SAL) AS 급여총합
FROM EMP WHERE JOB = 'SALESMAN'
GROUP BY ENAME;

-- Q53 전 사원의 급여 평균을 구한다.
SELECT TRUNC(AVG(SAL)) FROM EMP;


--? Q54 커미션을 받는 사원들의 커미션 평균을 구한다.
SELECT AVG(COMM) FROM EMP WHERE COMM IS NOT NULL;

-- Q55 전 사원의 커미션의 평균을 구한다.
SELECT AVG(COMM) FROM EMP;

-- Q56 커미션을 받는 사원들의 급여 평균을 구한다.
SELECT AVG(SAL) FROM EMP WHERE COMM IS NOT NULL;

-- Q57 30번 부서에 근무하고 있는 사원들의 급여 평균을 구한다.
SELECT TRUNC(AVG(SAL)) FROM EMP WHERE DEPTNO = 30;

-- Q58 직무가 SALESMAN인 사원들의 급여 + 커미션 평균을 구한다.
SELECT AVG(SAL+COMM) FROM EMP WHERE JOB = 'SALESMAN';

-- Q59 사원들의 총 수를 가져온다.
SELECT COUNT(ENAME) FROM EMP;

-- Q60 커미션을 받는 사원들의 총 수를 가져온다.
SELECT COUNT(ENAME) FROM EMP WHERE COMM IS NOT NULL;

-- Q61 사원들의 급여 최대, 최소값을 가져온다.
SELECT MAX(SAL) AS 최대급여, MIN(SAL) AS 최소급여 FROM EMP;

-- Q62 각 부서별 사원들의 급여 평균을 구한다.
SELECT DEPTNO, TRUNC(AVG(SAL))
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

-- Q63 각 직무별 사원들의 급여 총합을 구한다.
SELECT JOB, TRUNC(SUM(SAL)) AS 급여총합
FROM EMP
GROUP BY JOB;

-- Q64 1500 이상 급여를 받는 사원들의 부서별 급여 평균을 구한다.
SELECT DEPTNO, TRUNC(AVG(SAL)) AS 급여평균
FROM EMP
WHERE SAL >= 1500
GROUP BY DEPTNO
ORDER BY DEPTNO;

-- Q65 부서별 평균 급여가 2000이상인 부서의 급여 평균을 가져온다.
SELECT DEPTNO, TRUNC(AVG(SAL)) AS 급여평균
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL)>=2000
ORDER BY DEPTNO;

-- Q66 부서별 최대 급여액이 3000이하인 부서의 급여 총합을 가져온다.
SELECT DEPTNO, SUM(SAL) AS 급여총합
FROM EMP
GROUP BY DEPTNO
HAVING MAX(SAL) < 3000;

-- Q67 부서별 최소 급여액이 1000 이하인 부서에서 직무가 CLERK인 사원들의 급여 총합을 구한다
SELECT DEPTNO, SUM(SAL) AS 급여총합
FROM EMP
WHERE JOB = 'CLERK'
GROUP BY DEPTNO
HAVING MIN(SAL) < 1000
ORDER BY DEPTNO;

-- Q68 각 부서의 급여 최소가 900이상 최대가 10000이하인 부서의 사원들 중1500이상의 급여를 받는 사원들의 평균 급여액을 가져온다.
SELECT DEPTNO, AVG(SAL) AS 평균급여
FROM EMP
WHERE SAL > 1500
GROUP BY DEPTNO
HAVING MIN(SAL) > 900 AND MAX(SAL) < 10000
ORDER BY DEPTNO;


