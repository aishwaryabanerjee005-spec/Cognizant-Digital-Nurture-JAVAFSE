USE bankdb;

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
INSERT INTO Accounts VALUES
(101, 1, 'Savings', 10000.00),
(102, 2, 'Current', 15000.00),
(103, 3, 'Savings', 20000.00),
(104, 4, 'Savings', 5000.00);
SELECT * FROM Accounts;
USE bankdb;

DROP PROCEDURE IF EXISTS ProcessMonthlyInterest;

DELIMITER //

CREATE PROCEDURE ProcessMonthlyInterest()
BEGIN
    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01)
    WHERE AccountType = 'Savings';
END //

DELIMITER ;
CALL ProcessMonthlyInterest();
SELECT * FROM Accounts;