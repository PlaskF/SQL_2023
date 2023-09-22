-- �������� 1.

select abs(15) from dual;           --> 15
-- abs(����): ������ ���밪 ���

select ceil(15.7) from dual;        --> 16
-- ceil(����): ���ں��� ũ�ų� ���� �ּ��� ����

select cos(3.14159) from dual;      --> -0.999 ... 324
-- cos(): 

select floor(15.7) from dual;       --> 15
-- floor(����): ���ں��� �۰ų� ���� �ּ��� ����

select log(10,100) from dual;       --> 2
-- log(n,����): ������ �ڿ��α� �� ��ȯ

select mod(11,4) from dual;         --> 3
-- mod(): 

select power(3,2) from dual;        --> 9
-- power(����,n): ������ n���� �� ���

select round(15.7) from dual;       --> 16
-- round(����,m): m�ڸ� �������� ���� �ݿø�

select sign(-15) from dual;         --> -1
-- sign(����): ���ڰ� �����̸� -14,0�̸� 0,����̸� 1

select trunc(15.7) from dual;       --> 15
-- 

select chr(67) from dual;           --> C
-- chr(k): ���� �ƽ�Ű�ڵ带 ���ڷ� ��ȯ

select concat('HAPPY','BIRTHDAY') from dual;    --> HAPPYBIRTHDAY
-- concat(s1,s2): �� ���ڿ��� ����

select lower('Birthday') from dual;             --> birthday
-- lower(s): ��� ���ڿ��� ��� �ҹ��ڷ� ��ȯ

select lpad('Page 1',15,'*.') from dual;        --> *.*.*.*.*Page 1
-- lpad(s,n,c): ��� ���ڿ��� ���ʺ��� ������ �ڸ������� ������ ���ڷ� ä��

select ltrim('Page 1','ae') from dual;          --> Page 1
-- ltrim(s1,s2): ��� ���ڿ��� ���ʺ��� ������ ���ڵ��� ����

select replace('JACK','J','BL') from dual;      --> BLACK
-- replace(s1,s2,s3): ��� ���ڿ��� ������ ���ڸ� ���ϴ� ���ڷ� ����

select rpad('Page 1',15,'*.') from dual;        --> Page 1*.*.*.*.*
-- rpad(s,n,c): ��� ���ڿ��� �����ʺ��� ������ �ڸ������� ������ ���ڷ� ä��

select rtrim('Page 1','ae') from dual;          --> Page 1
-- rtrim(s1,s2): ��� ���ڿ��� �����ʺ��� ������ ���ڵ��� ����


