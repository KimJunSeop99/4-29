-- �˻�(R)
-- SELECT * FROM DEPT;
-- �⺻��
-- SELECT �÷��� FROM ���̺�� 
-- WHERE �����÷� = '' �Ǵ� LIKE '%' ;
-- ORDER BY ���Ĵ���÷�[������] ASC[��������] �Ǵ� DESC[��������]; �÷�ID�ε� ����
-- SELECT �÷��� ������ ���� ��µǴ� ��ġ�� �ٲ�

-- DESC ���̺��
-- ���̺��� ������ �����ִ� ��ɾ�
-- *NUMBER : ����, �Ǽ��� ǥ���ϴ� �ڷ���(*)
-- NUMBER(4) : 4�� ���� 4�ڸ�
-- NUMBER(7, 2) : 7�� �����ڸ���7�ڸ� , 2�� �Ҽ��ڸ� 2�ڸ�
-- *VARCHAR2 : ���ڿ��� ǥ���ϴ� �ڷ���(*)
-- ����)KSC5601 : ����(�ѱ���) 1BYTE , �ѱ�(�ѱ���) 2BYTE
-- *UTF8 ���� : ����(�ѱ���)1BYTE, �ѱ�(�ѱ���) 3BYTE
-- VARCHAR2(10) : 10�� �ڸ����� �ǹ�.
-- *DATE :��¥�� ǥ���ϴ� �ڷ���
DESC EMP;

SELECT EMPNO, ENAME, SAL*12  FROM EMP;

SELECT ENAME, SALARY, SALARY*12 FROM employee;
-- SELECT ���� �÷� + �ٸ��÷� => ��갡��
-- �÷� + �ٸ��÷�(NULL���� ������) = NULL(�ش� ������)
-- SALARY : ����
-- SALARY * 12 : ����
-- SALARY * 12 + COMMISSION(���ʽ� , �μ�Ƽ��) : ���� 1��ġ ����
-- ������) ��� ���� (COMMISSION)NULL�� �־ ����� ���� 1��ġ ������ ����������.
SELECT ENAME SALARY, JOB , DNO, 
COMMISSION, SALARY*12, SALARY*12+COMMISSION
FROM employee;

-- ������) ��� ���� (COMMISSION)NULL�� �־ ����� ���� 1��ġ ������ ����������.
-- �ذ�) NULL�÷��� 0���� ��ȯ �����Լ� ����.
-- NVL(�÷���, ���氪)
-- SELECT ���� AS ��Ī(Alias) �ټ�����

SELECT ENAME SALARY, JOB , DNO, 
NVL(COMMISSION, 0), SALARY*12 AS ����, SALARY*12 + NVL(COMMISSION,0) AS ��������
FROM employee;

-- �÷��� ��Ī(Alias) #2 ���� , Ư������ ���� "��Ī�̸�"
SELECT ENAME,
       SALARY,
       JOB,
       DNO,
       NVL(COMMISSION, 0),
       SALARY*12 AS "��   ��",
       SALARY*12 + NVL(COMMISSION,0) AS "��_��_��_��"
FROM EMPLOYEE;

-- DISTINCT �÷��� : �ߺ��Ȱ� �����Ͽ� ���� (���� ���̺� �����Ͱ��� ����)
SELECT DISTINCT DNO AS �μ���ȣ
FROM EMPLOYEE;

-- �׽�Ʈ��, ���� ���� �������̺� �Ұ�
-- ���̺� �� : DUAL
DESC DUAL;
SELECT 10*4/3 FROM DUAL;

-- ���� �ð�, ��¥ ����ϱ� (�����Լ�) : SYSDATE
SELECT SYSDATE FROM DEPARTMENT;

-- DUAL : �����Ͱ� �Ѱ��� �������̺�.
SELECT SYSDATE FROM DUAL;

-- ���� : ���� �˻�
-- SALARY(����) 1500�̻� ���� �����Ͱ˻�
-- = : ����. > : ���� ũ��, < : ���� �۴� , <> : �����ʴ�.
SELECT * FROM EMPLOYEE
WHERE SALARY >= 1500;

-- ���� 1) ����(EMPLOYEE) ���̺��� �μ���ȣ(DNO)�� 20���� ū ������ ��� ���.

SELECT * FROM EMPLOYEE WHERE DNO > 20;

-- ���ڿ� �˻� : Ȭ����ǥ

SELECT * FROM employee
WHERE ENAME = 'SCOTT';

-- ��¥ ������ �˻�
SELECT * FROM employee
WHERE HIREDATE <= '1981/01/01';

-- ��¥ ������ �����ؼ� ���ڿ��� ����ϴ� (�����Լ�)
-- TO_CHAR(�÷���, 'YYYY,MM,DD') ������ : , . / _ �ƹ��ų� ���밡��
-- TO_CHAR(�÷���, ��������) : ��¥, ��¥�÷� => ���ڿ��� ����(������ ����)
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;

