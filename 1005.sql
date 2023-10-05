-- 연습문제 5
-- (2) 주문을 한 고객의 이름, 평균 구매가격을 구하시오
select cs.name,s from 
(select custid,avg(saleprice)s from orders group by custid)od, 
customer cs
where cs.custid=od.custid;
-- 인라인 뷰 서브쿼리
-- (3) custid가 3이하인 고객의 판매금액의 총합은?
select sum(saleprice)"total" from orders od 
where EXISTS
(select * from customer cs where custid <=3 
AND cs.custid=od.custid);
-- 중첩질의 서브쿼리

SELECT * FROM book;

-- 책 이름에 과학이라는 단어가 포함된 결과행을 출력하시오
SELECT * FROM book WHERE bookname like '%과학%';

CREATE VIEW v_book AS SELECT * FROM book WHERE bookname like '%과학%';

SELECT * FROM customer;
-- 주소에 서울이라는 단어가 포함된 뷰를 생성하시오.
SELECT * FROM customer WHERE address LIKE '%서울%';

CREATE VIEW vw_customer AS SELECT * FROM customer WHERE address LIKE '%서울%';
-- 선택된 뷰 출력
SELECT * FROM vw_customer; 

-- 주문테이블에서 고객이름, 도서이름을 바로 확인할 수 있는 뷰를 생성한 후,
-- 김연아 고객이 구입한 도서의 주문번호, 도서명, 주문액을 출력하시오.
CREATE VIEW vw_orders(orderid, custid, name, bookid, bookname, saleprice, orderdate)
AS SELECT o.orderid, o.custid, c.name, o.bookid, b.bookname, o.saleprice, o.orderdate 
FROM orders o, customer c, book b
WHERE o.custid=c.custid and o.bookid=b.bookid;

SELECT * FROM vw_orders;

SELECT orderid, bookname, saleprice FROM vw_orders WHERE name='김연아';

-- 기존의 뷰를 수정한다
CREATE OR REPLACE VIEW vw_customer(custid, name, address) 
AS SELECT custid, name, address FROM customer WHERE address LIKE '%영국%';

SELECT * FROM vw_customer;

-- 뷰 삭제
DROP VIEW vw_customer;

-- 연습문제 8
-- (1)
CREATE VIEW highorders(도서번호, 도서이름, 고객이름, 출판사, 판매가격) 
AS SELECT b.bookid, b.bookname, c.name, b.publisher, o.saleprice
FROM orders o, customer c, book b 
WHERE o.custid=c.custid and o.bookid=b.bookid and saleprice>=20000;

select * FROM highorders;

-- (2)
SELECT 도서이름, 고객이름 FROM highorders;

-- (3)
CREATE OR REPLACE VIEW highorders(도서번호, 도서이름, 고객이름, 출판사) 
AS SELECT b.bookid, b.bookname, c.name, b.publisher
FROM orders o, customer c, book b 
WHERE o.custid=c.custid and o.bookid=b.bookid;

SELECT 도서이름, 고객이름 FROM highorders;

-- insertbook 프로시저 실행
EXEC insertbook(17, '스포츠과학', '마당과학서적', 25000);
SELECT * FROM book;

EXEC insertorupdate(16, '스포츠 즐거움', '마당과학서적', 30000);
SELECT * FROM book;

EXEC insertorupdate(16, '스포츠 즐거움', '마당과학서적', 20000);

SET SERVEROUTPUT ON;
DECLARE
    averageval NUMBER;
BEGIN
    averageprice(averageval);
    dbms_output.put_line('도서평균가격: '||round(averageval,2));
end;

