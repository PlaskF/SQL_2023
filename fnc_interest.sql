-- 사용자 정의 함수 만들기
CREATE OR REPLACE FUNCTION FNC_INTEREST(price NUMBER) RETURN INT 
IS
    myinterest NUMBER;  
BEGIN
  IF price >= 30000 THEN myinterest := price * 0.1;
  ELSE myinterest := price * 0.05;
  END IF;
  RETURN myinterest;
END;
-- 가격이 3만원 이상이면 10%, 3만원 미만이면 5%