-- 검색(R)
-- SELECT * FROM DEPT;
-- 기본형
-- SELECT 컬럼명 FROM 테이블명 
-- WHERE 조건컬럼 = '' 또는 LIKE '%' ;
-- ORDER BY 정렬대상컬럼[복수개] ASC[오름차순] 또는 DESC[내림차순]; 컬럼ID로도 가능
-- SELECT 컬럼의 순서에 따라 출력되는 위치가 바뀜

-- DESC 테이블명
-- 테이블의 구조를 보여주는 명령어
-- *NUMBER : 정수, 실수를 표기하는 자료형(*)
-- NUMBER(4) : 4는 숫자 4자리
-- NUMBER(7, 2) : 7은 정수자리수7자리 , 2는 소수자리 2자리
-- *VARCHAR2 : 문자열을 표기하는 자료형(*)
-- 참고)KSC5601 : 영어(한글자) 1BYTE , 한글(한글자) 2BYTE
-- *UTF8 설정 : 영어(한글자)1BYTE, 한글(한글자) 3BYTE
-- VARCHAR2(10) : 10은 자리수를 의미.
-- *DATE :날짜를 표기하는 자료형
DESC EMP;

SELECT EMPNO, ENAME, SAL*12  FROM EMP;

SELECT ENAME, SALARY, SALARY*12 FROM employee;
-- SELECT 절에 컬럼 + 다른컬럼 => 계산가능
-- 컬럼 + 다른컬럼(NULL값이 있으면) = NULL(해당 데이터)
-- SALARY : 월급
-- SALARY * 12 : 연봉
-- SALARY * 12 + COMMISSION(보너스 , 인센티브) : 최종 1년치 연봉
-- 문제점) 상기 값에 (COMMISSION)NULL이 있어서 제대로 최종 1년치 연봉이 나오지않음.
SELECT ENAME SALARY, JOB , DNO, 
COMMISSION, SALARY*12, SALARY*12+COMMISSION
FROM employee;

-- 문제점) 상기 값에 (COMMISSION)NULL이 있어서 제대로 최종 1년치 연봉이 나오지않음.
-- 해결) NULL컬럼을 0으로 변환 내장함수 적용.
-- NVL(컬럼명, 변경값)
-- SELECT 절에 AS 별칭(Alias) 줄수있음

SELECT ENAME SALARY, JOB , DNO, 
NVL(COMMISSION, 0), SALARY*12 AS 연봉, SALARY*12 + NVL(COMMISSION,0) AS 최종연봉
FROM employee;

-- 컬럼에 별칭(Alias) #2 띄어쓰기 , 특수문자 사용시 "별칭이름"
SELECT ENAME,
       SALARY,
       JOB,
       DNO,
       NVL(COMMISSION, 0),
       SALARY*12 AS "연   봉",
       SALARY*12 + NVL(COMMISSION,0) AS "최_종_연_봉"
FROM EMPLOYEE;

-- DISTINCT 컬럼명 : 중복된값 제거하여 보기 (실제 테이블 데이터값은 유지)
SELECT DISTINCT DNO AS 부서번호
FROM EMPLOYEE;

-- 테스트용, 간이 계산용 내장테이블 소개
-- 테이블 명 : DUAL
DESC DUAL;
SELECT 10*4/3 FROM DUAL;

-- 현재 시간, 날짜 출력하기 (내장함수) : SYSDATE
SELECT SYSDATE FROM DEPARTMENT;

-- DUAL : 데이터가 한건인 간이테이블.
SELECT SYSDATE FROM DUAL;

-- 조건 : 범위 검색
-- SALARY(월급) 1500이상 직원 데이터검색
-- = : 같다. > : 보다 크다, < : 보다 작다 , <> : 같지않다.
SELECT * FROM EMPLOYEE
WHERE SALARY >= 1500;

-- 문제 1) 직원(EMPLOYEE) 테이블에서 부서번호(DNO)가 20보다 큰 직원을 모두 출력.

SELECT * FROM EMPLOYEE WHERE DNO > 20;

-- 문자열 검색 : 홑따옴표

SELECT * FROM employee
WHERE ENAME = 'SCOTT';

-- 날짜 데이터 검색
SELECT * FROM employee
WHERE HIREDATE <= '1981/01/01';

-- 날짜 포맷을 변경해서 문자열로 출력하는 (내장함수)
-- TO_CHAR(컬럼명, 'YYYY,MM,DD') 구분자 : , . / _ 아무거나 적용가능
-- TO_CHAR(컬럼명, 변경포맷) : 날짜, 날짜컬럼 => 문자열로 변경(지정된 포맷)
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;

