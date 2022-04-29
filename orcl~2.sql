-- 연습문제 1)
-- 덧셈 연산자를 이용하여 모든 사원에 대해서 $300의 급여 인상을 계산한 후
-- 사원의 이름, 급여, 인상된 급여를 출력하시오.
SELECT * FROM EMPLOYEE;

SELECT ENO, ENAME, JOB, MANAGER, HIREDATE, SALARY,
SALARY+300 , COMMISSION, DNO FROM EMPLOYEE;

-- 연습문제 2)
-- 사원의이름, 급여, 연간 총수입을 총 수입이 많은 것 부터 작은 순으로 출력하세요.
-- (연간 총수입은 월급에 12를 곱한후 $100의 상여금을 더해서 계산하세요)
SELECT
ENO, ENAME, JOB, MANAGER, HIREDATE, SALARY,
SALARY*12+100 AS 연간총수입 , COMMISSION, DNO FROM EMPLOYEE ORDER BY SALARY ASC;
-- 연습문제 3)
-- 급여가 2000을 넘는 사원의 이름과 급여를 급여가 많은 것부터 작은 순으로 출력.

SELECT * FROM EMPLOYEE WHERE SALARY > 2000 ORDER BY SALARY DESC;

-- 연습문제 4)
-- 사원번호가 7788인 사원의 이름과 부서 출력.

SELECT ENAME, NO
FROM EMPLOYEE;

-- 연습문제 5)
-- 급여가 2000에서 3000사이에 포함되지 않는 사원의 이름과 급여를 출력하세요.
SELECT ENAME,SALARY 
FROM EMPLOYEE 
WHERE SALARY NOT BETWEEN 2000 AND 3000;
-- 연습문제 6)
-- 1981년 2월 20일 부터 1981년 5월 1일 사이에 입사한
-- 사원의 이름, 담당 업무, 입사일을 출력.
-- JOB 컬럼 : 담당업무
SELECT ENAME, JOB, HIREDATE FROM EMPLOYEE 
WHERE HIREDATE 
BETWEEN '1981/02/20' AND '1981/05/01';


-- 연습문제 7)
-- 부서번호가 20 및 30에 속한 사원의 이름과 부서번호를 출력하되
-- 이름을 기준으로 내림차순 영문자순으로 출력.

SELECT DNO, ENAME FROM EMPLOYEE WHERE DNO IN(20,30) ORDER BY ENAME DESC;

-- 연습문제 8)
-- 사원의 급여가 2000 에서 3000 사이에 포함되고 부서번호가 20 또는 30인
-- 사원이름 , 급여 , 부서번호를 출력하되 이름(오름차순) 출력.

SELECT ENAME, SALARY, DNO 
FROM EMPLOYEE 
WHERE SALARY BETWEEN 2000 AND 3000 
AND DNO IN(20,30) ORDER BY ENAME;

-- 연습문제 9)
-- 1981년도에 입사한 사원의 이름, 입사일을 출력
-- 단, LIKE 연산자와 와일드카드를 사용.

SELECT ENAME, ENO, HIREDATE FROM EMPLOYEE WHERE HIREDATE LIKE '81%';

-- 연습문제 10)
-- 관리자가 없는 사원의 이름과 담당 업무 출력
-- MANAGER 컬럼 : 관리자 컬럼
SELECT ENAME, JOB FROM EMPLOYEE WHERE MANAGER IS NULL ;


-- 연습문제 11)
-- COMMITION을 받을 수 있는 자격이 되는 사원의이름, 급여, 커미션을 출력하되
-- 급여 및 커미션을 기준으로 내림차순 정렬.

SELECT ENAME, SALARY, COMMISSION
FROM EMPLOYEE
WHERE COMMISSION IS NOT NULL
ORDER BY SALARY DESC , COMMISSION DESC;

