--DDL(Date Defination Language): ������ ���Ǿ�

--������(newcustomer ���̺�)
--custid(�⺻Ű), name, address, phone
CREATE TABLE newcustomer (
    custid  NUMBER PRIMARY KEY,
    name    VARCHAR2(40),
    address VARCHAR2(40),
    phone   NUMBER
    );

--orderid(�⺻Ű), custid(not null, newcustomer custid �����ؼ� �ܷ�Ű, �������)
--bookid(not null, new book3 bookid �����ؼ� �ַ�Ű, �������)
--saleprice
--orderdate(date��)
CREATE TABLE neworders (
    orderid NUMBER  PRIMARY KEY,
    custid  NUMBER  NOT NULL ,
    bookid  NUMBER  NOT NULL,
    saleprice   NUMBER,
    orderdate   DATE,
    FOREIGN KEY(custid) REFERENCES newcustomer(custid) ON DELETE CASCADE,
    FOREIGN KEY(custid) REFERENCES newbook3(bookid) ON DELETE CASCADE
    );

--Alter��
--�̹� ������ ���̺��� ������ ������ �� ���
--add(�߰�),drop(����),modify(����)

--������ newbook1 ���̺��� �����ϰ� �� ���̺�
CREATE TABLE newbook1 (
    bookid  NUMBER,
    bookname VARCHAR2(20),
    publisher VARCHAR2(20),
    price   NUMBER
    );
-- isbn �÷� �߰�
ALTER TABLE newbook1 ADD isbn VARCHAR2(13);
-- isbn �÷��� �ڷ��� ����
ALTER TABLE newbook1 MODIFY isbn NUMBER;

-- isbn �÷� ����
ALTER TABLE newbook1 DROP COLUMN isbn;

-- bookname �÷��� varchar2(30) not null �������� ���� 
ALTER TABLE newbook1 MODIFY bookname VARCHAR2(30) NOT NULL;

-- bookid �÷��� not null ��������
ALTER TABLE newbook1 MODIFY bookid NUMBER NOT NULL;
-- bookid �÷��� �⺻Ű �߰�
ALTER TABLE newbook1 ADD PRIMARY KEY(bookid);

-- ���̺� ����
DROP TABLE newbook1;

-- DML(select, insert(�����ͻ���), update(�����ͼ���), delete(�����ͻ���))
-- insert 1��: �Ӽ�����Ʈ ����
INSERT into book VALUES(11, '����','����å',12000);

-- insert 2��: �Ӽ�(�÷�)����Ʈ ���
INSERT into book(bookid, bookname, publisher, price) 
VALUES(12, '���ӿ���������','����å',8000);

-- insert 3��: �÷��� ������ ����
INSERT into book(bookid, price, publisher, bookname) 
VALUES(13, 28000,'���ڳ���','���� ����');

-- insert 4��: Ư�� �÷��� ���� ����
INSERT into book(bookid, price, bookname) 
VALUES(14, 10000, '��ħ ���');

-- ���̺����� ���� �ٸ� ���̺��� �������� �����ϴ� ���
INSERT into book(bookid,bookname,price,publisher) 
SELECT bookid,bookname,price,publisher 
FROM imported_book;

-- update: ������ ����
-- ����ȣ�� 5���� ���� �ּҸ� ���ѹα� �λ� �����Ͻÿ�.
SELECT * FROM customer;
UPDATE customer SET address='���ѹα� �λ�' WHERE custid=5;

-- �ڼ��� ���� �ּҸ� �迬�� ���� �ּҿ� �����ϰ� �����Ͻÿ�.
UPDATE customer SET address=(
SELECT address FROM customer WHERE name='�迬��')
WHERE name='�ڼ���';

-- �ڼ��� ���� ��ȭ��ȣ�� �迬�� ���� ��ȭ��ȣ�� �����ϰ� �����Ͻÿ�.
UPDATE customer SET phone=(
SELECT phone FROM customer WHERE name='�迬��')
WHERE name='�ڼ���';

-- ��� ���� �����Ͻÿ�.
DELETE FROM customer;

SELECT * FROM orders;
SELECT * FROM customer;
-- �ڼ��� ���� �����Ͻÿ�.
DELETE FROM customer WHERE name='�ڼ���';

ROLLBACK;
COMMIT;

-- 3-1
SELECT name FROM customers WHERE name=(
SELECT name FROM orders WHERE 