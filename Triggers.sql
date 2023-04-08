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




