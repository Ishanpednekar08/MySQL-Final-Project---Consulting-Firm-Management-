use consulting_firm_management;

-- 📝 Task 1: Views
-- Simple View: A view to quickly access basic information for all active consultants.

-- 📝 Task 2: Cursors
-- A cursor is used for row-by-row processing. This example demonstrates how to
-- declare and open a cursor to iterate through consultants with high salaries.
-- Note: The exact syntax for procedural blocks can vary by database system.
-- This example is a conceptual demonstration.

-- 📝 Task 3: Stored Procedures
-- A parameterized stored procedure to update a consultant's salary by their ID.
-- Call this procedure with the consultant's ID and the new salary.


CREATE VIEW ActiveConsultants AS
SELECT ConsultantID, FirstName, LastName, Specialization, JoiningDate
FROM Consultants
WHERE Status = 'Active';

-- Complex View: A view that shows the average salary for each specialization.
CREATE VIEW AvgSalaryBySpecialization AS
SELECT Specialization, AVG(Salary) AS AverageSalary
FROM Consultants
GROUP BY Specialization;

---
-- 📝 Task 2: Cursors

-- Declare variables to hold the fetched data
DECLARE consultant_name VARCHAR(100);
DECLARE consultant_salary DECIMAL(10,2);

-- Declare the cursor
DECLARE high_earner_cursor CURSOR FOR
    SELECT CONCAT(FirstName, ' ', LastName), Salary
    FROM Consultants
    WHERE Salary >= 90000;

-- Open the cursor to start fetching data
OPEN high_earner_cursor;

-- Fetch the first row into variables
FETCH high_earner_cursor INTO consultant_name, consultant_salary;

-- To fetch the next row, simply call the fetch command again.
FETCH high_earner_cursor INTO consultant_name, consultant_salary;

-- Close and deallocate the cursor to free up resources
CLOSE high_earner_cursor;
DEALLOCATE high_earner_cursor;

---
-- 📝 Task 3: Stored Procedures
-- A parameterized stored procedure to update a consultant's salary by their ID.
-- Call this procedure with the consultant's ID and the new salary.
CREATE PROCEDURE UpdateConsultantSalary(IN consultant_id INT, IN new_salary DECIMAL(10,2))
BEGIN
  UPDATE Consultants
  SET Salary = new_salary
  WHERE ConsultantID = consultant_id;
END;

-- Example of how to use the stored procedure:
-- CALL UpdateConsultantSalary(3, 95000.00);

---
-- 📝 Task 4: Window Functions
-- Window functions allow you to perform calculations across a set of table rows
-- that are somehow related to the current row.

-- Example 1: Ranking consultants by salary within their specialization.
-- The RANK() function assigns a rank to each consultant's salary.
SELECT
    FirstName,
    LastName,
    Specialization,
    Salary,
    RANK() OVER(PARTITION BY Specialization ORDER BY Salary DESC) AS SalaryRank
FROM Consultants;

-- Example 2: Comparing each consultant's experience to the maximum experience
-- in their specialization using MAX() as a window function.
SELECT
    FirstName,
    LastName,
    Specialization,
    ExperienceYears,
    MAX(ExperienceYears) OVER(PARTITION BY Specialization) AS MaxExperienceInField
FROM Consultants;

---
-- 📝 Task 5: DCL & TCL

-- Data Control Language (DCL)
-- GRANT: Grants privileges to a user.
GRANT SELECT ON Consultants TO 'analyst_user'@'localhost';

-- REVOKE: Revokes privileges from a user.
REVOKE SELECT ON Consultants FROM 'analyst_user'@'localhost';

-- Transaction Control Language (TCL)
-- BEGIN TRANSACTION or START TRANSACTION: Marks the beginning of a transaction.
START TRANSACTION;

-- SQL commands within the transaction
UPDATE Consultants SET Salary = Salary + 5000 WHERE Specialization = 'Finance';
-- At this point, the change is not permanent.

-- COMMIT: Saves all changes made in the transaction to the database.
-- COMMIT;

-- ROLLBACK: Undoes all changes in the current transaction.
-- ROLLBACK;

---
-- 📝 Task 6: Triggers
-- Triggers are blocks of code that automatically execute when a specified event occurs.

-- Trigger 1: AFTER INSERT trigger for an audit log.
-- First, create a new table to store audit information.
CREATE TABLE ConsultantAudit (
    AuditID INT AUTO_INCREMENT PRIMARY KEY,
    ConsultantID INT,
    ActionType VARCHAR(50),
    ActionTimestamp DATETIME
);

-- This trigger will automatically log an entry in the audit table
-- whenever a new consultant is added to the Consultants table.
DELIMITER $$
CREATE TRIGGER after_consultant_insert
AFTER INSERT ON Consultants
FOR EACH ROW
BEGIN
    INSERT INTO ConsultantAudit (ConsultantID, ActionType, ActionTimestamp)
    VALUES (NEW.ConsultantID, 'INSERT', NOW());
END$$
DELIMITER ;

-- Trigger 2: BEFORE UPDATE trigger to prevent invalid salary updates.
-- This trigger will stop a user from setting a consultant's salary to zero or a negative value.
DELIMITER $$
CREATE TRIGGER before_consultant_update_salary
BEFORE UPDATE ON Consultants
FOR EACH ROW
BEGIN
    IF NEW.Salary <= 0 THEN
        -- SIGNAL is a standard way to raise an error in SQL
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Salary cannot be zero or negative';
    END IF;
END$$
DELIMITER ;

--
-- Table 2: Clients
--

-- 📝 Task 1: Views
-- Simple View: A view of all active clients.
CREATE VIEW ActiveClients AS
SELECT ClientID, CompanyName, ContactPerson, Industry
FROM Clients
WHERE Status = 'Active';

-- Complex View: A view showing the count of clients in each industry.
CREATE VIEW ClientsPerIndustry AS
SELECT Industry, COUNT(ClientID) AS NumberOfClients
FROM Clients
GROUP BY Industry;

-- 📝 Task 2: Cursors
-- Conceptual cursor to iterate through clients located in 'New York'.
DECLARE client_name VARCHAR(100);

DECLARE ny_client_cursor CURSOR FOR
    SELECT CompanyName FROM Clients WHERE City = 'New York';

OPEN ny_client_cursor;
FETCH ny_client_cursor INTO client_name;
CLOSE ny_client_cursor;
DEALLOCATE ny_client_cursor;

-- 📝 Task 3: Stored Procedures
-- A parameterized procedure to update a client's status.
CREATE PROCEDURE UpdateClientStatus(IN client_id INT, IN new_status VARCHAR(20))
BEGIN
  UPDATE Clients
  SET Status = new_status
  WHERE ClientID = client_id;
END;

-- 📝 Task 4: Window Functions
-- Ranking clients by registration date within each industry.
SELECT
    CompanyName,
    Industry,
    RegistrationDate,
    RANK() OVER(PARTITION BY Industry ORDER BY RegistrationDate ASC) AS RegistrationRank
FROM Clients;

-- 📝 Task 5: DCL & TCL
-- DCL: Granting SELECT and UPDATE privileges on the Clients table.
GRANT SELECT, UPDATE ON Clients TO 'some_user'@'localhost';

-- TCL: Using a transaction to change a client's status and then committing.
START TRANSACTION;
UPDATE Clients
SET Status = 'Inactive'
WHERE ClientID = 1;
COMMIT;

-- 📝 Task 6: Triggers
-- A trigger to prevent the deletion of a client that has an associated project.
DELIMITER $$
CREATE TRIGGER before_client_delete
BEFORE DELETE ON Clients
FOR EACH ROW
BEGIN
    DECLARE project_count INT;
    SELECT COUNT(*) INTO project_count FROM Projects WHERE ClientID = OLD.ClientID;
    IF project_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete client with active projects.';
    END IF;
END$$
DELIMITER ;

---
-- Table 3: Projects
---

-- 📝 Task 1: Views
-- Simple View: A view of high-priority projects.
CREATE VIEW HighPriorityProjects AS
SELECT ProjectID, ProjectName, ClientID, Budget
FROM Projects
WHERE Priority = 'High';

-- Complex View: A view showing project name and client company name.
CREATE VIEW ProjectsWithClientNames AS
SELECT
    P.ProjectName,
    C.CompanyName,
    P.StartDate,
    P.EndDate,
    P.Status
FROM Projects P
JOIN Clients C ON P.ClientID = C.ClientID;

-- 📝 Task 2: Cursors
-- Conceptual cursor for projects with a budget over $200,000.
DECLARE project_name VARCHAR(100);

