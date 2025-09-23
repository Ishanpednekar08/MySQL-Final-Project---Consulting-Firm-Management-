USE Consulting_firm_Management;

-- ===============================================
-- DDL (Data Definition Language) - 10 queries
-- ===============================================
-- 1. Create table 'EmployeeCertifications' for consultants' certifications
CREATE TABLE EmployeeCertifications (
    CertificationID INT PRIMARY KEY,
    ConsultantID INT,
    CertificationName VARCHAR(100) NOT NULL,
    IssuedBy VARCHAR(100),
    IssueDate DATE,
    ExpiryDate DATE,
    FOREIGN KEY (ConsultantID) REFERENCES Consultants(ConsultantID)
);

-- 2. Alter 'Consultants' to add an optional 'MiddleName' column
ALTER TABLE Consultants
ADD COLUMN MiddleName VARCHAR(50);

-- 3. Alter 'Departments' to drop the 'Objectives' column
ALTER TABLE Departments
DROP COLUMN Objectives;

-- 4. Create an index on Projects(ProjectManagerID) to speed up queries by manager
CREATE INDEX idx_projects_manager ON Projects(ProjectManagerID);

-- 5. Add unique constraint to ensure one attendance record per consultant per date
ALTER TABLE Attendance
ADD CONSTRAINT uq_attendance_per_day UNIQUE (ConsultantID, Date);

-- 6. Rename table 'Trainings' to 'TrainingPrograms' for clarity
ALTER TABLE Trainings RENAME TO TrainingPrograms;

-- 7. Drop an example table if it exists (demonstration)
DROP TABLE IF EXISTS ExampleTable;

-- 8. Add CHECK constraint on JobRoles.SalaryRange to ensure it is positive
ALTER TABLE JobRoles
ADD CONSTRAINT chk_salary_range CHECK (SalaryRange > 0);

-- 9. Alter 'Contracts' to add a foreign key on ProjectID with ON DELETE CASCADE
ALTER TABLE Contracts
ADD CONSTRAINT fk_contracts_project
FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
ON DELETE CASCADE;

