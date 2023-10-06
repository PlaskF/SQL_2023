create or replace PROCEDURE INTEREST 
AS
  myinterest NUMERIC;
  price NUMERIC;
  CURSOR interestcursor IS SELECT saleprice FROM orders;
BEGIN
  myinterest := 0.0;
  OPEN interestcursor;
  LOOP
    FETCH interestcursor INTO price;
    EXIT WHEN interestcursor%notfound;
    IF price >= 30000 THEN
        myinterest := myinterest + price * 0.1;
    ELSE
        myinterest := myinterest + price * 0.05;
    END IF;
   END LOOP;
   CLOSE interestcursor;
   dbms_output.put_line(' 전체 이익 금액 = '|| round(myinterest,3));
END;