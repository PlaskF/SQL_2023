-- book 테이블에서 과학이라는 문자열을 포함하고 도서가격이 15000원 이상인 데이터 행을 검색하시오.
SELECT * FROM book WHERE bookname LIKE '%과학%' AND price >=15000;
-- book 테이블에서 출판사가 굿스포츠 또는 어크로스인 도서를 검색하시오.
SELECT * FROM book WHERE publisher='굿스포츠' OR publisher='사계절';
-- 위 문제를 in 연산자를 사용하여 수정하시오.
SELECT * FROM book WHERE publisher IN ('굿스포츠','사계절');
-- book 테이블에서 도서명 순으로 검색하시오.
SELECT * FROM book ORDER by bookname;
-- book 테이블에서 도서번호 순으로 검색하시오.
SELECT * FROM book ORDER by bookid;
-- book 테이블에서 가격 순으로 검색하고 같은 가격이면 이름순으로 검색하시오.
SELECT * FROM book ORDER by price, bookname;
-- book 테이블에서 가격을 내림차순으로 검색하고 같은 가격이면 출판사 순으로 검색하시오.
SELECT * FROM book ORDER by price DESC, publisher ASC;

-- orders 테이블에서 고객이 주문한 도서의 총 판매액을 구하시오.
-- 집계함수 사용(합계: sum)
SELECT * FROM orders;
SELECT SUM(saleprice) as 총판매금액 FROM orders;

-- orders 테이블에서 고객번호가 1인 고객이 주문한 도서의 총판매금액을 구하시오.
SELECT SUM(saleprice) as 총판매금액 FROM orders WHERE custid=1;
-- orders 테이블에서 판매액의 합계, 평균, 최소값, 최대값을 구하시오.
SELECT SUM(saleprice) as 총판매금액, 
AVG(saleprice) as 평균값,
MIN(saleprice) as 최저가,
MAX(saleprice) as 최고가 FROM orders;
-- orders 테이블에서 판매한 도서의 개수를 구하시오.
SELECT count(*) FROM orders;
-- orders 테이블에서 도서가격이 13000원 이상인 도서의 개수를 구하시오.
SELECT count(*) FROM orders WHERE saleprice>=13000;
-- orders 테이블에서 고객번호가 1 또는 3인 고객의 주문 개수를 구하시오.
SELECT COUNT(*) FROM orders WHERE custid IN (1,3);
-- orders 테이블에서 고객별 주문한 도서의 개수와 총합계를 구하시오.
-- 그룹화(부분합)
SELECT custid, COUNT(*) 주문수량, SUM(saleprice) 주문총액 
FROM orders GROUP by custid ORDER by custid;
-- orders 테이블에서 판매가격이 8000원 이상인 도서를 구매한 고객에 대해 고객별 주문 도서의 총수량을 구하시오.
-- 단 2권 이상 구매한 고객만 출력하시오.
SELECT custid, COUNT(*) as 도서수량 FROM orders 
WHERE saleprice>=8000 GROUP by custid
HAVING COUNT(*) >=2
ORDER by custid;

-- 연습문제
-- 1-1
SELECT bookname FROM book WHERE bookid=1;
-- 1-2
SELECT bookname FROM book WHERE price>=20000;
-- 1-3
SELECT SUM(saleprice) as 총구매액 FROM orders WHERE custid=1;
-- 1-4
SELECT COUNT(*) FROM orders WHERE custid=1;

-- 2-1
SELECT COUNT(*) 도서_총개수 FROM book;
-- 2-2
SELECT COUNT(DISTINCT publisher) 출판사_수 FROM book;
-- 2-3
SELECT name,address FROM customer;
-- 2-4
SELECT orderid FROM orders WHERE orderdate 
BETWEEN '2014-07-04' and '2014-07-07';
-- 2-5
SELECT orderid FROM orders WHERE NOT orderdate 
BETWEEN '2014-07-04' and '2014-07-07';
-- 2-6
SELECT name,address FROM customer WHERE name LIKE '김%';
-- 2-7
SELECT name,address FROM customer 
WHERE name LIKE '김%' AND name LIKE '%아';