-- 10. Create table 'OfficeLocations' to store addresses for departments
CREATE TABLE OfficeLocations (
    LocationID INT PRIMARY KEY,
    DepartmentID INT,
    Address VARCHAR(200),
    City VARCHAR(50),
    Country VARCHAR(50),
    PhoneNumber VARCHAR(15),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- ===============================================
-- DML (Data Manipulation) - 10 queries
-- ===============================================
-- 1. Insert a new consultant record
INSERT INTO Consultants (ConsultantID, FirstName, LastName, Email, Phone, Specialization, ExperienceYears, JoiningDate, Salary, Status)
VALUES (16, 'Kevin', 'Martin', 'kevin.martin@example.com', '9876543230', 'Finance', 4, '2023-05-15', 70000, 'Active');

-- 2. Bulk insert new client records
INSERT INTO Clients (ClientID, CompanyName, ContactPerson, Email, Phone, Address, City, Industry, RegistrationDate, Status)
VALUES
(11, 'Tech Solutions Inc.', 'Laura Parker', 'laura.parker@techsolutions.com', '9110000001', '456 Tech Park', 'Bangalore', 'Technology', '2024-02-20', 'Active'),
(12, 'Green Manufacturing', 'Samuel Lee', 'samuel.lee@greenmfg.com', '9110000002', '789 Green Road', 'Pune', 'Manufacturing', '2024-03-10', 'Active');

-- 3. Insert a new project for the new client (ClientID = 11)
INSERT INTO Projects (ProjectID, ProjectName, ClientID, StartDate, EndDate, Budget, Status, ProjectManagerName, Description, Priority)
VALUES (21, 'IT Infrastructure Overhaul', 11, '2024-04-01', '2024-08-01', 500000.00, 'Planned', 'Alice Johnson', 'Upgrade network infrastructure.', 'High');

-- 4. Insert a new timesheet entry for consultant 16 on project 21
INSERT INTO Timesheets (TimesheetID, ConsultantID, ProjectID, Date, HoursWorked, TaskID, Status, ApprovalDate, SubmittedDate, Notes)
VALUES (100, 16, 21, '2024-04-02', 8.0, NULL, 'Pending', NULL, '2024-04-03', 'First day of project.');

-- 5. Create a new invoice for project 21
INSERT INTO Invoices (InvoiceID, ClientID, ProjectID, InvoiceDate, DueDate, Amount, Tax, TotalAmount, PaidStatus, PaymentDate)
VALUES (201, 11, 21, '2024-04-05', '2024-05-05', 50000.00, 5000.00, 55000.00, 'Unpaid', NULL);

-- 6. Update consultant 16's salary after performance review
UPDATE Consultants
SET Salary = 75000
WHERE ConsultantID = 16;

-- 7. Mark project 21 as 'In Progress'
UPDATE Projects
SET Status = 'In Progress'
WHERE ProjectID = 21;

-- 8. Delete old timesheet entries before 2024
DELETE FROM Timesheets
WHERE Date < '2024-01-01';

-- 9. Remove a cancelled training session (ID = 5)
DELETE FROM TrainingPrograms
WHERE TrainingID = 5;

-- 10. Delete resources marked as 'Damaged'
DELETE FROM Resources
WHERE Status = 'Damaged';

-- ===============================================
-- DQL (Data Query Language) - 10 queries
-- ===============================================
-- 1. Select all active consultants ordered by last name
SELECT ConsultantID, FirstName, LastName, Email
FROM Consultants
WHERE Status = 'Active'
ORDER BY LastName, FirstName;

-- 2. Count of projects for each client
SELECT c.ClientID, c.CompanyName, COUNT(p.ProjectID) AS ProjectCount
FROM Clients c
LEFT JOIN Projects p ON c.ClientID = p.ClientID
GROUP BY c.ClientID, c.CompanyName;

-- 3. Total hours worked per project from timesheets
SELECT t.ProjectID, p.ProjectName, SUM(t.HoursWorked) AS TotalHours
FROM Timesheets t
JOIN Projects p ON t.ProjectID = p.ProjectID
GROUP BY t.ProjectID, p.ProjectName;

-- 4. List consultants by descending salary
SELECT ConsultantID, FirstName, LastName, Salary
FROM Consultants
ORDER BY Salary DESC;

-- 5. Projects started in 2024
SELECT ProjectID, ProjectName, StartDate
FROM Projects
WHERE YEAR(StartDate) = 2024;

-- 6. Total budget of projects per client
SELECT c.ClientID, c.CompanyName, SUM(p.Budget) AS TotalBudget
FROM Clients c
JOIN Projects p ON c.ClientID = p.ClientID
GROUP BY c.ClientID, c.CompanyName;

-- 7. Projects with 'High' priority
SELECT ProjectID, ProjectName, Priority
FROM Projects
WHERE Priority = 'High';

-- 8. Number of tasks per project
SELECT t.ProjectID, p.ProjectName, COUNT(t.TaskID) AS TaskCount
FROM Tasks t
JOIN Projects p ON t.ProjectID = p.ProjectID
GROUP BY t.ProjectID, p.ProjectName;

-- 9. Upcoming appointments (today or later)
SELECT AppointmentID, ClientID, ConsultantID, AppointmentDate
FROM Appointments
WHERE AppointmentDate >= CURDATE()
ORDER BY AppointmentDate;

-- 10. Clients registered in the last year
SELECT ClientID, CompanyName, RegistrationDate
FROM Clients
WHERE RegistrationDate >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- ===============================================
-- Clauses & Operators - 10 queries
-- ===============================================
-- 1. Active consultants in Finance or IT
SELECT ConsultantID, FirstName, LastName, Specialization
FROM Consultants
WHERE Status = 'Active' AND (Specialization = 'Finance' OR Specialization = 'IT');

-- 2. Projects with budget between 100k and 200k
SELECT ProjectID, ProjectName, Budget
FROM Projects
WHERE Budget BETWEEN 100000 AND 200000;

-- 3. Clients whose company name starts with 'A'
SELECT ClientID, CompanyName
FROM Clients
WHERE CompanyName LIKE 'A%';

-- 4. Consultants with 2, 5, or 8 years of experience
SELECT ConsultantID, FirstName, LastName, ExperienceYears
FROM Consultants
WHERE ExperienceYears IN (2, 5, 8);

-- 5. Consultants earning more than any HR consultant
SELECT ConsultantID, FirstName, LastName, Salary
FROM Consultants
WHERE Salary > ANY (SELECT Salary FROM Consultants WHERE Specialization = 'HR');

-- 6. Projects with budget exceeding all completed projects' budgets
SELECT ProjectID, ProjectName, Budget
FROM Projects
WHERE Budget > ALL (SELECT Budget FROM Projects WHERE Status = 'Completed');

-- 7. Unresolved feedback with rating below 3
SELECT FeedbackID, Rating, Comments
FROM Feedback
WHERE ResolvedStatus = 'No' AND Rating < 3;

-- 8. All approved or pending proposals
SELECT ProposalID, Title, Status
FROM Proposals
WHERE Status = 'Approved' OR Status = 'Pending';

-- 9. Vendors not providing legal services
SELECT VendorID, VendorName
FROM Vendors
WHERE ServicesProvided NOT LIKE '%Legal%';

-- 10. Marketing campaigns starting in July 2025
SELECT CampaignID, CampaignName, StartDate, EndDate
FROM MarketingCampaigns
WHERE StartDate BETWEEN '2025-07-01' AND '2025-07-31';

-- ===============================================
-- Constraints & Cascades - 10 queries
-- ===============================================
-- 1. Create table with ON DELETE CASCADE for tasks under a project
CREATE TABLE ProjectTasks (
    TaskID INT PRIMARY KEY,
    ProjectID INT,
    TaskName VARCHAR(100),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
    ON DELETE CASCADE
);

-- 2. Ensure payments are deleted when their invoice is deleted
ALTER TABLE Payments
ADD CONSTRAINT fk_payments_invoice
FOREIGN KEY (InvoiceID) REFERENCES Invoices(InvoiceID)
ON DELETE CASCADE;

-- 3. Link invoices to clients with ON UPDATE CASCADE on ClientID
ALTER TABLE Invoices
ADD CONSTRAINT fk_invoices_client
FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
ON UPDATE CASCADE;

-- 4. Create junction table for projects and consultants with composite PK
CREATE TABLE ProjectConsultant (
    ProjectID INT,
    ConsultantID INT,
    AssignedDate DATE,
    PRIMARY KEY (ProjectID, ConsultantID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    FOREIGN KEY (ConsultantID) REFERENCES Consultants(ConsultantID)
);

-- 5. Cascade updates from Consultants to assigned tasks
ALTER TABLE Tasks
ADD CONSTRAINT fk_tasks_consultant
FOREIGN KEY (AssignedTo) REFERENCES Consultants(ConsultantID)
ON UPDATE CASCADE;

-- 6. Set Feedback.ConsultantID to NULL if consultant is removed
ALTER TABLE Feedback
ADD CONSTRAINT fk_feedback_consultant
FOREIGN KEY (ConsultantID) REFERENCES Consultants(ConsultantID)
ON DELETE SET NULL;

-- 7. Create table for asset assignments with cascading constraints
CREATE TABLE AssetAssignments (
    AssignmentID INT PRIMARY KEY,
    AssetID INT,
    ConsultantID INT,
    FOREIGN KEY (AssetID) REFERENCES Assets(AssetID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ConsultantID) REFERENCES Consultants(ConsultantID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 8. Create a self-referencing employee hierarchy table
CREATE TABLE EmployeeHierarchy (
    ConsultantID INT PRIMARY KEY,
    ManagerID INT,
    FOREIGN KEY (ConsultantID) REFERENCES Consultants(ConsultantID),
    FOREIGN KEY (ManagerID) REFERENCES Consultants(ConsultantID) ON DELETE SET NULL ON UPDATE CASCADE
);

-- 9. Cascade delete contracts when a client is removed
ALTER TABLE Contracts
ADD CONSTRAINT fk_contracts_client
FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
ON DELETE CASCADE;

-- 10. Cascade delete attendance records when consultant is deleted
ALTER TABLE Attendance
ADD CONSTRAINT fk_attendance_consultant
FOREIGN KEY (ConsultantID) REFERENCES Consultants(ConsultantID)
ON DELETE CASCADE;

-- ===============================================
-- Joins - 10 queries
-- ===============================================
-- 1. Inner join projects with clients to list project-client pairs
SELECT p.ProjectID, p.ProjectName, c.CompanyName
FROM Projects p
INNER JOIN Clients c ON p.ClientID = c.ClientID;

-- 2. Left join clients with projects (include clients without projects)
SELECT c.ClientID, c.CompanyName, p.ProjectID
FROM Clients c
LEFT JOIN Projects p ON c.ClientID = p.ClientID;

-- 3. Right join departments with consultants to list managers
SELECT d.DepartmentName, con.FirstName, con.LastName
FROM Departments d
RIGHT JOIN Consultants con ON d.ManagerID = con.ConsultantID;

-- 4. Self join consultants to find pairs with same specialization
SELECT a.ConsultantID AS CID1, b.ConsultantID AS CID2, a.Specialization
FROM Consultants a
JOIN Consultants b ON a.Specialization = b.Specialization AND a.ConsultantID <> b.ConsultantID;

-- 5. Join consultants, tasks, and projects to show assignments
SELECT con.FirstName, con.LastName, t.TaskName, pr.ProjectName
FROM Consultants con
JOIN Tasks t ON con.ConsultantID = t.AssignedTo
JOIN Projects pr ON t.ProjectID = pr.ProjectID;

-- 6. Count approved proposals per client (LEFT JOIN with GROUP BY)
SELECT cl.ClientID, cl.CompanyName, COUNT(pr.ProposalID) AS ApprovedProposals
FROM Clients cl
LEFT JOIN Proposals pr ON cl.ClientID = pr.ClientID AND pr.Status = 'Approved'
GROUP BY cl.ClientID, cl.CompanyName;

-- 7. Right join departments with consultants to list all consultants and department they manage (if any)
SELECT d.DepartmentName, con.FirstName, con.LastName
FROM Departments d
RIGHT JOIN Consultants con ON d.ManagerID = con.ConsultantID;

-- 8. Self join attendance to compare check-in times on consecutive days
SELECT a1.ConsultantID, a1.Date AS Date1, a1.CheckInTime, a2.Date AS Date2, a2.CheckInTime
FROM Attendance a1
JOIN Attendance a2 ON a1.ConsultantID = a2.ConsultantID
WHERE a1.Date = DATE_SUB(a2.Date, INTERVAL 1 DAY);

-- 9. Full outer join clients and proposals using UNION
SELECT cl.ClientID, cl.CompanyName, pr.ProposalID
FROM Clients cl
LEFT JOIN Proposals pr ON cl.ClientID = pr.ClientID
UNION
SELECT cl.ClientID, cl.CompanyName, pr.ProposalID
FROM Clients cl
RIGHT JOIN Proposals pr ON cl.ClientID = pr.ClientID;

-- 10. Self join job roles to find roles approved by the same consultant
SELECT j1.RoleName AS Role1, j2.RoleName AS Role2, j1.ReportsTo AS ApprovedBy
FROM JobRoles j1
JOIN JobRoles j2 ON j1.ReportsTo = j2.ReportsTo AND j1.RoleID <> j2.RoleID;

-- ===============================================
-- Subqueries - 10 queries
-- ===============================================
-- 1. Projects with budget above average
SELECT ProjectID, ProjectName, Budget
FROM Projects
WHERE Budget > (SELECT AVG(Budget) FROM Projects);

-- 2. Consultants with experience above the average
SELECT ConsultantID, FirstName, LastName, ExperienceYears
FROM Consultants c
WHERE ExperienceYears > (SELECT AVG(ExperienceYears) FROM Consultants);

-- 3. Clients with more proposals than average
SELECT ClientID, CompanyName
FROM Clients
WHERE (SELECT COUNT(*) FROM Proposals pr WHERE pr.ClientID = Clients.ClientID) >
      (SELECT AVG(cnt) FROM (SELECT COUNT(*) AS cnt FROM Proposals GROUP BY ClientID) AS sub);

-- 4. Consultants who have at least one leave approved
SELECT ConsultantID, FirstName, LastName
FROM Consultants c
WHERE EXISTS (
    SELECT 1 FROM Leaves l
    WHERE l.ConsultantID = c.ConsultantID AND l.ApprovedBy IS NOT NULL
);

-- 5. Projects with no tasks
SELECT ProjectID, ProjectName
FROM Projects p
WHERE NOT EXISTS (SELECT 1 FROM Tasks t WHERE t.ProjectID = p.ProjectID);

-- 6. Consultants earning more than all HR consultants
SELECT ConsultantID, FirstName, LastName, Salary
FROM Consultants
WHERE Salary > ALL (SELECT Salary FROM Consultants WHERE Specialization = 'HR');

-- 7. Projects where invoiced amount exceeds budget
SELECT p.ProjectID, p.ProjectName
FROM Projects p
WHERE (SELECT SUM(Amount + Tax) FROM Invoices i WHERE i.ProjectID = p.ProjectID) > p.Budget;

-- 8. Consultants working on multiple projects
SELECT ConsultantID, FirstName, LastName
FROM Consultants c
WHERE (SELECT COUNT(DISTINCT ProjectID) FROM Tasks t WHERE t.AssignedTo = c.ConsultantID) > 1;

-- 9. Consultants with salary above specialization average
SELECT c.ConsultantID, c.FirstName, c.Specialization, c.Salary
FROM Consultants c
WHERE c.Salary > (
    SELECT AVG(c2.Salary) FROM Consultants c2
    WHERE c2.Specialization = c.Specialization
);

-- 10. Projects with end date before all their tasks' deadlines
SELECT p.ProjectID, p.ProjectName
FROM Projects p
WHERE p.EndDate < ALL (SELECT Deadline FROM Tasks t WHERE t.ProjectID = p.ProjectID);

-- ===============================================
-- Functions - 10 queries
-- ===============================================
-- 1. Total number of consultants
SELECT COUNT(*) AS TotalConsultants
FROM Consultants;

-- 2. Average salary by specialization
SELECT Specialization, AVG(Salary) AS AvgSalary
FROM Consultants
GROUP BY Specialization;

-- 3. Total budget of completed projects
SELECT SUM(Budget) AS TotalBudget
FROM Projects
WHERE Status = 'Completed';

-- 4. Maximum hours logged on any task
SELECT MAX(HoursLogged) AS MaxHours
FROM Tasks;

-- 5. Length of the longest resource name
SELECT MAX(LENGTH(ResourceName)) AS MaxNameLength
FROM Resources;

-- 6. Uppercase email addresses of clients
SELECT UPPER(Email) AS EmailUpper
FROM Clients;

-- 7. Lowercase vendor names
SELECT LOWER(VendorName) AS VendorLower
FROM Vendors;

-- 8. Length of each consultant's full name
SELECT FirstName, LastName, LENGTH(FirstName) + LENGTH(LastName) + 1 AS NameLength
FROM Consultants;

-- 9. Count of tasks by status
SELECT Status, COUNT(*) AS TaskCount
FROM Tasks
GROUP BY Status;

-- 10. Average approved leave duration in days
SELECT AVG(DATEDIFF(EndDate, StartDate)) AS AvgLeaveLength
FROM Leaves
WHERE Status = 'Approved';

-- ===============================================
-- Views & CTE - 10 queries
-- ===============================================
-- 1. Create a view for consultant ID, full name, and specialization
CREATE VIEW ConsultantInfo AS
SELECT ConsultantID, CONCAT(FirstName, ' ', LastName) AS FullName, Specialization
FROM Consultants;

-- 2. Select all from ConsultantInfo view
SELECT * FROM ConsultantInfo;

-- 3. Create a view summarizing project basic details
CREATE VIEW ProjectSummary AS
SELECT ProjectID, ProjectName, Budget, Status
FROM Projects;

-- 4. Select completed projects using ProjectSummary view
SELECT * FROM ProjectSummary
WHERE Status = 'Completed';

-- 5. CTE to get task count per project
WITH TaskCount AS (
    SELECT ProjectID, COUNT(*) AS TotalTasks
    FROM Tasks
    GROUP BY ProjectID
)
SELECT p.ProjectID, p.ProjectName, tc.TotalTasks
FROM Projects p
JOIN TaskCount tc ON p.ProjectID = tc.ProjectID;

-- 6. Recursive CTE to generate numbers 1 through 5
WITH RECURSIVE seq AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM seq WHERE n < 5
)
SELECT * FROM seq;

-- 7. CTE to calculate total hours per consultant in 2023
WITH YearlyHours AS (
    SELECT ConsultantID, SUM(HoursWorked) AS Hours2023
    FROM Timesheets
    WHERE YEAR(Date) = 2023
    GROUP BY ConsultantID
)
SELECT ConsultantID, Hours2023 FROM YearlyHours;

-- 8. Create a view for invoices above 100k
CREATE VIEW HighValueInvoices AS
SELECT InvoiceID, ClientID, TotalAmount
FROM Invoices
WHERE TotalAmount > 100000;

-- 9. Select from HighValueInvoices view
SELECT * FROM HighValueInvoices;

-- 10. Recursive CTE to calculate running total 1 to 5
WITH RECURSIVE nums AS (
    SELECT 1 AS num, 1 AS sum
    UNION ALL
    SELECT num+1, sum+num+1 FROM nums WHERE num < 5
)
SELECT num, sum FROM nums;

-- ===============================================
-- Stored Procedures - 5 queries
-- ===============================================
-- 1. Procedure to add a new client
DELIMITER $$
CREATE PROCEDURE AddClient(
    IN p_CompanyName VARCHAR(100), IN p_ContactPerson VARCHAR(50),
    IN p_Email VARCHAR(100), IN p_Phone VARCHAR(15), IN p_Address VARCHAR(200),
    IN p_City VARCHAR(50), IN p_Industry VARCHAR(50), IN p_RegistrationDate DATE
)
BEGIN
    INSERT INTO Clients(CompanyName, ContactPerson, Email, Phone, Address, City, Industry, RegistrationDate, Status)
    VALUES(p_CompanyName, p_ContactPerson, p_Email, p_Phone, p_Address, p_City, p_Industry, p_RegistrationDate, 'Active');
END $$
DELIMITER ;

-- 2. Procedure to update a project's status
DELIMITER $$
CREATE PROCEDURE UpdateProjectStatus(
    IN p_ProjectID INT, IN p_Status VARCHAR(20)
)
BEGIN
    UPDATE Projects
    SET Status = p_Status
    WHERE ProjectID = p_ProjectID;
END $$
DELIMITER ;

-- 3. Procedure to delete a consultant by ID
DELIMITER $$
CREATE PROCEDURE DeleteConsultant(
    IN p_ConsultantID INT
)
BEGIN
    DELETE FROM Consultants
    WHERE ConsultantID = p_ConsultantID;
END $$
DELIMITER ;

-- 4. Procedure to get total invoice amount for a client
DELIMITER $$
CREATE PROCEDURE GetClientInvoiceTotal(
    IN p_ClientID INT, OUT p_Total DECIMAL(12,2)
)
BEGIN
    SELECT SUM(TotalAmount) INTO p_Total
    FROM Invoices
    WHERE ClientID = p_ClientID;
END $$
DELIMITER ;

-- 5. Procedure to insert a new timesheet entry
DELIMITER $$
CREATE PROCEDURE AddTimesheet(
    IN p_TimesheetID INT, IN p_ConsultantID INT, IN p_ProjectID INT,
    IN p_Date DATE, IN p_Hours DECIMAL(5,2), IN p_Status VARCHAR(20)
)
BEGIN
    INSERT INTO Timesheets(TimesheetID, ConsultantID, ProjectID, Date, HoursWorked, Status)
    VALUES (p_TimesheetID, p_ConsultantID, p_ProjectID, p_Date, p_Hours, p_Status);
END $$
DELIMITER ;

-- ===============================================
-- Window Functions - 5 queries
-- ===============================================
-- 1. Assign row numbers to consultants by descending salary
SELECT ConsultantID, FirstName, Salary,
ROW_NUMBER() OVER (ORDER BY Salary DESC) AS RowNum
FROM Consultants;

-- 2. Rank projects by budget (highest gets rank 1)
SELECT ProjectID, ProjectName, Budget,
RANK() OVER (ORDER BY Budget DESC) AS BudgetRank
FROM Projects;

-- 3. Show each task with the next deadline (within the project)
SELECT TaskID, ProjectID, Deadline,
LEAD(Deadline) OVER (PARTITION BY ProjectID ORDER BY Deadline) AS NextDeadline
FROM Tasks;

-- 4. Show each meeting with the previous meeting date (same project)
SELECT MeetingID, ProjectID, MeetingDate,
LAG(MeetingDate) OVER (PARTITION BY ProjectID ORDER BY MeetingDate) AS PrevMeetingDate
FROM Meetings;

-- 5. Rank consultants within each specialization by experience
SELECT ConsultantID, Specialization, ExperienceYears,
RANK() OVER (PARTITION BY Specialization ORDER BY ExperienceYears DESC) AS SpecRank
FROM Consultants;

-- ===============================================
-- Transactions - 5 queries
-- ===============================================
-- 1. Transaction: update project budget and client status, then commit
START TRANSACTION;
UPDATE Projects SET Budget = Budget * 1.1 WHERE ProjectID = 21;
UPDATE Clients SET Status = 'Active' WHERE ClientID = 11;
COMMIT;

-- 2. Transaction: attempt update and delete, then rollback
START TRANSACTION;
UPDATE Consultants SET Salary = Salary + 5000 WHERE ConsultantID = 2;
DELETE FROM Consultants WHERE ConsultantID = 2;
ROLLBACK;

-- 3. Transaction with savepoint: partial rollback example
START TRANSACTION;
UPDATE Projects SET Status = 'On Hold' WHERE ProjectID = 21;
SAVEPOINT sp1;
UPDATE Projects SET Status = 'Cancelled' WHERE ProjectID = 21;
ROLLBACK TO sp1;
COMMIT;

-- 4. Transaction: delete tasks with savepoint and rollback to it
START TRANSACTION;
DELETE FROM Tasks WHERE TaskID = 1;
SAVEPOINT afterDelete;
DELETE FROM Tasks WHERE TaskID = 2;
ROLLBACK TO afterDelete;
COMMIT;

-- 5. Transaction: mark invoice paid and insert payment record
START TRANSACTION;
UPDATE Invoices SET PaidStatus = 'Paid', PaymentDate = CURDATE() WHERE InvoiceID = 201;
INSERT INTO Payments(PaymentID, InvoiceID, PaymentDate, Amount, PaymentMethod, ReferenceNumber, Status)
VALUES (301, 201, CURDATE(), 55000.00, 'Wire Transfer', 'REF123', 'Completed');
COMMIT;

-- ===============================================
-- Triggers - 5 queries
-- ===============================================
-- Create table for logging client deletions (used by trigger)
CREATE TABLE IF NOT EXISTS ClientDeletions (
    ClientID INT,
    DeletedDate DATETIME
);

-- 1. After insert on Timesheets: deduct cost from project budget
DELIMITER $$
CREATE TRIGGER after_timesheet_insert
AFTER INSERT ON Timesheets
FOR EACH ROW
BEGIN
    UPDATE Projects
    SET Budget = Budget - (NEW.HoursWorked * 100) -- assume rate 100 per hour
    WHERE ProjectID = NEW.ProjectID;
END $$
DELIMITER ;

-- 2. Before update on Projects: prevent drastic budget cuts
DELIMITER $$
CREATE TRIGGER before_project_update
BEFORE UPDATE ON Projects
FOR EACH ROW
BEGIN
    IF NEW.Budget < OLD.Budget * 0.5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Budget reduction too large';
    END IF;
END $$
DELIMITER ;

-- 3. After delete on Clients: log deleted client ID
DELIMITER $$
CREATE TRIGGER after_client_delete
AFTER DELETE ON Clients
FOR EACH ROW
BEGIN
    INSERT INTO ClientDeletions(ClientID, DeletedDate)
    VALUES (OLD.ClientID, NOW());
END $$
DELIMITER ;

-- 4. After update on Payments: mark invoice as paid
DELIMITER $$
CREATE TRIGGER after_payment_update
AFTER UPDATE ON Payments
FOR EACH ROW
BEGIN
    IF NEW.Status = 'Completed' THEN
        UPDATE Invoices
        SET PaidStatus = 'Paid', PaymentDate = NEW.PaymentDate
        WHERE InvoiceID = NEW.InvoiceID;
    END IF;
END $$
DELIMITER ;

-- 5. Before insert on Feedback: set SubmittedDate to today if not provided
DELIMITER $$
CREATE TRIGGER before_feedback_insert
BEFORE INSERT ON Feedback
FOR EACH ROW
BEGIN
    IF NEW.SubmittedDate IS NULL THEN
        SET NEW.SubmittedDate = CURDATE();
    END IF;
END $$
DELIMITER ;
