CREATE DATABASE bankdb;
USE bankdb;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Age INT,
    Balance DECIMAL(10,2),
    IsVIP BOOLEAN DEFAULT FALSE
);
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    CustomerID INT,
    InterestRate DECIMAL(5,2),
    DueDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
INSERT INTO Customers VALUES
(1,'Rahul',65,15000,FALSE),
(2,'Priya',45,8000,FALSE),
(3,'Amit',70,20000,FALSE),
(4,'Sneha',30,5000,FALSE);
INSERT INTO Loans VALUES
(101,1,10.5,'2026-07-20'),
(102,2,9.0,'2026-08-25'),
(103,3,11.0,'2026-07-15'),
(104,4,8.5,'2026-09-10');
USE bankdb;
DELIMITER //

CREATE PROCEDURE DiscountInterest()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE c_id INT;
    DECLARE c_age INT;

    DECLARE cur CURSOR FOR
        SELECT CustomerID, Age
        FROM Customers;

    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = TRUE;

    OPEN cur;

    read_loop: LOOP

        FETCH cur INTO c_id, c_age;

        IF done THEN
            LEAVE read_loop;
        END IF;

        IF c_age > 60 THEN
            UPDATE Loans
            SET InterestRate = InterestRate - 1
            WHERE CustomerID = c_id;
        END IF;

    END LOOP;

    CLOSE cur;

END //

DELIMITER ;
CALL DiscountInterest();
SELECT * FROM Loans;