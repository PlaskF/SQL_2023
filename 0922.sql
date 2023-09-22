-- 연습문제 1.

select abs(15) from dual;           --> 15
-- abs(숫자): 숫자의 절대값 계산

select ceil(15.7) from dual;        --> 16
-- ceil(숫자): 숫자보다 크거나 같은 최소의 정수

select cos(3.14159) from dual;      --> -0.999 ... 324
-- cos(): 

select floor(15.7) from dual;       --> 15
-- floor(숫자): 숫자보다 작거나 같은 최소의 정수

select log(10,100) from dual;       --> 2
-- log(n,숫자): 숫자의 자연로그 값 반환

select mod(11,4) from dual;         --> 3
-- mod(): 

select power(3,2) from dual;        --> 9
-- power(숫자,n): 숫자의 n제곱 값 계산

select round(15.7) from dual;       --> 16
-- round(숫자,m): m자리 기준으로 숫자 반올림

select sign(-15) from dual;         --> -1
-- sign(숫자): 숫자가 음수이면 -14,0이면 0,양수이면 1

select trunc(15.7) from dual;       --> 15
-- 

select chr(67) from dual;           --> C
-- chr(k): 정수 아스키코드를 문자로 변환

select concat('HAPPY','BIRTHDAY') from dual;    --> HAPPYBIRTHDAY
-- concat(s1,s2): 두 문자열을 연결

select lower('Birthday') from dual;             --> birthday
-- lower(s): 대상 문자열을 모두 소문자로 변환

select lpad('Page 1',15,'*.') from dual;        --> *.*.*.*.*Page 1
-- lpad(s,n,c): 대상 문자열의 왼쪽부터 지정한 자릿수까지 지정한 문자로 채움

select ltrim('Page 1','ae') from dual;          --> Page 1
-- ltrim(s1,s2): 대상 문자열의 왼쪽부터 지정한 문자들을 제거

select replace('JACK','J','BL') from dual;      --> BLACK
-- replace(s1,s2,s3): 대상 문자열의 지정한 문자를 원하는 문자로 변경

select rpad('Page 1',15,'*.') from dual;        --> Page 1*.*.*.*.*
-- rpad(s,n,c): 대상 문자열의 오른쪽부터 지정한 자릿수까지 지정한 문자로 채움

select rtrim('Page 1','ae') from dual;          --> Page 1
-- rtrim(s1,s2): 대상 문자열의 오른쪽부터 지정한 문자들을 제거


