USE bankdb;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);
INSERT INTO Employees VALUES
(1, 'Raj', 'IT', 50000),
(2, 'Priya', 'HR', 45000),
(3, 'Amit', 'IT', 60000),
(4, 'Sneha', 'Finance', 55000);
SELECT * FROM Employees;
USE bankdb;

DROP PROCEDURE IF EXISTS UpdateEmployeeBonus;

DELIMITER //

CREATE PROCEDURE UpdateEmployeeBonus(
    IN dept VARCHAR(50),
    IN bonusPercent DECIMAL(5,2)
)
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * bonusPercent / 100)
    WHERE Department = dept;
END //

DELIMITER ;
CALL UpdateEmployeeBonus('IT', 10);
SELECT * FROM Employees;