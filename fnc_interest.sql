-- ����� ���� �Լ� �����
CREATE OR REPLACE FUNCTION FNC_INTEREST(price NUMBER) RETURN INT 
IS
    myinterest NUMBER;  
BEGIN
  IF price >= 30000 THEN myinterest := price * 0.1;
  ELSE myinterest := price * 0.05;
  END IF;
  RETURN myinterest;
END;
-- ������ 3���� �̻��̸� 10%, 3���� �̸��̸� 5%