-- 연습문제 12)
-- 이름의 세번째 문자가 R인 사원의 이름을 표시하세요.
SELECT * FROM EMPLOYEE WHERE ENAME LIKE '__R%';
-- 연습문제 13)
-- 이름에 A와 E를 모두 포함하고 있는 사원의 이름을 표시
SELECT * FROM EMPLOYEE WHERE ENAME LIKE 'A%E%';
-- 연습문제 14)
-- 담당업무 (JOB컬럼) 가 사무원(CLERK) 또는 영업사원 (SALESMAN) 이면서
-- 급여가 $1600, $950 또는 $1300이 아닌 사원의 이름, 담당 업무, 급여를 출력.
SELECT ENAME, JOB, SALARY FROM EMPLOYEE WHERE JOB IN ('CLERK' , 'SALESMAN')
AND SALARY NOT IN (1600,950,1300);

-- 연습문제 15)
-- 커미션 (상여금)이 $500이상인 사원의 이름과 급여 및 커미션(상여금)을 출력하세요.
SELECT ENAME, COMMISSION FROM EMPLOYEE WHERE COMMISSION >= 500;

-- Oracle 오라클 : 내장함수 1
-- 1) UPPER(문자열) 2) LOWER(문자열) 3) INITCAP(문자열)
-- DUAL : 간이테이블
SELECT 'Oracle mania',
    UPPER('Oracle mania')AS대문자,
    LOWER('Oracle mania')AS소문자,
    INITCAP('Oracle mania')AS 첫글자대문자
FROM DUAL;

SELECT ENAME,
    LOWER(ENAME),
    JOB,
    INITCAP(JOB)
FROM EMPLOYEE;

-- scott 사원 검색하기
-- 컬럼의 데이터를 일괄 소문자로 변경해서 비교할 수도 있음
-- 성능은 안좋음

SELECT ENO, ENAME, DNO FROM EMPLOYEE
WHERE LOWER(ENAME) = 'scott';
-- 참고
SELECT ENO, ENAME, DNO FROM EMPLOYEE
WHERE INITCAP(ENAME) = 'Scott';

-- 오라클 : 내장함수 2
-- 문자길이를 반환하는 함수 : LENGTH(문자열) / 한글, 영어 문자개수 세어서 반환 
SELECT LENGTH('OracleMania'),
    LENGTH('오라클매니아') 
    FROM DUAL;
    
-- 내장함수 3) 문자 조작함수
-- CONCAT : 문자의 값을 연결하는 함수
-- 참고) 문자열 || 문자열 : 문자열 붙히기가 됨
SELECT 'ORacle', 'mania', concat('Oracle','mania') FROM DUAL;
SELECT 'ORacle', 'mania', 'Oracle' ||'mania' FROM DUAL;

-- 내장함수4) 문자 조작함수
-- 문자열 자르기
-- SUBSTR(대상컬럼(문자), 시작위치, 갯수) : 인덱스가 1부터 시작
SELECT SUBSTR('Oracle mania',4,3) FROM DUAL;

-- 문제 12)
-- 이름이 N으로 끝나는 사원 표시하기
-- 대상 테이블 : EMPLOYEE
SELECT * FROM EMPLOYEE WHERE SUBSTR(ENAME, -1, 1) = 'N';

-- 문제 13)
-- 87년도에 입사한 사원 표시하기
-- 대상 테이블 : EMPLOYEE
-- WHERE절에 내장함수를 쓰면 성능에 안좋음
SELECT * FROM EMPLOYEE WHERE SUBSTR(HIREDATE, 1, 2) = '87';

-- SUBSTRB(대상컬럼(문자), 시작위치, 갯수) : 문자 BYTE 기준으로 잘라서 출력.
-- 영문 : SUBSTR / SUBSTRB 결과 동일
-- 한글 : SUBSTR / SUBSTRB 결과 다름

-- 내장함수 5) 문자열 에서 대상 문자 찾아서 인덱스 번호 반환
-- 오라클에서는 인덱스번호가 1부터 시작함.
-- INSTR(대상컬럼(문자), 찾을글자, 시작위치, 몇번째 발견)
SELECT INSTR('Oracle mania', 'a')
FROM DUAL;

-- 문자열에서 'a'의 위치를 5번째위치부터 차지 시작하고
-- 두번째 'a'를 찾았을때의 인덱스번호를 반환
SELECT INSTR('Oracle mania', 'a', 5, 2)
FROM DUAL;


