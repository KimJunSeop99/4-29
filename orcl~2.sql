-- �������� 1)
-- ���� �����ڸ� �̿��Ͽ� ��� ����� ���ؼ� $300�� �޿� �λ��� ����� ��
-- ����� �̸�, �޿�, �λ�� �޿��� ����Ͻÿ�.
SELECT * FROM EMPLOYEE;

SELECT ENO, ENAME, JOB, MANAGER, HIREDATE, SALARY,
SALARY+300 , COMMISSION, DNO FROM EMPLOYEE;

-- �������� 2)
-- ������̸�, �޿�, ���� �Ѽ����� �� ������ ���� �� ���� ���� ������ ����ϼ���.
-- (���� �Ѽ����� ���޿� 12�� ������ $100�� �󿩱��� ���ؼ� ����ϼ���)
SELECT
ENO, ENAME, JOB, MANAGER, HIREDATE, SALARY,
SALARY*12+100 AS �����Ѽ��� , COMMISSION, DNO FROM EMPLOYEE ORDER BY SALARY ASC;
-- �������� 3)
-- �޿��� 2000�� �Ѵ� ����� �̸��� �޿��� �޿��� ���� �ͺ��� ���� ������ ���.

SELECT * FROM EMPLOYEE WHERE SALARY > 2000 ORDER BY SALARY DESC;

-- �������� 4)
-- �����ȣ�� 7788�� ����� �̸��� �μ� ���.

SELECT ENAME, NO
FROM EMPLOYEE;

-- �������� 5)
-- �޿��� 2000���� 3000���̿� ���Ե��� �ʴ� ����� �̸��� �޿��� ����ϼ���.
SELECT ENAME,SALARY 
FROM EMPLOYEE 
WHERE SALARY NOT BETWEEN 2000 AND 3000;
-- �������� 6)
-- 1981�� 2�� 20�� ���� 1981�� 5�� 1�� ���̿� �Ի���
-- ����� �̸�, ��� ����, �Ի����� ���.
-- JOB �÷� : ������
SELECT ENAME, JOB, HIREDATE FROM EMPLOYEE 
WHERE HIREDATE 
BETWEEN '1981/02/20' AND '1981/05/01';


-- �������� 7)
-- �μ���ȣ�� 20 �� 30�� ���� ����� �̸��� �μ���ȣ�� ����ϵ�
-- �̸��� �������� �������� �����ڼ����� ���.

SELECT DNO, ENAME FROM EMPLOYEE WHERE DNO IN(20,30) ORDER BY ENAME DESC;

-- �������� 8)
-- ����� �޿��� 2000 ���� 3000 ���̿� ���Եǰ� �μ���ȣ�� 20 �Ǵ� 30��
-- ����̸� , �޿� , �μ���ȣ�� ����ϵ� �̸�(��������) ���.

SELECT ENAME, SALARY, DNO 
FROM EMPLOYEE 
WHERE SALARY BETWEEN 2000 AND 3000 
AND DNO IN(20,30) ORDER BY ENAME;

-- �������� 9)
-- 1981�⵵�� �Ի��� ����� �̸�, �Ի����� ���
-- ��, LIKE �����ڿ� ���ϵ�ī�带 ���.

SELECT ENAME, ENO, HIREDATE FROM EMPLOYEE WHERE HIREDATE LIKE '81%';

-- �������� 10)
-- �����ڰ� ���� ����� �̸��� ��� ���� ���
-- MANAGER �÷� : ������ �÷�
SELECT ENAME, JOB FROM EMPLOYEE WHERE MANAGER IS NULL ;


-- �������� 11)
-- COMMITION�� ���� �� �ִ� �ڰ��� �Ǵ� ������̸�, �޿�, Ŀ�̼��� ����ϵ�
-- �޿� �� Ŀ�̼��� �������� �������� ����.

SELECT ENAME, SALARY, COMMISSION
FROM EMPLOYEE
WHERE COMMISSION IS NOT NULL
ORDER BY SALARY DESC , COMMISSION DESC;