-- ���� �̸��� ��ȭ��ȣ�� ����Ͻÿ�.(��, ��ȭ��ȣ�� ���� ���� '����ó����'���� ����Ͻÿ�
SELECT name �̸�, phone ��ȭ��ȣ FROM customer;
SELECT name �̸�, nvl(phone, '����ó����') ��ȭ��ȣ FROM customer;

-- ����Ͽ��� ����, ����ȣ, �̸�, ��ȭ��ȣ�� ���� �θ� ����Ͻÿ�.
SELECT ROWNUM ����, custid, name, phone FROM customer;
SELECT ROWNUM ����, custid, name, phone FROM customer WHERE ROWNUM<=2;


-- �������� 2
-- mybook ���̺� ����
create TABLE mybook (
    bookid  NUMBER NOT NULL PRIMARY KEY,
    price   number
);

-- ������ �� ����
INSERT INTO mybook VALUES(1,10000);
INSERT INTO mybook VALUES(2,20000);
INSERT INTO mybook(bookid) VALUES(3);
SELECT * FROM mybook;

select bookid,NVL(price,0) FROM mybook;
-- price�� null �Ӽ��� 0���� ��ü

select * FROM mybook WHERE price IS NULL;
-- price�� null�� ������ ����ϱ�

select * FROM mybook WHERE price='';
-- price ���� ''�� ������ ����ϱ�
-- �ش�Ǵ� �����Ͱ� ����

select bookid,price+100 FROM mybook;
-- booid, price�� 100�� �߰��� �� ����ϱ�
-- null �� ���迡�� ������

select sum(price),avg(price),count(*) FROM mybook WHERE bookid >=4;
-- bookid�� 4 �̻��� ������ ����ϱ�
-- bookid�� 3����, �� �̻��� null

select count(*),count(price) FROM mybook;
-- ��� �������� ���� ����, price ������ ���� ���� ����ϱ�
-- price �� �����Ϳ� null �� ������ 2 ���

select sum(price),avg(price) FROM mybook;
-- price�� ����, ��� ���� ����ϱ�


-- �������� 3
SELECT * from book;
-- book�� ������ ���
SELECT * from book WHERE ROWNUM <=5;
-- book�� �������� 5���� ���
SELECT * from book WHERE ROWNUM <=5 ORDER BY price;
-- �������� 5���� ��� �� price�� ������������ ����
SELECT * from (SELECT * from book ORDER BY price)b WHERE ROWNUM <=5;
-- ���� price���� ���� �� �������� 5�� ���
SELECT * from (SELECT * from book WHERE ROWNUM <=5)b ORDER BY price;
-- �������� 5���� ���� �� price�� ������������ ����
SELECT * FROM (SELECT * from book WHERE ROWNUM <=5 ORDER BY price)b;
-- �������� 5���� ���� �� price�� ������������ ������ ���� ����

-- ����Ǹűݾ� ������ �ֹ��� ���� �ֹ���ȣ�� �ݾ��� ����Ͻÿ�.
SELECT orderid �ֹ���ȣ, saleprice �ݾ� FROM orders; 
SELECT orderid �ֹ���ȣ, saleprice �ݾ� FROM orders
WHERE saleprice <= (SELECT avg(saleprice) FROM orders);

-- �� ���� ����Ǹűݾ׺��� ū �ݾ��� �ֹ� ���������� �ֹ���ȣ, ����ȣ, �Ǹűݾ��� ����Ͻÿ�.
SELECT orderid �ֹ���ȣ, custid ����ȣ, saleprice �ݾ� FROM orders;
SELECT orderid �ֹ���ȣ, custid ����ȣ, saleprice �ݾ� FROM orders mo
WHERE saleprice > (SELECT  avg(saleprice) FROM orders so WHERE mo.custid = so.custid);

-- ���￡ �����ϴ� ������ �Ǹ��� ������ ���Ǹűݾ��� ����Ͻÿ�
SELECT sum(saleprice) ���Ǹűݾ� FROM orders;
-- ���￡ �����ϴ� ����� ����ȣ
SELECT custid FROM customer WHERE address like '%����%';
SELECT sum(saleprice) ���Ǹűݾ� FROM orders 
WHERE custid IN(SELECT custid FROM customer WHERE address like '%����%');

-- ���￡ �������� �ʴ� ������ �Ǹ��� ������ ���Ǹűݾ��� ����Ͻÿ�
SELECT sum(saleprice) ���Ǹűݾ� FROM orders 
WHERE custid NOT IN(SELECT custid FROM customer WHERE address like '%����%');

-- 3�� ���� �ֹ��� ������ �ְ�ݾ׺��� �� ��� ������ ������ �ֹ��� �ֹ���ȣ�� �ݾ��� ����Ͻÿ�.
SELECT orderid �ֹ���ȣ, saleprice �ݾ� FROM orders;
SELECT orderid �ֹ���ȣ, saleprice �ݾ� FROM orders 
WHERE saleprice > all(SELECT saleprice FROM orders WHERE orders.custid=3);
-- max�� ��ü ����

-- ���￡ �����ϴ� ������ �Ǹ��� ������ ���Ǹž��� ���Ͻÿ�.(��, exit ������ ���)
SELECT saleprice ���Ǹž� FROM orders mo 
WHERE EXISTS(
SELECT * FROM customer c 
WHERE address LIKE '%����%' AND mo.custid=c.custid);

-- ���� �Ǹűݾ��� �հ踦 ����Ͻÿ�.(����ȣ, �Ǹ��հ�)
SELECT custid ����ȣ, sum(saleprice) �Ǹ��հ� FROM orders group by custid;
SELECT (select name from customer c 
where c.custid = o.custid) ����, sum(saleprice) �Ǹ��հ� FROM orders o 
GROUP BY o.custid;

-- �ֹ���Ͽ� å�̸��� ������ �� �ִ� �÷��� �߰��Ͻÿ�.
ALTER TABLE orders add bookname VARCHAR2(40);

UPDATE orders o SET bookname = 
(select bookname FROM book b WHERE b.bookid=o.bookid);

-- ����ȣ�� 2 ������ ����ȣ�� �̸��� ����Ͻÿ�.
SELECT custid ����ȣ, name �̸� FROM customer WHERE custid<=2;

-- ����ȣ�� 2 ������ ���� �Ǹűݾ��� ����Ͻÿ�.(���̸��� ���� �Ǹž� ���)
SELECT name ���̸�, sum(saleprice) �Ǹ��Ѿ� 
FROM (SELECT custid, name FROM customer WHERE custid<=2) c, orders o 
WHERE c.custid=o.custid group by name;

SELECT name ���̸�, sum(saleprice) �Ǹ��Ѿ� 
FROM customer c, orders o 
WHERE c.custid=o.custid group by name;



-- �������� 5
SELECT custid,
(select address from customer cs where cs.custid=od.custid)"adress",
sum(saleprice)"total"
from orders od group by od.custid;
-- ��Į�� �������� 

select cs.name,s from 
(select custid,avg(saleprice)s from orders group by custid)od, 
customer cs
where cs.custid=od.custid;
-- �ζ��� �� ��������

select sum(saleprice)"total" from orders od 
where EXISTS
(select * from customer cs where custid <=3 
AND cs.custid=od.custid);
-- ��ø���� ��������

select substr('ABCDEFG',3,4) from dual;         --> CDEF
select trim(leading 0 from '00AA00') from dual;  --> AA00 
select upper('Birthday') from dual;             --> BIRTHDAY
select ASCII('A') from dual;                    --> 65
select instr('CORPORATE FLOOR','OR',3,2) from dual;  --14
select length('Birthday') from dual;            --> 8
select add_months('14/05/21',1) from dual;      --> 14/06/21
select last_day(sysdate) from dual;             --> 23/09/30
select next_day(sysdate,'ȭ') from dual;        --> 23/09/26
select round(sysdate) from dual;                --> 23/09/22
select sysdate from dual;                       --> 23/09/22
select to_char(sysdate) from dual;              --> 23/09/22
select to_char(123) from dual;                  --> 123 
select to_date('12 05 2014','dd mm yyyy') from dual; --> 14/05/12
select to_number('12.3') from dual;             --> 12.3
select decode(1,1,'aa','bb') from dual;         --> aa 
select nullif(123,345) from dual;               --> 123

select nvl(null,123) from dual;                 --> 123
-- nvl('�Ӽ�','��'): '�Ӽ�'�� null ���̸� '��'���� ��ü�Ѵ�.