-- 고객의 이름과 전화번호를 출력하시오.(단, 전화번호가 없는 고객은 '연락처없음'으로 출력하시오
SELECT name 이름, phone 전화번호 FROM customer;
SELECT name 이름, nvl(phone, '연락처없음') 전화번호 FROM customer;

-- 고객목록에서 순번, 고객번호, 이름, 전화번호를 앞의 두명만 출력하시오.
SELECT ROWNUM 순번, custid, name, phone FROM customer;
SELECT ROWNUM 순번, custid, name, phone FROM customer WHERE ROWNUM<=2;


-- 연습문제 2
-- mybook 테이블 생성
create TABLE mybook (
    bookid  NUMBER NOT NULL PRIMARY KEY,
    price   number
);

-- 데이터 행 삽입
INSERT INTO mybook VALUES(1,10000);
INSERT INTO mybook VALUES(2,20000);
INSERT INTO mybook(bookid) VALUES(3);
SELECT * FROM mybook;

select bookid,NVL(price,0) FROM mybook;
-- price의 null 속성을 0으로 대체

select * FROM mybook WHERE price IS NULL;
-- price가 null인 데이터 출력하기

select * FROM mybook WHERE price='';
-- price 값이 ''인 데이터 출력하기
-- 해당되는 데이터가 없다

select bookid,price+100 FROM mybook;
-- booid, price에 100을 추가한 후 출력하기
-- null 은 집계에서 빠진다

select sum(price),avg(price),count(*) FROM mybook WHERE bookid >=4;
-- bookid가 4 이상인 데이터 출력하기
-- bookid는 3까지, 그 이상은 null

select count(*),count(price) FROM mybook;
-- 모든 데이터의 행의 개수, price 데이터 행의 개수 출력하기
-- price 의 데이터에 null 이 있으니 2 출력

select sum(price),avg(price) FROM mybook;
-- price의 총합, 평균 각각 출력하기


-- 연습문제 3
SELECT * from book;
-- book의 데이터 출력
SELECT * from book WHERE ROWNUM <=5;
-- book의 데이터행 5까지 출력
SELECT * from book WHERE ROWNUM <=5 ORDER BY price;
-- 데이터행 5까지 출력 후 price의 내림차순으로 정렬
SELECT * from (SELECT * from book ORDER BY price)b WHERE ROWNUM <=5;
-- 먼저 price부터 정렬 후 데이터행 5개 출력
SELECT * from (SELECT * from book WHERE ROWNUM <=5)b ORDER BY price;
-- 데이터행 5까지 선택 후 price의 내림차순으로 정렬
SELECT * FROM (SELECT * from book WHERE ROWNUM <=5 ORDER BY price)b;
-- 데이터행 5까지 선택 후 price의 내림차순으로 정렬한 것을 선택

-- 평균판매금액 이하의 주문에 대해 주문번호와 금액을 출력하시오.
SELECT orderid 주문번호, saleprice 금액 FROM orders; 
SELECT orderid 주문번호, saleprice 금액 FROM orders
WHERE saleprice <= (SELECT avg(saleprice) FROM orders);

-- 각 고객의 평균판매금액보다 큰 금액의 주문 내역에서만 주문번호, 고객번호, 판매금액을 출력하시오.
SELECT orderid 주문번호, custid 고객번호, saleprice 금액 FROM orders;
SELECT orderid 주문번호, custid 고객번호, saleprice 금액 FROM orders mo
WHERE saleprice > (SELECT  avg(saleprice) FROM orders so WHERE mo.custid = so.custid);

-- 서울에 거주하는 고객에게 판매한 도서의 총판매금액을 출력하시오
SELECT sum(saleprice) 총판매금액 FROM orders;
-- 서울에 거주하는 사람의 고객번호
SELECT custid FROM customer WHERE address like '%서울%';
SELECT sum(saleprice) 총판매금액 FROM orders 
WHERE custid IN(SELECT custid FROM customer WHERE address like '%서울%');

-- 서울에 거주하지 않는 고객에게 판매한 도서의 총판매금액을 출력하시오
SELECT sum(saleprice) 총판매금액 FROM orders 
WHERE custid NOT IN(SELECT custid FROM customer WHERE address like '%서울%');

-- 3번 고객이 주문한 도서의 최고금액보다 더 비싼 도서를 구입한 주문의 주문번호와 금액을 출력하시오.
SELECT orderid 주문번호, saleprice 금액 FROM orders;
SELECT orderid 주문번호, saleprice 금액 FROM orders 
WHERE saleprice > all(SELECT saleprice FROM orders WHERE orders.custid=3);
-- max로 대체 가능

-- 서울에 거주하는 고객에게 판매한 도서의 총판매액을 구하시오.(단, exit 연산자 사용)
SELECT saleprice 총판매액 FROM orders mo 
WHERE EXISTS(
SELECT * FROM customer c 
WHERE address LIKE '%서울%' AND mo.custid=c.custid);

-- 고객별 판매금액의 합계를 출력하시오.(고객번호, 판매합계)
SELECT custid 고객번호, sum(saleprice) 판매합계 FROM orders group by custid;
SELECT (select name from customer c 
where c.custid = o.custid) 고객명, sum(saleprice) 판매합계 FROM orders o 
GROUP BY o.custid;

-- 주문목록에 책이름을 저장할 수 있는 컬럼을 추가하시오.
ALTER TABLE orders add bookname VARCHAR2(40);

UPDATE orders o SET bookname = 
(select bookname FROM book b WHERE b.bookid=o.bookid);

-- 고객번호가 2 이하인 고객번호와 이름을 출력하시오.
SELECT custid 고객번호, name 이름 FROM customer WHERE custid<=2;

-- 고객번호가 2 이하인 고객의 판매금액을 출력하시오.(고객이름과 고객별 판매액 출력)
SELECT name 고객이름, sum(saleprice) 판매총액 
FROM (SELECT custid, name FROM customer WHERE custid<=2) c, orders o 
WHERE c.custid=o.custid group by name;

SELECT name 고객이름, sum(saleprice) 판매총액 
FROM customer c, orders o 
WHERE c.custid=o.custid group by name;



-- 연습문제 5
SELECT custid,
(select address from customer cs where cs.custid=od.custid)"adress",
sum(saleprice)"total"
from orders od group by od.custid;
-- 스칼라 서브쿼리 

select cs.name,s from 
(select custid,avg(saleprice)s from orders group by custid)od, 
customer cs
where cs.custid=od.custid;
-- 인라인 뷰 서브쿼리

select sum(saleprice)"total" from orders od 
where EXISTS
(select * from customer cs where custid <=3 
AND cs.custid=od.custid);
-- 중첩질의 서브쿼리

select substr('ABCDEFG',3,4) from dual;         --> CDEF
select trim(leading 0 from '00AA00') from dual;  --> AA00 
select upper('Birthday') from dual;             --> BIRTHDAY
select ASCII('A') from dual;                    --> 65
select instr('CORPORATE FLOOR','OR',3,2) from dual;  --14
select length('Birthday') from dual;            --> 8
select add_months('14/05/21',1) from dual;      --> 14/06/21
select last_day(sysdate) from dual;             --> 23/09/30
select next_day(sysdate,'화') from dual;        --> 23/09/26
select round(sysdate) from dual;                --> 23/09/22
select sysdate from dual;                       --> 23/09/22
select to_char(sysdate) from dual;              --> 23/09/22
select to_char(123) from dual;                  --> 123 
select to_date('12 05 2014','dd mm yyyy') from dual; --> 14/05/12
select to_number('12.3') from dual;             --> 12.3
select decode(1,1,'aa','bb') from dual;         --> aa 
select nullif(123,345) from dual;               --> 123

select nvl(null,123) from dual;                 --> 123
-- nvl('속성','값'): '속성'이 null 값이면 '값'으로 대체한다.