-- 문자열을 날짜 데이터형식으로 변경하는 (내장함수)
-- TO_DATE(컬럼명, 변경포맷) : 문자열을 실제 데이터로 변경포맷
SELECT TO_DATE('2022-04-29 12:00:00', 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;

-- 논리연산자 : AND(동시에 참) , OR(둘중 하나가 참이면 참) , NOT(반대)

-- 문제 2) 부서 번호가 10이고 직급이 'MANAGER' 인 사원만 출력하기.
-- DNO : 부서번호
-- JOB : 직급
-- EMPLOYEE : 대상테이블 
SELECT * FROM EMPLOYEE WHERE DNO = 10 and JOB = 'MANAGER';

-- 문제3) 부서 번호가 10이거나 직급이 'MANAGER' 인 사원만 출력하기.
SELECT * FROM EMPLOYEE WHERE DNO = 10 OR JOB = 'MANAGER';
-- 문제4) 10번 부서에 소속된 사원만 제외하고 나머지 사원의 정보를 출력
SELECT * FROM EMPLOYEE WHERE NOT DNO = 10;  
-- 문제5) 급여가 1000 에서 1500 사이의 사원을 출력하세요.
SELECT * FROM EMPLOYEE WHERE 1000 <= SALARY and SALARY <= 1500;  
-- 문제6) 급여가 1000 미만이거나 1500초과인 사원을 출력하세요
SELECT * FROM EMPLOYEE WHERE 1000 > SALARY OR SALARY > 1500;
-- 문제7) 커미션이 300이거나 500이거나 1400인 사원을 출력하세요.
SELECT * FROM EMPLOYEE WHERE COMMISSION = 300 
    or COMMISSION = 500 or COMMISSION = 1400;
    
-- 범위검색 2
-- 문제5) 급여가 1000 에서 1500 사이의 사원을 출력하세요.
SELECT * FROM EMPLOYEE WHERE SALARY >= 1000 and SALARY <= 1500;
-- 위랑 동일 문법
-- WHERE절 컬럼명 BETWEEN 초기값 AND 끝값;
-- 초기값 ~ 끝값 사이의 값을 출력하기
-- 문제5) 급여가 1000 에서 1500 사이의 사원을 출력하세요.
SELECT * FROM EMPLOYEE WHERE SALARY BETWEEN 1000 and 1500;

-- 문제6) 급여가 1000 미만이거나 1500초과인 사원을 출력하세요
SELECT * FROM EMPLOYEE WHERE 1000 > SALARY OR SALARY > 1500;
-- 위랑 동일 문법
-- WHERE절 컬럼명 NOT BETWEEN 초기값 AND 끝값;
-- 초기값보다 작거나 끝값보다 큰값
SELECT * FROM EMPLOYEE WHERE SALARY NOT BETWEEN 1000 AND 1500;

--  문제8) 1982년에 입사한 사원 출력하기
-- BETWEEN AND 써서 출력하기
SELECT * FROM EMPLOYEE WHERE HIREDATE BETWEEN '1982/01/01' AND '1982/12/31';

-- 문제7) 커미션이 300이거나 500이거나 1400인 사원을 출력하세요.
SELECT * FROM EMPLOYEE
WHERE COMMISSION = 300 OR COMMISSION = 500 OR COMMISSION = 1400;
-- 위와 동일 문법
SELECT * FROM EMPLOYEE
WHERE COMMISSION IN(300,500,1400);

-- COMMISSION 300이 아니고 500도 아니고 1400도 아닌 직원출력
SELECT * FROM EMPLOYEE
WHERE COMMISSION <> 300 AND COMMISSION <> 500 AND COMMISSION <> 1400;
-- 위와 동일 문법
SELECT * FROM EMPLOYEE
WHERE COMMISSION NOT IN(300, 500, 1400);

-- LIKE 용법 심층해서 검토
-- 1. WHERE 컬럼명 LIKE '문자%'
SELECT * FROM EMPLOYEE
WHERE ENAME LIKE 'F%';

-- 2. WHERE 컬럼명 LIKE '%문자%' 문자로 나오는 사람은 모두 출력
SELECT * FROM EMPLOYEE
WHERE ENAME LIKE '%M%';

-- 문제9) 이름이 'N'으로 끝나는 사원 검색하기.
SELECT * FROM EMPLOYEE WHERE ENAME LIKE '%N' ;

-- 이름이 세번째 글짜가 A인 사원 출력


-- A가안들어가는 사원이읆
SELECT * FROM EMPLOYEE
WHERE ENAME NOT LIKE 'A%';

-- 문제 11) 직원 테이블에서 날짜 정보를 내림차순으로 정렬 출려.











