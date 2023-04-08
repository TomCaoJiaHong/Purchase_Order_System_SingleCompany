DROP TRIGGER TRG_CLIENTS_TEST_402;

DELIMITER $$
CREATE TRIGGER TRG_CLIENTS_TEST_402
AFTER INSERT ON POs402
FOR EACH ROW
BEGIN
SET @clientID = new.Clients_clientID;
SET @quantity = new.orderQuantity;

UPDATE Clients402 SET dollarsOnOrder = dollarsOnOrder + (5 * @quantity) WHERE clientID = @clientID;
UPDATE Clients402 SET moneyOwed = moneyOwed + (5 * @quantity) WHERE clientID = @clientID;
END; $$
DELIMITER ;
Show triggers;


DROP PROCEDURE part_price;

DELIMITER $$
CREATE PROCEDURE part_price (IN id INT)

BEGIN
	SELECT * from mydb.Parts402 WHERE partNo = id;
END$$

CALL part_price(1);


