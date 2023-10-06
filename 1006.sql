SET SERVEROUTPUT on;
EXEC interest;
-- 프로시저 호출

CREATE TABLE book_log (
    bookid_1 NUMBER,
    bookname_1 VARCHAR2(40),
    publisher_1 VARCHAR2(40),
    price_1 NUMBER
);

-- insert,delete,update 문이 실행될 때 자동으로 실행
INSERT INTO book VALUES(18,'스포츠과학','이상미디어',25000);
SELECT * FROM book WHERE bookid='18';
SELECT * FROM book_log WHERE bookid_1='18';

-- select 문으로 호출
SELECT custid, orderid, saleprice, fnc_interest(saleprice) 이익금 FROM orders;

-- 연습문제 8
-- (1) insertcustomer() 프로시저 작성
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

