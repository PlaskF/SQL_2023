-- ��������(Equal Join)
-- ���� ���� ���̺��� ������ �� Ư�� �÷��� ���� ���� ��鸸 �˻��� �� ���

-- ���� ���� �ֹ��� ���� �����͸� ��� ����Ͻÿ�
SELECT * FROM customer, orders WHERE customer.custid=orders.custid;
-- ���� ���� �ֹ��� ���� �����͸� ��� ����ȣ ������������ ����Ͻÿ�
SELECT * FROM customer, orders WHERE customer.custid=orders.custid
ORDER by customer.custid desc;
-- ���� �̸�, �ֹ��� ���� �ǸŰ����� �˻��Ͻÿ�
SELECT name, saleprice FROM customer c, orders o 
WHERE c.custid = o.custid;
-- ���̸����� �ֹ��� ��� ������ �� �Ǹž��� ���ϰ� ���̸������� �����Ͻÿ�
SELECT name, sum(saleprice) FROM customer, orders 
WHERE customer.custid = orders.custid 
group by customer.name order by customer.name;
-- ���� �̸��� �ֹ��� ������ �̸��� ���Ͻÿ�
-- 3���� ���̺� ���� ��������
SELECT name, bookname FROM customer c, book b, orders o
WHERE c.custid = o.custid and o.bookid = b.bookid order by name;
-- ���������� 2������ ������ �ֹ��� ���̸��� �����̸��� ����Ͻÿ�
SELECT name, bookname FROM customer c, book b, orders o
WHERE c.custid = o.custid and b.bookid = o.bookid and price >= 20000;

-- �ܺ�����(Outer Join)
-- ���������� �ϰԵǸ� ���� �������� ���� ���� ���õ�����
-- �ܺ������� �ϰԵǸ� ������ �Ǵ� ���̺��� ���� �������� ���� �������൵ �����ؼ� ������ش�.

-- ������ �������� ���� ���� �����Ͽ� ���̸��� �ֹ��� ������ �ǸŰ����� ����Ͻÿ�
SELECT name, saleprice FROM customer c 
Left OUTER JOIN orders o ON c.custid = o.custid;

-- Sub Query(�μ� ����)
-- Main Query ���� �ִ� Query

-- ���������� ���� ��� ����
SELECT MAX(price) FROM book;
-- �����̸�
SELECT bookname FROM book;
-- ���������� ���� ��� �����̸��� ����Ͻÿ�
SELECT bookname FROM book WHERE price =(SELECT MAX(price) FROM book);
-- ���������� ���� �� ������ �̸��� ������ ����Ͻÿ�
SELECT bookname, price FROM book WHERE price =(SELECT MIN(price) FROM book);
-- ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�.
SELECT name FROM customer WHERE custid IN (SELECT DISTINCT custid FROM orders);
-- ���� ����: �ֹ��� ���� �ִ� ����ȣ��
SELECT DISTINCT custid FROM orders;

-- ���������Ͽ콺���� ������ ������ ������ ���� �̸��� ����Ͻÿ�
SELECT name FROM customer;
SELECT bookid, bookname FROM book WHERE publisher ='�½�����';

--������ ������ ���
SELECT DISTINCT custid FROM orders;

SELECT name FROM customer WHERE custid IN 
(SELECT DISTINCT custid FROM orders WHERE bookid IN
(SELECT bookid FROM book WHERE publisher ='�½�����'));