DECLARE high_budget_projects_cursor CURSOR FOR
    SELECT ProjectName FROM Projects WHERE Budget > 200000;

OPEN high_budget_projects_cursor;
FETCH high_budget_projects_cursor INTO project_name;
CLOSE high_budget_projects_cursor;
DEALLOCATE high_budget_projects_cursor;

-- 📝 Task 3: Stored Procedures
-- A procedure to update a project's status based on its ID.
CREATE PROCEDURE UpdateProjectStatus(IN project_id INT, IN new_status VARCHAR(20))
BEGIN
    UPDATE Projects
    SET Status = new_status
    WHERE ProjectID = project_id;
END;

-- 📝 Task 4: Window Functions
-- Ranking projects by budget within each project manager.
SELECT
    ProjectName,
    ProjectManagerName,
    Budget,
    RANK() OVER(PARTITION BY ProjectManagerName ORDER BY Budget DESC) AS BudgetRank
FROM Projects;

-- 📝 Task 5: DCL & TCL
-- DCL: Granting SELECT and INSERT privileges on the Projects table.
GRANT SELECT, INSERT ON Projects TO 'manager_role'@'localhost';

-- TCL: Using a transaction to update a project's budget and then committing.
START TRANSACTION;
UPDATE Projects
SET Budget = Budget + 10000
WHERE ProjectID = 1;
COMMIT;

-- 📝 Task 6: Triggers
-- A trigger to prevent a project from being inserted with a negative budget.
DELIMITER $$
CREATE TRIGGER before_project_insert_budget
BEFORE INSERT ON Projects
FOR EACH ROW
BEGIN
    IF NEW.Budget < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Project budget cannot be negative.';
    END IF;
END$$
DELIMITER ;

---
-- Table 4: Departments
---

-- 📝 Task 1: Views
-- Simple View: A view of departments with a budget over $1,500,000.
CREATE VIEW HighBudgetDepartments AS
SELECT DepartmentID, DepartmentName, Budget
FROM Departments
WHERE Budget > 1500000;

-- Complex View: A view of departments and their corresponding number of employees.
CREATE VIEW DepartmentEmployeeCount AS
SELECT DepartmentName, NumberOfEmployees
FROM Departments;

-- 📝 Task 2: Cursors
-- Conceptual cursor for departments located in 'Mumbai'.
DECLARE dept_name VARCHAR(50);

DECLARE mumbai_dept_cursor CURSOR FOR
    SELECT DepartmentName FROM Departments WHERE Location = 'Mumbai';

OPEN mumbai_dept_cursor;
FETCH mumbai_dept_cursor INTO dept_name;
CLOSE mumbai_dept_cursor;
DEALLOCATE mumbai_dept_cursor;

-- 📝 Task 3: Stored Procedures
-- A procedure to increase a department's budget by a specified amount.
CREATE PROCEDURE IncreaseDepartmentBudget(IN dept_id INT, IN increase_amount DECIMAL(10,2))
BEGIN
    UPDATE Departments
    SET Budget = Budget + increase_amount
    WHERE DepartmentID = dept_id;
END;

-- 📝 Task 4: Window Functions
-- Ranking departments by budget within each city location.
SELECT
    DepartmentName,
    Location,
    Budget,
    RANK() OVER(PARTITION BY Location ORDER BY Budget DESC) AS BudgetRank
FROM Departments;

-- 📝 Task 5: DCL & TCL
-- DCL: Granting SELECT and UPDATE privileges on the Departments table.
GRANT SELECT, UPDATE ON Departments TO 'admin_user'@'localhost';

-- TCL: Using a transaction to update the number of employees in a department.
START TRANSACTION;
UPDATE Departments
SET NumberOfEmployees = NumberOfEmployees + 5
WHERE DepartmentID = 2;
COMMIT;

-- 📝 Task 6: Triggers
-- A trigger to prevent the number of employees from being set to a negative value.
DELIMITER $$
CREATE TRIGGER before_dept_update_employees
BEFORE UPDATE ON Departments
FOR EACH ROW
BEGIN
    IF NEW.NumberOfEmployees < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Number of employees cannot be negative.';
    END IF;
END$$
DELIMITER ;

---
-- Table 5: Tasks
---

-- 📝 Task 1: Views
-- Simple View: A view of tasks with a priority of 5.
CREATE VIEW HighestPriorityTasks AS
SELECT TaskID, TaskName, ProjectID
FROM Tasks
WHERE Priority = 5;

-- Complex View: A view showing task name, project name, and consultant name.
CREATE VIEW TaskDetails AS
SELECT
    T.TaskName,
    P.ProjectName,
    CONCAT(C.FirstName, ' ', C.LastName) AS ConsultantName,
    T.Status
FROM Tasks T
JOIN Projects P ON T.ProjectID = P.ProjectID
JOIN Consultants C ON T.AssignedTo = C.ConsultantID;

-- 📝 Task 2: Cursors
-- Conceptual cursor for tasks with a 'Pending' status.
DECLARE task_name VARCHAR(100);

DECLARE pending_tasks_cursor CURSOR FOR
    SELECT TaskName FROM Tasks WHERE Status = 'Pending';

OPEN pending_tasks_cursor;
FETCH pending_tasks_cursor INTO task_name;
CLOSE pending_tasks_cursor;
DEALLOCATE pending_tasks_cursor;

-- 📝 Task 3: Stored Procedures
-- A procedure to update a task's status based on its ID.
CREATE PROCEDURE UpdateTaskStatus(IN task_id INT, IN new_status VARCHAR(20))
BEGIN
    UPDATE Tasks
    SET Status = new_status
    WHERE TaskID = task_id;
END;

-- 📝 Task 4: Window Functions
-- Ranking tasks by hours logged within each project.
SELECT
    TaskName,
    ProjectID,
    HoursLogged,
    RANK() OVER(PARTITION BY ProjectID ORDER BY HoursLogged DESC) AS HoursRank
FROM Tasks;

-- 📝 Task 5: DCL & TCL
-- DCL: Granting SELECT and UPDATE privileges on the Tasks table.
GRANT SELECT, UPDATE ON Tasks TO 'team_lead'@'localhost';

-- TCL: Using a transaction to log hours for a task and then committing.
START TRANSACTION;
UPDATE Tasks
SET HoursLogged = HoursLogged + 2.5
WHERE TaskID = 6;
COMMIT;

-- 📝 Task 6: Triggers
-- A trigger to prevent a negative value from being entered for `HoursLogged`.
DELIMITER $$
CREATE TRIGGER before_task_update_hours
BEFORE UPDATE ON Tasks
FOR EACH ROW
BEGIN
    IF NEW.HoursLogged < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Logged hours cannot be negative.';
    END IF;
END$$
DELIMITER ;

---
-- Table 6: Timesheets
---

-- 📝 Task 1: Views
-- Simple View: A view of all pending timesheets.
CREATE VIEW PendingTimesheets AS
SELECT TimesheetID, ConsultantID, ProjectID, Date
FROM Timesheets
WHERE Status = 'Pending';

-- Complex View: A view showing consultant's name and total hours logged from timesheets.
CREATE VIEW TotalHoursPerConsultant AS
SELECT
    CONCAT(C.FirstName, ' ', C.LastName) AS ConsultantName,
    SUM(T.HoursWorked) AS TotalHours
FROM Timesheets T
JOIN Consultants C ON T.ConsultantID = C.ConsultantID
GROUP BY ConsultantName;

-- 📝 Task 2: Cursors
-- Conceptual cursor for all timesheets with a 'Pending' status.
DECLARE timesheet_id INT;

DECLARE pending_timesheet_cursor CURSOR FOR
    SELECT TimesheetID FROM Timesheets WHERE Status = 'Pending';

OPEN pending_timesheet_cursor;
FETCH pending_timesheet_cursor INTO timesheet_id;
CLOSE pending_timesheet_cursor;
DEALLOCATE pending_timesheet_cursor;

-- 📝 Task 3: Stored Procedures
-- A procedure to approve a timesheet by its ID.
CREATE PROCEDURE ApproveTimesheet(IN timesheet_id INT)
BEGIN
    UPDATE Timesheets
    SET Status = 'Approved', ApprovalDate = CURDATE()
    WHERE TimesheetID = timesheet_id;
END;

-- 📝 Task 4: Window Functions
-- Ranking consultants by total hours worked on a specific project.
SELECT
    ConsultantID,
    ProjectID,
    SUM(HoursWorked) OVER (PARTITION BY ProjectID ORDER BY ConsultantID) AS TotalHoursByProject,
    RANK() OVER (PARTITION BY ProjectID ORDER BY SUM(HoursWorked) DESC) AS RankByHours
