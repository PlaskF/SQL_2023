-- 도서정보 Book 테이블
create TABLE Book(
    bookid NUMBER(2) PRIMARY KEY,
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price NUMBER(8)
);

-- 수입도서정보 Imported_Book 테이블
create TABLE Imported_Book(
    bookid NUMBER(2),
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price NUMBER(8)
);

-- 고객정보 Customer 테이블
CREATE TABLE Customer(
    custid NUMBER(2) PRIMARY KEY,
    name VARCHAR2(40),
    address VARCHAR2(50),
    phone VARCHAR2(20)
);

-- 주문정보 Orders 테이블
CREATE TABLE Orders(
    orderid NUMBER(2) PRIMARY KEY,
    custid NUMBER(2) REFERENCES Customer(custid),
    bookid NUMBER(2) REFERENCES Book(bookid),
    saleprice NUMBER(8),
    orderdate DATE
);

-- Book 테이블에 10권의 도서 정보를 추가하세요
INSERT into Book VALUES(1, '축구의 역사', '굿스포츠', 7000);
INSERT into Book VALUES(2, '세계요리열전', '쿠킹팩토리', 13000);
INSERT into Book VALUES(3, '반지의 제왕', '북이십일', 12000);
INSERT into Book VALUES(4, '아메리칸 프로메테우스', '사이언스북스', 22500);
INSERT into Book VALUES(5, '마당을 나온 암탉', '사계절', 12800);
INSERT into Book VALUES(6, '개미', '열린책들', 15800);
INSERT into Book VALUES(7, '멋진 신세계', '소담출판사', 13800);
INSERT into Book VALUES(8, '드라큘라', '푸른숲주니어', 9500);
INSERT into Book VALUES(9, '프랑켄슈타인', '문학동네', 11000);
INSERT into Book VALUES(10, '러브크래프트 전집', '황금가지', 17000);

-- customer 테이블에 고객정보 5명 추가
INSERT into customer VALUES(1, '박지성', '영국 맨체스터', '000-5000-001');
INSERT into customer VALUES(2, '김연아', '서울 동작구 흑석동', '02-333-5555');
INSERT into customer VALUES(3, '장미란', '서울 용산구 보광동', '02-555-7777');
INSERT into customer VALUES(4, '추신수', '인천광역시 연수구', '032-233-5656');
INSERT into customer VALUES(5, '박세리', '대전광역시 유성구', '042-322-1234');




