-- ���տ�����: ������(UNION), ������(MINUS), ������(INTERCECT)
-- ������ ������ ���

-- ������ �ֹ����� ���� ���� �̸��� ���ÿ�.
SELECT name FROM customer;

SELECT DISTINCT custid from orders;

SELECT name FROM customer WHERE custid IN(SELECT DISTINCT custid from orders);

-- ������ ������ ���
SELECT name FROM customer
MINUS
SELECT name FROM customer
WHERE custid IN(SELECT DISTINCT custid from orders);

-- ������ ������� ���� ���
SELECT name FROM customer WHERE custid 
NOT IN(SELECT DISTINCT custid from orders);

-- EXISTS: ���������� ����� �����ϴ� ��쿡 TRUE
-- �ֹ��� �ִ� ���� �̸��� �ּҸ� ����Ͻÿ�.
-- IN ������ ����� ���
SELECT name,address FROM customer 
WHERE custid IN (SELECT DISTINCT custid FROM orders);
-- �������ΰ� �ߺ��� ����
SELECT DISTINCT name, address FROM customer c, orders o 
WHERE c.custid = o.custid; 
-- EXISTS ����� ���'
SELECT name, address FROM customer c 
WHERE EXISTS(SELECT * FROM orders o WHERE c.custid = o.custid);

-- ��������
-- 1-5
SELECT COUNT(DISTINCT publisher) FROM book, customer, orders 
WHERE name='������' AND orders.bookid = book.bookid;
-- 1-6
SELECT bookname,price,price-saleprice ������_�ǸŰ���_���� FROM book, customer, orders
WHERE name='������' AND orders.bookid = book.bookid AND orders.custid = customer.custid;
-- 1-7
SELECT bookname FROM book b, customer c, orders o
WHERE name<>'������' AND o.bookid = b.bookid AND o.custid = c.custid;
-- 2-8
SELECT name FROM customer 
WHERE custid NOT IN(SELECT custid from orders);
-- 2-9
SELECT sum(saleprice), avg(saleprice) FROM orders;
-- 2-10
SELECT name, sum(saleprice) from customer, orders 
WHERE orders.custid = customer.custid group by name;
--2-11
SELECT name,bookname FROM customer, book, orders
WHERE orders.custid = customer.custid AND orders.bookid = book.bookid;
-- 2-12
SELECT * FROM book b, orders o 
WHERE o.bookid = b.bookid 
AND price-saleprice=(SELECT max(price-saleprice) from book sb, orders so 
WHERE sb.bookid = so.bookid);
-- 2-13
SELECT name, avg(saleprice) FROM customer c, orders o 
WHERE c.custid = o.custid GROUP BY name;

-- DDL(Data Defination Language):������ ���Ǿ�
-- create table/alter table/drop table
-- ���̺� ���� ����1
CREATE TABLE newbook1 (
    bookid      NUMBER,
    bookname    VARCHAR2(20),
    publisher   VARCHAR2(20),
    price       NUMBER  );

-- ���̺� ���� ����2
-- primary key ���� ���1
CREATE TABLE newbook2 (
    bookid      NUMBER,
    bookname    VARCHAR2(20),
    publisher   VARCHAR2(20),
    price       NUMBER,  
    PRIMARY KEY (bookid)
    );
-- primary key ���� ���2
CREATE TABLE newbook3 (
    bookid      NUMBER PRIMARY KEY,
    bookname    VARCHAR2(20),
    publisher   VARCHAR2(20),
    price       NUMBER
    );
-- bookname �÷�: null�� ���� �� ����
-- publisher �÷�: ������ ���� ���� �� ����
-- price �÷�: ������ �ԷµǾ� ���� ������ �⺻���� 10000���� �ϰ� �Էµ� ���� 1000�ʰ��� �Ѵ�
-- bookname, publisher �÷��� ����Ű�� ����
CREATE TABLE newbook4 (
    bookname    VARCHAR2(20) NOT NULL,
    publisher   VARCHAR2(20) UNIQUE,
    price       NUMBER DEFAULT 10000 CHECK(price>1000),
    PRIMARY KEY (bookname, publisher)
    );