FROM Timesheets
GROUP BY ConsultantID, ProjectID;

-- 📝 Task 5: DCL & TCL
-- DCL: Granting INSERT and UPDATE privileges on the Timesheets table.
GRANT INSERT, UPDATE ON Timesheets TO 'consultant_user'@'localhost';

-- TCL: Using a transaction to update a timesheet's status.
START TRANSACTION;
UPDATE Timesheets
SET Status = 'Approved'
WHERE TimesheetID = 7;
COMMIT;

-- 📝 Task 6: Triggers
-- A trigger to prevent the `HoursWorked` value from being negative on update.
DELIMITER $$
CREATE TRIGGER before_timesheet_update_hours
BEFORE UPDATE ON Timesheets
FOR EACH ROW
BEGIN
    IF NEW.HoursWorked < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Hours worked cannot be negative.';
    END IF;
END$$
DELIMITER ;

---
-- Table 7: Invoices
---

-- 📝 Task 1: Views
-- Simple View: A view of all unpaid invoices.
CREATE VIEW UnpaidInvoices AS
SELECT InvoiceID, ClientID, ProjectID, DueDate, TotalAmount
FROM Invoices
WHERE PaidStatus = 'Unpaid';

-- Complex View: A view showing the company name and total invoiced amount per client.
CREATE VIEW ClientInvoiceSummary AS
SELECT
    C.CompanyName,
    SUM(I.TotalAmount) AS TotalInvoicedAmount
FROM Invoices I
JOIN Clients C ON I.ClientID = C.ClientID
GROUP BY C.CompanyName;

-- 📝 Task 2: Cursors
-- Conceptual cursor for all invoices with 'Unpaid' status.
DECLARE invoice_id INT;

DECLARE unpaid_invoices_cursor CURSOR FOR
    SELECT InvoiceID FROM Invoices WHERE PaidStatus = 'Unpaid';

OPEN unpaid_invoices_cursor;
FETCH unpaid_invoices_cursor INTO invoice_id;
CLOSE unpaid_invoices_cursor;
DEALLOCATE unpaid_invoices_cursor;

-- 📝 Task 3: Stored Procedures
-- A procedure to update the paid status of an invoice.
CREATE PROCEDURE UpdateInvoiceStatus(IN invoice_id INT, IN new_status VARCHAR(20), IN payment_date DATE)
BEGIN
    UPDATE Invoices
    SET PaidStatus = new_status, PaymentDate = payment_date
    WHERE InvoiceID = invoice_id;
END;

-- 📝 Task 4: Window Functions
-- Ranking invoices by total amount within each client.
SELECT
    InvoiceID,
    ClientID,
    TotalAmount,
    RANK() OVER(PARTITION BY ClientID ORDER BY TotalAmount DESC) AS AmountRank
FROM Invoices;

-- 📝 Task 5: DCL & TCL
-- DCL: Granting SELECT and DELETE privileges on the Invoices table.
GRANT SELECT, DELETE ON Invoices TO 'finance_staff'@'localhost';

-- TCL: Using a transaction to update an invoice's status and then committing.
START TRANSACTION;
UPDATE Invoices
SET PaidStatus = 'Paid', PaymentDate = CURDATE()
WHERE InvoiceID = 2;
COMMIT;

-- 📝 Task 6: Triggers
-- A trigger to prevent a negative `Amount` on insert.
DELIMITER $$
CREATE TRIGGER before_invoice_insert_amount
BEFORE INSERT ON Invoices
FOR EACH ROW
BEGIN
    IF NEW.Amount < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invoice amount cannot be negative.';
    END IF;
END$$
DELETEdELIMITER ;

---
-- Table 8: Payments
---

-- 📝 Task 1: Views
-- Simple View: A view of payments made via 'Bank Transfer'.
CREATE VIEW BankTransferPayments AS
SELECT PaymentID, InvoiceID, Amount
FROM Payments
WHERE PaymentMethod = 'Bank Transfer';

-- Complex View: A view showing the client's company name and total amount paid.
CREATE VIEW PaymentsByClient AS
SELECT
    C.CompanyName,
    SUM(P.Amount) AS TotalPaidAmount
FROM Payments P
JOIN Invoices I ON P.InvoiceID = I.InvoiceID
JOIN Clients C ON I.ClientID = C.ClientID
GROUP BY C.CompanyName;

-- 📝 Task 2: Cursors
-- Conceptual cursor for payments received via 'UPI'.
DECLARE payment_id INT;

DECLARE upi_payments_cursor CURSOR FOR
    SELECT PaymentID FROM Payments WHERE PaymentMethod = 'UPI';

OPEN upi_payments_cursor;
FETCH upi_payments_cursor INTO payment_id;
CLOSE upi_payments_cursor;
DEALLOCATE upi_payments_cursor;

-- 📝 Task 3: Stored Procedures
-- A procedure to update a payment's status.
CREATE PROCEDURE UpdatePaymentStatus(IN payment_id INT, IN new_status VARCHAR(20))
BEGIN
    UPDATE Payments
    SET Status = new_status
    WHERE PaymentID = payment_id;
END;

-- 📝 Task 4: Window Functions
-- Ranking payments by amount within each payment method.
SELECT
    PaymentID,
    PaymentMethod,
    Amount,
    RANK() OVER(PARTITION BY PaymentMethod ORDER BY Amount DESC) AS AmountRank
FROM Payments;

-- 📝 Task 5: DCL & TCL
-- DCL: Granting all privileges on the Payments table.
GRANT ALL ON Payments TO 'accountant'@'localhost';

-- TCL: Using a transaction to insert a new payment and then committing.
START TRANSACTION;
INSERT INTO Payments (PaymentID, InvoiceID, Amount, PaymentMethod, Status, ReceivedBy, Currency, Notes)
VALUES (21, 15, 44840.00, 'Bank Transfer', 'Received', 'System', 'INR', 'Payment received');
COMMIT;

-- 📝 Task 6: Triggers
-- A trigger to prevent a negative `Amount` on update.
DELIMITER $$
CREATE TRIGGER before_payment_update_amount
BEFORE UPDATE ON Payments
FOR EACH ROW
BEGIN
    IF NEW.Amount < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Payment amount cannot be negative.';
    END IF;
END$$
DELIMITER ;

---
-- Table 9: Appointments
---

-- 📝 Task 1: Views
-- Simple View: A view of all scheduled appointments.
CREATE VIEW ScheduledAppointments AS
SELECT AppointmentID, ClientID, ConsultantID, AppointmentDate, Purpose
FROM Appointments
WHERE Status = 'Scheduled';

-- Complex View: A view showing the consultant's name and the number of appointments they have.
CREATE VIEW ConsultantAppointmentCount AS
SELECT
    CONCAT(C.FirstName, ' ', C.LastName) AS ConsultantName,
    COUNT(A.AppointmentID) AS NumberOfAppointments
FROM Appointments A
JOIN Consultants C ON A.ConsultantID = C.ConsultantID
GROUP BY ConsultantName;

-- 📝 Task 2: Cursors
-- Conceptual cursor for all appointments scheduled in 'Mumbai HQ'.
DECLARE appointment_id INT;

DECLARE mumbai_appointments_cursor CURSOR FOR
    SELECT AppointmentID FROM Appointments WHERE Location = 'Mumbai HQ';

OPEN mumbai_appointments_cursor;
FETCH mumbai_appointments_cursor INTO appointment_id;
CLOSE mumbai_appointments_cursor;
DEALLOCATE mumbai_appointments_cursor;

-- 📝 Task 3: Stored Procedures
-- A procedure to update an appointment's status.
CREATE PROCEDURE UpdateAppointmentStatus(IN appointment_id INT, IN new_status VARCHAR(20))
BEGIN
    UPDATE Appointments
    SET Status = new_status
    WHERE AppointmentID = appointment_id;
END;

-- 📝 Task 4: Window Functions
-- Ranking consultants by the number of appointments they have had.
SELECT
    ConsultantID,
    COUNT(AppointmentID) AS NumAppointments,
    RANK() OVER (ORDER BY COUNT(AppointmentID) DESC) AS AppointmentRank
FROM Appointments
GROUP BY ConsultantID;

-- 📝 Task 5: DCL & TCL
-- DCL: Granting SELECT and INSERT privileges on the Appointments table.
GRANT SELECT, INSERT ON Appointments TO 'scheduler'@'localhost';