-- ���ڿ��� ��¥ �������������� �����ϴ� (�����Լ�)
-- TO_DATE(�÷���, ��������) : ���ڿ��� ���� �����ͷ� ��������
SELECT TO_DATE('2022-04-29 12:00:00', 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;

-- �������� : AND(���ÿ� ��) , OR(���� �ϳ��� ���̸� ��) , NOT(�ݴ�)

-- ���� 2) �μ� ��ȣ�� 10�̰� ������ 'MANAGER' �� ����� ����ϱ�.
-- DNO : �μ���ȣ
-- JOB : ����
-- EMPLOYEE : ������̺� 
SELECT * FROM EMPLOYEE WHERE DNO = 10 and JOB = 'MANAGER';

-- ����3) �μ� ��ȣ�� 10�̰ų� ������ 'MANAGER' �� ����� ����ϱ�.
SELECT * FROM EMPLOYEE WHERE DNO = 10 OR JOB = 'MANAGER';
-- ����4) 10�� �μ��� �Ҽӵ� ����� �����ϰ� ������ ����� ������ ���
SELECT * FROM EMPLOYEE WHERE NOT DNO = 10;  
-- ����5) �޿��� 1000 ���� 1500 ������ ����� ����ϼ���.
SELECT * FROM EMPLOYEE WHERE 1000 <= SALARY and SALARY <= 1500;  
-- ����6) �޿��� 1000 �̸��̰ų� 1500�ʰ��� ����� ����ϼ���
SELECT * FROM EMPLOYEE WHERE 1000 > SALARY OR SALARY > 1500;
-- ����7) Ŀ�̼��� 300�̰ų� 500�̰ų� 1400�� ����� ����ϼ���.
SELECT * FROM EMPLOYEE WHERE COMMISSION = 300 
    or COMMISSION = 500 or COMMISSION = 1400;
    
-- �����˻� 2
-- ����5) �޿��� 1000 ���� 1500 ������ ����� ����ϼ���.
SELECT * FROM EMPLOYEE WHERE SALARY >= 1000 and SALARY <= 1500;
-- ���� ���� ����
-- WHERE�� �÷��� BETWEEN �ʱⰪ AND ����;
-- �ʱⰪ ~ ���� ������ ���� ����ϱ�
-- ����5) �޿��� 1000 ���� 1500 ������ ����� ����ϼ���.
SELECT * FROM EMPLOYEE WHERE SALARY BETWEEN 1000 and 1500;

-- ����6) �޿��� 1000 �̸��̰ų� 1500�ʰ��� ����� ����ϼ���
SELECT * FROM EMPLOYEE WHERE 1000 > SALARY OR SALARY > 1500;
-- ���� ���� ����
-- WHERE�� �÷��� NOT BETWEEN �ʱⰪ AND ����;
-- �ʱⰪ���� �۰ų� �������� ū��
SELECT * FROM EMPLOYEE WHERE SALARY NOT BETWEEN 1000 AND 1500;

--  ����8) 1982�⿡ �Ի��� ��� ����ϱ�
-- BETWEEN AND �Ἥ ����ϱ�
SELECT * FROM EMPLOYEE WHERE HIREDATE BETWEEN '1982/01/01' AND '1982/12/31';

-- ����7) Ŀ�̼��� 300�̰ų� 500�̰ų� 1400�� ����� ����ϼ���.
SELECT * FROM EMPLOYEE
WHERE COMMISSION = 300 OR COMMISSION = 500 OR COMMISSION = 1400;
-- ���� ���� ����
SELECT * FROM EMPLOYEE
WHERE COMMISSION IN(300,500,1400);

-- COMMISSION 300�� �ƴϰ� 500�� �ƴϰ� 1400�� �ƴ� �������
SELECT * FROM EMPLOYEE
WHERE COMMISSION <> 300 AND COMMISSION <> 500 AND COMMISSION <> 1400;
-- ���� ���� ����
SELECT * FROM EMPLOYEE
WHERE COMMISSION NOT IN(300, 500, 1400);

-- LIKE ��� �����ؼ� ����
-- 1. WHERE �÷��� LIKE '����%'
SELECT * FROM EMPLOYEE
WHERE ENAME LIKE 'F%';

-- 2. WHERE �÷��� LIKE '%����%' ���ڷ� ������ ����� ��� ���
SELECT * FROM EMPLOYEE
WHERE ENAME LIKE '%M%';

-- ����9) �̸��� 'N'���� ������ ��� �˻��ϱ�.
SELECT * FROM EMPLOYEE WHERE ENAME LIKE '%N' ;

-- �̸��� ����° ��¥�� A�� ��� ���


-- A���ȵ��� ����̟�
SELECT * FROM EMPLOYEE
WHERE ENAME NOT LIKE 'A%';

-- ���� 11) ���� ���̺��� ��¥ ������ ������������ ���� ���.











