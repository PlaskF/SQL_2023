create or replace PROCEDURE AVERAGEPRICE(
    averageval OUT NUMBER)
AS 
BEGIN
  SELECT AVG(price) INTO averageval FROM book WHERE price IS NOT NULL;
END;