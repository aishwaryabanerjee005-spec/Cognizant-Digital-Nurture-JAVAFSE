USE bankdb;

DELIMITER //

CREATE PROCEDURE SetVIP()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE c_id INT;
    DECLARE c_balance DECIMAL(10,2);

    DECLARE cur CURSOR FOR
        SELECT CustomerID, Balance
        FROM Customers;

    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = TRUE;

    OPEN cur;

    read_loop: LOOP

        FETCH cur INTO c_id, c_balance;

        IF done THEN
            LEAVE read_loop;
        END IF;

        IF c_balance > 10000 THEN
            UPDATE Customers
            SET IsVIP = TRUE
            WHERE CustomerID = c_id;
        END IF;

    END LOOP;

    CLOSE cur;

END //

DELIMITER ;
CALL SetVIP();
SELECT * FROM Customers;