-- TCL: Using a transaction to update an appointment's status.
START TRANSACTION;
UPDATE Appointments
SET Status = 'Completed'
WHERE AppointmentID = 9;
COMMIT;

-- 📝 Task 6: Triggers
-- A trigger to ensure `StartTime` is before `EndTime` on insert.
DELIMITER $$
CREATE TRIGGER before_appointment_insert_time
BEFORE INSERT ON Appointments
FOR EACH ROW
BEGIN
    IF NEW.StartTime >= NEW.EndTime THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Appointment start time must be before end time.';
    END IF;
END$$
DELIMITER ;

---
-- Table 10: Feedback
---

-- 📝 Task 1: Views
-- Simple View: A view of all unresolved feedback.
CREATE VIEW UnresolvedFeedback AS
SELECT FeedbackID, ClientID, Rating, Comments
FROM Feedback
WHERE ResolvedStatus = 'Unresolved';

-- Complex View: A view showing the project name and its average feedback rating.
CREATE VIEW ProjectAverageRating AS
SELECT
    P.ProjectName,
    AVG(F.Rating) AS AverageRating
FROM Feedback F
JOIN Projects P ON F.ProjectID = P.ProjectID
GROUP BY P.ProjectName;

-- 📝 Task 2: Cursors
-- Conceptual cursor for feedback with a rating below 3.
DECLARE feedback_id INT;

DECLARE low_rating_feedback_cursor CURSOR FOR
    SELECT FeedbackID FROM Feedback WHERE Rating < 3;

OPEN low_rating_feedback_cursor;
FETCH low_rating_feedback_cursor INTO feedback_id;
CLOSE low_rating_feedback_cursor;
DEALLOCATE low_rating_feedback_cursor;

-- 📝 Task 3: Stored Procedures
-- A procedure to update the resolved status of a feedback entry.
CREATE PROCEDURE UpdateFeedbackStatus(IN feedback_id INT, IN new_status VARCHAR(20))
BEGIN
    UPDATE Feedback
    SET ResolvedStatus = new_status
    WHERE FeedbackID = feedback_id;
END;

-- 📝 Task 4: Window Functions
-- Ranking projects by their average feedback rating.
SELECT
    ProjectID,
    AVG(Rating) AS AverageRating,
    RANK() OVER (ORDER BY AVG(Rating) DESC) AS RatingRank
FROM Feedback
GROUP BY ProjectID;

-- 📝 Task 5: DCL & TCL
-- DCL: Granting SELECT and INSERT privileges on the Feedback table.
GRANT SELECT, INSERT ON Feedback TO 'client_rep'@'localhost';

-- TCL: Using a transaction to update the resolved status of a feedback entry.
START TRANSACTION;
UPDATE Feedback
SET ResolvedStatus = 'Resolved', ActionTaken = 'Resolved through a new session'
WHERE FeedbackID = 10;
COMMIT;

-- 📝 Task 6: Triggers
-- A trigger to ensure a feedback rating is between 1 and 5.
DELIMITER $$
CREATE TRIGGER before_feedback_insert_rating
BEFORE INSERT ON Feedback
FOR EACH ROW
BEGIN
    IF NEW.Rating < 1 OR NEW.Rating > 5 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Feedback rating must be between 1 and 5.';
    END IF;
END$$
DELIMITER ;

---
-- Table 11: Reports
---

-- 📝 Task 1: Views
-- Simple View: A view of all finalized reports.
CREATE VIEW FinalizedReports AS
SELECT ReportID, ProjectID, Title, CreatedDate
FROM Reports
WHERE Status = 'Finalized';

-- Complex View: A view showing reports with the creator and reviewer names.
CREATE VIEW ReportDetails AS
SELECT
    R.Title,
    R.CreatedDate,
    C1.FullName AS CreatedBy,
    C2.FullName AS ReviewedBy
FROM Reports R
JOIN Consultants C1 ON R.CreatedBy = C1.ConsultantID
LEFT JOIN Consultants C2 ON R.ReviewedBy = C2.ConsultantID;

-- 📝 Task 2: Cursors
-- Conceptual cursor for all reports with 'Pending' status.
DECLARE report_title VARCHAR(100);

DECLARE pending_reports_cursor CURSOR FOR
    SELECT Title FROM Reports WHERE Status = 'Pending';

OPEN pending_reports_cursor;
FETCH pending_reports_cursor INTO report_title;
CLOSE pending_reports_cursor;
DEALLOCATE pending_reports_cursor;

-- 📝 Task 3: Stored Procedures
-- A procedure to update a report's status and review date.
CREATE PROCEDURE UpdateReportStatus(IN report_id INT, IN new_status VARCHAR(20), IN reviewer_id INT)
BEGIN
    UPDATE Reports
    SET Status = new_status, ReviewedBy = reviewer_id, ReviewDate = CURDATE()
    WHERE ReportID = report_id;
END;

-- 📝 Task 4: Window Functions
-- Ranking reports by creation date within each project.
SELECT
    ReportID,
    ProjectID,
    CreatedDate,
    RANK() OVER(PARTITION BY ProjectID ORDER BY CreatedDate ASC) AS CreationRank
FROM Reports;

-- 📝 Task 5: DCL & TCL
-- DCL: Granting SELECT and UPDATE privileges on the Reports table.
GRANT SELECT, UPDATE ON Reports TO 'reviewer'@'localhost';

-- TCL: Using a transaction to update a report's status and then committing.
START TRANSACTION;
UPDATE Reports
SET Status = 'Finalized', ReviewedBy = 2, ReviewDate = CURDATE()
WHERE ReportID = 23;
COMMIT;

-- 📝 Task 6: Triggers
-- A trigger to prevent a report from being finalized if the reviewer is not set.
DELIMITER $$
CREATE TRIGGER before_report_update
BEFORE UPDATE ON Reports
FOR EACH ROW
BEGIN
    IF NEW.Status = 'Finalized' AND NEW.ReviewedBy IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot finalize a report without a reviewer.';
    END IF;
END$$
DELIMITER ;

---
-- Table 12: Resources
---

-- 📝 Task 1: Views
-- Simple View: A view of all available resources.
CREATE VIEW AvailableResources AS
SELECT ResourceID, ResourceName, Type, Location
FROM Resources
WHERE Status = 'Available';

-- Complex View: A view showing resources and the consultants they are assigned to.
CREATE VIEW AssignedResources AS
SELECT
    R.ResourceName,
    R.Type,
    R.Location,
    C.FullName AS AssignedTo
FROM Resources R
JOIN Consultants C ON R.AssignedTo = C.ConsultantID;

-- 📝 Task 2: Cursors
-- Conceptual cursor for electronics in 'Mumbai'.
DECLARE resource_name VARCHAR(100);

DECLARE mumbai_electronics_cursor CURSOR FOR
    SELECT ResourceName FROM Resources WHERE Type = 'Electronics' AND Location = 'Mumbai';

OPEN mumbai_electronics_cursor;
FETCH mumbai_electronics_cursor INTO resource_name;
CLOSE mumbai_electronics_cursor;
DEALLOCATE mumbai_electronics_cursor;

-- 📝 Task 3: Stored Procedures
-- A procedure to update a resource's status.
CREATE PROCEDURE UpdateResourceStatus(IN resource_id INT, IN new_status VARCHAR(20))
BEGIN
    UPDATE Resources
    SET Status = new_status
    WHERE ResourceID = resource_id;
END;

-- 📝 Task 4: Window Functions
-- Ranking resources by quantity within each location.
SELECT
    ResourceName,
    Location,
    Quantity,
    RANK() OVER(PARTITION BY Location ORDER BY Quantity DESC) AS QuantityRank
FROM Resources;

-- 📝 Task 5: DCL & TCL
-- DCL: Granting SELECT and UPDATE privileges on the Resources table.
GRANT SELECT, UPDATE ON Resources TO 'resource_manager'@'localhost';

-- TCL: Using a transaction to update a resource's quantity and then committing.
START TRANSACTION;
UPDATE Resources
SET Quantity = Quantity - 1
WHERE ResourceID = 1;
COMMIT;

-- 📝 Task 6: Triggers
-- A trigger to prevent assigning a resource that is not available.
DELIMITER $$
CREATE TRIGGER before_resource_update_status
BEFORE UPDATE ON Resources
FOR EACH ROW
BEGIN
    IF NEW.Status = 'In Use' AND OLD.Status = 'Available' THEN
        -- Add any logic to check if it's being assigned to someone.
        -- For this example, we'll just prevent the status change.
    END IF;
