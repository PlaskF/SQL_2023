-- �������� Book ���̺�
create TABLE Book(
    bookid NUMBER(2) PRIMARY KEY,
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price NUMBER(8)
);

-- ���Ե������� Imported_Book ���̺�
create TABLE Imported_Book(
    bookid NUMBER(2),
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price NUMBER(8)
);

-- ������ Customer ���̺�
CREATE TABLE Customer(
    custid NUMBER(2) PRIMARY KEY,
    name VARCHAR2(40),
    address VARCHAR2(50),
    phone VARCHAR2(20)
);

-- �ֹ����� Orders ���̺�
CREATE TABLE Orders(
    orderid NUMBER(2) PRIMARY KEY,
    custid NUMBER(2) REFERENCES Customer(custid),
    bookid NUMBER(2) REFERENCES Book(bookid),
    saleprice NUMBER(8),
    orderdate DATE
);

-- Book ���̺� 10���� ���� ������ �߰��ϼ���
INSERT into Book VALUES(1, '�౸�� ����', '�½�����', 7000);
INSERT into Book VALUES(2, '����丮����', '��ŷ���丮', 13000);
INSERT into Book VALUES(3, '������ ����', '���̽���', 12000);
INSERT into Book VALUES(4, '�Ƹ޸�ĭ ���θ��׿콺', '���̾𽺺Ͻ�', 22500);
INSERT into Book VALUES(5, '������ ���� ��ż', '�����', 12800);
INSERT into Book VALUES(6, '����', '����å��', 15800);
INSERT into Book VALUES(7, '���� �ż���', '�Ҵ����ǻ�', 13800);
INSERT into Book VALUES(8, '���ŧ��', 'Ǫ�����ִϾ�', 9500);
INSERT into Book VALUES(9, '�����˽�Ÿ��', '���е���', 11000);
INSERT into Book VALUES(10, '����ũ����Ʈ ����', 'Ȳ�ݰ���', 17000);

-- customer ���̺� ������ 5�� �߰�
INSERT into customer VALUES(1, '������', '���� ��ü����', '000-5000-001');
INSERT into customer VALUES(2, '�迬��', '���� ���۱� �漮��', '02-333-5555');
INSERT into customer VALUES(3, '��̶�', '���� ��걸 ������', '02-555-7777');
INSERT into customer VALUES(4, '�߽ż�', '��õ������ ������', '032-233-5656');
INSERT into customer VALUES(5, '�ڼ���', '���������� ������', '042-322-1234');




