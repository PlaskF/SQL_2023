SET SERVEROUTPUT on;
EXEC interest;
-- ���ν��� ȣ��

CREATE TABLE book_log (
    bookid_1 NUMBER,
    bookname_1 VARCHAR2(40),
    publisher_1 VARCHAR2(40),
    price_1 NUMBER
);

-- insert,delete,update ���� ����� �� �ڵ����� ����
INSERT INTO book VALUES(18,'����������','�̻�̵��',25000);
SELECT * FROM book WHERE bookid='18';
SELECT * FROM book_log WHERE bookid_1='18';

-- select ������ ȣ��
SELECT custid, orderid, saleprice, fnc_interest(saleprice) ���ͱ� FROM orders;

-- �������� 8
-- (1) insertcustomer() ���ν��� �ۼ�
CREATE OR REPLACE PROCEDURE INSERTCUSTOMER (
    mycustid IN NUMBER,
    myname IN VARCHAR2,
    myaddress IN VARCHAR2,
    myphone IN VARCHAR2)
AS 
BEGIN
  INSERT INTO customer(custid, name, address, phone)
  VALUES(mycustid, myname, myaddress, myphone);
END;