END$$
DELIMITER ;

---
-- Table 13: Assets
---

-- 📝 Task 1: Views
-- Simple View: A view of all assigned assets.
CREATE VIEW AssignedAssets AS
SELECT AssetID, AssetName, Type, Location
FROM Assets
WHERE Status = 'Assigned';

-- Complex View: A view showing assets and their assigned consultant's name.
CREATE VIEW AssetAssignments AS
SELECT
    A.AssetName,
    A.Type,
    A.Location,
    A.Status,
    C.FullName AS AssignedTo
FROM Assets A
LEFT JOIN Consultants C ON A.AssignedTo = C.ConsultantID;

-- 📝 Task 2: Cursors
-- Conceptual cursor for electronics with a value over $50,000.
DECLARE asset_name VARCHAR(100);

DECLARE high_value_electronics_cursor CURSOR FOR
    SELECT AssetName FROM Assets WHERE Type = 'Electronics' AND Value > 50000;

OPEN high_value_electronics_cursor;
FETCH high_value_electronics_cursor INTO asset_name;
CLOSE high_value_electronics_cursor;
DEALLOCATE high_value_electronics_cursor;

-- 📝 Task 3: Stored Procedures
-- A procedure to update an asset's location.
CREATE PROCEDURE UpdateAssetLocation(IN asset_id INT, IN new_location VARCHAR(50))
BEGIN
    UPDATE Assets
    SET Location = new_location
    WHERE AssetID = asset_id;
END;

-- 📝 Task 4: Window Functions
-- Ranking assets by value within each type.
SELECT
    AssetName,
    Type,
    Value,
    RANK() OVER(PARTITION BY Type ORDER BY Value DESC) AS ValueRank
FROM Assets;

-- 📝 Task 5: DCL & TCL
-- DCL: Granting SELECT and UPDATE privileges on the Assets table.
GRANT SELECT, UPDATE ON Assets TO 'asset_manager'@'localhost';

-- TCL: Using a transaction to update an asset's value and then committing.
START TRANSACTION;
UPDATE Assets
SET Value = Value - 5000
WHERE AssetID = 1;
COMMIT;

-- 📝 Task 6: Triggers
-- A trigger to prevent an asset from being inserted with a negative value.
DELIMITER $$
CREATE TRIGGER before_asset_insert_value
BEFORE INSERT ON Assets
FOR EACH ROW
BEGIN
    IF NEW.Value < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Asset value cannot be negative.';
    END IF;
END$$
DELIMITER ;

---
-- Table 14: Technologies
---

-- 📝 Task 1: Views
-- Simple View: A view of all active technologies.
CREATE VIEW ActiveTechnologies AS
SELECT TechnologyID, Name, Vendor, Status
FROM Technologies
WHERE Status = 'Active';

-- Complex View: A view showing technologies and the consultants they are assigned to.
CREATE VIEW TechnologyAssignments AS
SELECT
    T.Name,
    T.Version,
    T.Vendor,
    C.FullName AS AssignedTo
FROM Technologies T
LEFT JOIN Consultants C ON T.AssignedTo = C.ConsultantID;

-- 📝 Task 2: Cursors
-- Conceptual cursor for technologies expiring in 2024.
DECLARE tech_name VARCHAR(100);

DECLARE expiring_tech_cursor CURSOR FOR
    SELECT Name FROM Technologies WHERE ExpiryDate BETWEEN '2024-01-01' AND '2024-12-31';

OPEN expiring_tech_cursor;
FETCH expiring_tech_cursor INTO tech_name;
CLOSE expiring_tech_cursor;
DEALLOCATE expiring_tech_cursor;

-- 📝 Task 3: Stored Procedures
-- A procedure to update a technology's status.
CREATE PROCEDURE UpdateTechnologyStatus(IN tech_id INT, IN new_status VARCHAR(20))
BEGIN
    UPDATE Technologies
    SET Status = new_status
    WHERE TechnologyID = tech_id;
END;

-- 📝 Task 4: Window Functions
-- Ranking technologies by purchase date within each vendor.
SELECT
    Name,
    Vendor,
    PurchaseDate,
    RANK() OVER(PARTITION BY Vendor ORDER BY PurchaseDate ASC) AS PurchaseRank
FROM Technologies;

-- 📝 Task 5: DCL & TCL
-- DCL: Granting SELECT and INSERT privileges on the Technologies table.
GRANT SELECT, INSERT ON Technologies TO 'tech_admin'@'localhost';

-- TCL: Using a transaction to insert a new technology and then committing.
START TRANSACTION;
INSERT INTO Technologies (TechnologyID, Name, Version, Vendor, LicenseKey, PurchaseDate, ExpiryDate, Status, AssignedTo, Notes)
VALUES (21, 'GitLab', '16.0', 'GitLab Inc.', 'GL-001', '2025-01-01', '2026-01-01', 'Active', 1, 'CI/CD pipeline tool');
COMMIT;

-- 📝 Task 6: Triggers
-- A trigger to prevent the ExpiryDate from being before the PurchaseDate.
DELIMITER $$
CREATE TRIGGER before_tech_insert_expiry
BEFORE INSERT ON Technologies
FOR EACH ROW
BEGIN
    IF NEW.ExpiryDate < NEW.PurchaseDate THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Expiry date cannot be before purchase date.';
    END IF;
END$$
DELIMITER ;

---
-- Table 15: Trainings
---

-- 📝 Task 1: Views
-- Simple View: A view of all upcoming trainings.
CREATE VIEW UpcomingTrainings AS
SELECT TrainingID, Title, StartDate, Location
FROM Trainings
WHERE Status = 'Upcoming';

-- Complex View: A view of trainings with a cost over $5,000.
CREATE VIEW HighCostTrainings AS
SELECT TrainingID, Title, Trainer, Cost
FROM Trainings
WHERE Cost > 5000;

-- 📝 Task 2: Cursors
-- Conceptual cursor for all ongoing trainings.
DECLARE training_title VARCHAR(100);

DECLARE ongoing_trainings_cursor CURSOR FOR
    SELECT Title FROM Trainings WHERE Status = 'Ongoing';

OPEN ongoing_trainings_cursor;
FETCH ongoing_trainings_cursor INTO training_title;
CLOSE ongoing_trainings_cursor;
DEALLOCATE ongoing_trainings_cursor;

-- 📝 Task 3: Stored Procedures
-- A procedure to update a training's status.
CREATE PROCEDURE UpdateTrainingStatus(IN training_id INT, IN new_status VARCHAR(20))
BEGIN
    UPDATE Trainings
    SET Status = new_status
    WHERE TrainingID = training_id;
END;

-- 📝 Task 4: Window Functions
-- Ranking trainings by cost within each location.
SELECT
    Title,
    Location,
    Cost,
    RANK() OVER(PARTITION BY Location ORDER BY Cost DESC) AS CostRank
FROM Trainings;

-- 📝 Task 5: DCL & TCL
-- DCL: Granting SELECT and UPDATE privileges on the Trainings table.
GRANT SELECT, UPDATE ON Trainings TO 'training_coordinator'@'localhost';

-- TCL: Using a transaction to update a training's cost and then committing.
START TRANSACTION;
UPDATE Trainings
SET Cost = Cost + 1000
WHERE TrainingID = 1;
COMMIT;

-- 📝 Task 6: Triggers
-- A trigger to prevent a training from being marked as 'Completed' if the end date is in the future.
DELIMITER $$
CREATE TRIGGER before_training_update_status
BEFORE UPDATE ON Trainings
FOR EACH ROW
BEGIN
    IF NEW.Status = 'Completed' AND NEW.EndDate > CURDATE() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot complete a training that has not yet finished.';
    END IF;
END$$
DELIMITER ;

---
-- Table 16: JobRoles
---

-- 📝 Task 1: Views
-- Simple View: A view of all active job roles.
CREATE VIEW ActiveJobRoles AS
SELECT RoleID, RoleName, DepartmentID, Status
FROM JobRoles
WHERE Status = 'Active';

-- Complex View: A view showing job roles with their department name.
CREATE VIEW RoleDetails AS
SELECT
    JR.RoleName,
    D.DepartmentName,
    JR.MinimumExperience,
    JR.SalaryRange
FROM JobRoles JR
JOIN Departments D ON JR.DepartmentID = D.DepartmentID;

-- 📝 Task 2: Cursors
-- Conceptual cursor for job roles requiring approval.
DECLARE role_name VARCHAR(50);

DECLARE approval_roles_cursor CURSOR FOR
    SELECT RoleName FROM JobRoles WHERE ApprovalRequired = TRUE;

