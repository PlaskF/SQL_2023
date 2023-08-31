insert into orders VALUES (1, 1, 1, 6000, TO_DATE('2023-01-10','yyyy-mm-dd'));
insert into orders VALUES (2, 1, 2, 10000, TO_DATE('2023-02-12','yyyy-mm-dd'));
insert into orders VALUES (3, 2, 3, 8000, TO_DATE('2023-03-13','yyyy-mm-dd'));
insert into orders VALUES (4, 3, 4, 20000, TO_DATE('2023-04-14','yyyy-mm-dd'));
insert into orders VALUES (5, 4, 5, 10000, TO_DATE('2023-05-15','yyyy-mm-dd'));
insert into orders VALUES (6, 1, 6, 11000, TO_DATE('2023-06-16','yyyy-mm-dd'));
insert into orders VALUES (7, 4, 7, 12000, TO_DATE('2023-07-17','yyyy-mm-dd'));
insert into orders VALUES (8, 3, 8, 8500, TO_DATE('2023-08-18','yyyy-mm-dd'));
insert into orders VALUES (9, 2, 9, 11000, TO_DATE('2023-09-19','yyyy-mm-dd'));
insert into orders VALUES (10, 2, 10, 13000, TO_DATE('2023-10-11','yyyy-mm-dd'));

INSERT into imported_book VALUES(21, 'Zen Golf', 'person', 12000);
INSERT into imported_book VALUES(22, 'Soccer skills', 'Human kinetics', 15000);

SELECT publisher, price FROM book WHERE bookname LIKE '축구의 역사';
SELECT phone from customer WHERE name='김연아';
SELECT * from customer WHERE name='김연아';

--book 테이블에서 도서명과 가격을 검색하시오.
select bookname, price from book;
--book 테이블에서 가격과 도서명을 검색하시오.
select price, bookname from book;
--book 테이블에서 도서번호, 도서명, 출판사, 가격을 검색하시오
select * from book;
--book 테이블에서 모든 출판사를 검색하시오.
SELECT publisher FROM book;
--book 테이블에서 모든 출판사를 검색하시오.(중복되는 출판사는 제거하시오.)
SELECT DISTINCT publisher FROM book;
--book 테이블에서 가격이 15000원 미만인 도서를 검색하시오.
select * FROM book where price < 15000;
--book 테이블에서 가격이 10000원 이상 16000 이하인 도서를 검색하시오.
SELECT * FROM book WHERE price BETWEEN 10000 and 16000;
SELECT * FROM book WHERE price >= 10000 and price<= 16000;
--book 테이블에서 출판사가 쿠킹팩토리,사계절,북이십일인 도서를 검색하시오.
select * FROM book where publisher in('쿠킹팩토리','사계절','북이십일');
--book 테이블에서 출판사가 쿠킹팩토리,사계절,북이십일인 도서를 검색하시오.
--단 in 연산자를 사용하지 마시오.(비교연산자와 or 연산자 사용)
select * FROM book where publisher='쿠킹팩토리' or publisher='사계절' or publisher='북이십일';
--book 테이블에서 출판사가 쿠킹팩토리,사계절,북이십일이 아닌 도서를 검색하시오.
select * FROM book WHERE publisher NOT IN('쿠킹팩토리','사계절','북이십일');
--book 테이블에서 출판사가 쿠킹팩토리,사계절,북이십일이 아닌 도서를 검색하시오.
--단 in 연산자를 사용하지 마시오.(비교연산자와 and 연산자 사용)
select * FROM book WHERE publisher<>'쿠킹팩토리' and publisher<>'사계절' and publisher<>'북이십일';
--book 테이블에서 도서명에 축구의 역사인 행을 검색하시오.
SELECT * FROM book WHERE bookname='축구의 역사';
SELECT * FROM book WHERE bookname like '축구의 역사';
--book 테이블에서 도서명에 축구라는 문자열이 포함된 행을 검색하시오.
SELECT * FROM book WHERE bookname like '%축구%';
--book 테이블에서 도서명에 과학이라는 문자열이 포함된 행을 검색하시오.
SELECT * FROM book WHERE bookname like '%과학%';
--book 테이블에서 도서명에 과학이라는 문자열로 끝나는 행을 검색하시오.
SELECT * FROM book WHERE bookname like '%과학';
--book 테이블에서 도서명에 '의'자 앞에 임의의 2글자가 포함된 행을 검색하시오.
SELECT * FROM book WHERE bookname like '__의%';