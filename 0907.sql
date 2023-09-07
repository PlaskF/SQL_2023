-- 동등조인(Equal Join)
-- 여러 개의 테이블을 연결할 때 특정 컬럼의 값이 같은 행들만 검색할 때 사용

-- 고객과 고객의 주문에 관한 데이터를 모두 출력하시오
SELECT * FROM customer, orders WHERE customer.custid=orders.custid;
-- 고객과 고객의 주문에 관한 데이터를 모두 고객번호 내림차순으로 출력하시오
SELECT * FROM customer, orders WHERE customer.custid=orders.custid
ORDER by customer.custid desc;
-- 고객의 이름, 주문한 도서 판매가격을 검색하시오
SELECT name, saleprice FROM customer c, orders o 
WHERE c.custid = o.custid;
-- 고객이름별로 주문한 모든 도서의 총 판매액을 구하고 고객이름순으로 정렬하시오
SELECT name, sum(saleprice) FROM customer, orders 
WHERE customer.custid = orders.custid 
group by customer.name order by customer.name;
-- 고객의 이름과 주문한 도서의 이름을 구하시오
-- 3개의 테이블에 대한 동등조인
SELECT name, bookname FROM customer c, book b, orders o
WHERE c.custid = o.custid and o.bookid = b.bookid order by name;
-- 도서가격이 2만원인 도서를 주문한 고객이름과 도서이름을 출력하시오
SELECT name, bookname FROM customer c, book b, orders o
WHERE c.custid = o.custid and b.bookid = o.bookid and price >= 20000;

-- 외부조인(Outer Join)
-- 동등조인을 하게되면 값이 동등하지 않은 행은 무시되지만
-- 외부조인을 하게되면 기준이 되는 테이블의 값이 동등하지 않은 데이터행도 포함해서 출력해준다.

-- 도서를 구매하지 않은 고객도 포함하여 고객이름과 주문한 도서의 판매가격을 출력하시오
SELECT name, saleprice FROM customer c 
Left OUTER JOIN orders o ON c.custid = o.custid;

-- Sub Query(부속 질의)
-- Main Query 내에 있는 Query

-- 도서가격이 가장 비싼 가격
SELECT MAX(price) FROM book;
-- 도서이름
SELECT bookname FROM book;
-- 도서가격이 가장 비싼 도서이름을 출력하시오
SELECT bookname FROM book WHERE price =(SELECT MAX(price) FROM book);
-- 도서가격이 가장 싼 도서의 이름과 가격을 출력하시오
SELECT bookname, price FROM book WHERE price =(SELECT MIN(price) FROM book);
-- 도서를 구매한 적이 있는 고객의 이름을 검색하시오.
SELECT name FROM customer WHERE custid IN (SELECT DISTINCT custid FROM orders);
-- 서브 쿼리: 주문한 적이 있는 고객번호들
SELECT DISTINCT custid FROM orders;

-- 웅진지식하우스에서 출판한 도서를 구매한 고객의 이름을 출력하시오
SELECT name FROM customer;
SELECT bookid, bookname FROM book WHERE publisher ='굿스포츠';

--도서를 구매한 사람
SELECT DISTINCT custid FROM orders;

SELECT name FROM customer WHERE custid IN 
(SELECT DISTINCT custid FROM orders WHERE bookid IN
(SELECT bookid FROM book WHERE publisher ='굿스포츠'));