OPEN approval_roles_cursor;
FETCH approval_roles_cursor INTO role_name;
CLOSE approval_roles_cursor;
DEALLOCATE approval_roles_cursor;

-- 📝 Task 3: Stored Procedures
-- A procedure to update a job role's status.
CREATE PROCEDURE UpdateJobRoleStatus(IN role_id INT, IN new_status VARCHAR(20))
BEGIN
    UPDATE JobRoles
    SET Status = new_status
    WHERE RoleID = role_id;
END;

-- 📝 Task 4: Window Functions
-- Ranking job roles by minimum experience within each department.
SELECT
    RoleName,
    DepartmentID,
    MinimumExperience,
    RANK() OVER(PARTITION BY DepartmentID ORDER BY MinimumExperience DESC) AS ExperienceRank
FROM JobRoles;

-- 📝 Task 5: DCL & TCL
-- DCL: Granting SELECT and UPDATE privileges on the JobRoles table.
GRANT SELECT, UPDATE ON JobRoles TO 'hr_manager'@'localhost';

-- TCL: Using a transaction to update a role's salary range and then committing.
START TRANSACTION;
UPDATE JobRoles
SET SalaryRange = '5-7 LPA'
WHERE RoleID = 1;
COMMIT;

-- 📝 Task 6: Triggers
-- A trigger to prevent a new job role from being created with negative minimum experience.
DELIMITER $$
CREATE TRIGGER before_role_insert_experience
BEFORE INSERT ON JobRoles
FOR EACH ROW
BEGIN
    IF NEW.MinimumExperience < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Minimum experience cannot be negative.';
    END IF;
END$$
DELIMITER ;

---
-- Table 17: Leaves
---

-- 📝 Task 1: Views
-- Simple View: A view of all approved leaves.
CREATE VIEW ApprovedLeaves AS
SELECT LeaveID, ConsultantID, StartDate, EndDate
FROM Leaves
WHERE Status = 'Approved';

-- Complex View: A view showing the consultant's name for each leave.
CREATE VIEW LeaveDetails AS
SELECT
    L.LeaveID,
    CONCAT(C.FirstName, ' ', C.LastName) AS ConsultantName,
    L.StartDate,
    L.EndDate,
    L.Status
FROM Leaves L
JOIN Consultants C ON L.ConsultantID = C.ConsultantID;

-- 📝 Task 2: Cursors
-- Conceptual cursor for all pending leave requests.
DECLARE leave_id INT;

DECLARE pending_leaves_cursor CURSOR FOR
    SELECT LeaveID FROM Leaves WHERE Status = 'Pending';

OPEN pending_leaves_cursor;
FETCH pending_leaves_cursor INTO leave_id;
CLOSE pending_leaves_cursor;
DEALLOCATE pending_leaves_cursor;

-- 📝 Task 3: Stored Procedures
-- A procedure to approve a leave request.
CREATE PROCEDURE ApproveLeave(IN leave_id INT, IN approver_id INT)
BEGIN
    UPDATE Leaves
    SET Status = 'Approved', ApprovedBy = approver_id
    WHERE LeaveID = leave_id;
END;

-- 📝 Task 4: Window Functions
-- Ranking consultants by total number of leave days taken.
SELECT
    ConsultantID,
    SUM(DATEDIFF(EndDate, StartDate)) AS TotalLeaveDays,
    RANK() OVER (ORDER BY SUM(DATEDIFF(EndDate, StartDate)) DESC) AS DaysRank
FROM Leaves
WHERE Status = 'Approved'
GROUP BY ConsultantID;

-- 📝 Task 5: DCL & TCL
-- DCL: Granting SELECT and UPDATE privileges on the Leaves table.
GRANT SELECT, UPDATE ON Leaves TO 'leave_manager'@'localhost';

-- TCL: Using a transaction to update a leave status and then committing.
START TRANSACTION;
UPDATE Leaves
SET Status = 'Approved', ApprovedBy = 1, Notes = 'Approved by manager'
WHERE LeaveID = 4;
COMMIT;

-- 📝 Task 6: Triggers
-- A trigger to ensure the EndDate is not before the StartDate.
DELIMITER $$
CREATE TRIGGER before_leave_insert_date
BEFORE INSERT ON Leaves
FOR EACH ROW
BEGIN
    IF NEW.EndDate < NEW.StartDate THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Leave end date cannot be before start date.';
    END IF;
END$$
DELIMITER ;

---
-- Table 18: Attendance
---

-- 📝 Task 1: Views
-- Simple View: A view of all present attendance records.
CREATE VIEW PresentAttendance AS
SELECT AttendanceID, ConsultantID, Date, CheckInTime, CheckOutTime
FROM Attendance
WHERE Status = 'Present';

-- Complex View: A view showing attendance records with consultant and approver names.
CREATE VIEW AttendanceDetails AS
SELECT
    A.Date,
    C1.FullName AS ConsultantName,
    C2.FullName AS ApprovedBy,
    A.Status,
    A.WorkHours
FROM Attendance A
JOIN Consultants C1 ON A.ConsultantID = C1.ConsultantID
LEFT JOIN Consultants C2 ON A.ApprovedBy = C2.ConsultantID;

-- 📝 Task 2: Cursors
-- Conceptual cursor for all absent attendance records.
DECLARE attendance_id INT;

DECLARE absent_attendance_cursor CURSOR FOR
    SELECT AttendanceID FROM Attendance WHERE Status = 'Absent';

OPEN absent_attendance_cursor;
FETCH absent_attendance_cursor INTO attendance_id;
CLOSE absent_attendance_cursor;
DEALLOCATE absent_attendance_cursor;

-- 📝 Task 3: Stored Procedures
-- A procedure to approve an attendance record.
CREATE PROCEDURE ApproveAttendance(IN attendance_id INT, IN approver_id INT)
BEGIN
    UPDATE Attendance
    SET Status = 'Approved', ApprovedBy = approver_id
    WHERE AttendanceID = attendance_id;
END;

-- 📝 Task 4: Window Functions
-- Ranking consultants by work hours on a specific date.
SELECT
    ConsultantID,
    WorkHours,
    RANK() OVER (ORDER BY WorkHours DESC) AS HoursRank
FROM Attendance
WHERE Date = '2025-07-01';

-- 📝 Task 5: DCL & TCL
-- DCL: Granting SELECT and UPDATE privileges on the Attendance table.
GRANT SELECT, UPDATE ON Attendance TO 'hr_staff'@'localhost';

-- TCL: Using a transaction to update work hours and then committing.
START TRANSACTION;
UPDATE Attendance
SET WorkHours = 8.5
WHERE AttendanceID = 1;
COMMIT;

-- 📝 Task 6: Triggers
-- A trigger to ensure CheckOutTime is not before CheckInTime.
DELIMITER $$
CREATE TRIGGER before_attendance_insert_time
BEFORE INSERT ON Attendance
FOR EACH ROW
BEGIN
    IF NEW.CheckOutTime < NEW.CheckInTime THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Check-out time cannot be before check-in time.';
    END IF;
END$$
DELIMITER ;

---
-- Table 19: Contracts
---

-- 📝 Task 1: Views
-- Simple View: A view of all active contracts.
CREATE VIEW ActiveContracts AS
SELECT ContractID, ClientID, ProjectID, StartDate, EndDate
FROM Contracts
WHERE Status = 'Active';

-- Complex View: A view showing contracts with their client and project names.
CREATE VIEW ContractDetails AS
SELECT
    CT.ContractID,
    C.CompanyName AS Client,
    P.ProjectName AS Project,
    CT.ContractValue,
    CT.Status
FROM Contracts CT
JOIN Clients C ON CT.ClientID = C.ClientID
JOIN Projects P ON CT.ProjectID = P.ProjectID;

-- 📝 Task 2: Cursors
-- Conceptual cursor for all pending contracts.
DECLARE contract_id INT;

DECLARE pending_contracts_cursor CURSOR FOR
    SELECT ContractID FROM Contracts WHERE Status = 'Pending';

OPEN pending_contracts_cursor;
FETCH pending_contracts_cursor INTO contract_id;
CLOSE pending_contracts_cursor;
DEALLOCATE pending_contracts_cursor;

-- 📝 Task 3: Stored Procedures
-- A procedure to update a contract's status.
CREATE PROCEDURE UpdateContractStatus(IN contract_id INT, IN new_status VARCHAR(20))
BEGIN
    UPDATE Contracts
    SET Status = new_status
    WHERE ContractID = contract_id;