-- �������� 12)
-- �̸��� ����° ���ڰ� R�� ����� �̸��� ǥ���ϼ���.
SELECT * FROM EMPLOYEE WHERE ENAME LIKE '__R%';
-- �������� 13)
-- �̸��� A�� E�� ��� �����ϰ� �ִ� ����� �̸��� ǥ��
SELECT * FROM EMPLOYEE WHERE ENAME LIKE 'A%E%';
-- �������� 14)
-- ������ (JOB�÷�) �� �繫��(CLERK) �Ǵ� ������� (SALESMAN) �̸鼭
-- �޿��� $1600, $950 �Ǵ� $1300�� �ƴ� ����� �̸�, ��� ����, �޿��� ���.
SELECT ENAME, JOB, SALARY FROM EMPLOYEE WHERE JOB IN ('CLERK' , 'SALESMAN')
AND SALARY NOT IN (1600,950,1300);

-- �������� 15)
-- Ŀ�̼� (�󿩱�)�� $500�̻��� ����� �̸��� �޿� �� Ŀ�̼�(�󿩱�)�� ����ϼ���.
SELECT ENAME, COMMISSION FROM EMPLOYEE WHERE COMMISSION >= 500;

-- Oracle ����Ŭ : �����Լ� 1
-- 1) UPPER(���ڿ�) 2) LOWER(���ڿ�) 3) INITCAP(���ڿ�)
-- DUAL : �������̺�
SELECT 'Oracle mania',
    UPPER('Oracle mania')AS�빮��,
    LOWER('Oracle mania')AS�ҹ���,
    INITCAP('Oracle mania')AS ù���ڴ빮��
FROM DUAL;

SELECT ENAME,
    LOWER(ENAME),
    JOB,
    INITCAP(JOB)
FROM EMPLOYEE;

-- scott ��� �˻��ϱ�
-- �÷��� �����͸� �ϰ� �ҹ��ڷ� �����ؼ� ���� ���� ����
-- ������ ������

SELECT ENO, ENAME, DNO FROM EMPLOYEE
WHERE LOWER(ENAME) = 'scott';
-- ����
SELECT ENO, ENAME, DNO FROM EMPLOYEE
WHERE INITCAP(ENAME) = 'Scott';

-- ����Ŭ : �����Լ� 2
-- ���ڱ��̸� ��ȯ�ϴ� �Լ� : LENGTH(���ڿ�) / �ѱ�, ���� ���ڰ��� ��� ��ȯ 
SELECT LENGTH('OracleMania'),
    LENGTH('����Ŭ�ŴϾ�') 
    FROM DUAL;
    
-- �����Լ� 3) ���� �����Լ�
-- CONCAT : ������ ���� �����ϴ� �Լ�
-- ����) ���ڿ� || ���ڿ� : ���ڿ� �����Ⱑ ��
SELECT 'ORacle', 'mania', concat('Oracle','mania') FROM DUAL;
SELECT 'ORacle', 'mania', 'Oracle' ||'mania' FROM DUAL;

-- �����Լ�4) ���� �����Լ�
-- ���ڿ� �ڸ���
-- SUBSTR(����÷�(����), ������ġ, ����) : �ε����� 1���� ����
SELECT SUBSTR('Oracle mania',4,3) FROM DUAL;

-- ���� 12)
-- �̸��� N���� ������ ��� ǥ���ϱ�
-- ��� ���̺� : EMPLOYEE
SELECT * FROM EMPLOYEE WHERE SUBSTR(ENAME, -1, 1) = 'N';

-- ���� 13)
-- 87�⵵�� �Ի��� ��� ǥ���ϱ�
-- ��� ���̺� : EMPLOYEE
-- WHERE���� �����Լ��� ���� ���ɿ� ������
SELECT * FROM EMPLOYEE WHERE SUBSTR(HIREDATE, 1, 2) = '87';

-- SUBSTRB(����÷�(����), ������ġ, ����) : ���� BYTE �������� �߶� ���.
-- ���� : SUBSTR / SUBSTRB ��� ����
-- �ѱ� : SUBSTR / SUBSTRB ��� �ٸ�

-- �����Լ� 5) ���ڿ� ���� ��� ���� ã�Ƽ� �ε��� ��ȣ ��ȯ
-- ����Ŭ������ �ε�����ȣ�� 1���� ������.
-- INSTR(����÷�(����), ã������, ������ġ, ���° �߰�)
SELECT INSTR('Oracle mania', 'a')
FROM DUAL;

-- ���ڿ����� 'a'�� ��ġ�� 5��°��ġ���� ���� �����ϰ�
-- �ι�° 'a'�� ã�������� �ε�����ȣ�� ��ȯ
SELECT INSTR('Oracle mania', 'a', 5, 2)
FROM DUAL;


