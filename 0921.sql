-- 3-1 �������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸�
-- �������� ������ ������ ���ǻ��� �̸�
SELECT publisher FROM customer, orders, book 
WHERE orders.custid = customer.custid AND orders.bookid = book.bookid 
AND name like '������';

SELECT name FROM customer, orders, book 
WHERE orders.custid = customer.custid AND orders.bookid = book.bookid 
AND name not like '������' AND publisher IN(
    SELECT publisher FROM customer, orders, book 
    WHERE orders.custid = customer.custid AND orders.bookid = book.bookid 
    AND name like '������'
);

-- 3-2 �� �� �̻��� ���� �ٸ� ���ǻ翡�� ������ ������ ���� �̸�
SELECT name FROM customer 
WHERE (SELECT COUNT(DISTINCT publisher) FROM customer, orders, book 
        WHERE orders.custid = customer.custid AND orders.bookid = book.bookid 
        AND name LIKE customer.name)>=2;

-- 3-3 ��ü ���� 30% �̻��� ������ ����
SELECT bookname FROM book bm 
WHERE (SELECT count(b.bookid) FROM book b, orders o 
        WHERE o.bookid = b.bookid AND bm.bookid = b.bookid) 
        >= (SELECT COUNT(*) FROM customer)*0.3;

-- 4-1  
INSERT INTO book VALUES(15, '����������', '���ѹ̵��', 10000);

-- 4-2
DELETE FROM book WHERE publisher LIKE '���е���';

-- 4-3
-- ���Ἲ ���������� ����Ǿ����ϴ�- orders ���̺��� �ڽ� ���ڵ尡 �߰ߵǾ����ϴ�
DELETE FROM book WHERE publisher LIKE 'Ȳ�ݰ���';

-- 4-4
UPDATE book SET publisher='�������ǻ�' WHERE publisher LIKE '���ѹ̵��';

-- 4-5
CREATE TABLE bookcompany(
    name    VARCHAR2(20) PRIMARY KEY,
    address VARCHAR2(20),
    begin   DATE
    );
    
-- 4-6
ALTER TABLE bookcompany ADD webadress VARCHAR2(30);

-- 4-7
INSERT INTO bookcompany VALUES('�Ѻ���ī����', '����� ������', '1993-01-01', 'http://hanbit.co.kr');

-- abs: ���밪 ���ϴ� �Լ�
SELECT abs(-33), abs(33) FROM dual;

-- 5.657�� �Ҽ� ù°�ڸ����� �ݿø��� ���� ���Ͻÿ�.
SELECT round(5.657,1) FROM dual;

-- ���� ��� �ֹ��ݾ��� ��� ������ �ݿø��� ���� ���Ͻÿ�.
SELECT custid "����ȣ", round(avg(saleprice), -2) "��ձݾ�" FROM orders 
GROUP BY custid;

-- ������ '����'�� ���Ե� ������ '����'���� �����Ͽ� ����Ͻÿ�.
-- ���� book ���̺��� ���������͸� �����ϸ� �� �ȴ�.
SELECT bookid, replace(bookname, '����','����') bookname, publisher, price FROM book;
SELECT * FROM book;

-- ���ǻ簡 '�س�'�� �������� ���ڼ��� ����Ʈ���� ����Ͻÿ�.
SELECT bookname "������", length(bookname) "���ڼ�", lengthb(bookname) "����Ʈ��" from book 
WHERE publisher LIKE '�س�';

-- �� �߿��� ���� ������ ���� ����� ������� �������� �ο����� ����Ͻÿ�.
SELECT substr(name, 1, 1) "����", count(*) "�ο���" FROM customer GROUP BY substr(name, 1, 1);

-- ������ �ֹ�Ȯ������ �ֹ��Ϸκ��� 10�� ���̴�. �ֹ���ȣ, �ֹ���, �ֹ�Ȯ������ ����Ͻÿ�.
select orderid �ֹ���ȣ, orderdate �ֹ���, orderdate+10 Ȯ�� FROM orders ORDER BY orderid;

-- 2023�� 8�� 28�Ͽ� �ֹ� ���� �ֹ���ȣ, �ֹ���, ����ȣ, ������ȣ�� ��� ����Ͻÿ�.
-- ��, �ֹ����� "yyyy�� mm�� dd��"�� ���� �������� ǥ���Ͻÿ�.
SELECT orderid �ֹ���ȣ, to_char(orderdate, 'yyyy-mm-dd') �ֹ���, custid ����ȣ, bookid ������ȣ 
FROM orders where orderdate=to_date('20230828', 'yyyymmdd');

-- 2023�� 8�� 28�Ͽ� �ֹ� ���� �ֹ���ȣ, �ֹ���, ����, �������� ��� ����Ͻÿ�.
-- ��, �ֹ����� "yyyy�� mm�� dd��"�� ���� �������� ǥ���Ͻÿ�.
SELECT orderid �ֹ���ȣ, orderdate �ֹ���, name ����, bookname ������ 
FROM orders,customer,book where orders.custid = customer.custid AND orders.bookid = book.bookid 
AND orderdate=to_date('20230828', 'yyyymmdd');

-- DB ������ ������ ��¥�� �ð� ������ ����Ͻÿ�.
-- ���� ��ȯ�� ��¥�� ������ ������(�⵵4�ڸ�/��2�ڸ�/��¥2�ڸ�/ ������ ����, ��:��:��) ��¥�� �ð� 2������ ��� ����Ͻÿ�.
SELECT sysdate ������ȯ�Ȱ�, to_char(sysdate, 'yyyy/mm/dd dy hh24:mi:ss') �������ĳ�¥�׽ð�
FROM dual;