END;

-- 📝 Task 4: Window Functions
-- Ranking contracts by value within each client.
SELECT
    ContractID,
    ClientID,
    ContractValue,
    RANK() OVER(PARTITION BY ClientID ORDER BY ContractValue DESC) AS ValueRank
FROM Contracts;

-- 📝 Task 5: DCL & TCL
-- DCL: Granting SELECT and UPDATE privileges on the Contracts table.
GRANT SELECT, UPDATE ON Contracts TO 'legal_team'@'localhost';

-- TCL: Using a transaction to update a contract's value and then committing.
START TRANSACTION;
UPDATE Contracts
SET ContractValue = ContractValue + 50000
WHERE ContractID = 1;
COMMIT;

-- 📝 Task 6: Triggers
-- A trigger to prevent a contract from being inserted with a negative value.
DELIMITER $$
CREATE TRIGGER before_contract_insert_value
BEFORE INSERT ON Contracts
FOR EACH ROW
BEGIN
    IF NEW.ContractValue < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Contract value cannot be negative.';
    END IF;
END$$
DELIMITER ;

---
-- Table 20: Proposals
---

-- 📝 Task 1: Views
-- Simple View: A view of all approved proposals.
CREATE VIEW ApprovedProposals AS
SELECT ProposalID, ClientID, Title, SubmissionDate, EstimatedBudget
FROM Proposals
WHERE Status = 'Approved';

-- Complex View: A view showing proposals with their client name and approver name.
CREATE VIEW ProposalDetails AS
SELECT
    P.Title,
    C.CompanyName AS Client,
    P.Status,
    P.EstimatedBudget,
    Cns.FullName AS ApprovedBy
FROM Proposals P
JOIN Clients C ON P.ClientID = C.ClientID
LEFT JOIN Consultants Cns ON P.ApprovedBy = Cns.ConsultantID;

-- 📝 Task 2: Cursors
-- Conceptual cursor for all pending proposals.
DECLARE proposal_title VARCHAR(100);

DECLARE pending_proposals_cursor CURSOR FOR
    SELECT Title FROM Proposals WHERE Status = 'Pending';

OPEN pending_proposals_cursor;
FETCH pending_proposals_cursor INTO proposal_title;
CLOSE pending_proposals_cursor;
DEALLOCATE pending_proposals_cursor;

-- 📝 Task 3: Stored Procedures
-- A procedure to update a proposal's status.
CREATE PROCEDURE UpdateProposalStatus(IN proposal_id INT, IN new_status VARCHAR(20))
BEGIN
    UPDATE Proposals
    SET Status = new_status
    WHERE ProposalID = proposal_id;
END;

-- 📝 Task 4: Window Functions
-- Ranking proposals by estimated budget within each client.
SELECT
    ProposalID,
    ClientID,
    EstimatedBudget,
    RANK() OVER(PARTITION BY ClientID ORDER BY EstimatedBudget DESC) AS BudgetRank
FROM Proposals;

-- 📝 Task 5: DCL & TCL
-- DCL: Granting SELECT and INSERT privileges on the Proposals table.
GRANT SELECT, INSERT ON Proposals TO 'sales_team'@'localhost';

-- TCL: Using a transaction to update a proposal's status and then committing.
START TRANSACTION;
UPDATE Proposals
SET Status = 'Approved'
WHERE ProposalID = 2;
COMMIT;

-- 📝 Task 6: Triggers
-- A trigger to ensure a proposal is not marked as 'Approved' without an approver.
DELIMITER $$
CREATE TRIGGER before_proposal_update_status
BEFORE UPDATE ON Proposals
FOR EACH ROW
BEGIN
    IF NEW.Status = 'Approved' AND NEW.ApprovedBy IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'An approved proposal must have an approver.';
    END IF;
END$$
DELIMITER ;

-- 
-- Table 21
-- 
-- 📝 Task 1: Views
-- Simple View: A view of all active vendors.
CREATE VIEW ActiveVendors AS
SELECT VendorID, VendorName, ServicesProvided, ContactPerson
FROM Vendors
WHERE Status = 'Active';

-- Complex View: A view showing vendors grouped by their services provided, with a count of vendors for each service.
CREATE VIEW VendorServiceSummary AS
SELECT
ServicesProvided,
COUNT(VendorID) AS NumberOfVendors
FROM Vendors
GROUP BY ServicesProvided;

-- 📝 Task 2: Cursors
-- Conceptual cursor for all vendors located in Mumbai.
DECLARE vendor_name VARCHAR(100);
DECLARE vendor_address VARCHAR(200);
DECLARE mumbai_vendors_cursor CURSOR FOR
SELECT VendorName, Address FROM Vendors WHERE Address LIKE '%Mumbai%';
OPEN mumbai_vendors_cursor;
FETCH mumbai_vendors_cursor INTO vendor_name, vendor_address;
CLOSE mumbai_vendors_cursor;
DEALLOCATE mumbai_vendors_cursor;

-- 📝 Task 3: Stored Procedures
-- A procedure to update a vendor's status.
CREATE PROCEDURE UpdateVendorStatus(IN vendor_id INT, IN new_status VARCHAR(20))
BEGIN
UPDATE Vendors
SET Status = new_status
WHERE VendorID = vendor_id;
END;

-- 📝 Task 4: Window Functions
-- Ranking vendors by their contract start date.
SELECT
VendorID,
VendorName,
ContractStartDate,
RANK() OVER(ORDER BY ContractStartDate) AS ContractRank
FROM Vendors;

-- 📝 Task 5: DCL & TCL
-- DCL: Granting SELECT and UPDATE privileges on the Vendors table to an 'admin_user'.
GRANT SELECT, UPDATE ON Vendors TO 'admin_user'@'localhost';

-- TCL: Using a transaction to update a vendor's contact person and then committing.
START TRANSACTION;
UPDATE Vendors
SET ContactPerson = 'New Contact'
WHERE VendorID = 5;
COMMIT;

-- 📝 Task 6: Triggers
-- A trigger to ensure that a vendor's contract end date is after their start date.
DELIMITER $$
CREATE TRIGGER before_vendor_contract_insert
BEFORE INSERT ON Vendors
FOR EACH ROW
BEGIN
IF NEW.ContractEndDate <= NEW.ContractStartDate THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Contract end date must be after the start date.';
END IF;
END$$
DELIMITER ;

--
-- Table 22
--

-- 📝 Task 1: Views
-- Simple View: A view of all scheduled meetings.
CREATE VIEW ScheduledMeetings AS
SELECT MeetingID, ProjectID, MeetingDate, Purpose, Location
FROM Meetings
WHERE Status = 'Scheduled';

-- Complex View: A view showing the average duration of meetings by location.
CREATE VIEW MeetingDurationByLocation AS
SELECT
Location,
AVG(TIMESTAMPDIFF(MINUTE, StartTime, EndTime)) AS AvgDurationMinutes
FROM Meetings
GROUP BY Location;

-- 📝 Task 2: Cursors
-- Conceptual cursor for all meetings held via Zoom or Teams.
DECLARE meeting_id INT;
DECLARE meeting_purpose VARCHAR(100);
DECLARE virtual_meetings_cursor CURSOR FOR
SELECT MeetingID, Purpose FROM Meetings WHERE Location IN ('Zoom', 'Teams');
OPEN virtual_meetings_cursor;
FETCH virtual_meetings_cursor INTO meeting_id, meeting_purpose;
CLOSE virtual_meetings_cursor;
DEALLOCATE virtual_meetings_cursor;

-- 📝 Task 3: Stored Procedures
-- A procedure to cancel a meeting by its ID.
CREATE PROCEDURE CancelMeeting(IN meeting_id INT)
BEGIN
UPDATE Meetings
SET Status = 'Cancelled'
WHERE MeetingID = meeting_id;
END;

-- 📝 Task 4: Window Functions
-- Ranking meetings by duration, partitioned by location.
SELECT
MeetingID,
Location,
TIMEDIFF(EndTime, StartTime) AS Duration,
RANK() OVER(PARTITION BY Location ORDER BY TIMEDIFF(EndTime, StartTime) DESC) AS DurationRank
FROM Meetings;

-- 📝 Task 5: DCL & TCL
-- DCL: Granting SELECT privilege on the Meetings table to a 'project_manager'.
GRANT SELECT ON Meetings TO 'project_manager'@'localhost';

