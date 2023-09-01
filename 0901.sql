-- book ���̺��� �����̶�� ���ڿ��� �����ϰ� ���������� 15000�� �̻��� ������ ���� �˻��Ͻÿ�.
SELECT * FROM book WHERE bookname LIKE '%����%' AND price >=15000;
-- book ���̺��� ���ǻ簡 �½����� �Ǵ� ��ũ�ν��� ������ �˻��Ͻÿ�.
SELECT * FROM book WHERE publisher='�½�����' OR publisher='�����';
-- �� ������ in �����ڸ� ����Ͽ� �����Ͻÿ�.
SELECT * FROM book WHERE publisher IN ('�½�����','�����');
-- book ���̺��� ������ ������ �˻��Ͻÿ�.
SELECT * FROM book ORDER by bookname;
-- book ���̺��� ������ȣ ������ �˻��Ͻÿ�.
SELECT * FROM book ORDER by bookid;
-- book ���̺��� ���� ������ �˻��ϰ� ���� �����̸� �̸������� �˻��Ͻÿ�.
SELECT * FROM book ORDER by price, bookname;
-- book ���̺��� ������ ������������ �˻��ϰ� ���� �����̸� ���ǻ� ������ �˻��Ͻÿ�.
SELECT * FROM book ORDER by price DESC, publisher ASC;

-- orders ���̺��� ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�.
-- �����Լ� ���(�հ�: sum)
SELECT * FROM orders;
SELECT SUM(saleprice) as ���Ǹűݾ� FROM orders;

-- orders ���̺��� ����ȣ�� 1�� ���� �ֹ��� ������ ���Ǹűݾ��� ���Ͻÿ�.
SELECT SUM(saleprice) as ���Ǹűݾ� FROM orders WHERE custid=1;
-- orders ���̺��� �Ǹž��� �հ�, ���, �ּҰ�, �ִ밪�� ���Ͻÿ�.
SELECT SUM(saleprice) as ���Ǹűݾ�, 
AVG(saleprice) as ��հ�,
MIN(saleprice) as ������,
MAX(saleprice) as �ְ� FROM orders;
-- orders ���̺��� �Ǹ��� ������ ������ ���Ͻÿ�.
SELECT count(*) FROM orders;
-- orders ���̺��� ���������� 13000�� �̻��� ������ ������ ���Ͻÿ�.
SELECT count(*) FROM orders WHERE saleprice>=13000;
-- orders ���̺��� ����ȣ�� 1 �Ǵ� 3�� ���� �ֹ� ������ ���Ͻÿ�.
SELECT COUNT(*) FROM orders WHERE custid IN (1,3);
-- orders ���̺��� ���� �ֹ��� ������ ������ ���հ踦 ���Ͻÿ�.
-- �׷�ȭ(�κ���)
SELECT custid, COUNT(*) �ֹ�����, SUM(saleprice) �ֹ��Ѿ� 
FROM orders GROUP by custid ORDER by custid;
-- orders ���̺��� �ǸŰ����� 8000�� �̻��� ������ ������ ���� ���� ���� �ֹ� ������ �Ѽ����� ���Ͻÿ�.
-- �� 2�� �̻� ������ ���� ����Ͻÿ�.
SELECT custid, COUNT(*) as �������� FROM orders 
WHERE saleprice>=8000 GROUP by custid
HAVING COUNT(*) >=2
ORDER by custid;

-- ��������
-- 1-1
SELECT bookname FROM book WHERE bookid=1;
-- 1-2
SELECT bookname FROM book WHERE price>=20000;
-- 1-3
SELECT SUM(saleprice) as �ѱ��ž� FROM orders WHERE custid=1;
-- 1-4
SELECT COUNT(*) FROM orders WHERE custid=1;

-- 2-1
SELECT COUNT(*) ����_�Ѱ��� FROM book;
-- 2-2
SELECT COUNT(DISTINCT publisher) ���ǻ�_�� FROM book;
-- 2-3
SELECT name,address FROM customer;
-- 2-4
SELECT orderid FROM orders WHERE orderdate 
BETWEEN '2014-07-04' and '2014-07-07';
-- 2-5
SELECT orderid FROM orders WHERE NOT orderdate 
BETWEEN '2014-07-04' and '2014-07-07';
-- 2-6
SELECT name,address FROM customer WHERE name LIKE '��%';
-- 2-7
SELECT name,address FROM customer 
WHERE name LIKE '��%' AND name LIKE '%��';