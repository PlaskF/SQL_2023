-- 3-1 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
-- 박지성이 구매한 도서의 출판사의 이름
SELECT publisher FROM customer, orders, book 
WHERE orders.custid = customer.custid AND orders.bookid = book.bookid 
AND name like '박지성';

SELECT name FROM customer, orders, book 
WHERE orders.custid = customer.custid AND orders.bookid = book.bookid 
AND name not like '박지성' AND publisher IN(
    SELECT publisher FROM customer, orders, book 
    WHERE orders.custid = customer.custid AND orders.bookid = book.bookid 
    AND name like '박지성'
);

-- 3-2 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름
SELECT name FROM customer 
WHERE (SELECT COUNT(DISTINCT publisher) FROM customer, orders, book 
        WHERE orders.custid = customer.custid AND orders.bookid = book.bookid 
        AND name LIKE customer.name)>=2;

-- 3-3 전체 고객의 30% 이상이 구매한 도서
SELECT bookname FROM book bm 
WHERE (SELECT count(b.bookid) FROM book b, orders o 
        WHERE o.bookid = b.bookid AND bm.bookid = b.bookid) 
        >= (SELECT COUNT(*) FROM customer)*0.3;

-- 4-1  
INSERT INTO book VALUES(15, '스포츠세계', '대한미디어', 10000);

-- 4-2
DELETE FROM book WHERE publisher LIKE '문학동네';

-- 4-3
-- 무결성 제약조건이 위배되었습니다- orders 테이블의 자식 레코드가 발견되었습니다
DELETE FROM book WHERE publisher LIKE '황금가지';

-- 4-4
UPDATE book SET publisher='대한출판사' WHERE publisher LIKE '대한미디어';

-- 4-5
CREATE TABLE bookcompany(
    name    VARCHAR2(20) PRIMARY KEY,
    address VARCHAR2(20),
    begin   DATE
    );
    
-- 4-6
ALTER TABLE bookcompany ADD webadress VARCHAR2(30);

-- 4-7
INSERT INTO bookcompany VALUES('한빛아카데미', '서울시 마포구', '1993-01-01', 'http://hanbit.co.kr');

-- abs: 절대값 구하는 함수
SELECT abs(-33), abs(33) FROM dual;

-- 5.657을 소수 첫째자리까지 반올림한 값을 구하시오.
SELECT round(5.657,1) FROM dual;

-- 고객별 평균 주문금액을 백원 단위로 반올림한 값을 구하시오.
SELECT custid "고객번호", round(avg(saleprice), -2) "평균금액" FROM orders 
GROUP BY custid;

-- 도서명에 '과학'이 포함된 도서를 '수학'으로 변경하여 출력하시오.
-- 실제 book 테이블의 원본데이터를 변경하면 안 된다.
SELECT bookid, replace(bookname, '과학','수학') bookname, publisher, price FROM book;
SELECT * FROM book;

-- 출판사가 '해냄'인 도서명의 글자수와 바이트수를 출력하시오.
SELECT bookname "도서명", length(bookname) "글자수", lengthb(bookname) "바이트수" from book 
WHERE publisher LIKE '해냄';

-- 고객 중에서 같은 성씨를 가진 사람이 몇명인지 성씨별로 인원수를 출력하시오.
SELECT substr(name, 1, 1) "성씨", count(*) "인원수" FROM customer GROUP BY substr(name, 1, 1);

-- 서점의 주문확정일은 주문일로부터 10일 후이다. 주문번호, 주문일, 주문확정일을 출력하시오.
select orderid 주문번호, orderdate 주문일, orderdate+10 확정 FROM orders ORDER BY orderid;

-- 2023년 8월 28일에 주문 받은 주문번호, 주문일, 고객번호, 도서번호를 모두 출력하시오.
-- 단, 주문일은 "yyyy년 mm월 dd일"과 같은 형식으로 표시하시오.
SELECT orderid 주문번호, to_char(orderdate, 'yyyy-mm-dd') 주문일, custid 고객번호, bookid 도서번호 
FROM orders where orderdate=to_date('20230828', 'yyyymmdd');

-- 2023년 8월 28일에 주문 받은 주문번호, 주문일, 고객명, 도서명을 모두 출력하시오.
-- 단, 주문일은 "yyyy년 mm월 dd일"과 같은 형식으로 표시하시오.
SELECT orderid 주문번호, orderdate 주문일, name 고객명, bookname 도서명 
FROM orders,customer,book where orders.custid = customer.custid AND orders.bookid = book.bookid 
AND orderdate=to_date('20230828', 'yyyymmdd');

-- DB 서버의 설정된 날짜와 시간 요일을 출력하시오.
-- 실제 반환된 날짜와 형식을 지정한(년도4자리/월2자리/날짜2자리/ 간략한 요일, 시:분:초) 날짜와 시간 2가지를 모두 출력하시오.
SELECT sysdate 원래반환된값, to_char(sysdate, 'yyyy/mm/dd dy hh24:mi:ss') 지정형식날짜및시간
FROM dual;