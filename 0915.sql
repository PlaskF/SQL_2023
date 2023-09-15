--DDL(Date Defination Language): 데이터 정의어

--고객정보(newcustomer 테이블)
--custid(기본키), name, address, phone
CREATE TABLE newcustomer (
    custid  NUMBER PRIMARY KEY,
    name    VARCHAR2(40),
    address VARCHAR2(40),
    phone   NUMBER
    );

--orderid(기본키), custid(not null, newcustomer custid 참조해서 외래키, 연쇄삭제)
--bookid(not null, new book3 bookid 참조해서 왜래키, 연쇄삭제)
--saleprice
--orderdate(date형)
CREATE TABLE neworders (
    orderid NUMBER  PRIMARY KEY,
    custid  NUMBER  NOT NULL ,
    bookid  NUMBER  NOT NULL,
    saleprice   NUMBER,
    orderdate   DATE,
    FOREIGN KEY(custid) REFERENCES newcustomer(custid) ON DELETE CASCADE,
    FOREIGN KEY(custid) REFERENCES newbook3(bookid) ON DELETE CASCADE
    );

--Alter문
--이미 생성된 테이블의 구조를 변경할 때 사용
--add(추가),drop(삭제),modify(수정)

--기존의 newbook1 테이블을 삭제하고 새 테이블
CREATE TABLE newbook1 (
    bookid  NUMBER,
    bookname VARCHAR2(20),
    publisher VARCHAR2(20),
    price   NUMBER
    );
-- isbn 컬럼 추가
ALTER TABLE newbook1 ADD isbn VARCHAR2(13);
-- isbn 컬럼의 자료형 변경
ALTER TABLE newbook1 MODIFY isbn NUMBER;

-- isbn 컬럼 삭제
ALTER TABLE newbook1 DROP COLUMN isbn;

-- bookname 컬럼의 varchar2(30) not null 제약조건 변경 
ALTER TABLE newbook1 MODIFY bookname VARCHAR2(30) NOT NULL;

-- bookid 컬럼에 not null 제약조건
ALTER TABLE newbook1 MODIFY bookid NUMBER NOT NULL;
-- bookid 컬럼의 기본키 추가
ALTER TABLE newbook1 ADD PRIMARY KEY(bookid);

-- 테이블 삭제
DROP TABLE newbook1;

-- DML(select, insert(데이터삽입), update(데이터수정), delete(데이터삭제))
-- insert 1번: 속성리스트 생략
INSERT into book VALUES(11, '나무','좋은책',12000);

-- insert 2번: 속성(컬럼)리스트 명시
INSERT into book(bookid, bookname, publisher, price) 
VALUES(12, '라임오렌지나무','좋은책',8000);

-- insert 3번: 컬럼의 순서를 변경
INSERT into book(bookid, price, publisher, bookname) 
VALUES(13, 28000,'부자나라','부의 습관');

-- insert 4번: 특정 컬럼의 값을 생략
INSERT into book(bookid, price, bookname) 
VALUES(14, 10000, '아침 명상');

-- 테이블구조가 같은 다른 테이블의 데이터행 삽입하는 방법
INSERT into book(bookid,bookname,price,publisher) 
SELECT bookid,bookname,price,publisher 
FROM imported_book;

-- update: 데이터 변경
-- 고객번호가 5번인 고객의 주소를 대한민국 부산 변경하시오.
SELECT * FROM customer;
UPDATE customer SET address='대한민국 부산' WHERE custid=5;

-- 박세리 고객의 주소를 김연아 고객의 주소와 동일하게 변경하시오.
UPDATE customer SET address=(
SELECT address FROM customer WHERE name='김연아')
WHERE name='박세리';

-- 박세리 고객의 전화번호를 김연아 고객의 전화번호와 동일하게 변경하시오.
UPDATE customer SET phone=(
SELECT phone FROM customer WHERE name='김연아')
WHERE name='박세리';

-- 모든 고객을 삭제하시오.
DELETE FROM customer;

SELECT * FROM orders;
SELECT * FROM customer;
-- 박세리 고객을 삭제하시오.
DELETE FROM customer WHERE name='박세리';

ROLLBACK;
COMMIT;

-- 3-1
SELECT name FROM customers WHERE name=(
SELECT name FROM orders WHERE 