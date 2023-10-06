create or replace PROCEDURE INSERTBOOK(
    mybookid IN NUMBER,
    mybookname IN VARCHAR2,
    mypublisher IN VARCHAR2,
    myprice IN NUMBER)
AS 
BEGIN
  INSERT INTO book(bookid, bookname, publisher, price)
  VALUES(mybookid, mybookname, mypublisher, myprice);
END;