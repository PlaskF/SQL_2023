create or replace PROCEDURE INSERTORUPDATE(
    mybookid NUMBER,
    mybookname VARCHAR2,
    mypublisher VARCHAR2,
    myprice INT)
AS
    mycount NUMBER;
BEGIN
  SELECT COUNT(*) INTO mycount FROM book
  WHERE bookname LIKE mybookname;
  
  IF mycount != 0 THEN 
   UPDATE book SET price = myprice 
    WHERE bookname LIKE mybookname;
  ELSE
   INSERT INTO book(bookid, bookname, publisher, price) 
    VALUES(mybookid, mybookname, mypublisher, myprice);
    
  END IF;
END;