USE bankdb;

DELIMITER //

CREATE PROCEDURE LoanReminder()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE c_name VARCHAR(50);
    DECLARE due_date DATE;

    DECLARE cur CURSOR FOR
        SELECT CustomerName, DueDate
        FROM Customers
        JOIN Loans
        ON Customers.CustomerID = Loans.CustomerID
        WHERE DueDate BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY);

    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = TRUE;

    OPEN cur;

    read_loop: LOOP

        FETCH cur INTO c_name, due_date;

        IF done THEN
            LEAVE read_loop;
        END IF;

        SELECT CONCAT('Reminder: ', c_name,
                      ', your loan is due on ',
                      due_date) AS Message;

    END LOOP;

    CLOSE cur;

END //

DELIMITER ;
CALL LoanReminder();