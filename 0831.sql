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

SELECT publisher, price FROM book WHERE bookname LIKE '�౸�� ����';
SELECT phone from customer WHERE name='�迬��';
SELECT * from customer WHERE name='�迬��';

--book ���̺��� ������� ������ �˻��Ͻÿ�.
select bookname, price from book;
--book ���̺��� ���ݰ� �������� �˻��Ͻÿ�.
select price, bookname from book;
--book ���̺��� ������ȣ, ������, ���ǻ�, ������ �˻��Ͻÿ�
select * from book;
--book ���̺��� ��� ���ǻ縦 �˻��Ͻÿ�.
SELECT publisher FROM book;
--book ���̺��� ��� ���ǻ縦 �˻��Ͻÿ�.(�ߺ��Ǵ� ���ǻ�� �����Ͻÿ�.)
SELECT DISTINCT publisher FROM book;
--book ���̺��� ������ 15000�� �̸��� ������ �˻��Ͻÿ�.
select * FROM book where price < 15000;
--book ���̺��� ������ 10000�� �̻� 16000 ������ ������ �˻��Ͻÿ�.
SELECT * FROM book WHERE price BETWEEN 10000 and 16000;
SELECT * FROM book WHERE price >= 10000 and price<= 16000;
--book ���̺��� ���ǻ簡 ��ŷ���丮,�����,���̽����� ������ �˻��Ͻÿ�.
select * FROM book where publisher in('��ŷ���丮','�����','���̽���');
--book ���̺��� ���ǻ簡 ��ŷ���丮,�����,���̽����� ������ �˻��Ͻÿ�.
--�� in �����ڸ� ������� ���ÿ�.(�񱳿����ڿ� or ������ ���)
select * FROM book where publisher='��ŷ���丮' or publisher='�����' or publisher='���̽���';
--book ���̺��� ���ǻ簡 ��ŷ���丮,�����,���̽����� �ƴ� ������ �˻��Ͻÿ�.
select * FROM book WHERE publisher NOT IN('��ŷ���丮','�����','���̽���');
--book ���̺��� ���ǻ簡 ��ŷ���丮,�����,���̽����� �ƴ� ������ �˻��Ͻÿ�.
--�� in �����ڸ� ������� ���ÿ�.(�񱳿����ڿ� and ������ ���)
select * FROM book WHERE publisher<>'��ŷ���丮' and publisher<>'�����' and publisher<>'���̽���';
--book ���̺��� ������ �౸�� ������ ���� �˻��Ͻÿ�.
SELECT * FROM book WHERE bookname='�౸�� ����';
SELECT * FROM book WHERE bookname like '�౸�� ����';
--book ���̺��� ������ �౸��� ���ڿ��� ���Ե� ���� �˻��Ͻÿ�.
SELECT * FROM book WHERE bookname like '%�౸%';
--book ���̺��� ������ �����̶�� ���ڿ��� ���Ե� ���� �˻��Ͻÿ�.
SELECT * FROM book WHERE bookname like '%����%';
--book ���̺��� ������ �����̶�� ���ڿ��� ������ ���� �˻��Ͻÿ�.
SELECT * FROM book WHERE bookname like '%����';
--book ���̺��� ������ '��'�� �տ� ������ 2���ڰ� ���Ե� ���� �˻��Ͻÿ�.
SELECT * FROM book WHERE bookname like '__��%';