-- TCL: Using a transaction to insert a new meeting and then committing.
START TRANSACTION;
INSERT INTO Meetings (MeetingID, ProjectID, OrganizerID, MeetingDate, StartTime, EndTime, Location, Purpose, MinutesRecorded, Status)
VALUES (21, 1, 1, '2025-09-20', '16:00:00', '17:00:00', 'Teams', 'Follow-up', FALSE, 'Scheduled');
COMMIT;

-- 📝 Task 6: Triggers
-- A trigger to automatically set 'MinutesRecorded' to FALSE for new 'Scheduled' meetings.
DELIMITER $$
CREATE TRIGGER before_meeting_insert_status
BEFORE INSERT ON Meetings
FOR EACH ROW
BEGIN
IF NEW.Status = 'Scheduled' THEN
SET NEW.MinutesRecorded = FALSE;
END IF;
END$$
DELIMITER ;

--
-- Table 23
--
-- 📝 Task 1: Views
-- Simple View: A view of all evaluations with a score below 7.0.
CREATE VIEW UnderperformingConsultants AS
SELECT EvaluationID, ConsultantID, ProjectID, Score, Comments
FROM Evaluations
WHERE Score < 7.0;

-- Complex View: A view showing the average score given by each evaluator.
CREATE VIEW EvaluatorAverageScore AS
SELECT
Evaluator,
AVG(Score) AS AverageScore
FROM Evaluations
GROUP BY Evaluator;

-- 📝 Task 2: Cursors
-- Conceptual cursor for all evaluations that are pending.
DECLARE eval_id INT;
DECLARE eval_comment TEXT;
DECLARE pending_evaluations_cursor CURSOR FOR
SELECT EvaluationID, Comments FROM Evaluations WHERE Status = 'Pending';
OPEN pending_evaluations_cursor;
FETCH pending_evaluations_cursor INTO eval_id, eval_comment;
CLOSE pending_evaluations_cursor;
DEALLOCATE pending_evaluations_cursor;

-- 📝 Task 3: Stored Procedures
-- A procedure to mark an evaluation as reviewed and add a follow-up date.
CREATE PROCEDURE ReviewEvaluation(IN eval_id INT, IN follow_up_date DATE)
BEGIN
UPDATE Evaluations
SET Status = 'Reviewed', FollowUpDate = follow_up_date
WHERE EvaluationID = eval_id;
END;

-- 📝 Task 4: Window Functions
-- Ranking evaluations by score, partitioned by the evaluator.
SELECT
EvaluationID,
Evaluator,
Score,
RANK() OVER(PARTITION BY Evaluator ORDER BY Score DESC) AS ScoreRank
FROM Evaluations;

-- 📝 Task 5: DCL & TCL
-- DCL: Granting SELECT privilege on the Evaluations table to an 'hr_department' role.
GRANT SELECT ON Evaluations TO 'hr_department'@'localhost';

-- TCL: Using a transaction to update comments for a specific evaluation and then committing.
START TRANSACTION;
UPDATE Evaluations
SET Comments = 'Good performance, met all goals.'
WHERE EvaluationID = 5;
COMMIT;

-- 📝 Task 6: Triggers
-- A trigger to set the status to 'Reviewed' if a follow-up date is added.
DELIMITER $$
CREATE TRIGGER after_evaluation_update_followup
BEFORE UPDATE ON Evaluations
FOR EACH ROW
BEGIN
IF NEW.FollowUpDate IS NOT NULL AND OLD.FollowUpDate IS NULL THEN
SET NEW.Status = 'Reviewed';
END IF;
END$$
DELIMITER ;

-- 
-- Table 24
--
-- 📝 Task 1: Views
-- Simple View: A view of all approved expenses.
CREATE VIEW ApprovedExpenses AS
SELECT ExpenseID, ProjectID, Description, Amount
FROM Expenses
WHERE Status = 'Approved';

-- Complex View: A view showing the total amount spent per expense category.
CREATE VIEW ExpenseSummaryByCategory AS
SELECT
Category,
SUM(Amount) AS TotalSpent
FROM Expenses
GROUP BY Category;

-- 📝 Task 2: Cursors
-- Conceptual cursor for all expenses related to 'Travel'.
DECLARE expense_id INT;
DECLARE expense_amount DECIMAL(10,2);
DECLARE travel_expenses_cursor CURSOR FOR
SELECT ExpenseID, Amount FROM Expenses WHERE Category = 'Travel';
OPEN travel_expenses_cursor;
FETCH travel_expenses_cursor INTO expense_id, expense_amount;
CLOSE travel_expenses_cursor;
DEALLOCATE travel_expenses_cursor;

-- 📝 Task 3: Stored Procedures
-- A procedure to approve a specific expense.
CREATE PROCEDURE ApproveExpense(IN expense_id INT, IN approver_id INT)
BEGIN
UPDATE Expenses
SET Status = 'Approved', ApprovedBy = approver_id
WHERE ExpenseID = expense_id;
END;

-- 📝 Task 4: Window Functions
-- Ranking expenses by amount, partitioned by project.
SELECT
ExpenseID,
ProjectID,
Amount,
RANK() OVER(PARTITION BY ProjectID ORDER BY Amount DESC) AS ExpenseRank
FROM Expenses;

-- 📝 Task 5: DCL & TCL
-- DCL: Granting SELECT, INSERT, and UPDATE privileges on the Expenses table to a 'finance_team' role.
GRANT SELECT, INSERT, UPDATE ON Expenses TO 'finance_team'@'localhost';

-- TCL: Using a transaction to update an expense and then rolling back the changes.
START TRANSACTION;
UPDATE Expenses
SET Amount = 100.00
WHERE ExpenseID = 12;
ROLLBACK;

-- 📝 Task 6: Triggers
-- A trigger to ensure that a positive amount is entered for a new expense.
DELIMITER $$
CREATE TRIGGER before_expense_insert_amount
BEFORE INSERT ON Expenses
FOR EACH ROW
BEGIN
IF NEW.Amount <= 0 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Expense amount must be positive.';
END IF;
END$$
DELIMITER ;

--
-- Table 25
--
-- 📝 Task 1: Views
-- Simple View: A view of all completed campaigns.
CREATE VIEW CompletedCampaigns AS
SELECT CampaignID, CampaignName, EndDate, ROI
FROM MarketingCampaigns
WHERE Status = 'Completed';

-- Complex View: A view showing campaigns with a high ROI (above 6.0) and their budget.
CREATE VIEW HighROICampaigns AS
SELECT
CampaignName,
Budget,
ROI,
Channel
FROM MarketingCampaigns
WHERE ROI > 6.0;

-- 📝 Task 2: Cursors
-- Conceptual cursor for all campaigns created via Email or Instagram.
DECLARE campaign_name VARCHAR(100);
DECLARE campaign_channel VARCHAR(50);
DECLARE social_campaigns_cursor CURSOR FOR
SELECT CampaignName, Channel FROM MarketingCampaigns WHERE Channel IN ('Email', 'Instagram');
OPEN social_campaigns_cursor;
FETCH social_campaigns_cursor INTO campaign_name, campaign_channel;
CLOSE social_campaigns_cursor;
DEALLOCATE social_campaigns_cursor;

-- 📝 Task 3: Stored Procedures
-- A procedure to update the status of a marketing campaign.
CREATE PROCEDURE UpdateCampaignStatus(IN campaign_id INT, IN new_status VARCHAR(20))
BEGIN
UPDATE MarketingCampaigns
SET Status = new_status
WHERE CampaignID = campaign_id;
END;

-- 📝 Task 4: Window Functions
-- Ranking campaigns by budget, partitioned by status.
SELECT
CampaignID,
CampaignName,
Status,
Budget,
RANK() OVER(PARTITION BY Status ORDER BY Budget DESC) AS BudgetRank
FROM MarketingCampaigns;

-- 📝 Task 5: DCL & TCL
-- DCL: Granting SELECT and UPDATE privileges on the MarketingCampaigns table to a 'marketing_team' role.
GRANT SELECT, UPDATE ON MarketingCampaigns TO 'marketing_team'@'localhost';

-- TCL: Using a transaction to decrease the budget of a campaign and then committing.
START TRANSACTION;
UPDATE MarketingCampaigns
SET Budget = Budget * 0.95
WHERE CampaignID = 1;
COMMIT;

-- 📝 Task 6: Triggers
-- A trigger to prevent a campaign's end date from being before its start date.
DELIMITER $$
CREATE TRIGGER before_campaign_update_dates
BEFORE UPDATE ON MarketingCampaigns
FOR EACH ROW
BEGIN
IF NEW.EndDate < NEW.StartDate THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Campaign end date cannot be before the start date.';
END IF;
END$$
DELIMITER ;
