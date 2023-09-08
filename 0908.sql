-- 집합연산자: 합집합(UNION), 차집합(MINUS), 교집합(INTERCECT)
-- 차집합 연산자 사용

-- 도서를 주문하지 않은 고객의 이름을 쓰시오.
SELECT name FROM customer;

SELECT DISTINCT custid from orders;

SELECT name FROM customer WHERE custid IN(SELECT DISTINCT custid from orders);

-- 차집합 연산자 사용
SELECT name FROM customer
MINUS
SELECT name FROM customer
WHERE custid IN(SELECT DISTINCT custid from orders);

-- 연산자 사용하지 않을 경우
SELECT name FROM customer WHERE custid 
NOT IN(SELECT DISTINCT custid from orders);

-- EXISTS: 서브쿼리의 결과가 존재하는 경우에 TRUE
-- 주문이 있는 고객의 이름과 주소를 출력하시오.
-- IN 연산자 사용한 경우
SELECT name,address FROM customer 
WHERE custid IN (SELECT DISTINCT custid FROM orders);
-- 동등조인과 중복행 제거
SELECT DISTINCT name, address FROM customer c, orders o 
WHERE c.custid = o.custid; 
-- EXISTS 사용한 경우'
SELECT name, address FROM customer c 
WHERE EXISTS(SELECT * FROM orders o WHERE c.custid = o.custid);

-- 연습문제
-- 1-5
SELECT COUNT(DISTINCT publisher) FROM book, customer, orders 
WHERE name='박지성' AND orders.bookid = book.bookid;
-- 1-6
SELECT bookname,price,price-saleprice 정가와_판매가격_차이 FROM book, customer, orders
WHERE name='박지성' AND orders.bookid = book.bookid AND orders.custid = customer.custid;
-- 1-7
SELECT bookname FROM book b, customer c, orders o
WHERE name<>'박지성' AND o.bookid = b.bookid AND o.custid = c.custid;
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

-- DDL(Data Defination Language):데이터 정의어
-- create table/alter table/drop table
-- 테이블 생성 연습1
CREATE TABLE newbook1 (
    bookid      NUMBER,
    bookname    VARCHAR2(20),
    publisher   VARCHAR2(20),
    price       NUMBER  );

-- 테이블 생성 연습2
-- primary key 설정 방법1
CREATE TABLE newbook2 (
    bookid      NUMBER,
    bookname    VARCHAR2(20),
    publisher   VARCHAR2(20),
    price       NUMBER,  
    PRIMARY KEY (bookid)
    );
-- primary key 설정 방법2
CREATE TABLE newbook3 (
    bookid      NUMBER PRIMARY KEY,
    bookname    VARCHAR2(20),
    publisher   VARCHAR2(20),
    price       NUMBER
    );
-- bookname 컬럼: null값 가질 수 없음
-- publisher 컬럼: 동일한 값을 가질 수 없음
-- price 컬럼: 가격이 입력되어 있지 않으면 기본값을 10000으로 하고 입력될 때는 1000초과로 한다
-- bookname, publisher 컬럼을 복합키로 설정
CREATE TABLE newbook4 (
    bookname    VARCHAR2(20) NOT NULL,
    publisher   VARCHAR2(20) UNIQUE,
    price       NUMBER DEFAULT 10000 CHECK(price>1000),
    PRIMARY KEY (bookname, publisher)
    );