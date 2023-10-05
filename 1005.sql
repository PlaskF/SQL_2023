-- �������� 5
-- (2) �ֹ��� �� ���� �̸�, ��� ���Ű����� ���Ͻÿ�
select cs.name,s from 
(select custid,avg(saleprice)s from orders group by custid)od, 
customer cs
where cs.custid=od.custid;
-- �ζ��� �� ��������
-- (3) custid�� 3������ ���� �Ǹűݾ��� ������?
select sum(saleprice)"total" from orders od 
where EXISTS
(select * from customer cs where custid <=3 
AND cs.custid=od.custid);
-- ��ø���� ��������

SELECT * FROM book;

-- å �̸��� �����̶�� �ܾ ���Ե� ������� ����Ͻÿ�
SELECT * FROM book WHERE bookname like '%����%';

CREATE VIEW v_book AS SELECT * FROM book WHERE bookname like '%����%';

SELECT * FROM customer;
-- �ּҿ� �����̶�� �ܾ ���Ե� �並 �����Ͻÿ�.
SELECT * FROM customer WHERE address LIKE '%����%';

CREATE VIEW vw_customer AS SELECT * FROM customer WHERE address LIKE '%����%';
-- ���õ� �� ���
SELECT * FROM vw_customer; 

-- �ֹ����̺��� ���̸�, �����̸��� �ٷ� Ȯ���� �� �ִ� �並 ������ ��,
-- �迬�� ���� ������ ������ �ֹ���ȣ, ������, �ֹ����� ����Ͻÿ�.
CREATE VIEW vw_orders(orderid, custid, name, bookid, bookname, saleprice, orderdate)
AS SELECT o.orderid, o.custid, c.name, o.bookid, b.bookname, o.saleprice, o.orderdate 
FROM orders o, customer c, book b
WHERE o.custid=c.custid and o.bookid=b.bookid;

SELECT * FROM vw_orders;

SELECT orderid, bookname, saleprice FROM vw_orders WHERE name='�迬��';

-- ������ �並 �����Ѵ�
CREATE OR REPLACE VIEW vw_customer(custid, name, address) 
AS SELECT custid, name, address FROM customer WHERE address LIKE '%����%';

SELECT * FROM vw_customer;

-- �� ����
DROP VIEW vw_customer;

-- �������� 8
-- (1)
CREATE VIEW highorders(������ȣ, �����̸�, ���̸�, ���ǻ�, �ǸŰ���) 
AS SELECT b.bookid, b.bookname, c.name, b.publisher, o.saleprice
FROM orders o, customer c, book b 
WHERE o.custid=c.custid and o.bookid=b.bookid and saleprice>=20000;

select * FROM highorders;

-- (2)
SELECT �����̸�, ���̸� FROM highorders;

-- (3)
CREATE OR REPLACE VIEW highorders(������ȣ, �����̸�, ���̸�, ���ǻ�) 
AS SELECT b.bookid, b.bookname, c.name, b.publisher
FROM orders o, customer c, book b 
WHERE o.custid=c.custid and o.bookid=b.bookid;

SELECT �����̸�, ���̸� FROM highorders;

-- insertbook ���ν��� ����
EXEC insertbook(17, '����������', '������м���', 25000);
SELECT * FROM book;

EXEC insertorupdate(16, '������ ��ſ�', '������м���', 30000);
SELECT * FROM book;

EXEC insertorupdate(16, '������ ��ſ�', '������м���', 20000);

SET SERVEROUTPUT ON;
DECLARE
    averageval NUMBER;
BEGIN
    averageprice(averageval);
    dbms_output.put_line('������հ���: '||round(averageval,2));
end;

