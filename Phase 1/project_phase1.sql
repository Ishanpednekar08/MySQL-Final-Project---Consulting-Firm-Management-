-- Single line comment 

/* 
multi 
line 
comment
*/

-- --------------------------------------------- Database Queries -----------------------------------------------------

-- to create database Consulting Firm Management 
create database Consulting_firm_Management;

-- to work on database we need to use it 
use Consulting_firm_Management;


-- --------------------------------------------- Database Analysis -----------------------------------------------------

-- Table 1: Consultants – ConsultantID, FirstName, LastName, Email, Phone, Specialization, ExperienceYears, JoiningDate, Salary, Status
-- Table 2: Clients – ClientID, CompanyName, ContactPerson, Email, Phone, Address, City, Industry, RegistrationDate, Status
-- Table 3: Projects – ProjectID, ProjectName, ClientID, StartDate, EndDate, Budget, Status, ProjectManagerID, Description, Priority
-- Table 4: Departments – DepartmentID, DepartmentName, ManagerID, Location, ExtensionNumber, CreatedDate, Budget, NumberOfEmployees, Objectives, Status
-- Table 5: Tasks – TaskID, ProjectID, AssignedTo, TaskName, Description, StartDate, Deadline, Status, Priority, HoursLogged
-- Table 6: Timesheets – TimesheetID, ConsultantID, ProjectID, Date, HoursWorked, TaskID, Status, ApprovalDate, SubmittedDate, Notes
-- Table 7: Invoices – InvoiceID, ClientID, ProjectID, InvoiceDate, DueDate, Amount, Tax, TotalAmount, PaidStatus, PaymentDate
-- Table 8: Payments – PaymentID, InvoiceID, PaymentDate, Amount, PaymentMethod, ReferenceNumber, Status, ReceivedBy, Currency, Notes
-- Table 9: Appointments – AppointmentID, ClientID, ConsultantID, AppointmentDate, StartTime, EndTime, Location, Purpose, Status, Notes
-- Table 10: Feedback – FeedbackID, ClientID, ProjectID, SubmittedDate, Rating, Comments, ResolvedStatus, ConsultantID, ResponseDate, ActionTaken
-- Table 11: Reports – ReportID, ProjectID, CreatedBy, CreatedDate, Title, Description, Status, ReviewedBy, ReviewDate, FilePath
-- Table 12: Resources – ResourceID, ResourceName, Type, Quantity, Location, PurchaseDate, Condition, Status, AssignedTo, Notes
-- Table 13: Assets – AssetID, AssetName, Type, PurchaseDate, Value, Status, Location, AssignedTo, WarrantyExpiry, Notes
-- Table 14: Technologies – TechnologyID, Name, Version, Vendor, LicenseKey, PurchaseDate, ExpiryDate, Status, AssignedTo, Notes
-- Table 15: Trainings – TrainingID, Title, Trainer, StartDate, EndDate, Location, Capacity, Description, Status, Cost
-- Table 16: JobRoles – RoleID, RoleName, DepartmentID, Description, MinimumExperience, SalaryRange, CreatedDate, Status, ReportsTo, ApprovalRequired
-- Table 17: Leaves – LeaveID, ConsultantID, StartDate, EndDate, LeaveType, Reason, Status, AppliedDate, ApprovedBy, Notes
-- Table 18: Attendance – AttendanceID, ConsultantID, Date, CheckInTime, CheckOutTime, Status, WorkHours, Location, ApprovedBy, Notes
-- Table 19: Contracts – ContractID, ClientID, ProjectID, StartDate, EndDate, ContractValue, Status, SignedDate, RenewedDate, Notes
-- Table 20: Proposals – ProposalID, ClientID, Title, Description, SubmissionDate, Status, ApprovedBy, ValidUntil, EstimatedBudget, Notes
-- Table 21: Vendors – VendorID, VendorName, ContactPerson, Email, Phone, Address, ServicesProvided, ContractStartDate, ContractEndDate, Status
-- Table 22: Meetings – MeetingID, ProjectID, OrganizerID, MeetingDate, StartTime, EndTime, Location, Purpose, MinutesRecorded, Status
-- Table 23: Evaluations – EvaluationID, ConsultantID, ProjectID, EvaluationDate, Evaluator, Score, Comments, Status, FollowUpDate, Recommendations
-- Table 24: Expenses – ExpenseID, ProjectID, Description, Amount, ExpenseDate, SubmittedBy, ApprovedBy, Status, Category, Notes
-- Table 25: MarketingCampaigns – CampaignID, CampaignName, StartDate, EndDate, Budget, TargetAudience, Status, CreatedBy, Channel, ROI

-- ----------------------------------------------------------- Table Queries ----------------------------------------------------------------------------

-- Table 1: Consultants
create table Consultants (
ConsultantID INT PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Email VARCHAR(100) UNIQUE,
Phone VARCHAR(15) UNIQUE,
Specialization VARCHAR(100),
ExperienceYears INT CHECK (ExperienceYears >= 0),
JoiningDate DATE ,
Salary DECIMAL(10,2),
Status VARCHAR(20) DEFAULT 'Active'
);

INSERT INTO Consultants VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '9876543210', 'Finance', 5, '2020-05-12', 75000, 'Active'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '9876543211', 'HR', 3, '2021-06-14', 65000, 'Active'),
(3, 'Mike', 'Brown', 'mike.brown@example.com', '9876543212', 'IT', 7, '2019-02-10', 90000, 'Active'),
(4, 'Alice', 'Johnson', 'alice.johnson@example.com', '9876543213', 'Marketing', 4, '2020-11-23', 72000, 'Active'),
(5, 'Bob', 'Williams', 'bob.williams@example.com', '9876543214', 'Operations', 6, '2018-08-19', 80000, 'Active'),
(6, 'Sara', 'Davis', 'sara.davis@example.com', '9876543215', 'Finance', 2, '2022-01-05', 60000, 'Active'),
(7, 'Tom', 'Miller', 'tom.miller@example.com', '9876543216', 'HR', 8, '2017-03-16', 95000, 'Active'),
(8, 'Emma', 'Wilson', 'emma.wilson@example.com', '9876543217', 'IT', 5, '2019-06-24', 77000, 'Active'),
(9, 'Chris', 'Moore', 'chris.moore@example.com', '9876543218', 'Operations', 4, '2020-10-30', 72000, 'Active'),
(10, 'Nancy', 'Taylor', 'nancy.taylor@example.com', '9876543219', 'Marketing', 3, '2021-09-12', 68000, 'Active'),
(11, 'David', 'Anderson', 'david.anderson@example.com', '9876543220', 'Finance', 7, '2018-04-15', 87000, 'Active'),
(12, 'Laura', 'Thomas', 'laura.thomas@example.com', '9876543221', 'HR', 6, '2019-07-22', 82000, 'Active'),
(13, 'Peter', 'Jackson', 'peter.jackson@example.com', '9876543222', 'IT', 3, '2021-02-14', 69000, 'Active'),
(14, 'Sophia', 'White', 'sophia.white@example.com', '9876543223', 'Operations', 5, '2019-11-29', 75000, 'Active'),
(15, 'Daniel', 'Harris', 'daniel.harris@example.com', '9876543224', 'Marketing', 4, '2020-08-08', 72000, 'Active'),
(16, 'Grace', 'Martin', 'grace.martin@example.com', '9876543225', 'Finance', 2, '2022-03-19', 62000, 'Active'),
(17, 'Henry', 'Lee', 'henry.lee@example.com', '9876543226', 'HR', 9, '2016-05-21', 98000, 'Active'),
(18, 'Olivia', 'Walker', 'olivia.walker@example.com', '9876543227', 'IT', 7, '2018-09-13', 88000, 'Active'),
(19, 'Paul', 'Hall', 'paul.hall@example.com', '9876543228', 'Operations', 3, '2021-11-10', 67000, 'Active'),
(20, 'Mia', 'Allen', 'mia.allen@example.com', '9876543229', 'Marketing', 5, '2019-01-07', 74000, 'Active');

-- to display records
select * from Consultants;

-- to remove records from the table
truncate table consultants;

-- to remove whole table from databse
drop table Consultants;

-- Select queries
-- 1.Select consultants with more than 5 years of experience
SELECT * FROM Consultants WHERE ExperienceYears > 5;

-- 2. List all consultants ordered by Salary descending
SELECT ConsultantID, FirstName, LastName, Salary FROM Consultants ORDER BY Salary DESC;

-- 3. Find consultants with specialization in 'Finance'
SELECT * FROM Consultants WHERE Specialization LIKE 'Finance';

-- 4. Select consultants with salary between 70,000 and 90,000
SELECT FirstName, LastName, Salary FROM Consultants WHERE Salary BETWEEN 70000 AND 90000;

-- 5. Select consultants who work in HR, IT, or Marketing
SELECT FirstName, Specialization FROM Consultants WHERE Specialization IN ('HR', 'IT', 'Marketing');

-- alter queries
-- 1. Add a new column for performance rating
ALTER TABLE Consultants ADD PerformanceRating DECIMAL(3,2);

-- 2. Modify ExperienceYears column to set default as 0
ALTER TABLE Consultants ALTER COLUMN ExperienceYears SET DEFAULT 0;

-- 3. Add NOT NULL constraint to Salary column
ALTER TABLE Consultants ALTER COLUMN Salary SET NOT NULL;

-- 4. Drop the Status column
ALTER TABLE Consultants DROP COLUMN Status;

-- 5. Add CHECK constraint for Salary to be greater than 50000
ALTER TABLE Consultants ADD CONSTRAINT chk_Salary CHECK (Salary > 50000);

-- 3. Rename queries 
-- 1. Rename table Consultants to CompanyConsultants
ALTER TABLE Consultants RENAME TO CompanyConsultants;

-- 2. Rename column FirstName to FName
ALTER TABLE CompanyConsultants RENAME COLUMN FirstName TO FName;

-- 3. Rename column LastName to LName
ALTER TABLE Consultants RENAME COLUMN LastName TO LName;

-- 4. Rename column Phone to ContactNumber
ALTER TABLE Consultants RENAME COLUMN Phone TO ContactNumber;

-- 5. Rename column Email to EmailAddress
ALTER TABLE Consultants RENAME COLUMN Email TO EmailAddress;

-- disables safe update mode,
SET SQL_SAFE_UPDATES = 0;

-- turn safe mode back
SET SQL_SAFE_UPDATES = 1;

-- 4. Delete Queries
-- 1. Delete particular consultant 
DELETE FROM Consultants
WHERE ConsultantID = 5;

-- 2. Delete Consultant with experience less than 3 years
DELETE FROM Consultants
WHERE ExperienceYears < 3;

-- 3. Delete Consultant with joining date before 2018
DELETE FROM Consultants
WHERE ExperienceYears < 3;

-- 4. Delete Consultants specialized in operations
DELETE FROM Consultants
WHERE Specialization = 'Operations';

-- 5. Delete Consultants with salary higher than 90000
DELETE FROM Consultants
WHERE Salary > 90000;

-- 5. Update Queries
-- 1. Update status to inactive with consultants more than 8 years experience
UPDATE Consultants
SET Status = 'Inactive'
WHERE ExperienceYears > 8;

-- 2. Increase salary by 5000
UPDATE Consultants
SET Salary = Salary + 5000
WHERE Specialization = 'IT';

-- 3. Update Hr to Senior HR who are having more than 5 years experience
UPDATE Consultants
SET Specialization = 'Senior HR'
WHERE Specialization = 'HR' AND ExperienceYears > 5;

-- 4. Status on leave for consultant those joined after 2021
UPDATE Consultants
SET Status = 'On Leave'
WHERE JoiningDate > '2021-01-01';

-- 5. Reduce salary by 3000 whose salary is between 70k to 80k 
UPDATE Consultants
SET Salary = Salary - 3000
WHERE Salary BETWEEN 70000 AND 80000;

-- Table 2: Clients 
Create Table Clients (
ClientID INT PRIMARY KEY,
CompanyName VARCHAR(100) NOT NULL,
ContactPerson VARCHAR(50),
Email VARCHAR(100) UNIQUE,
Phone VARCHAR(15),
Address VARCHAR(200),
City VARCHAR(50),
Industry VARCHAR(50),
RegistrationDate DATE,
Status VARCHAR(20) DEFAULT 'Active'
);

INSERT INTO Clients (ClientID, CompanyName, ContactPerson, Email, Phone, Address, City, Industry, RegistrationDate, Status)
VALUES
(1, 'ABC Corp', 'John Doe', 'abc@example.com', '1234567890', '123 Elm St', 'New York', 'Finance', '2019-02-15', 'Active'),
(2, 'XYZ Ltd', 'Jane Smith', 'xyz@example.com', '1234567891', '456 Maple St', 'Los Angeles', 'IT', '2020-05-10', 'Active'),
(3, 'Tech Solutions', 'Mike Brown', 'techsol@example.com', '1234567892', '789 Oak St', 'Chicago', 'Marketing', '2018-07-20', 'Inactive'),
(4, 'Sunrise Inc', 'Sara Davis', 'sunrise@example.com', '1234567893', '101 Pine St', 'Houston', 'HR', '2021-03-12', 'Active'),
(5, 'GreenTech', 'Tom Miller', 'greentech@example.com', '1234567894', '102 Birch St', 'Phoenix', 'Finance', '2019-10-22', 'Active'),
(6, 'BlueWave', 'Emma Wilson', 'bluewave@example.com', '1234567895', '103 Cedar St', 'San Diego', 'IT', '2020-08-18', 'Active'),
(7, 'Prime Corp', 'Chris Moore', 'prime@example.com', '1234567896', '104 Ash St', 'Dallas', 'HR', '2017-12-01', 'Inactive'),
(8, 'InnovateX', 'Nancy Taylor', 'innovatex@example.com', '1234567897', '105 Walnut St', 'San Jose', 'Marketing', '2018-06-11', 'Active'),
(9, 'Star Solutions', 'David Anderson', 'star@example.com', '1234567898', '106 Spruce St', 'Austin', 'Operations', '2019-09-23', 'Active'),
(10, 'AlphaTech', 'Laura Thomas', 'alpha@example.com', '1234567899', '107 Redwood St', 'Jacksonville', 'Finance', '2020-01-14', 'Inactive'),
(11, 'Beta Enterprises', 'Peter Jackson', 'beta@example.com', '1234567800', '108 Palm St', 'Fort Worth', 'IT', '2021-04-07', 'Active'),
(12, 'Gamma LLC', 'Sophia White', 'gamma@example.com', '1234567801', '109 Cypress St', 'Columbus', 'HR', '2019-03-28', 'Active'),
(13, 'Delta Ltd', 'Daniel Harris', 'delta@example.com', '1234567802', '110 Chestnut St', 'Charlotte', 'Marketing', '2018-05-15', 'Inactive'),
(14, 'Epsilon Co', 'Grace Martin', 'epsilon@example.com', '1234567803', '111 Fir St', 'Indianapolis', 'Finance', '2020-07-19', 'Active'),
(15, 'Zeta Inc', 'Henry Lee', 'zeta@example.com', '1234567804', '112 Poplar St', 'San Francisco', 'IT', '2019-11-25', 'Active'),
(16, 'Eta Group', 'Olivia Walker', 'eta@example.com', '1234567805', '113 Beech St', 'Seattle', 'HR', '2017-09-09', 'Inactive'),
(17, 'Theta Corp', 'Paul Hall', 'theta@example.com', '1234567806', '114 Sycamore St', 'Denver', 'Marketing', '2018-08-03', 'Active'),
(18, 'Iota LLC', 'Mia Allen', 'iota@example.com', '1234567807', '115 Hickory St', 'Boston', 'Finance', '2019-06-30', 'Active'),
(19, 'Kappa Ltd', 'John Doe', 'kappa@example.com', '1234567808', '116 Magnolia St', 'El Paso', 'IT', '2020-12-17', 'Active'),
(20, 'Lambda Inc', 'Jane Smith', 'lambda@example.com', '1234567809', '117 Dogwood St', 'Detroit', 'HR', '2018-02-21', 'Inactive');

-- to display records
select * from Clients;

-- to remove records from the table
truncate table Clients;

-- to remove whole table from databse
drop table Clients;

-- 1. Select queries
-- 1. Selecting particular feild clients with status of active
SELECT ClientID, CompanyName, City, Industry
from Clients
where Status = 'Active'
and Industry = 'Finance'
and City IN ('New York', 'Boston');

-- 2.List all clients registered after 2019, ordered by RegistrationDate descending 
SELECT ClientID, CompanyName, RegistrationDate
from Clients
where RegistrationDate > '2019-12-31'
order by RegistrationDate DESC;

-- 3. Selecting clients whose company name starts with 'A'
select ClientID, CompanyName, ContactPerson
from Clients
where CompanyName like 'A%';

-- 4. Count all clients in industry 
select Industry, COUNT(*) as TotalClients
from Clients
group by Industry;

-- 5. select clients with inacitve status and contact endling with 0
select ClientID, CompanyName, Phone, Status
from Clients
where Status = 'Inactive'
and Phone like '%0';

-- 2. Alter queries
-- 1. Adding extra column
Alter table Clients
Add TaxID varchar (200) unique;

-- 2. Modify address column to allow longer text 
alter table Clients
modify column Address varchar (300);

-- 3. Drop city column
alter table Clients
drop column City;

-- 4. Rename column phone to contactnumber
alter table Clients
rename column Phone to ContactNumber;

-- 3. Rename Queries
-- 1. Rename clients table
alter table Clients
rename to CustomerAccounts;

-- 2. rename column 
alter table CustomerAccounts
rename column status to AccountStatus;

-- 3. rename column 
alter table CustomerAccounts
rename column Industry to BusinessSector;

-- 4. rename column
alter table CustomerAccounts
rename column CompanyName to OrganizationName;

-- 5. Rename the table 
alter table CustomerAccounts
rename to Clients;

-- 4. Delete Queries
-- 1. Delete all inactive clients 
Delete from Clients
where Accountstatus = 'Inactive';

-- 2. Delete clients before 2018
Delete from Clients 
where RegistrationDate < '2018-01-01';

-- 3. Delete clients with specific position and city
Delete from Clients 
where position = 'HR'
and city = 'Seatle';

-- 4. Delete Clients whose company name containts Tech
Delete from Clients
where CompanyName LIKE '%Tech%';

-- 5. Delete clients with id greater than 15
DELETE FROM Clients
WHERE ClientID > 15;

-- 5. Update Queries
-- 1. Deactivate clients within IT indsutry
Update Clients
Set accountstatus = 'Inactive'
where BusinessSector = 'IT';

-- 2. Update contactperson to unknown where contactperson is Null
Update Clients
set ContactPerson = 'Unknown'
where ContactPerson IS NULL;
 
-- 3. Set city to San Francisco for clients whose registration is after 2020
Update Clients 
set Address = 'San Francisco' 
where registrationdate < '2020-01-01';

-- 4. Increase all active clients Registrationdate by 1 year
Update Clients 
set registrationdate = registrationdate + interval 1 year
where accountstatus = 'Active';

-- 5. update industry to consulting where companyname starts with 'A'
Update Clients 
set BusinessSector = 'Consulting'
where organizationname like 'A%';

-- Table 3: Projects
CREATE TABLE Projects (
ProjectID INT PRIMARY KEY,
ProjectName VARCHAR(100) NOT NULL,
ClientID INT,
StartDate DATE,
EndDate DATE,
Budget DECIMAL(12,2),
Status VARCHAR(20),
ProjectManagerName VARCHAR(50),  
Description TEXT,
Priority VARCHAR(10),
FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);

INSERT INTO Projects 
VALUES
(1, 'ERP Implementation', 1, '2021-04-10', '2022-12-31', 250000, 'In Progress', 'Tom Miller', 'Implementation', 'High'),
(2, 'Website Redesign', 2, '2020-03-15', '2020-09-15', 80000, 'Completed', 'Sara Davis', 'Development', 'Medium'),
(3, 'Mobile App Development', 3, '2019-05-01', '2020-02-28', 150000, 'Completed', 'Emma Wilson', 'Development', 'High'),
(4, 'Cloud Migration', 4, '2021-04-20', '2022-04-20', 300000, 'In Progress', 'John Doe', 'Implementation', 'High'),
(5, 'SEO Optimization', 5, '2018-11-10', '2019-05-10', 50000, 'Completed', 'Jane Smith', 'Marketing', 'Low'),
(6, 'CRM Integration', 6, '2020-07-05', '2021-03-05', 120000, 'Completed', 'Mike Brown', 'Development', 'Medium'),
(7, 'Data Analytics', 7, '2019-08-22', '2020-06-22', 200000, 'Completed', 'Alice Johnson', 'Analytics', 'High'),
(8, 'Security Upgrade', 8, '2021-02-18', '2021-12-18', 90000, 'In Progress', 'Chris Moore', 'Implementation', 'Medium'),
(9, 'Network Expansion', 9, '2018-10-11', '2019-09-11', 180000, 'Completed', 'Nancy Taylor', 'Infrastructure', 'Medium'),
(10, 'E-commerce Setup', 10, '2019-12-01', '2020-07-01', 140000, 'Completed', 'David Anderson', 'Development', 'High'),
(11, 'HR Portal Development', 11, '2020-06-10', '2021-01-10', 110000, 'Completed', 'Laura Thomas', 'Development', 'Medium'),
(12, 'Product Launch', 12, '2021-03-05', '2021-09-05', 130000, 'In Progress', 'Peter Jackson', 'Marketing', 'High'),
(13, 'Business Intelligence', 13, '2018-09-12', '2019-08-12', 175000, 'Completed', 'Sophia White', 'Analytics', 'Medium'),
(14, 'Software Upgrade', 14, '2019-07-19', '2020-05-19', 95000, 'Completed', 'Daniel Harris', 'Development', 'Low'),
(15, 'Training Program', 15, '2020-04-02', '2020-10-02', 60000, 'Completed', 'Grace Martin', 'Training', 'Low'),
(16, 'API Development', 16, '2019-11-08', '2020-08-08', 105000, 'Completed', 'Henry Lee', 'Development', 'Medium'),
(17, 'Data Center Setup', 17, '2018-03-25', '2019-03-25', 220000, 'Completed', 'Olivia Walker', 'Infrastructure', 'High'),
(18, 'Chatbot Implementation', 18, '2021-05-12', '2022-01-12', 95000, 'In Progress', 'Paul Hall', 'Development', 'Medium'),
(19, 'Social Media Campaign', 19, '2019-06-15', '2019-12-15', 70000, 'Completed', 'Mia Allen', 'Marketing', 'Low'),
(20, 'Blockchain Pilot', 20, '2020-09-01', '2021-06-01', 160000, 'Completed', 'John Doe', 'Development', 'High');

-- to display records
select * from Projects;

-- to remove records from the table
truncate table Projects;

-- to remove whole table from databse
drop table Projects;

-- SELECT QUERIES

-- 1. select high priority projects
select * from projects where priority = 'high';

-- 2. select completed projects with budget more than 100000
select projectname, budget from projects where status = 'completed' and budget > 100000;

-- 3. select projects that started after 2020
select projectid, projectname, startdate from projects where startdate > '2020-01-01';

-- 4. select distinct project managers
select distinct projectmanagername from projects;

-- 5. select projects ordered by budget in descending order
select projectname, budget from projects order by budget desc;


-- ALTER QUERIES
-- 1. add a new column 'delivery_mode' to specify online/offline
alter table projects 
add delivery_mode varchar(20);

-- 2. modify 'priority' column to accept only specific values
alter table projects
modify priority enum('low','medium','high','critical');

-- 3. add a check constraint for budget to be more than 30000
alter table projects 
add constraint chk_budget check (budget > 30000);

-- 4. change data type of 'description' to varchar(255)
alter table projects 
modify description varchar(255);

-- 5. add a default value to 'status' column
alter table projects 
alter column status set default 'in progress';


-- RENAME QUERIES

-- 1. rename column 'projectmanagername' to 'manager_name'
alter table projects 
rename column projectmanagername to manager_name;

-- 2. rename column 'budget' to 'project_budget' (due to check constraint this cannot be changed)
alter table projects 
rename column budget to project_budget;

-- 3. rename table 'projects' to 'client_projects'
rename table projects to client_projects;

-- 4. rename column 'priority' to 'urgency_level'
alter table client_projects
rename column priority to urgency_level;

-- 5. rename column 'status' to 'project_status'
alter table client_projects 
rename column status to project_status;

-- DELETE QUERIES

-- 1. delete projects with budget less than 60000
delete from client_projects 
where project_budget < 60000;

-- 2. delete projects that are marked 'completed' and ended before 2019
delete from client_projects 
where project_status = 'completed' and enddate < '2019-01-01';

-- 3. delete project where projectid is 15
delete from client_projects 
where projectid = 15;

-- 4. delete projects with urgency_level = 'low'
delete from client_projects 
where urgency_level = 'low';

-- 5. delete all projects with delivery_mode = 'offline'
delete from client_projects 
where delivery_mode = 'offline';

-- UPDATE QUERIES (based on ALTER changes)

-- 1. update delivery_mode to 'online' for all ongoing projects
update client_projects 
set delivery_mode = 'online' 
where project_status = 'in progress';

-- 2. update urgency_level to 'critical' for projects with budget above 200000
update client_projects 
set urgency_level = 'critical' 
where budget > 200000;

-- 3. update project_status to 'completed' for all projects ending before 2021
update client_projects 
set project_status = 'completed' 
where enddate < '2021-01-01';

-- 4. update manager_name for project_id 1
update client_projects 
set manager_name = 'Tommy Miller' 
where projectid = 1;

-- 5. update description for projects where delivery_mode is 'online'
update client_projects 
set description = 'Delivered remotely using cloud platform' 
where delivery_mode = 'online';

-- Table 4: Departments
CREATE TABLE Departments (
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(50) NOT NULL,
ManagerID INT,
Location VARCHAR(50),
ExtensionNumber VARCHAR(10),
CreatedDate DATE,
Budget DECIMAL(10,2),
NumberOfEmployees INT,
Objectives TEXT,
Status VARCHAR(20) DEFAULT 'Active'
);

INSERT INTO Departments 
VALUES
(1, 'Consulting', 101, 'Mumbai', '1001', '2022-04-10', 2000000.00, 50, 'Provide expert business advice.', 'Active'),
(2, 'IT', 102, 'Bangalore', '1002', '2022-05-12', 1500000.00, 40, 'Maintain IT infrastructure.', 'Active'),
(3, 'HR', 103, 'Delhi', '1003', '2022-06-15', 1000000.00, 25, 'Manage human capital.', 'Active'),
(4, 'Finance', 104, 'Pune', '1004', '2022-07-01', 1800000.00, 30, 'Financial planning and auditing.', 'Active'),
(5, 'Legal', 105, 'Mumbai', '1005', '2022-08-05', 800000.00, 15, 'Handle legal compliance.', 'Active'),
(6, 'Marketing', 106, 'Kolkata', '1006', '2022-09-10', 1700000.00, 20, 'Marketing and branding.', 'Active'),
(7, 'Sales', 107, 'Chennai', '1007', '2022-10-12', 2200000.00, 45, 'Client acquisition.', 'Active'),
(8, 'R&D', 108, 'Hyderabad', '1008', '2022-11-15', 2500000.00, 35, 'Innovation and development.', 'Active'),
(9, 'Admin', 109, 'Mumbai', '1009', '2022-12-20', 900000.00, 10, 'Facility and admin support.', 'Active'),
(10, 'Operations', 110, 'Pune', '1010', '2023-01-10', 1900000.00, 28, 'Operational efficiency.', 'Active'),
(11, 'Customer Service', 111, 'Delhi', '1011', '2023-02-01', 1200000.00, 18, 'Client support services.', 'Active'),
(12, 'Logistics', 112, 'Gurgaon', '1012', '2023-03-05', 1600000.00, 22, 'Supply chain coordination.', 'Active'),
(13, 'Procurement', 113, 'Noida', '1013', '2023-04-10', 1100000.00, 12, 'Vendor sourcing.', 'Active'),
(14, 'Training', 114, 'Ahmedabad', '1014', '2023-05-01', 950000.00, 16, 'Employee skill development.', 'Active'),
(15, 'Quality Control', 115, 'Nagpur', '1015', '2023-06-01', 850000.00, 14, 'Ensure product quality.', 'Active'),
(16, 'Audit', 116, 'Lucknow', '1016', '2023-07-01', 780000.00, 9, 'Internal audits.', 'Active'),
(17, 'CSR', 117, 'Indore', '1017', '2023-08-01', 720000.00, 7, 'Corporate Social Responsibility.', 'Active'),
(18, 'Strategy', 118, 'Bhubaneshwar', '1018', '2023-09-01', 1950000.00, 13, 'Long-term planning.', 'Active'),
(19, 'Analytics', 119, 'Patna', '1019', '2023-10-01', 2100000.00, 19, 'Data insights and BI.', 'Active'),
(20, 'Compliance', 120, 'Chandigarh', '1020', '2023-11-01', 880000.00, 11, 'Regulatory alignment.', 'Active');

-- to display records
select * from Departments;

-- to remove records from the table
truncate table Departments;

-- to remove whole table from databse
drop table Departments;

-- 5 SELECT QUERIES

-- select all columns for departments in Mumbai
select * from departments where location = 'Mumbai';

-- select department names and budgets where budget is greater than 1,500,000
select departmentname, budget from departments where budget > 1500000;

-- select departments with more than 20 employees, ordered by number of employees descending
select departmentid, departmentname, numberofemployees from departments 
where numberofemployees > 20 order by numberofemployees desc;

-- select unique locations of departments
select distinct location from departments;

-- select departments created after July 1, 2023
select departmentid, departmentname, createddate from departments 
where createddate > '2023-07-01';

-- 5 ALTER QUERIES

-- add a new column for department phone number
alter table departments 
add column phonenumber varchar(15);

-- modify budget to allow higher precision
alter table departments 
modify budget decimal(15,2);

-- drop the objectives column
alter table departments 
drop column objectives;

-- change the default status to 'Pending'
alter table departments 
alter column status set default 'Pending';

-- add a constraint that budget must be greater than 500000 
alter table departments 
add constraint chk_budget check (budget > 500000.00);


-- 5 RENAME QUERIES

-- rename table from departments to company_departments
rename table departments to company_departments;

-- rename column departmentname to dept_name
alter table company_departments 
change departmentname dept_name varchar(50);

-- rename column location to dept_location
alter table company_departments 
change location dept_location varchar(50);

-- rename column budget to dept_budget
alter table company_departments 
change budget dept_budget decimal(15,2);

-- rename column status to dept_status
alter table company_departments 
change status dept_status varchar(20);

-- 5 DELETE QUERIES

-- delete department with ID 5
delete from company_departments 
where departmentid = 5;

-- delete all departments in Chennai
delete from company_departments 
where dept_location = 'Chennai';

-- delete departments with fewer than 10 employees
delete from company_departments 
where numberofemployees < 10;

-- delete departments with budget over 2 million
delete from company_departments 
where dept_budget > 2000000;

-- delete departments created before 2022-12-31
delete from company_departments 
where createddate < '2022-12-31';


-- 5 UPDATE QUERIES (based on ALTER changes above)

-- update phone number for department ID 1
update company_departments 
set phonenumber = '9876543210' 
where departmentid = 1;

-- update dept_budget for department ID 2
update company_departments 
set dept_budget = 2500000.00 
where departmentid = 2;

-- update dept_status to 'Pending' for department ID 3
update company_departments 
set dept_status = 'Pending' 
where departmentid = 3;

-- update dept_name for department ID 4
update company_departments 
set dept_name = 'Finance and Accounts' 
where departmentid = 4;

-- update dept_location for department ID 6
update company_departments 
set dept_location = 'Gurgaon' 
where departmentid = 6;

-- Table 5: Tasks 
CREATE TABLE Tasks (
TaskID INT PRIMARY KEY,
ProjectID INT,
AssignedTo INT,
TaskName VARCHAR(100),
Description TEXT,
StartDate DATE,
Deadline DATE,
Status VARCHAR(20),
Priority INT CHECK (Priority BETWEEN 1 AND 5),
HoursLogged DECIMAL(6,2),
FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
FOREIGN KEY (AssignedTo) REFERENCES Consultants(ConsultantID)
);

INSERT INTO Tasks 
VALUES
(1, 1, 1, 'Requirement Gathering', 'Collect business requirements.', '2023-01-01', '2023-01-05', 'Completed', 3, 10.0),
(2, 1, 2, 'Process Mapping', 'Create as-is and to-be flowcharts.', '2023-01-06', '2023-01-10', 'Completed', 4, 12.0),
(3, 1, 3, 'Gap Analysis', 'Identify business process gaps.', '2023-01-11', '2023-01-15', 'Completed', 4, 14.5),
(4, 1, 4, 'Stakeholder Meeting', 'Client meeting to discuss gaps.', '2023-01-16', '2023-01-16', 'Completed', 2, 6.5),
(5, 2, 5, 'Sprint Planning', 'Setup sprints with tech team.', '2023-02-01', '2023-02-03', 'Completed', 5, 7.0),
(6, 2, 6, 'Data Migration', 'Move legacy data.', '2023-02-04', '2023-02-10', 'In Progress', 5, 8.0),
(7, 2, 7, 'API Development', 'Develop RESTful APIs.', '2023-02-11', '2023-02-18', 'Pending', 5, 0.0),
(8, 3, 8, 'UAT Preparation', 'Prepare test cases.', '2023-03-01', '2023-03-05', 'Pending', 3, 0.0),
(9, 3, 9, 'UAT Execution', 'Execute test cases.', '2023-03-06', '2023-03-10', 'Pending', 4, 0.0),
(10, 3, 10, 'Bug Fixing', 'Resolve reported issues.', '2023-03-11', '2023-03-13', 'Pending', 4, 0.0),
(11, 3, 11, 'Final Demo', 'Client walk-through.', '2023-03-14', '2023-03-14', 'Pending', 2, 0.0),
(12, 4, 12, 'Documentation', 'Create project documents.', '2023-04-01', '2023-04-05', 'Pending', 3, 0.0),
(13, 4, 13, 'Training', 'Train client users.', '2023-04-06', '2023-04-10', 'Pending', 3, 0.0),
(14, 5, 14, 'Go Live Support', 'Provide live support.', '2023-05-01', '2023-05-10', 'Pending', 4, 0.0),
(15, 5, 15, 'Hypercare', 'Support post go-live.', '2023-05-11', '2023-05-20', 'Pending', 4, 0.0),
(16, 6, 16, 'Internal Audit', 'Conduct internal checks.', '2023-06-01', '2023-06-05', 'Pending', 3, 0.0),
(17, 6, 17, 'Process Optimization', 'Improve workflows.', '2023-06-06', '2023-06-10', 'Pending', 4, 0.0),
(18, 7, 18, 'Strategy Review', 'Evaluate long-term goals.', '2023-07-01', '2023-07-03', 'Pending', 5, 0.0),
(19, 8, 19, 'Client Survey', 'Collect feedback.', '2023-08-01', '2023-08-02', 'Pending', 2, 0.0),
(20, 8, 20, 'Quarterly Report', 'Generate Q2 report.', '2023-08-03', '2023-08-05', 'Pending', 3, 0.0);

-- to display records
select * from Tasks;

-- to remove records from the table
truncate table Tasks;

-- to remove whole table from databse
drop table Tasks;

-- Select Queries
-- select all tasks with priority 5
select * from tasks where priority = 5;

-- select task names and deadlines ordered by deadline descending
select taskname, deadline from tasks order by deadline desc;

-- select tasks assigned to consultants between id 5 and 10
select * from tasks where assignedto between 5 and 10;

-- select completed tasks with hours logged more than 5
select * from tasks where status = 'Completed' and hourslogged > 5;

-- select tasks grouped by status showing count
select status, count(*) as task_count from tasks group by status;

-- Alter Queries
-- add a column to track review status
alter table tasks 
add column reviewstatus varchar(20) default 'Pending';

-- modify hourslogged to allow 8 digits total
alter table tasks 
modify column hourslogged decimal(8,2);

-- add a constraint that deadline must be after startdate
alter table tasks 
add constraint chk_deadline check (deadline >= startdate);

-- drop the description column
alter table tasks drop column description;

-- change datatype of status to varchar(30)
alter table tasks 
modify column status varchar(30);


-- rename taskname to task_title
alter table tasks 
rename column taskname to task_title;

-- rename startdate to task_start_date
alter table tasks (no due check )
rename column startdate to task_start_date;

-- rename deadline to task_deadline
alter table tasks (no due check )
rename column deadline to task_deadline;

-- rename hourslogged to total_hours_logged
alter table tasks 
rename column hourslogged to total_hours_logged;

-- rename priority to task_priority
alter table tasks 
rename column priority to task_priority;

-- delete queries
-- delete tasks with status 'Pending' and priority 2
delete from tasks where status = 'Pending' and task_priority = 2;

-- delete tasks where total_hours_logged is zero
delete from tasks where total_hours_logged = 0;

-- delete tasks with reviewstatus 'Pending'
delete from tasks where reviewstatus = 'Pending';

-- delete tasks assigned to consultant id 20
delete from tasks where assignedto = 20;

-- delete tasks starting after '2023-06-01'
delete from tasks where task_start_date > '2023-06-01';

-- update Queries
-- update reviewstatus to 'Reviewed' where status is 'Completed'
update tasks 
set reviewstatus = 'Reviewed' 
where status = 'Completed';

-- update total_hours_logged to 5.5 where total_hours_logged is null
update tasks 
set total_hours_logged = 5.5 
where total_hours_logged is null;

-- update status to 'Overdue' where task_deadline < '2023-04-01'
update tasks 
set status = 'Overdue' 
where deadline < '2023-04-01';

Select * from Tasks;
-- update task_priority to 3 where task_priority = 4
update tasks 
set priority = 3 
where priority = 4;

-- update reviewstatus to 'In Review' for all remaining records
update tasks 
set reviewstatus = 'In Review';

-- Table 6: Timesheets
CREATE TABLE Timesheets (
TimesheetID INT PRIMARY KEY,
ConsultantID INT,
ProjectID INT,
Date DATE,
HoursWorked DECIMAL(5,2),
TaskID INT,
Status VARCHAR(20),
ApprovalDate DATE,
SubmittedDate DATE,
Notes TEXT,
FOREIGN KEY (ConsultantID) REFERENCES Consultants(ConsultantID),
FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
FOREIGN KEY (TaskID) REFERENCES Tasks(TaskID)
);

INSERT INTO Timesheets 
VALUES
(1, 1, 1, '2023-01-01', 2.5, 1, 'Approved', '2023-01-02', '2023-01-01', 'Initial scoping'),
(2, 2, 1, '2023-01-03', 3.0, 2, 'Approved', '2023-01-04', '2023-01-03', 'Flowcharts created'),
(3, 3, 1, '2023-01-05', 3.5, 3, 'Approved', '2023-01-06', '2023-01-05', 'Gap doc updated'),
(4, 4, 1, '2023-01-07', 2.0, 4, 'Approved', '2023-01-08', '2023-01-07', 'Meeting with CTO'),
(5, 5, 2, '2023-02-01', 4.0, 5, 'Approved', '2023-02-02', '2023-02-01', 'Sprint planning'),
(6, 6, 2, '2023-02-05', 5.0, 6, 'Approved', '2023-02-06', '2023-02-05', 'Data load success'),
(7, 7, 2, '2023-02-11', 0.0, 7, 'Pending', NULL, '2023-02-11', 'Work not started'),
(8, 8, 3, '2023-03-01', 1.5, 8, 'Approved', '2023-03-02', '2023-03-01', 'Test cases'),
(9, 9, 3, '2023-03-06', 2.0, 9, 'Approved', '2023-03-07', '2023-03-06', 'Executing tests'),
(10, 10, 3, '2023-03-11', 1.0, 10, 'Approved', '2023-03-12', '2023-03-11', 'Bug fixes'),
(11, 11, 3, '2023-03-14', 1.5, 11, 'Approved', '2023-03-15', '2023-03-14', 'Client demo'),
(12, 12, 4, '2023-04-01', 2.0, 12, 'Approved', '2023-04-02', '2023-04-01', 'Docs created'),
(13, 13, 4, '2023-04-06', 3.0, 13, 'Approved', '2023-04-07', '2023-04-06', 'Training'),
(14, 14, 5, '2023-05-01', 2.5, 14, 'Approved', '2023-05-02', '2023-05-01', 'Go live support'),
(15, 15, 5, '2023-05-11', 4.0, 15, 'Approved', '2023-05-12', '2023-05-11', 'Hypercare'),
(16, 16, 6, '2023-06-01', 1.5, 16, 'Approved', '2023-06-02', '2023-06-01', 'Audit phase 1'),
(17, 17, 6, '2023-06-06', 2.0, 17, 'Approved', '2023-06-07', '2023-06-06', 'Workflow update'),
(18, 18, 7, '2023-07-01', 3.5, 18, 'Approved', '2023-07-02', '2023-07-01', 'Strategy setup'),
(19, 19, 8, '2023-08-01', 1.0, 19, 'Approved', '2023-08-02', '2023-08-01', 'Survey round'),
(20, 20, 8, '2023-08-03', 2.5, 20, 'Approved', '2023-08-04', '2023-08-03', 'Report generation');

-- to display records
select * from Timesheets;

-- to remove records from the table
truncate table Timesheets;

-- to remove whole table from databse
drop table Timesheets;

-- SELECT queries

-- 1. Select all approved timesheets for Project 1
select * from timesheets 
where projectid = 1 and status = 'Approved';

-- 2. Select timesheets where hours worked are between 2 and 4
select timesheetid, consultantid, hoursworked from timesheets 
where hoursworked between 2 and 4;

-- 3. Select the total hours worked per consultant
select consultantid, sum(hoursworked) as total_hours from timesheets group by consultantid;

-- 4. Select notes containing the word 'support'
select timesheetid, notes from timesheets 
where notes like '%support%';

-- 5. Select top 3 timesheets with highest hours worked
select * from timesheets order by hoursworked desc limit 3;

-- ALTER queries

-- 1. Add a column to store billable flag
alter table timesheets 
add column is_billable boolean default true;

-- 2. Modify hoursworked to allow only positive values
alter table timesheets 
modify hoursworked decimal(5,2) check (hoursworked >= 0);

-- 3. Add a constraint to ensure status is either 'Approved', 'Pending', or 'Rejected'
alter table timesheets 
add constraint chk_status check (status in ('Approved', 'Pending', 'Rejected'));

-- 4. Drop the Notes column (simulate cleaning up table)
alter table timesheets drop column notes;

-- 5. Add a column for overtime hours
alter table timesheets 
add column overtime_hours decimal(4,2) default 0;

-- RENAME queries

-- 1. Rename column date to work_date
alter table timesheets 
rename column date to work_date;

-- 2. Rename column status to approval_status
alter table timesheets 
rename column status to approval_status;

-- 3. Rename column submitteddate to submission_date
alter table timesheets 
rename column submitteddate to submission_date;

-- 4. Rename column approvaldate to approved_on
alter table timesheets 
rename column approvaldate to approved_on;

-- 5. Rename column hoursworked to regular_hours
alter table timesheets 
rename column hoursworked to regular_hours;

-- DELETE queries

-- 1. Delete timesheets with zero hours
delete from timesheets 
where regular_hours = 0;

-- 2. Delete timesheets of consultant 20
delete from timesheets 
where consultantid = 20;

-- 3. Delete timesheets for Project 8
delete from timesheets 
where projectid = 8;

-- 4. Delete timesheets with work_date before '2023-02-01'
delete from timesheets 
where work_date < '2023-02-01';

-- 5. Delete timesheets where approval_status = 'Pending'
delete from timesheets 
where approval_status = 'Pending';

-- UPDATE queries (based on the ALTER changes)
Select * from timesheets;
-- 1. Update is_billable to false where regular_hours < 2
update timesheets 
set is_billable = false where hoursworked < 2;

-- 2. Update overtime_hours to 1.5 for consultant 6
update timesheets 
set overtime_hours = 1.5 where consultantid = 6;

-- 3. Update approval_status to 'Rejected' for regular_hours > 3 and <= 4
update timesheets 
set status = 'Rejected' 
where hoursworked > 3 and hoursworked <= 4;

-- 4. Update overtime_hours to 2.0 for all timesheets of Project 2
update timesheets 
set overtime_hours = 2.0 
where projectid = 2;

-- 5. Update approval_status to 'Approved' where overtime_hours > 0
update timesheets 
set status = 'Approved' 
where hoursworked > 0;

-- Table 7: Invoices
CREATE TABLE Invoices (
InvoiceID INT PRIMARY KEY,
ClientID INT,
ProjectID INT,
InvoiceDate DATE,
DueDate DATE,
Amount DECIMAL(10,2),
Tax DECIMAL(5,2),
TotalAmount DECIMAL(10,2),
PaidStatus VARCHAR(20),
PaymentDate DATE,
FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

INSERT INTO Invoices 
VALUES
(1, 1, 1, '2023-01-01', '2023-01-10', 50000.00, 18.00, 59000.00, 'Paid', '2023-01-05'),
(2, 2, 1, '2023-01-12', '2023-01-22', 30000.00, 18.00, 35400.00, 'Unpaid', NULL),
(3, 3, 2, '2023-02-01', '2023-02-10', 60000.00, 18.00, 70800.00, 'Paid', '2023-02-09'),
(4, 4, 3, '2023-02-15', '2023-02-25', 25000.00, 18.00, 29500.00, 'Unpaid', NULL),
(5, 5, 3, '2023-03-01', '2023-03-10', 45000.00, 18.00, 53100.00, 'Paid', '2023-03-05'),
(6, 6, 4, '2023-03-15', '2023-03-25', 70000.00, 18.00, 82600.00, 'Paid', '2023-03-20'),
(7, 7, 5, '2023-04-01', '2023-04-10', 48000.00, 18.00, 56640.00, 'Paid', '2023-04-08'),
(8, 8, 6, '2023-04-15', '2023-04-25', 53000.00, 18.00, 62540.00, 'Unpaid', NULL),
(9, 9, 7, '2023-05-01', '2023-05-10', 67000.00, 18.00, 79060.00, 'Paid', '2023-05-06'),
(10, 10, 8, '2023-05-15', '2023-05-25', 55000.00, 18.00, 64900.00, 'Unpaid', NULL),
(11, 11, 9, '2023-06-01', '2023-06-10', 72000.00, 18.00, 84960.00, 'Paid', '2023-06-08'),
(12, 12, 9, '2023-06-15', '2023-06-25', 62000.00, 18.00, 73160.00, 'Unpaid', NULL),
(13, 13, 10, '2023-07-01', '2023-07-10', 49000.00, 18.00, 57820.00, 'Paid', '2023-07-05'),
(14, 14, 10, '2023-07-15', '2023-07-25', 41000.00, 18.00, 48380.00, 'Paid', '2023-07-20'),
(15, 15, 11, '2023-08-01', '2023-08-10', 38000.00, 18.00, 44840.00, 'Unpaid', NULL),
(16, 16, 12, '2023-08-15', '2023-08-25', 56000.00, 18.00, 66080.00, 'Paid', '2023-08-18'),
(17, 17, 13, '2023-09-01', '2023-09-10', 75000.00, 18.00, 88500.00, 'Paid', '2023-09-06'),
(18, 18, 14, '2023-09-15', '2023-09-25', 47000.00, 18.00, 55460.00, 'Unpaid', NULL),
(19, 19, 15, '2023-10-01', '2023-10-10', 51000.00, 18.00, 60180.00, 'Paid', '2023-10-07'),
(20, 20, 16, '2023-10-15', '2023-10-25', 36000.00, 18.00, 42480.00, 'Paid', '2023-10-20');

-- to display records
select * from Invoices;

-- to remove records from the table
truncate table Invoices;

-- to remove whole table from databse
drop table Invoices;


-- select queries
-- select all invoices where the status is unpaid
select * from invoices 
where paidstatus = 'Unpaid';

-- select invoices with amount greater than 50000 and order by total amount descending
select * from invoices 
where amount > 50000 order by totalamount desc;

-- select clientid and total amount, group by clientid
select clientid, sum(totalamount) as total_billed from invoices group by clientid;

-- select invoices issued between two dates
select * from invoices 
where invoicedate between '2023-04-01' and '2023-08-31';

-- select the top 3 highest total amounts
select * from invoices order by totalamount desc limit 3;

--  alter queries
-- add a new column for discount
alter table invoices 
add column discount decimal(6,2) default 0.00;

-- modify tax column to allow null
alter table invoices 
modify column tax decimal(5,2) null;

-- add constraint to ensure total amount is positive
alter table invoices 
add constraint chk_total_positive check (totalamount >= 0);

-- drop the paymentdate column
alter table invoices drop column paymentdate;

-- change column paidstatus to be not null
alter table invoices 
modify column paidstatus varchar(20) not null;

-- rename queries
-- rename table invoices to invoice_records
rename table invoices to invoice_records;

-- rename column clientid to customer_id
alter table invoice_records 
change column clientid customer_id int;

-- rename column amount to base_amount
alter table invoice_records 
change column amount base_amount decimal(10,2);

-- rename column invoicedate to billing_date
alter table invoice_records 
change column invoicedate billing_date date;

-- rename column duedate to payment_due_date
alter table invoice_records 
change column duedate payment_due_date date;

-- delete queries
-- delete invoices where total amount is less than 45000
delete from invoice_records where totalamount < 45000;

-- delete invoices with status 'Unpaid' and base amount > 50000
delete from invoice_records where paidstatus = 'Unpaid' and base_amount > 50000;

-- delete top 2 oldest invoices by billing date
delete from invoice_records order by billing_date asc limit 2;

-- delete invoices for a specific customer_id
delete from invoice_records where customer_id = 4;

-- delete all invoices where tax is null
delete from invoice_records where tax is null;

-- update queries 
-- update discount for invoices over 70000 total
update invoice_records 
set discount = 500.00 
where totalamount > 70000;

-- update tax to null for unpaid invoices
update invoice_records 
set tax = null 
where paidstatus = 'Unpaid';

-- update base amount to 60000 where it was previously 55000
update invoice_records 
set base_amount = 60000.00 
where base_amount = 55000.00;

-- update paidstatus to 'Paid' for all invoices with discount applied
update invoice_records 
set paidstatus = 'Paid' 
where discount > 0;

-- update payment_due_date to extend deadline by 10 days
update invoice_records 
set payment_due_date = date_add(payment_due_date, interval 10 day);

-- Table 8: Payments
CREATE TABLE Payments (
PaymentID INT PRIMARY KEY,
InvoiceID INT,
PaymentDate DATE,
Amount DECIMAL(10,2),
PaymentMethod VARCHAR(20),
ReferenceNumber VARCHAR(50),
Status VARCHAR(20),
ReceivedBy VARCHAR(50),
Currency VARCHAR(10),
Notes TEXT,
FOREIGN KEY (InvoiceID) REFERENCES Invoices(InvoiceID)
);

INSERT INTO Payments 
VALUES
(1, 1, '2023-01-05', 59000.00, 'Bank Transfer', 'TXN001', 'Received', 'Ravi', 'INR', 'Initial payment'),
(2, 3, '2023-02-09', 70800.00, 'UPI', 'TXN002', 'Received', 'Anita', 'INR', 'Full invoice'),
(3, 5, '2023-03-05', 53100.00, 'Credit Card', 'TXN003', 'Received', 'Sohan', 'INR', 'Paid with card'),
(4, 6, '2023-03-20', 82600.00, 'Bank Transfer', 'TXN004', 'Received', 'Preeti', 'INR', 'Complete amount'),
(5, 7, '2023-04-08', 56640.00, 'UPI', 'TXN005', 'Received', 'Nisha', 'INR', 'No delay'),
(6, 9, '2023-05-06', 79060.00, 'NEFT', 'TXN006', 'Received', 'Raj', 'INR', 'Transferred'),
(7, 11, '2023-06-08', 84960.00, 'Bank Transfer', 'TXN007', 'Received', 'Megha', 'INR', 'Regular payment'),
(8, 13, '2023-07-05', 57820.00, 'Cheque', 'TXN008', 'Received', 'Neeraj', 'INR', 'Cleared'),
(9, 14, '2023-07-20', 48380.00, 'Bank Transfer', 'TXN009', 'Received', 'Dinesh', 'INR', 'Final'),
(10, 16, '2023-08-18', 66080.00, 'UPI', 'TXN010', 'Received', 'Shruti', 'INR', 'Settled'),
(11, 17, '2023-09-06', 88500.00, 'Bank Transfer', 'TXN011', 'Received', 'Kiran', 'INR', 'Complete'),
(12, 19, '2023-10-07', 60180.00, 'UPI', 'TXN012', 'Received', 'Kartik', 'INR', 'Paid full'),
(13, 20, '2023-10-20', 42480.00, 'Credit Card', 'TXN013', 'Received', 'Nikita', 'INR', 'Processed'),
(14, 2, NULL, 0.00, 'None', '', 'Pending', 'System', 'INR', 'Invoice unpaid'),
(15, 4, NULL, 0.00, 'None', '', 'Pending', 'System', 'INR', 'Invoice unpaid'),
(16, 8, NULL, 0.00, 'None', '', 'Pending', 'System', 'INR', 'Awaiting payment'),
(17, 10, NULL, 0.00, 'None', '', 'Pending', 'System', 'INR', 'Outstanding'),
(18, 12, NULL, 0.00, 'None', '', 'Pending', 'System', 'INR', 'Pending confirmation'),
(19, 15, NULL, 0.00, 'None', '', 'Pending', 'System', 'INR', 'Will follow up'),
(20, 18, NULL, 0.00, 'None', '', 'Pending', 'System', 'INR', 'Client delayed');


-- to display records
select * from Payments;

-- to remove records from the table
truncate table Payments;

-- to remove whole table from databse
drop table Payments;

-- SELECT QUERIES

-- 1. select all payments done via bank transfer
select * from payments 
where paymentmethod = 'Bank Transfer';

-- 2. select payments greater than 80000 ordered by amount descending
select * from payments 
where amount > 80000 order by amount desc;

-- 3. select distinct currencies used
select distinct currency from payments;

-- 4. select payments with status 'Pending' and limit 3
select * from payments 
where status = 'Pending' limit 3;

-- 5. select payments received between specific dates
select * from payments 
where paymentdate between '2023-05-01' and '2023-09-30';

-- ALTER QUERIES

-- 1. add column discount with default 0.00
alter table payments 
add column discount decimal(10,2) not null default 0.00;

-- 2. modify notes column to be varchar(255)
alter table payments 
modify notes varchar(255);

-- 3. add unique constraint on reference number
alter table payments 
add constraint unique_reference unique (referencenumber);

-- 4. add column exchange_rate decimal(5,2)
alter table payments 
add column exchange_rate decimal(5,2);

-- 5. add column is_verified tinyint default 0
alter table payments 
add column is_verified tinyint(1) not null default 0;

-- RENAME QUERIES

-- 1. rename table payments to payment_records
rename table payments to payment_records;

-- 2. rename column amount to payment_amount
alter table payment_records 
change amount payment_amount decimal(10,2);

-- 3. rename column status to payment_status
alter table payment_records 
change status payment_status varchar(20);

-- 4. rename column paymentmethod to method
alter table payment_records 
change paymentmethod method varchar(20);

-- 5. rename column receivedby to received_by
alter table payment_records 
change receivedby received_by varchar(50);

-- DELETE QUERIES

-- 1. delete payments with payment amount = 0
delete from payment_records 
where payment_amount = 0.00;

-- 2. delete payments with payment_status = 'Pending'
delete from payment_records 
where payment_status = 'Pending';

-- 3. delete records where method = 'Cheque'
delete from payment_records 
where method = 'Cheque';

-- 4. delete payments where exchange_rate is null
delete from payment_records 
where exchange_rate is null;

-- 5. delete payments where currency = 'INR' and discount = 0.00
delete from payment_records 
where currency = 'INR' and discount = 0.00;

-- UPDATE QUERIES (based on the ALTER changes)

-- 1. update exchange_rate for bank transfers
update payment_records 
set exchange_rate = 1.00 
where method = 'Bank Transfer';

-- 2. update discount to 500 for payments above 80000
update payment_records
 set discount = 500.00 
 where payment_amount > 80000;

-- 3. update is_verified to 1 for payments received by 'Kiran'
update payment_records
set is_verified = 1 
where received_by = 'Kiran';

-- 4. update payment_status to 'Confirmed' where exchange_rate = 1.00
update payment_records 
set payment_status = 'Confirmed' 
where exchange_rate = 1.00;

-- 5. update notes to 'Updated record' where discount = 500.00
update payment_records 
set notes = 'Updated record' 
where discount = 500.00;


-- Table 9: Appointments
CREATE TABLE Appointments (
AppointmentID INT PRIMARY KEY,
ClientID INT,
ConsultantID INT,
AppointmentDate DATE,
StartTime TIME,
EndTime TIME,
Location VARCHAR(100),
Purpose VARCHAR(100),
Status VARCHAR(20),
Notes TEXT,
FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
FOREIGN KEY (ConsultantID) REFERENCES Consultants(ConsultantID)
);

INSERT INTO Appointments 
VALUES
(1, 1, 1, '2023-01-10', '10:00:00', '10:30:00', 'Mumbai HQ', 'Kickoff Meeting', 'Completed', 'All good'),
(2, 2, 2, '2023-01-15', '11:00:00', '11:45:00', 'Delhi', 'Gap Analysis', 'Completed', ''),
(3, 3, 3, '2023-01-20', '12:00:00', '12:30:00', 'Virtual', 'Stakeholder Sync', 'Completed', ''),
(4, 4, 4, '2023-01-25', '13:00:00', '13:45:00', 'Kolkata', 'Project Brief', 'Completed', ''),
(5, 5, 5, '2023-02-01', '14:00:00', '14:30:00', 'Virtual', 'Sprint Review', 'Completed', ''),
(6, 6, 6, '2023-02-05', '10:30:00', '11:00:00', 'Client Site', 'API Discussion', 'Completed', ''),
(7, 7, 7, '2023-02-10', '11:30:00', '12:00:00', 'Virtual', 'Planning Meeting', 'Completed', ''),
(8, 8, 8, '2023-02-15', '15:00:00', '15:45:00', 'Client Office', 'Demo', 'Completed', ''),
(9, 9, 9, '2023-02-20', '16:00:00', '16:30:00', 'Pune', 'Training', 'Scheduled', ''),
(10, 10, 10, '2023-03-01', '09:30:00', '10:00:00', 'Virtual', 'Retrospective', 'Scheduled', ''),
(11, 11, 11, '2023-03-05', '10:00:00', '10:45:00', 'Mumbai', 'Feedback Review', 'Scheduled', ''),
(12, 12, 12, '2023-03-10', '11:00:00', '11:30:00', 'Online', 'Final Review', 'Scheduled', ''),
(13, 13, 13, '2023-03-15', '13:00:00', '13:30:00', 'Hyderabad', 'Closure Meeting', 'Scheduled', ''),
(14, 14, 14, '2023-03-20', '14:00:00', '14:30:00', 'Virtual', 'Project Renewal', 'Scheduled', ''),
(15, 15, 15, '2023-03-25', '15:00:00', '15:45:00', 'Bangalore', 'Phase II Discussion', 'Scheduled', ''),
(16, 16, 16, '2023-04-01', '16:00:00', '16:30:00', 'Chennai', 'Business Roadmap', 'Scheduled', ''),
(17, 17, 17, '2023-04-05', '10:00:00', '10:30:00', 'Virtual', 'QBR Planning', 'Scheduled', ''),
(18, 18, 18, '2023-04-10', '11:00:00', '11:45:00', 'Online', 'Board Meeting', 'Scheduled', ''),
(19, 19, 19, '2023-04-15', '12:00:00', '12:30:00', 'Kolkata', 'Marketing Sync', 'Scheduled', ''),
(20, 20, 20, '2023-04-20', '13:00:00', '13:45:00', 'Mumbai', 'Budget Review', 'Scheduled', '');

-- to display records
select * from Appointments;

-- to remove records from the table
truncate table Appointments;

-- to remove whole table from databse
drop table Appointments;

-- select queries

-- 1. select all appointments scheduled in March 2023
select * from appointments 
where appointmentdate between '2023-03-01' and '2023-03-31';

-- 2. select appointments that are still scheduled
select appointmentid, status from appointments 
where status = 'Scheduled';

-- 3. select appointments held virtually
select appointmentid, location from appointments 
where location = 'Virtual';

-- 4. select top 5 appointments by earliest date
select * from appointments 
order by appointmentdate asc 
limit 5;

-- 5. select appointments with notes not empty
select appointmentid, notes from appointments 
where notes is not null and notes <> '';

-- alter queries

-- 1. add a column to track duration in minutes
alter table appointments 
add column duration_minutes int;

-- 2. modify status column to increase its length
alter table appointments 
modify column status varchar(30);

-- 3. add a unique constraint 
alter table appointments 
add constraint unique_client_date unique(clientid, appointmentdate);

-- 4. add default value for notes column
alter table appointments 
modify column notes varchar(200) default 'No remarks';

-- 5. drop the purpose column
alter table appointments 
drop column purpose;

-- rename queries

-- 1. rename table appointments to client_appointments
rename table appointments to client_appointments;

-- 2. rename column location to meeting_location
alter table client_appointments 
rename column location to meeting_location;

-- 3. rename column status to appointment_status
alter table client_appointments 
rename column status to appointment_status;

-- 4. rename column notes to remarks
alter table client_appointments 
rename column notes to remarks;

-- 5. rename column duration_minutes to duration_min
alter table client_appointments 
rename column duration_minutes to duration_min;

-- delete queries

-- 1. delete all appointments in February 2023
delete from client_appointments 
where appointmentdate between '2023-02-01' and '2023-02-28';

-- 2. delete appointments with status Completed
delete from client_appointments 
where appointment_status = 'Completed';

-- 3. delete appointments with null remarks
delete from client_appointments 
where remarks is null;

-- 4. delete appointments where meeting_location = 'Online'
delete from client_appointments 
where meeting_location = 'Online';

-- 5. delete appointments scheduled after April 15, 2023
delete from client_appointments 
where appointmentdate > '2023-04-15';

-- update queries (based on alter changes)

-- 1. set duration_min for remaining appointments
update client_appointments 
set duration_min = timestampdiff(minute, starttime, endtime);

-- 2. update appointment_status to 'Closed' where appointmentdate < '2023-03-01'
update client_appointments 
set appointment_status = 'Closed' 
where appointmentdate < '2023-03-01';

-- 3. update meeting_location to 'Head Office' where meeting_location = 'Mumbai'
update client_appointments 
set meeting_location = 'Head Office' 
where meeting_location = 'Mumbai';

-- 4. update remarks to 'Updated by system' where remarks = 'No remarks'
update client_appointments 
set remarks = 'Updated by system' 
where remarks = 'No remarks';

-- 5. update appointment_status to 'Follow-up' where duration_min > 40
update client_appointments 
set appointment_status = 'Follow-up' 
where duration_min > 40;

-- Table 10: Feedback 
CREATE TABLE Feedback (
FeedbackID INT PRIMARY KEY,
ClientID INT,
ProjectID INT,
SubmittedDate DATE,
Rating INT CHECK (Rating BETWEEN 1 AND 5),
Comments TEXT,
ResolvedStatus VARCHAR(20),
ConsultantID INT,
ResponseDate DATE,
ActionTaken TEXT,
FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

INSERT INTO Feedback VALUES
(1, 1, 1, '2023-01-10', 4, 'Great experience overall.', 'Resolved', 101, '2023-01-12', 'Follow-up call done'),
(2, 2, 2, '2023-01-15', 3, 'Some delays in delivery.', 'Resolved', 102, '2023-01-17', 'Timeline adjusted'),
(3, 3, 3, '2023-01-20', 5, 'Excellent work and communication.', 'Resolved', 103, '2023-01-22', 'Appreciated'),
(4, 4, 4, '2023-01-25', 2, 'Technical bugs were frequent.', 'Unresolved', 104, NULL, 'Pending tech fix'),
(5, 5, 5, '2023-02-01', 4, 'Professional and responsive.', 'Resolved', 105, '2023-02-03', 'Positive response'),
(6, 6, 6, '2023-02-05', 3, 'Need better reporting.', 'Resolved', 106, '2023-02-07', 'Format revised'),
(7, 7, 7, '2023-02-10', 1, 'Very poor support.', 'Unresolved', 107, NULL, 'Escalated'),
(8, 8, 8, '2023-02-15', 5, 'Delivered before deadline.', 'Resolved', 108, '2023-02-17', 'Client happy'),
(9, 9, 9, '2023-02-20', 4, 'Minor issues resolved fast.', 'Resolved', 109, '2023-02-22', 'Good job'),
(10, 10, 10, '2023-03-01', 2, 'Training was not useful.', 'Unresolved', 110, NULL, 'New session planned'),
(11, 11, 11, '2023-03-05', 5, 'Best consulting team.', 'Resolved', 111, '2023-03-07', 'Noted and filed'),
(12, 12, 12, '2023-03-10', 3, 'Satisfactory output.', 'Resolved', 112, '2023-03-12', 'Accepted'),
(13, 13, 13, '2023-03-15', 4, 'Smooth collaboration.', 'Resolved', 113, '2023-03-17', 'Mentioned in report'),
(14, 14, 14, '2023-03-20', 5, 'Quick response always.', 'Resolved', 114, '2023-03-22', 'Saved as best case'),
(15, 15, 15, '2023-03-25', 2, 'Miscommunication happened.', 'Resolved', 115, '2023-03-27', 'Clarified'),
(16, 16, 16, '2023-04-01', 4, 'Well structured project.', 'Resolved', 116, '2023-04-03', 'Good flow'),
(17, 17, 17, '2023-04-05', 1, 'Unacceptable delay.', 'Unresolved', 117, NULL, 'Under review'),
(18, 18, 18, '2023-04-10', 3, 'Documentation could improve.', 'Resolved', 118, '2023-04-12', 'Better template shared'),
(19, 19, 19, '2023-04-15', 5, 'Amazing coordination.', 'Resolved', 119, '2023-04-17', 'Great remarks'),
(20, 20, 20, '2023-04-20', 4, 'Very satisfied.', 'Resolved', 120, '2023-04-22', 'Filed under success');

-- to display records
select * from Feedback;

-- to remove records from the table
truncate table Feedback;

-- to remove whole table from databse
drop table Feedback;

-- SELECT queries 
-- 1. Select all feedback with rating >=4
select * from feedback where rating >=4;

-- 2. Select feedback with unresolved status ordered by submitted date
select feedbackid, clientid, submitteddate from feedback 
where resolvedstatus = 'Unresolved' order by submitteddate asc;

-- 3. Select top 5 highest ratings
select * from feedback order by rating desc limit 5;

-- 4. Select feedback with comments containing 'delay'
select feedbackid, comments from feedback where comments like '%delay%';

-- 5. Select feedback grouped by resolved status showing count
select resolvedstatus, count(*) as total_feedback from feedback group by resolvedstatus;

--  ALTER queries 
-- 1. Add a new column FeedbackType
alter table feedback 
add column feedbacktype varchar(30) default 'General';

-- 2. Modify ActionTaken column to be NOT NULL
alter table feedback modify actiontaken text not null;

-- 3. Add a unique constraint on FeedbackID and ProjectID combination
alter table feedback 
add constraint unique_feedback_project unique(feedbackid, projectid);

-- 4. Add a check constraint to ensure ConsultantID is greater than 0
alter table feedback 
add constraint chk_consultantid check (consultantid > 0);

-- 5. Add a new column PriorityLevel
alter table feedback 
add column prioritylevel varchar(10);

-- 5 RENAME queries
-- 1. Rename column Comments to FeedbackComments
alter table feedback 
change comments feedbackcomments text;

-- 2. Rename column Rating to FeedbackRating
alter table feedback 
change rating feedbackrating int;

-- 3. Rename column ResolvedStatus to Status
alter table feedback 
change resolvedstatus status varchar(20);

-- 4. Rename table Feedback to ClientFeedback
rename table feedback to clientfeedback;

-- 5. Rename column SubmittedDate to DateSubmitted
alter table clientfeedback
change submitteddate datesubmitted date;

--  DELETE queries 
-- 1. Delete feedback with FeedbackRating=1
delete from clientfeedback where feedbackrating=1;

-- 2. Delete feedback submitted before 2023-02-01
delete from clientfeedback where datesubmitted < '2023-02-01';

-- 3. Delete feedback with Status='Resolved' and FeedbackRating=2
delete from clientfeedback where status='Resolved' and feedbackrating=2;

-- 4. Delete feedback where FeedbackComments like '%bugs%'
delete from clientfeedback where feedbackcomments like '%bugs%';

-- 5. Delete feedback where PriorityLevel is null
delete from clientfeedback where prioritylevel is null;

select * from clientfeedback;
-- 5 UPDATE queries (based on ALTER changes)
-- 1. Update FeedbackType to 'Complaint' 
update clientfeedback 
set feedbacktype='Complaint'; 

-- 2. Update ActionTaken to 'Pending action recorded' where Status='Unresolved'
update clientfeedback 
set actiontaken='Pending action recorded' 
where status='Unresolved';

-- 3. Update PriorityLevel to 'High' where FeedbackRating=5
update clientfeedback 
set prioritylevel='High' 
where rating=5;


-- 4. Update FeedbackComments to 'Escalated due to delay' where FeedbackComments like '%delay%'
update clientfeedback 
set feedbackcomments='Escalated due to delay' 
where feedbackcomments like '%delay%';

-- 5. Update Status to 'Closed' where FeedbackType='Complaint'
update clientfeedback 
set status='Closed' 
where feedbacktype='Complaint';

-- Table 11: Reports 
CREATE TABLE Reports (
ReportID INT PRIMARY KEY,
ProjectID INT,
CreatedBy INT,
CreatedDate DATE,
Title VARCHAR(100),
Description TEXT,
Status VARCHAR(20),
ReviewedBy INT,
ReviewDate DATE,
FilePath VARCHAR(200),
FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
FOREIGN KEY (CreatedBy) REFERENCES Consultants(ConsultantID),
FOREIGN KEY (ReviewedBy) REFERENCES Consultants(ConsultantID)
);

INSERT INTO Reports 
VALUES
(21, 1, 1, '2023-01-05', 'Initial Assessment', 'Project goals and timelines.', 'Finalized', 2, '2023-01-06', '/docs/rep21.pdf'),
(22, 2, 3, '2023-01-10', 'Gap Analysis', 'Process gaps identified.', 'Finalized', 4, '2023-01-11', '/docs/rep22.pdf'),
(23, 3, 5, '2023-01-15', 'UAT Results', 'Test outcomes and bugs.', 'Pending', NULL, NULL, '/docs/rep23.pdf'),
(24, 4, 6, '2023-01-20', 'Client Feedback Summary', 'Compiled responses.', 'Finalized', 7, '2023-01-21', '/docs/rep24.pdf'),
(25, 5, 8, '2023-02-01', 'Deployment Plan', 'Go live activities.', 'Draft', NULL, NULL, '/docs/rep25.pdf'),
(26, 6, 9, '2023-02-10', 'Sprint Review', 'Completed features list.', 'Finalized', 10, '2023-02-11', '/docs/rep26.pdf'),
(27, 7, 11, '2023-02-15', 'Issue Log', 'Bug tracking report.', 'Finalized', 12, '2023-02-16', '/docs/rep27.pdf'),
(28, 8, 13, '2023-02-20', 'Training Recap', 'Session summaries.', 'Draft', NULL, NULL, '/docs/rep28.pdf'),
(29, 9, 14, '2023-03-01', 'Audit Findings', 'Compliance issues.', 'Finalized', 15, '2023-03-02', '/docs/rep29.pdf'),
(30, 10, 16, '2023-03-05', 'Risk Matrix', 'High and low risk factors.', 'Finalized', 17, '2023-03-06', '/docs/rep30.pdf'),
(31, 11, 18, '2023-03-10', 'Budget Overview', 'Expenditure breakdown.', 'Finalized', 19, '2023-03-11', '/docs/rep31.pdf'),
(32, 12, 20, '2023-03-15', 'Executive Summary', 'Overview for C-level.', 'Finalized', 1, '2023-03-16', '/docs/rep32.pdf'),
(33, 13, 2, '2023-03-20', 'ROI Report', 'Returns analysis.', 'Finalized', 3, '2023-03-21', '/docs/rep33.pdf'),
(34, 14, 4, '2023-03-25', 'Follow-up Notes', 'Feedback actions.', 'Draft', NULL, NULL, '/docs/rep34.pdf'),
(35, 15, 5, '2023-04-01', 'Meeting Minutes', 'Key points from discussions.', 'Finalized', 6, '2023-04-02', '/docs/rep35.pdf'),
(36, 16, 7, '2023-04-05', 'Compliance Check', 'Regulatory checklist.', 'Finalized', 8, '2023-04-06', '/docs/rep36.pdf'),
(37, 17, 9, '2023-04-10', 'SOW', 'Scope of Work report.', 'Finalized', 10, '2023-04-11', '/docs/rep37.pdf'),
(38, 18, 11, '2023-04-15', 'User Manual', 'How-to guide.', 'Pending', NULL, NULL, '/docs/rep38.pdf'),
(39, 19, 12, '2023-04-20', 'Performance Metrics', 'KPIs tracked.', 'Finalized', 13, '2023-04-21', '/docs/rep39.pdf'),
(40, 20, 14, '2023-04-25', 'End Project Summary', 'Final closure report.', 'Finalized', 15, '2023-04-26', '/docs/rep40.pdf');

-- to display records
select * from Reports;

-- to remove records from the table
truncate table Reports;

-- to remove whole table from databse
drop table Reports;

-- SELECT QUERIES

-- 1. Select all finalized reports
select * from reports 
where status = 'Finalized';

-- 2. Select reports created in March 2023
select reportid, title, createddate from reports 
where month(createddate) = 3 and year(createddate) = 2023;

-- 3. Select reports with no reviewer assigned
select reportid, title from reports 
where reviewedby is null;

-- 4. Select reports where the description mentions 'compliance'
select * from reports 
where description like '%compliance%';

-- 5. Select reports ordered by CreatedDate descending
select reportid, title, createddate from reports order by createddate desc;

-- ALTER QUERIES

-- 1. Add a priority column
alter table reports 
add column priority varchar(10) default 'Medium';

-- 2. Modify Title length to 150 characters
alter table reports 
modify column title varchar(150);

-- 3. Add a unique constraint on FilePath
alter table reports 
add constraint unique_filepath unique (filepath);

-- 4. Change Status column to ENUM for better control
alter table reports 
modify column status enum('Draft', 'Pending', 'Finalized');

-- 5. Add a column to track last updated date
alter table reports 
add column lastupdated date;

--  RENAME COLUMN QUERIES
-- 1. Rename CreatedDate to DateCreated
alter table reports 
rename column createddate to datecreated;

-- 2. Rename ReviewedBy to ReviewerID
alter table reports 
rename column reviewedby to reviewerid;

-- 3. Rename ReviewDate to DateReviewed
alter table reports
rename column reviewdate to datereviewed;

-- 4. Rename FilePath to DocumentPath
alter table reports 
rename column filepath to documentpath;

-- 5. Rename Description to ReportDetails
alter table reports 
rename column description to reportdetails;

-- DELETE QUERIES

-- 1. Delete reports in Draft status
delete from reports where status = 'Draft';

-- 2. Delete reports created before February 2023
delete from reports where datecreated < '2023-02-01';

-- 3. Delete reports with 'Pending' status
delete from reports where status = 'Pending';

-- 4. Delete reports reviewed by consultant with ID = 15
delete from reports where reviewerid = 15;

-- 5. Delete reports where title contains 'Issue'
delete from reports where title like '%Issue%';

--  UPDATE QUERIES 

-- 1. Update priority to 'High' for finalized reports
update reports 
set priority = 'High' 
where status = 'Finalized';

-- 2. Update lastupdated to today for all reports
update reports 
set lastupdated = curdate();

-- 3. Update status to 'Draft' where it was 'Pending' before ENUM modification
update reports 
set status = 'Draft' 
where status = 'Pending';

-- 4. Update reportdetails to append note about compliance
update reports 
set reportdetails = concat(reportdetails, ' Note: Compliance verified.')
 where reportdetails like '%compliance%';

-- 5. Update documentpath to a new folder location
update reports 
set documentpath = replace(documentpath, '/docs/', '/repository/docs/');

-- table 12: Resources 	
CREATE TABLE Resources (
ResourceID INT PRIMARY KEY,
ResourceName VARCHAR(100),
Type VARCHAR(50),
Quantity INT,
Location VARCHAR(50),
PurchaseDate DATE,
Conditions VARCHAR(20),
Status VARCHAR(20),
AssignedTo INT,
Notes TEXT,
FOREIGN KEY (AssignedTo) REFERENCES Consultants(ConsultantID)
);

INSERT INTO Resources VALUES
(1, 'Laptop', 'Electronics', 5, 'Mumbai', '2022-12-01', 'Good', 'In Use', 1, 'Dell XPS models'),
(2, 'Whiteboard', 'Stationery', 2, 'Delhi', '2023-01-05', 'New', 'Available', 2, 'With markers'),
(3, 'Projector', 'Electronics', 1, 'Pune', '2023-01-10', 'Fair', 'In Use', 3, 'Ceiling mounted'),
(4, 'Chairs', 'Furniture', 10, 'Kolkata', '2023-01-15', 'Good', 'In Use', 4, 'Ergonomic'),
(5, 'Servers', 'Electronics', 3, 'Mumbai', '2023-01-20', 'Excellent', 'In Use', 5, 'Rack-mounted'),
(6, 'Laptops', 'Electronics', 15, 'Delhi', '2023-01-25', 'Good', 'In Use', 6, 'Mixed brands'),
(7, 'Books', 'Library', 20, 'Pune', '2023-02-01', 'New', 'Available', 7, 'Strategy & Ops'),
(8, 'Printer', 'Electronics', 2, 'Mumbai', '2023-02-05', 'Good', 'In Use', 8, 'Color + B/W'),
(9, 'Desks', 'Furniture', 6, 'Chennai', '2023-02-10', 'Fair', 'In Use', 9, 'Steel-frame'),
(10, 'CCTV', 'Security', 4, 'Hyderabad', '2023-02-15', 'Excellent', 'In Use', 10, 'Monitored live'),
(11, 'Phone Lines', 'Communication', 10, 'Mumbai', '2023-02-20', 'Good', 'In Use', 11, 'VoIP'),
(12, 'Cables', 'Electronics', 100, 'Bangalore', '2023-02-25', 'New', 'Available', 12, 'Ethernet CAT-6'),
(13, 'Whiteboard Markers', 'Stationery', 50, 'Delhi', '2023-03-01', 'Good', 'Available', 13, 'Dry erase'),
(14, 'UPS Systems', 'Power', 5, 'Noida', '2023-03-05', 'Good', 'In Use', 14, 'APC backup'),
(15, 'Modems', 'Communication', 3, 'Ahmedabad', '2023-03-10', 'Fair', 'In Use', 15, 'WiFi enabled'),
(16, 'Coffee Machine', 'Appliance', 1, 'Mumbai', '2023-03-15', 'Excellent', 'In Use', 16, 'Bean grinder'),
(17, 'AC Units', 'Appliance', 5, 'Lucknow', '2023-03-20', 'Good', 'In Use', 17, 'Daikin'),
(18, 'Water Purifier', 'Appliance', 1, 'Chandigarh', '2023-03-25', 'New', 'In Use', 18, 'RO + UV'),
(19, 'Speakers', 'Audio', 2, 'Indore', '2023-04-01', 'Good', 'In Use', 19, 'Bluetooth'),
(20, 'HDMI Cables', 'Electronics', 10, 'Bhubaneshwar', '2023-04-05', 'New', 'Available', 20, '2-meter length');

-- to display records
select * from Resources;

-- to remove records from the table
truncate table Resources;

-- to remove whole table from databse
drop table Resources;

-- SELECT QUERIES
-- 1. select all resources located in mumbai
select * from resources 
where location = 'Mumbai';

-- 2. select resource name and quantity for electronics type resources
select resourcename, quantity from resources 
where type = 'Electronics';

-- 3. select all resources purchased after february 1, 2023
select * from resources 
where purchasedate > '2023-02-01';

-- 4. select distinct types of resources assigned to consultant id 5 or 6
select distinct type from resources 
where assignedto in (5,6);

-- 5. select resources where status is 'available' and quantity > 5
select * from resources 
where status = 'Available' and quantity > 5;


--  ALTER QUERIES

-- 1. add a new column for warranty expiry date
alter table resources 
add column warrantyexpiry date;

-- 2. modify conditions column to allow longer descriptions
alter table resources 
modify column conditions varchar(50);

-- 3. add a check constraint on quantity to be positive
alter table resources 
add constraint chk_quantity_positive check (quantity > 0);

-- 4. drop the notes column
alter table resources 
drop column notes;

-- 5. change column resourcename to resourcetitle
alter table resources 
change column resourcename resourcetitle varchar(100);


-- 5 RENAME QUERIES

-- 1. rename table resources to company_resources
rename table resources to company_resources;

-- 2. rename column type to resourcetype
alter table company_resources 
change column type resourcetype varchar(50);

-- 3. rename column status to resourcestatus
alter table company_resources 
change column status resourcestatus varchar(20);

-- 4. rename column location to storagelocation
alter table company_resources 
change column location storagelocation varchar(50);

-- 5. rename column assignedto to consultantid
alter table company_resources 
change column assignedto consultantid int;


--  DELETE QUERIES

-- 1. delete resources of type 'Appliance'
delete from company_resources 
where resourcetype = 'Appliance';

-- 2. delete resources purchased before january 1, 2023
delete from company_resources 
where purchasedate < '2023-01-01';

-- 3. delete resources with quantity less than 3
delete from company_resources 
where quantity < 3;

-- 4. delete resources assigned to consultant id 15
delete from company_resources 
where consultantid = 15;

-- 5. delete all records where resourcestatus is 'Available'
delete from company_resources 
where resourcestatus = 'Available';


-- UPDATE QUERIES 

-- 1. update warrantyexpiry for electronics purchased in 2023
update company_resources 
set warrantyexpiry = '2025-01-01' 
where resourcetype = 'Electronics' and year(purchasedate) = 2023;

-- 2. update conditions to 'Excellent' for all with quantity >=10
update company_resources 
set conditions = 'Excellent' 
where quantity >=10;

-- 3. update resourcestatus to 'Retired' for resources purchased before march 2023
update company_resources 
set resourcestatus = 'Retired' 
where purchasedate < '2023-03-01';

-- 4. update storagelocation to 'Main Warehouse' where consultantid is 1
update company_resources 
set storagelocation = 'Main Warehouse' 
where consultantid = 1;

-- 5. update resourcetitle to 'High Priority Equipment' for all servers
update company_resources 
set resourcetitle = 'High Priority Equipment' 
where resourcetitle like '%Server%';

-- Table 13: Assets
CREATE TABLE Assets (
AssetID INT PRIMARY KEY,
AssetName VARCHAR(100),
Type VARCHAR(50),
PurchaseDate DATE,
Value DECIMAL(10,2),
Status VARCHAR(20),
Location VARCHAR(50),
AssignedTo INT,
WarrantyExpiry DATE,
Notes TEXT,
FOREIGN KEY (AssignedTo) REFERENCES Consultants(ConsultantID)
);

INSERT INTO Assets VALUES
(1, 'Laptop A', 'Electronics', '2023-01-01', 75000.00, 'Assigned', 'Mumbai', 1, '2025-01-01', 'In use by analyst'),
(2, 'Laptop B', 'Electronics', '2023-01-02', 70000.00, 'Assigned', 'Delhi', 2, '2025-01-02', 'In use by BA'),
(3, 'Server Rack 1', 'Hardware', '2023-01-03', 150000.00, 'Operational', 'Pune', 3, '2026-01-03', 'Server room'),
(4, 'Router X', 'Networking', '2023-01-04', 25000.00, 'Operational', 'Mumbai', 4, '2025-01-04', 'Wi-Fi backbone'),
(5, 'Switch Y', 'Networking', '2023-01-05', 18000.00, 'Operational', 'Delhi', 5, '2025-01-05', 'LAN managed'),
(6, 'Projector Z', 'AV Equipment', '2023-01-06', 40000.00, 'In Use', 'Pune', 6, '2026-01-06', 'Meeting rooms'),
(7, 'Phone System', 'Communication', '2023-01-07', 30000.00, 'Assigned', 'Kolkata', 7, '2024-01-07', 'IP phones'),
(8, 'Desktop PC', 'Electronics', '2023-01-08', 60000.00, 'Assigned', 'Chennai', 8, '2025-01-08', 'Analyst use'),
(9, 'Chair Executive', 'Furniture', '2023-01-09', 8000.00, 'In Use', 'Mumbai', 9, NULL, 'Manager chair'),
(10, 'Desk Wood', 'Furniture', '2023-01-10', 12000.00, 'In Use', 'Delhi', 10, NULL, 'Ergonomic desk'),
(11, 'Monitor 24"', 'Electronics', '2023-01-11', 15000.00, 'In Use', 'Pune', 11, '2025-01-11', 'Full HD'),
(12, 'Keyboard Wireless', 'Accessories', '2023-01-12', 2500.00, 'Assigned', 'Chennai', 12, '2024-01-12', 'Bluetooth'),
(13, 'Mouse Bluetooth', 'Accessories', '2023-01-13', 1500.00, 'Assigned', 'Mumbai', 13, '2024-01-13', 'Wireless'),
(14, 'UPS 2KVA', 'Power Backup', '2023-01-14', 20000.00, 'In Use', 'Lucknow', 14, '2026-01-14', 'Backup for servers'),
(15, 'Scanner A4', 'Electronics', '2023-01-15', 10000.00, 'Operational', 'Chandigarh', 15, '2025-01-15', 'Doc scanner'),
(16, 'Printer All-in-One', 'Electronics', '2023-01-16', 18000.00, 'In Use', 'Indore', 16, '2026-01-16', 'Print/Scan/Fax'),
(17, 'Tablet', 'Electronics', '2023-01-17', 45000.00, 'Assigned', 'Ahmedabad', 17, '2025-01-17', 'Field use'),
(18, 'Smartphone', 'Electronics', '2023-01-18', 35000.00, 'Assigned', 'Bhubaneshwar', 18, '2025-01-18', 'Business calls'),
(19, 'Headphones', 'Audio', '2023-01-19', 5000.00, 'In Use', 'Mumbai', 19, NULL, 'Zoom meetings'),
(20, 'AC Split', 'Appliance', '2023-01-20', 55000.00, 'Operational', 'Delhi', 20, '2028-01-20', 'Office cooling');

-- to display records
select * from Assets;

-- to remove records from the table
truncate table Assets;

-- to remove whole table from databse
drop table Assets;

-- Select Queries
-- select all assets that are currently assigned
select assetid, assetname, type from assets 
where status = 'Assigned';

-- select all assets valued above 50,000, sorted from highest to lowest
select * from assets 
where value > 50000 order by value desc;

-- select the first 3 assets located in Mumbai
select assetname, location, status from assets 
where location = 'Mumbai' limit 3;

-- count of assets grouped by type, showing only types with more than one asset
select count(*) as total_assets, type from assets group by type having count(*) > 1;

-- select assets that have a warranty expiry date before 1st Jan 2026
select assetid, assetname, warrantyexpiry from assets 
where warrantyexpiry is not null and warrantyexpiry < '2026-01-01';

-- Alter Queries
-- add a new column for insurance expiry date after warranty expiry
alter table assets 
add column insuranceexpiry date after warrantyexpiry;

-- modify the status column to be not null and allow up to 30 characters
alter table assets 
modify column status varchar(30) not null;

-- rename the column 'value' to 'assetvalue' and expand its size to (12,2)
alter table assets 
change column value assetvalue decimal(12,2);

-- add a check constraint to ensure assetvalue is zero or more
alter table assets 
add constraint chk_value check (assetvalue >= 0);

-- remove the 'notes' column from the table
alter table assets drop column notes;

-- Rename Queries
-- rename the table from 'assets' to 'company_assets'
rename table assets to company_assets;

-- rename column assetid to id
alter table company_assets 
rename column assetid to id;


-- rename column assetname to name
alter table company_assets 
rename column assetname to name;

-- rename column type to category
alter table company_assets 
rename column type to category;

-- rename column assignedto to assigned_consultant
alter table company_assets 
rename column assignedto to assigned_consultant;

-- Delete Queries
-- delete all assets that belong to the 'Furniture' category
delete from company_assets where category = 'Furniture';

-- delete all assets whose value is less than 10,000
delete from company_assets where assetvalue < 10000;

-- delete all assets that do not have a warranty expiry date
delete from company_assets where warrantyexpiry is null;

-- delete the first two assets found in Pune or Delhi
delete from company_assets where location in ('Pune','Delhi') limit 2;

-- delete assets that are operational and valued above 30,000
delete from company_assets where status = 'Operational' and assetvalue > 30000;

-- Update Queries
-- set insurance expiry to 31st Dec 2026 for all electronics
update company_assets 
set insuranceexpiry = '2026-12-31' 
where category = 'Electronics';

-- update status from 'Assigned' to 'In Use'
update company_assets 
set status = 'In Use' 
where status = 'Assigned';


-- increase asset value by 5,000 for all appliances
update company_assets 
set assetvalue = assetvalue + 5000 
where category = 'Appliance';

-- append ' - Updated' to asset names located in Mumbai
update company_assets 
set name = concat(name, ' - Updated') 
where location = 'Mumbai';

-- remove insurance expiry date for all furniture assets
update company_assets 
set insuranceexpiry = null 
where category = 'Furniture';

-- Table 14:
CREATE TABLE Technologies (
TechnologyID INT PRIMARY KEY,
Name VARCHAR(100),
Version VARCHAR(20),
Vendor VARCHAR(50),
LicenseKey VARCHAR(100),
PurchaseDate DATE,
ExpiryDate DATE,
Status VARCHAR(20),
AssignedTo INT,
Notes TEXT,
FOREIGN KEY (AssignedTo) REFERENCES Consultants(ConsultantID)
);

INSERT INTO Technologies VALUES
(1, 'Python', '3.11', 'Python Software Foundation', 'PY-001', '2023-01-01', '2025-01-01', 'Active', 1, 'Used for backend scripting'),
(2, 'MySQL', '8.0', 'Oracle', 'MY-001', '2023-01-02', '2026-01-02', 'Active', 2, 'Database system'),
(3, 'Power BI', '2.115', 'Microsoft', 'PB-001', '2023-01-03', '2024-01-03', 'Active', 3, 'Dashboards & visualization'),
(4, 'Excel', '2021', 'Microsoft', 'EX-001', '2023-01-04', '2024-12-31', 'Active', 4, 'Business analytics'),
(5, 'Salesforce', 'Summer 23', 'Salesforce Inc.', 'SF-001', '2023-01-05', '2025-01-05', 'Active', 5, 'CRM'),
(6, 'Java', '17', 'Oracle', 'JV-001', '2023-01-06', '2026-01-06', 'Active', 6, 'Used in backend'),
(7, 'AWS', '2023', 'Amazon', 'AW-001', '2023-01-07', '2026-01-07', 'Active', 7, 'Cloud infrastructure'),
(8, 'Docker', '20.10', 'Docker Inc.', 'DK-001', '2023-01-08', '2025-01-08', 'Active', 8, 'Containerization'),
(9, 'GitHub', 'Enterprise', 'GitHub', 'GH-001', '2023-01-09', '2024-01-09', 'Active', 9, 'Code repository'),
(10, 'Zoom', '5.15', 'Zoom Video', 'ZM-001', '2023-01-10', '2024-01-10', 'Active', 10, 'Remote meetings'),
(11, 'Slack', '4.29', 'Slack Tech', 'SL-001', '2023-01-11', '2024-01-11', 'Active', 11, 'Team communication'),
(12, 'Node.js', '18.x', 'Node Foundation', 'ND-001', '2023-01-12', '2025-01-12', 'Active', 12, 'JavaScript runtime'),
(13, 'React', '18.2', 'Meta', 'RC-001', '2023-01-13', '2024-12-13', 'Active', 13, 'Frontend development'),
(14, 'Figma', '2023', 'Figma Inc.', 'FG-001', '2023-01-14', '2024-01-14', 'Active', 14, 'UI/UX design'),
(15, 'Notion', '2.0', 'Notion Labs', 'NT-001', '2023-01-15', '2024-01-15', 'Active', 15, 'Productivity'),
(16, 'Trello', '2023', 'Atlassian', 'TR-001', '2023-01-16', '2024-01-16', 'Active', 16, 'Task management'),
(17, 'VS Code', '1.75', 'Microsoft', 'VC-001', '2023-01-17', '2024-01-17', 'Active', 17, 'Code editor'),
(18, 'Postman', '10', 'Postman Inc.', 'PM-001', '2023-01-18', '2025-01-18', 'Active', 18, 'API testing'),
(19, 'Tableau', '2023.1', 'Tableau', 'TB-001', '2023-01-19', '2025-01-19', 'Active', 19, 'BI tool'),
(20, 'Jira', '9.4', 'Atlassian', 'JR-001', '2023-01-20', '2024-01-20', 'Active', 20, 'Agile project tracking');

-- to display records
select * from Technologies;

-- to remove records from the table
truncate table Technologies;

-- to remove whole table from databse
drop table Technologies;

-- SELECT QUERIES

-- 1. select all columns
select * from technologies;

-- 2. select specific columns where vendor is Microsoft
select technologyid, name, version from technologies 
where vendor = 'Microsoft';

-- 3. select technologies purchased after 2023-01-10
select name, purchaseDate from technologies 
where purchasedate > '2023-01-10';

-- 4. select technologies assigned to consultant id between 5 and 10
select name, assignedto from technologies 
where assignedto between 5 and 10;

-- 5. select technologies ordered by expiry date descending
select name, expirydate from technologies order by expirydate desc;

--  ALTER QUERIES

-- 1. add a column for cost
alter table technologies 
add column cost decimal(10,2);

-- 2. modify licensekey to be not null
alter table technologies 
modify column licensekey varchar(100) not null;

-- 3. add unique constraint on licensekey
alter table technologies 
add constraint unique_license unique (licensekey);

-- 4. drop the notes column
alter table technologies drop column notes;

-- 5. add a default value for status
alter table technologies 
alter column status set default 'Active';

--  RENAME QUERIES
-- 1. rename table technologies to software_assets
rename table technologies to software_assets;

-- 2. rename column name to technology_name
alter table software_assets 
change column name technology_name varchar(100);

-- 3. rename column version to version_number
alter table software_assets 
change column version version_number varchar(20);


-- 4. rename column vendor to provider
alter table software_assets 
change column vendor provider varchar(50);

-- 5. rename column expirydate to license_expiry
alter table software_assets 
change column expirydate license_expiry date;

-- DELETE QUERIES

-- 1. delete where provider is 'Zoom Video'
delete from software_assets 
where provider = 'Zoom Video';

-- 2. delete records where status is 'Inactive'
delete from software_assets 
where status = 'Inactive';

-- 3. delete records where license_expiry before 2024-01-01
delete from software_assets 
where license_expiry < '2024-01-01';

-- 4. delete records assigned to consultant 15
delete from software_assets 
where assignedto = 15;

-- 5. delete records where technology_name like '%Slack%'
delete from software_assets 
where technology_name like '%Slack%';

-- UPDATE QUERIES 

-- 1. update cost for technology id 1
update software_assets 
set cost = 5000.00 
where technologyid = 1;

-- 2. update licensekey for technology id 2
update software_assets 
set licensekey = 'MY-002' 
where technologyid = 2;

-- 3. update provider for technology id 3
update software_assets set provider = 'Microsoft Corp.' 
where technologyid = 3;

-- 4. update technology_name for technology id 4
update software_assets set technology_name = 'Excel Pro' 
where technologyid = 4;

-- Table 15: Trainings
CREATE TABLE Trainings (
TrainingID INT PRIMARY KEY,
Title VARCHAR(100),
Trainer VARCHAR(50),
StartDate DATE,
EndDate DATE,
Location VARCHAR(50),
Capacity INT,
Description TEXT,
Status VARCHAR(20),
Cost DECIMAL(10,2)
);

INSERT INTO Trainings 
VALUES
(1, 'Advanced Excel', 'Mr. A', '2023-02-01', '2023-02-05', 'Mumbai', 30, 'Excel functions & dashboards', 'Completed', 5000.00),
(2, 'SQL for Analysts', 'Ms. B', '2023-02-10', '2023-02-15', 'Delhi', 25, 'Database queries & joins', 'Completed', 4000.00),
(3, 'Power BI Basics', 'Mr. C', '2023-02-20', '2023-02-25', 'Online', 50, 'Data visualization skills', 'Completed', 6000.00),
(4, 'Python for Data Science', 'Ms. D', '2023-03-01', '2023-03-07', 'Pune', 40, 'Pandas, Numpy, Matplotlib', 'Ongoing', 8000.00),
(5, 'Consulting Toolkit', 'Mr. E', '2023-03-10', '2023-03-15', 'Bangalore', 20, 'Client communication, proposals', 'Upcoming', 7000.00),
(6, 'Agile Methodology', 'Ms. F', '2023-03-20', '2023-03-25', 'Chennai', 30, 'Scrum, Kanban basics', 'Completed', 5500.00),
(7, 'Business Analytics', 'Mr. G', '2023-04-01', '2023-04-05', 'Mumbai', 35, 'Analytical skills training', 'Ongoing', 9000.00),
(8, 'Negotiation Skills', 'Ms. H', '2023-04-10', '2023-04-12', 'Delhi', 15, 'Consultant negotiation', 'Completed', 3000.00),
(9, 'Stakeholder Management', 'Mr. I', '2023-04-15', '2023-04-17', 'Online', 50, 'Managing clients effectively', 'Completed', 3500.00),
(10, 'Jira & Scrum Boards', 'Ms. J', '2023-04-20', '2023-04-22', 'Pune', 20, 'Agile workflows', 'Upcoming', 2800.00),
(11, 'Data Visualization', 'Mr. K', '2023-05-01', '2023-05-05', 'Bangalore', 30, 'Charts & Storytelling', 'Upcoming', 4000.00),
(12, 'R Programming', 'Ms. L', '2023-05-10', '2023-05-15', 'Online', 40, 'Stats & Data Models', 'Upcoming', 4500.00),
(13, 'Communication Workshop', 'Mr. M', '2023-05-20', '2023-05-22', 'Delhi', 25, 'Effective communication', 'Ongoing', 3000.00),
(14, 'Product Management', 'Ms. N', '2023-05-25', '2023-05-30', 'Mumbai', 30, 'Product lifecycle & strategy', 'Upcoming', 8500.00),
(15, 'ETL Tools Overview', 'Mr. O', '2023-06-01', '2023-06-05', 'Pune', 20, 'Data extraction & transformation', 'Upcoming', 6200.00),
(16, 'Financial Modeling', 'Ms. P', '2023-06-10', '2023-06-15', 'Online', 50, 'Valuation & Forecasting', 'Upcoming', 7800.00),
(17, 'Cybersecurity Basics', 'Mr. Q', '2023-06-20', '2023-06-25', 'Chennai', 30, 'Network & data protection', 'Upcoming', 5000.00),
(18, 'MS Project Usage', 'Ms. R', '2023-07-01', '2023-07-03', 'Hyderabad', 20, 'Project planning tool', 'Upcoming', 2500.00),
(19, 'Data Cleaning & Prep', 'Mr. S', '2023-07-05', '2023-07-07', 'Mumbai', 35, 'Preprocessing data for analysis', 'Upcoming', 3700.00),
(20, 'Design Thinking', 'Ms. T', '2023-07-10', '2023-07-12', 'Delhi', 40, 'Creative problem solving', 'Upcoming', 4600.00);

-- to display records
select * from Trainings;

-- to remove records from the table
truncate table Trainings;

-- to remove whole table from databse
drop table Trainings;

-- Select Queries
-- select top 5 most expensive trainings
select * from trainings 
where cost > 5000.00 order by cost desc limit 5;

-- select upcoming trainings sorted by start date
select title, trainer, location from trainings 
where status = 'upcoming' order by startdate asc;

-- select average cost of online trainings
select avg(cost) as average_cost from trainings 
where location = 'online';

-- select count of completed trainings
select count(*) as completed_count from trainings 
where status = 'completed';

-- select trainings between april and june 2023
select * from trainings 
where startdate between '2023-04-01' and '2023-06-30';

-- Alter Queries 
-- add a feedback_score column with default 0
alter table trainings 
add column feedback_score int default 0;

-- make capacity column not null
alter table trainings 
modify column capacity int not null;

-- rename location column to venue
alter table trainings 
change column location venue varchar(60);

-- remove the description column
alter table trainings 
drop column description;

-- add check to ensure cost is at least 2000
alter table trainings 
add constraint chk_cost check (cost >= 2000.00);

-- rename Queries
-- rename the trainings table to training_sessions
rename table trainings to training_sessions;

-- rename trainer column to instructor
alter table training_sessions 
rename column trainer to instructor;

-- rename status column to training_status
alter table training_sessions 
rename column status to training_status;

-- rename title column to training_title
alter table training_sessions 
rename column title to training_title;

-- rename cost column to training_cost
alter table training_sessions 
rename column cost to training_cost;

-- Delete Queries
-- delete 2 completed trainings
delete from training_sessions 
where training_status = 'completed' limit 2;

-- delete low-cost trainings in delhi
delete from training_sessions 
where venue = 'delhi' and training_cost < 4000.00;

-- delete trainings that start after june 2023
delete from training_sessions 
where startdate > '2023-06-30';

-- delete trainings with 'data' in the title
delete from training_sessions 
where training_title like '%data%';

-- delete trainings conducted by mr. g
delete from training_sessions 
where instructor = 'mr. g';

-- update queries
-- update feedback score for python training
update training_sessions 
set feedback_score = 8 
where training_title = 'python for data science';

-- update all low-cost trainings to minimum cost
update training_sessions 
set cost = 2000.00 
where cost < 2000.00;

-- update old trainings as archived
update training_sessions 
set training_status = 'archived' 
where enddate < '2023-04-01';

-- update venue from online to virtual
update training_sessions 
set venue = 'virtual' 
where venue = 'online';

-- update instructor name from ms. l to ms. z
update training_sessions 
set instructor = 'ms. z' 
where instructor = 'ms. l';

-- Table 16: Jobroles
CREATE TABLE JobRoles (
RoleID INT PRIMARY KEY,
RoleName VARCHAR(50),
DepartmentID INT,
Description TEXT,
MinimumExperience INT,
SalaryRange VARCHAR(50),
CreatedDate DATE,
Status VARCHAR(20),
ReportsTo INT,
ApprovalRequired BOOLEAN,
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
FOREIGN KEY (ReportsTo) REFERENCES Consultants(ConsultantID)
);

INSERT INTO JobRoles 
VALUES
(1, 'Business Analyst', 1, 'Analyzes business problems', 2, '4–6 LPA', '2023-01-01', 'Active', 1, TRUE),
(2, 'Data Analyst', 1, 'Works with data & reports', 1, '3–5 LPA', '2023-01-01', 'Active', 2, FALSE),
(3, 'Consultant', 2, 'Client facing advisor', 3, '6–10 LPA', '2023-01-01', 'Active', 3, TRUE),
(4, 'Project Manager', 2, 'Handles project scope', 5, '10–14 LPA', '2023-01-01', 'Active', 4, TRUE),
(5, 'HR Executive', 3, 'Manages hiring & HR ops', 1, '2.5–4 LPA', '2023-01-01', 'Active', 5, FALSE),
(6, 'Tech Lead', 1, 'Leads technical team', 4, '12–15 LPA', '2023-01-01', 'Active', 6, TRUE),
(7, 'Support Engineer', 4, 'Technical support', 1, '3–5 LPA', '2023-01-01', 'Active', 7, FALSE),
(8, 'UI/UX Designer', 1, 'Designs interface', 2, '5–7 LPA', '2023-01-01', 'Active', 8, TRUE),
(9, 'DevOps Engineer', 1, 'Handles CI/CD and infra', 3, '8–12 LPA', '2023-01-01', 'Active', 9, TRUE),
(10, 'Finance Analyst', 5, 'Financial reporting', 2, '4–6 LPA', '2023-01-01', 'Active', 10, FALSE),
(11, 'Marketing Manager', 6, 'Campaign strategist', 4, '8–10 LPA', '2023-01-01', 'Active', 11, TRUE),
(12, 'Legal Advisor', 7, 'Manages legal compliance', 5, '10–12 LPA', '2023-01-01', 'Active', 12, TRUE),
(13, 'Content Writer', 6, 'Writes marketing content', 1, '2–4 LPA', '2023-01-01', 'Active', 13, FALSE),
(14, 'Trainer', 8, 'Conducts training sessions', 2, '3–6 LPA', '2023-01-01', 'Active', 14, FALSE),
(15, 'Receptionist', 3, 'Greets and manages desk', 0, '1.8–2.5 LPA', '2023-01-01', 'Active', 15, FALSE),
(16, 'Account Manager', 5, 'Manages client accounts', 3, '6–9 LPA', '2023-01-01', 'Active', 16, TRUE),
(17, 'Security Officer', 9, 'Manages office security', 2, '2–3 LPA', '2023-01-01', 'Active', 17, FALSE),
(18, 'Product Owner', 2, 'Manages product backlog', 4, '10–13 LPA', '2023-01-01', 'Active', 18, TRUE),
(19, 'Graphic Designer', 6, 'Creates digital assets', 1, '3–5 LPA', '2023-01-01', 'Active', 19, FALSE),
(20, 'Scrum Master', 2, 'Facilitates agile team', 3, '9–11 LPA', '2023-01-01', 'Active', 20, TRUE);

-- to display records
select * from JobRoles;

-- to remove records from the table
truncate table JobRoles;

-- to remove whole table from databse
drop table JobRoles;

-- select queries
-- select all roles with minimum experience more than 3 years
select * from jobroles 
where minimumexperience > 3;

-- select roles in department 1 or 2 and sort by salary range
select rolename, departmentid, salaryrange from jobroles 
where departmentid in order by salaryrange desc;

-- select roles where approval is required and status is active
select rolename, approvalrequired from jobroles 
where approvalrequired = true and status = 'Active';

-- select count of roles per department with more than 1 role
select departmentid, count(*) as total_roles from jobroles group by departmentid having count(*) > 1;

-- select roles created between jan and june 2023
select rolename, createddate from jobroles 
where createddate between '2023-01-01' and '2023-06-30';

-- alter queries
-- add column job_level with default value 'Entry'
alter table jobroles 
add column job_level varchar(20) default 'Entry';

-- modify description to be not null
alter table jobroles 
modify column description text not null;

-- change salaryrange to salaryband and expand its length
alter table jobroles 
change column salaryrange salaryband varchar(100);

-- drop the status column
alter table jobroles 
drop column status;

-- add check constraint to ensure minimum experience is 0 or more
alter table jobroles 
add constraint chk_experience check (minimumexperience >= 0);

-- rename queries
-- rename table from jobroles to company_jobroles
rename table jobroles to company_jobroles;

-- rename column rolename to title
alter table company_jobroles 
rename column rolename to title;

-- rename column createddate to added_on
alter table company_jobroles 
rename column createddate to added_on;

-- rename column reportsTo to supervisor_id
alter table company_jobroles 
rename column reportsTo to supervisor_id;

-- rename column job_level to level
alter table company_jobroles 
rename column job_level to level;

-- Delete queries
-- delete roles with minimum experience less than 1
delete from company_jobroles where minimumexperience < 1;

-- delete roles in department 9
delete from company_jobroles where departmentid = 9;

-- delete roles with title like '%analyst%'
delete from company_jobroles where title like '%analyst%';

-- delete roles that do not require approval
delete from company_jobroles where approvalrequired = false;

-- delete roles with salaryband = '2–4 LPA'
delete from company_jobroles where salaryband = '2–4 LPA';

-- update queries
-- update level to 'Mid' where minimum experience is 3 or more
update company_jobroles 
set level = 'Mid' 
where minimumexperience >= 3;

-- update all null descriptions with default text
update company_jobroles 
set description = 'not provided' 
where description is null;

-- update salaryband to 'Negotiable' where title = 'tech lead'
update company_jobroles 
set salaryband = 'Negotiable' 
where title = 'Tech Lead';

-- update minimum experience to 0 where it's null
update company_jobroles 
set minimumexperience = 0 
where minimumexperience is null;

-- Table 17: Leaves
CREATE TABLE Leaves (
LeaveID INT PRIMARY KEY,
ConsultantID INT,
StartDate DATE,
EndDate DATE,
LeaveType VARCHAR(20),
Reason TEXT,
Status VARCHAR(20),
AppliedDate DATE,
ApprovedBy INT,
Notes TEXT,
FOREIGN KEY (ConsultantID) REFERENCES Consultants(ConsultantID),
FOREIGN KEY (ApprovedBy) REFERENCES Consultants(ConsultantID)
);

INSERT INTO Leaves VALUES
(1, 1, '2025-07-01', '2025-07-03', 'Sick', 'Fever and rest', 'Approved', '2025-06-30', 1, ''),
(2, 2, '2025-07-05', '2025-07-06', 'Casual', 'Family function', 'Approved', '2025-07-01', 2, ''),
(3, 3, '2025-07-10', '2025-07-12', 'Vacation', 'Goa trip', 'Approved', '2025-07-05', 3, ''),
(4, 4, '2025-07-15', '2025-07-15', 'Casual', 'One-day leave', 'Pending', '2025-07-10', NULL, ''),
(5, 5, '2025-07-18', '2025-07-19', 'Sick', 'Back pain', 'Approved', '2025-07-17', 4, ''),
(6, 6, '2025-07-21', '2025-07-25', 'Vacation', 'Family tour', 'Approved', '2025-07-15', 5, ''),
(7, 7, '2025-07-26', '2025-07-27', 'Casual', 'Urgent work', 'Rejected', '2025-07-20', 6, ''),
(8, 8, '2025-07-28', '2025-07-29', 'Sick', 'Dental checkup', 'Approved', '2025-07-25', 7, ''),
(9, 9, '2025-07-30', '2025-07-31', 'Vacation', 'Short trip', 'Pending', '2025-07-27', NULL, ''),
(10, 10, '2025-08-01', '2025-08-03', 'Casual', 'Function at home', 'Approved', '2025-07-28', 8, ''),
(11, 11, '2025-08-05', '2025-08-07', 'Sick', 'Cold and flu', 'Approved', '2025-08-03', 9, ''),
(12, 12, '2025-08-08', '2025-08-10', 'Vacation', 'Weekend break', 'Approved', '2025-08-05', 10, ''),
(13, 13, '2025-08-11', '2025-08-11', 'Casual', 'Personal work', 'Approved', '2025-08-09', 11, ''),
(14, 14, '2025-08-12', '2025-08-14', 'Sick', 'Migraine', 'Approved', '2025-08-10', 12, ''),
(15, 15, '2025-08-15', '2025-08-17', 'Vacation', 'Trip to hometown', 'Pending', '2025-08-12', NULL, ''),
(16, 16, '2025-08-18', '2025-08-18', 'Casual', 'Half-day', 'Approved', '2025-08-16', 13, ''),
(17, 17, '2025-08-20', '2025-08-22', 'Sick', 'Flu symptoms', 'Approved', '2025-08-19', 14, ''),
(18, 18, '2025-08-23', '2025-08-25', 'Vacation', 'Hill station trip', 'Approved', '2025-08-20', 15, ''),
(19, 19, '2025-08-26', '2025-08-27', 'Casual', 'Social event', 'Pending', '2025-08-23', NULL, ''),
(20, 20, '2025-08-28', '2025-08-30', 'Sick', 'Medical checkup', 'Approved', '2025-08-26', 16, '');

-- to display records
select * from Leaves;

-- to remove records from the table
truncate table Leaves;

-- to remove whole table from databse
drop table Leaves;

-- Select queries 
-- select all sick leaves
select * from leaves 
where leavetype = 'Sick';

-- select pending leaves sorted by applied date
select * from leaves 
where status = 'Pending' order by applieddate asc;

-- select number of leaves per consultant
select consultantid, count(*) as total_leaves from leaves group by consultantid;

-- select leaves applied between 1st august and 15th august
select * from leaves 
where applieddate between '2025-08-01' and '2025-08-15';

-- select top 3 longest leaves by duration
select *, datediff(enddate, startdate) as duration from leaves order by duration desc limit 3;

-- Alter queries
-- add column leave_duration to store number of leave days
alter table leaves 
add column leave_duration int;

-- modify status column to not null
alter table leaves 
modify column status varchar(20) not null;

-- change notes column to remarks with longer length
alter table leaves 
change column notes remarks varchar(255);

-- drop reason column
alter table leaves drop column reason;

-- add check constraint to ensure enddate is after or same as startdate
alter table leaves 
add constraint chk_dates check (enddate >= startdate);

-- Rename queries
-- rename table from leaves to consultant_leaves
rename table leaves to consultant_leaves;

-- rename column leavetype to type
alter table consultant_leaves 
rename column leavetype to type;

-- rename column applieddate to requested_on
alter table consultant_leaves 
rename column applieddate to requested_on;

-- rename column approvedby to manager_id
alter table consultant_leaves 
rename column approvedby to manager_id;

-- rename column status to leave_status
alter table consultant_leaves
rename column status to leave_status;

-- delete queries
-- delete all vacation leaves
delete from consultant_leaves where type = 'Vacation';

-- delete leaves with leave_duration less than 2
delete from consultant_leaves where leave_duration < 2;

-- delete leaves where leave_status is 'Rejected'
delete from consultant_leaves where leave_status = 'Rejected';

-- delete leaves with null manager_id
delete from consultant_leaves where manager_id is null;

-- delete leaves requested before july 2025
delete from consultant_leaves where requested_on < '2025-07-01';

-- Update queries
-- update leave_duration using start and end date
update consultant_leaves 
set leave_duration = datediff(enddate, startdate) + 1;

-- update leave_status to 'Reviewed' for all previously 'Approved'
update consultant_leaves 
set leave_status = 'Reviewed' 
where leave_status = 'Approved';

-- update remarks where it is empty
update consultant_leaves 
set remarks = 'no remarks' 
where remarks = '';

-- update manager_id to 1 where it is null
update consultant_leaves 
set consultantid = 1 
where consultantid is null;

-- Table 18: Attendance
CREATE TABLE Attendance (
AttendanceID INT PRIMARY KEY,
ConsultantID INT,
Date DATE,
CheckInTime TIME,
CheckOutTime TIME,
Status VARCHAR(20),
WorkHours DECIMAL(5,2),
Location VARCHAR(50),
ApprovedBy INT,
Notes TEXT,
FOREIGN KEY (ConsultantID) REFERENCES Consultants(ConsultantID),
FOREIGN KEY (ApprovedBy) REFERENCES Consultants(ConsultantID)
);

INSERT INTO Attendance 
VALUES
(1, 1, '2025-07-01', '09:00:00', '17:00:00', 'Present', 8.0, 'Mumbai', 1, 'On time'),
(2, 2, '2025-07-01', '09:15:00', '17:15:00', 'Present', 8.0, 'Delhi', 2, 'Late arrival'),
(3, 3, '2025-07-01', '09:05:00', '17:10:00', 'Present', 8.1, 'Pune', 3, ''),
(4, 4, '2025-07-01', NULL, NULL, 'Absent', 0.0, 'Mumbai', NULL, 'Sick leave'),
(5, 5, '2025-07-01', '09:10:00', '17:20:00', 'Present', 8.2, 'Chennai', 4, ''),
(6, 6, '2025-07-01', '09:00:00', '17:00:00', 'Present', 8.0, 'Kolkata', 5, ''),
(7, 7, '2025-07-01', '08:50:00', '17:00:00', 'Present', 8.2, 'Bangalore', 6, ''),
(8, 8, '2025-07-01', '09:30:00', '17:30:00', 'Present', 8.0, 'Hyderabad', 7, 'Traffic delay'),
(9, 9, '2025-07-01', '09:00:00', '17:05:00', 'Present', 8.1, 'Mumbai', 8, ''),
(10, 10, '2025-07-01', NULL, NULL, 'Leave', 0.0, 'Remote', NULL, 'Approved leave'),
(11, 11, '2025-07-01', '09:05:00', '17:00:00', 'Present', 7.9, 'Delhi', 9, ''),
(12, 12, '2025-07-01', '08:55:00', '16:50:00', 'Present', 7.9, 'Pune', 10, ''),
(13, 13, '2025-07-01', '09:00:00', '17:00:00', 'Present', 8.0, 'Chennai', 11, ''),
(14, 14, '2025-07-01', '09:10:00', '17:15:00', 'Present', 8.1, 'Kolkata', 12, ''),
(15, 15, '2025-07-01', '09:00:00', '16:45:00', 'Present', 7.75, 'Bangalore', 13, ''),
(16, 16, '2025-07-01', NULL, NULL, 'Absent', 0.0, 'Remote', NULL, ''),
(17, 17, '2025-07-01', '09:20:00', '17:00:00', 'Present', 7.67, 'Hyderabad', 14, 'Overslept'),
(18, 18, '2025-07-01', '09:00:00', '17:00:00', 'Present', 8.0, 'Mumbai', 15, ''),
(19, 19, '2025-07-01', '08:45:00', '17:00:00', 'Present', 8.25, 'Delhi', 16, ''),
(20, 20, '2025-07-01', '09:10:00', '17:30:00', 'Present', 8.33, 'Pune', 17, '');

-- to display records
select * from Attendance;

-- to remove records from the table
truncate table Attendance;

-- to remove whole table from databse
drop table Attendance;

-- Select queries
-- select all present consultants
select * from attendance 
where status = 'Present';

-- select consultants who worked more than 8 hours
select consultantid, workhours from attendance where workhours > 8.0;

-- select consultants who were absent or on leave
select * from attendance 
where status in ('Absent', 'Leave');

-- select count of present consultants by location
select location, count(*) as present_count from attendance 
where status = 'Present' group by location;

-- select top 3 consultants with highest work hours
select consultantid, workhours from attendance order by workhours desc limit 3;

-- Alter queries
-- add a column for shift type
alter table attendance 
add column shift varchar(20) default 'General';

-- modify notes column to be not null
alter table attendance 
modify column notes text not null;

-- change location column to office_location with longer length
alter table attendance 
change column location office_location varchar(100);

-- drop the status column
alter table attendance 
drop column status;

-- add a check constraint to ensure work hours are non-negative
alter table attendance 
add constraint chk_workhours check (workhours >= 0);

-- Rename queries
-- rename table from attendance to consultant_attendance
rename table attendance to consultant_attendance;

-- rename column date to attendance_date
alter table consultant_attendance 
rename column date to attendance_date;

-- rename column checkintime to time_in
alter table consultant_attendance 
rename column checkintime to time_in;

-- rename column checkouttime to time_out
alter table consultant_attendance 
rename column checkouttime to time_out;

-- rename column approvedby to supervisor_id
alter table consultant_attendance 
rename column approvedby to supervisor_id;

-- Delete queries
-- delete all absent records
delete from consultant_attendance 
where workhours = 0 and time_in is null;

-- delete records from remote location
delete from consultant_attendance where office_location = 'Remote';

-- delete records with workhours less than 7.5
delete from consultant_attendance where workhours < 7.5;

-- delete records with empty notes
delete from consultant_attendance where notes = '';

-- delete records approved by supervisor id 13
delete from consultant_attendance where supervisor_id = 13;

-- update queries
-- update shift type to 'Evening' for workhours below 8
update consultant_attendance 
set shift = 'Evening' 
where workhours < 8;

-- update notes to 'on time' where notes are empty
update consultant_attendance 
set notes = 'on time' 
where notes = '';

-- update office_location to 'Head Office' for mumbai entries
update consultant_attendance 
set office_location = 'Head Office' 
where office_location = 'Mumbai';

-- update supervisor_id to 1 where it is null
update consultant_attendance
 set supervisor_id = 1 
 where supervisor_id is null;

-- update time_out to '17:30:00' where workhours is more than 8.25
update consultant_attendance 
set time_out = '17:30:00' 
where workhours > 8.25;

-- Table 19: Contracts
CREATE TABLE Contracts (
ContractID INT PRIMARY KEY,
ClientID INT,
ProjectID INT,
StartDate DATE,
EndDate DATE,
ContractValue DECIMAL(12,2),
Status VARCHAR(20),
SignedDate DATE,
RenewedDate DATE,
Notes TEXT,
FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

INSERT INTO Contracts VALUES
(1, 1, 1, '2025-01-01', '2025-12-31', 1000000.00, 'Active', '2025-01-01', NULL, 'Year-long software project'),
(2, 2, 2, '2025-02-01', '2025-08-01', 750000.00, 'Completed', '2025-02-01', '2025-08-01', ''),
(3, 3, 3, '2025-03-01', '2025-09-01', 500000.00, 'Terminated', '2025-03-01', NULL, 'Client discontinued'),
(4, 4, 4, '2025-01-15', '2025-12-15', 950000.00, 'Active', '2025-01-15', NULL, ''),
(5, 5, 5, '2025-04-01', '2025-10-01', 600000.00, 'Active', '2025-04-01', NULL, ''),
(6, 6, 6, '2025-05-01', '2025-11-01', 700000.00, 'Active', '2025-05-01', NULL, ''),
(7, 7, 7, '2025-06-01', '2025-12-01', 850000.00, 'Active', '2025-06-01', NULL, ''),
(8, 8, 8, '2025-07-01', '2025-12-31', 900000.00, 'Pending', NULL, NULL, ''),
(9, 9, 9, '2025-08-01', '2026-01-31', 450000.00, 'Active', '2025-08-01', NULL, ''),
(10, 10, 10, '2025-09-01', '2026-03-01', 1000000.00, 'Active', '2025-09-01', NULL, ''),
(11, 11, 11, '2025-10-01', '2026-04-01', 650000.00, 'Pending', NULL, NULL, ''),
(12, 12, 12, '2025-11-01', '2026-05-01', 780000.00, 'Pending', NULL, NULL, ''),
(13, 13, 13, '2025-12-01', '2026-06-01', 890000.00, 'Pending', NULL, NULL, ''),
(14, 14, 14, '2025-01-05', '2025-07-05', 450000.00, 'Completed', '2025-01-05', '2025-07-05', ''),
(15, 15, 15, '2025-01-10', '2025-07-10', 520000.00, 'Completed', '2025-01-10', '2025-07-10', ''),
(16, 16, 16, '2025-01-15', '2025-07-15', 530000.00, 'Completed', '2025-01-15', '2025-07-15', ''),
(17, 17, 17, '2025-01-20', '2025-07-20', 640000.00, 'Completed', '2025-01-20', '2025-07-20', ''),
(18, 18, 18, '2025-01-25', '2025-07-25', 750000.00, 'Completed', '2025-01-25', '2025-07-25', ''),
(19, 19, 19, '2025-01-30', '2025-07-30', 860000.00, 'Completed', '2025-01-30', '2025-07-30', ''),
(20, 20, 20, '2025-02-01', '2025-08-01', 990000.00, 'Active', '2025-02-01', NULL, '');

-- to display records
select * from Contracts;

-- to remove records from the table
truncate table Contracts;

-- to remove whole table from databse
drop table Contracts;

-- select queries
-- select all active contracts
select * from contracts 
where status = 'Active';

-- select contracts with value over 800000 ordered high to low
select contractid, contractvalue from contracts 
where contractvalue > 800000 order by contractvalue desc;

-- select contracts signed in january 2025
select * from contracts 
where signeddate between '2025-01-01' and '2025-01-31';

-- select count of contracts per status
select status, count(*) as total_contracts from contracts group by status;

-- select contracts that are pending and have no signed date
select * from contracts 
where status = 'Pending' and signeddate is null;

-- Alter Queries
-- add column contract_type with default 'Fixed'
alter table contracts 
add column contract_type varchar(20) default 'Fixed';

-- modify notes column to be not null
alter table contracts 
modify column notes text not null;

-- change contractvalue to contract_amount with larger size
alter table contracts 
change column contractvalue contract_amount decimal(15,2);

-- drop the reneweddate column
alter table contracts 
drop column reneweddate;

-- add check constraint to ensure enddate is after or same as startdate
alter table contracts 
add constraint chk_contract_dates check (enddate >= startdate);

-- Rename queries
-- rename table from contracts to client_contracts
rename table contracts to client_contracts;

-- rename column contractid to id
alter table client_contracts 
rename column contractid to id;

-- rename column startdate to contract_start
alter table client_contracts 
rename column startdate to contract_start;

-- rename column enddate to contract_end
alter table client_contracts 
rename column enddate to contract_end;

-- rename column signeddate to signed_on
alter table client_contracts 
rename column signeddate to signed_on;

-- Delete queries
-- delete contracts with contract_amount less than 500000
delete from client_contracts where contract_amount < 500000;

-- delete contracts with status 'Terminated'
delete from client_contracts where status = 'Terminated';

-- delete contracts with no notes
delete from client_contracts where notes = '';

-- delete contracts that are pending and not signed
delete from client_contracts where status = 'Pending' and signed_on is null;

-- delete contracts ending before '2025-06-01'
delete from client_contracts where contract_end < '2025-06-01';

-- Update queries
-- update contract_type to 'Variable' for all completed contracts
update client_contracts 
set contract_type = 'Variable' 
where status = 'Completed';

-- update notes to 'no remarks' where notes are empty
update client_contracts 
set notes = 'no remarks' 
where notes = '';

-- update contract_amount to 1100000 for contract id 1
update client_contracts 
set contract_amount = 1100000.00 
where id = 1;

-- update contract_end to '2026-12-31' where contract_amount > 900000
update client_contracts 
set enddate = '2026-12-31' 
where contract_amount > 900000;

-- Table 20: Proposals
CREATE TABLE Proposals (
ProposalID INT PRIMARY KEY,
ClientID INT,
Title VARCHAR(100),
Description TEXT,
SubmissionDate DATE,
Status VARCHAR(20),
ApprovedBy INT,
ValidUntil DATE,
EstimatedBudget DECIMAL(12,2),
Notes TEXT,
FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
FOREIGN KEY (ApprovedBy) REFERENCES Consultants(ConsultantID)
);

INSERT INTO Proposals VALUES
(1, 1, 'ERP Upgrade', 'Upgrade legacy ERP system', '2025-01-01', 'Approved', 1, '2025-03-01', 800000, 'Client requested revision'),
(2, 2, 'CRM Integration', 'Integrate new CRM', '2025-01-05', 'Pending', 2, '2025-04-01', 600000, ''),
(3, 3, 'Digital Strategy', '5-year digital plan', '2025-01-10', 'Rejected', 3, '2025-03-10', 300000, 'Budget exceeded'),
(4, 4, 'Web Redesign', 'Modernize website', '2025-01-15', 'Approved', 4, '2025-03-15', 250000, ''),
(5, 5, 'Mobile App Dev', 'New client mobile app', '2025-01-20', 'Approved', 5, '2025-04-20', 500000, ''),
(6, 6, 'Security Audit', 'Cybersecurity risk audit', '2025-01-25', 'Pending', 6, '2025-05-25', 150000, ''),
(7, 7, 'Data Migration', 'Legacy to cloud', '2025-02-01', 'Approved', 7, '2025-05-01', 400000, ''),
(8, 8, 'HRIS Implementation', 'New HR platform', '2025-02-05', 'Approved', 8, '2025-06-05', 550000, ''),
(9, 9, 'Marketing Automation', 'B2B campaign tools', '2025-02-10', 'Pending', 9, '2025-06-10', 350000, ''),
(10, 10, 'Analytics Dashboard', 'Custom BI reports', '2025-02-15', 'Approved', 10, '2025-06-15', 480000, ''),
(11, 11, 'DevOps Setup', 'CI/CD pipelines', '2025-02-20', 'Approved', 11, '2025-06-20', 300000, ''),
(12, 12, 'Training Modules', 'Upskill internal teams', '2025-02-25', 'Pending', 12, '2025-06-25', 200000, ''),
(13, 13, 'Digital Compliance', 'GDPR review', '2025-03-01', 'Approved', 13, '2025-07-01', 100000, ''),
(14, 14, 'Cloud Consulting', 'AWS setup & cost control', '2025-03-05', 'Approved', 14, '2025-07-05', 250000, ''),
(15, 15, 'Internal Audit', 'Compliance internal controls', '2025-03-10', 'Approved', 15, '2025-07-10', 180000, ''),
(16, 16, 'Lead Gen Strategy', 'Sales pipeline revamp', '2025-03-15', 'Pending', 16, '2025-07-15', 220000, ''),
(17, 17, 'Process Automation', 'Robotic process systems', '2025-03-20', 'Approved', 17, '2025-07-20', 460000, ''),
(18, 18, 'AI Model Pilot', 'Forecasting solution', '2025-03-25', 'Pending', 18, '2025-07-25', 380000, ''),
(19, 19, 'Retail Expansion', 'Market entry India', '2025-03-30', 'Approved', 19, '2025-07-30', 900000, ''),
(20, 20, 'Social Media Ops', 'Brand digital refresh', '2025-04-01', 'Pending', 20, '2025-08-01', 150000, '');

-- to display records
select * from Proposals;

-- to remove records from the table
truncate table Proposals;

-- to remove whole table from databse
drop table Proposals;

-- Select queires
-- select all approved proposals
select * from proposals 
where status = 'Approved';

-- select proposals with budget above 500000, sorted high to low
select proposalid, estimatedbudget from proposals 
where estimatedbudget > 500000 order by estimatedbudget desc;

-- select proposals submitted in february 2025
select * from proposals 
where submissiondate between '2025-02-01' and '2025-02-28';

-- select count of proposals per status
select status, count(*) as total_proposals from proposals group by status;

-- select top 3 pending proposals by budget
select * from proposals 
where status = 'Pending' order by estimatedbudget desc limit 3;

-- Alter queries
-- add a new column for proposal type
alter table proposals 
add column proposal_type varchar(50) default 'Standard';

-- make notes column not null
alter table proposals 
modify column notes text not null;

-- rename estimatedbudget to budget_estimate and increase size
alter table proposals 
change column estimatedbudget budget_estimate decimal(15,2);

-- drop the validuntil column
alter table proposals 
drop column validuntil;

-- Rename queries
-- rename table from proposals to client_proposals
rename table proposals to client_proposals;

-- rename column proposalid to id
alter table client_proposals 
rename column proposalid to id;

-- rename column submissiondate to submitted_on
alter table client_proposals 
rename column submissiondate to submitted_on;

-- rename column status to proposal_status
alter table client_proposals 
rename column status to proposal_status;

-- rename column approvedby to consultant_id
alter table client_proposals 
rename column approvedby to consultant_id;

-- Delete queries
-- delete all rejected proposals
delete from client_proposals 
where proposal_status = 'Rejected';

-- delete proposals with budget under 200000
delete from client_proposals 
where budget_estimate < 200000;

-- delete proposals submitted before 2025-02-01
delete from client_proposals 
where submitted_on < '2025-02-01';

-- delete proposals where notes are empty
delete from client_proposals where notes = '';

-- delete proposals with proposal_type = 'Standard' and proposal_status = 'Pending'
delete from client_proposals where proposal_type = 'Standard' and proposal_status = 'Pending';

-- Update queries
-- update proposal_type to 'Premium' where budget is more than 700000
update client_proposals 
set proposal_type = 'Premium' w
here budget_estimate > 700000;

-- update notes to 'awaiting response' where notes are empty
update client_proposals 
set notes = 'awaiting response' 
where notes = '';

-- update proposal_status to 'Under Review' where proposal_type is 'Standard' and status is 'Pending'
update client_proposals 
set proposal_status = 'Under Review' 
where proposal_type = 'Standard' and proposal_status = 'Pending';

-- update budget_estimate to 100000 where it's below the check constraint
update client_proposals 
set budget_estimate = 100000 
where budget_estimate < 100000;

-- update consultant_id to 1 where it is null
update client_proposals 
set consultant_id = 1 
where consultant_id is null;

-- Table 21: Vendors
CREATE TABLE Vendors (
VendorID INT PRIMARY KEY,
VendorName VARCHAR(100),
ContactPerson VARCHAR(50),
Email VARCHAR(100),
Phone VARCHAR(15),
Address VARCHAR(200),
ServicesProvided VARCHAR(100),
ContractStartDate DATE,
ContractEndDate DATE,
Status VARCHAR(20)
);

INSERT INTO Vendors 
VALUES
(1, 'TechnoSoft Pvt Ltd', 'Raj Malhotra', 'raj@technosoft.com', '9123456789', 'Mumbai, India', 'Software Services', '2025-01-01', '2025-12-31', 'Active'),
(2, 'DataPlus Inc.', 'Anita Singh', 'anita@dataplus.com', '9876543210', 'Delhi, India', 'Data Warehousing', '2025-01-05', '2025-12-31', 'Active'),
(3, 'NetSecure', 'Ajay Verma', 'ajay@netsecure.com', '9988776655', 'Bangalore', 'Cybersecurity', '2025-01-10', '2025-12-31', 'Active'),
(4, 'Designify', 'Sonal Shah', 'sonal@designify.com', '9090909090', 'Pune', 'UI/UX Services', '2025-01-15', '2025-12-31', 'Active'),
(5, 'CloudAce', 'Deepak Kumar', 'deepak@cloudace.com', '8888777766', 'Hyderabad', 'Cloud Infrastructure', '2025-01-20', '2025-12-31', 'Active'),
(6, 'VisualGears', 'Nidhi Joshi', 'nidhi@visualgears.com', '9012345678', 'Chennai', 'Video Editing', '2025-01-25', '2025-12-31', 'Active'),
(7, 'EduTrain LLP', 'Ravi Shankar', 'ravi@edutrain.com', '9500012345', 'Delhi', 'Corporate Training', '2025-02-01', '2025-12-31', 'Active'),
(8, 'FastFix', 'Vikas Gupta', 'vikas@fastfix.com', '9700123456', 'Mumbai', 'IT Support', '2025-02-05', '2025-12-31', 'Active'),
(9, 'SmartHR', 'Shruti Agarwal', 'shruti@smarthr.com', '9400123456', 'Pune', 'HR SaaS', '2025-02-10', '2025-12-31', 'Active'),
(10, 'BizLaw', 'Pooja Sharma', 'pooja@bizlaw.com', '9800123456', 'Delhi', 'Legal Services', '2025-02-15', '2025-12-31', 'Active'),
(11, 'CleanTech', 'Manoj Desai', 'manoj@cleantech.com', '8900123456', 'Ahmedabad', 'Office Sanitation', '2025-02-20', '2025-12-31', 'Active'),
(12, 'SecurePrint', 'Rina Mehta', 'rina@secureprint.com', '8700123456', 'Chennai', 'Print Services', '2025-02-25', '2025-12-31', 'Active'),
(13, 'GlobalLogix', 'Arun Patil', 'arun@globallogix.com', '8600123456', 'Mumbai', 'Logistics', '2025-03-01', '2025-12-31', 'Active'),
(14, 'GreenVibe', 'Kiran Rao', 'kiran@greenvibe.com', '8500123456', 'Bangalore', 'Eco Office Supplies', '2025-03-05', '2025-12-31', 'Active'),
(15, 'Innoventia', 'Tarun Singh', 'tarun@innoventia.com', '8400123456', 'Delhi', 'Innovation Consulting', '2025-03-10', '2025-12-31', 'Active'),
(16, 'CityEvents', 'Simran Kaur', 'simran@cityevents.com', '8300123456', 'Hyderabad', 'Event Management', '2025-03-15', '2025-12-31', 'Active'),
(17, 'NeoPrint', 'Abhay Nair', 'abhay@neoprint.com', '8200123456', 'Pune', 'Promotional Printing', '2025-03-20', '2025-12-31', 'Active'),
(18, 'SafeHands', 'Jyoti Rane', 'jyoti@safehands.com', '8100123456', 'Kolkata', 'Office Security', '2025-03-25', '2025-12-31', 'Active'),
(19, 'FuelTech', 'Naveen Raj', 'naveen@fueltech.com', '8000123456', 'Chennai', 'Power backup & Generators', '2025-03-30', '2025-12-31', 'Active'),
(20, 'SmartLogics', 'Ritu Jain', 'ritu@smartlogics.com', '7900123456', 'Mumbai', 'IoT Automation', '2025-04-01', '2025-12-31', 'Active');

-- to display records
select * from Vendors;

-- to remove records from the table
truncate table Vendors;

-- to remove whole table from databse
drop table Vendors;

-- select queries
-- select all vendors located in mumbai
select * from vendors 
where address like '%mumbai%';

-- select top 5 vendors by contract value (assuming based on vendorid here)
select vendorid, vendorname, contractstartdate from vendors order by contractstartdate desc limit 5;

-- select vendors providing services with 'cloud' in their name
select vendorname, servicesprovided from vendors 
where servicesprovided like '%cloud%';

-- count vendors in each city
select address, count(*) as total_vendors from vendors group by address;

-- select vendors whose contract ends after october
select vendorname, contractenddate from vendors 
where contractenddate > '2025-10-01';

-- alter queries
-- add a new column for service rating
alter table vendors 
add column service_rating int default 3;

-- make phone column unique
alter table vendors 
modify column phone varchar(15) unique;

-- rename contractstartdate to contract_begin
alter table vendors 
change column contractstartdate contract_begin date;

-- Rename queries
-- rename table vendors to company_vendors
rename table vendors to company_vendors;

-- rename column vendorid to id
alter table company_vendors 
rename column vendorid to id;

-- rename column vendorname to name
alter table company_vendors 
rename column vendorname to name;

-- rename column contactperson to contact_name
alter table company_vendors 
rename column contactperson to contact_name;

-- rename column contractenddate to contract_end
alter table company_vendors 
rename column contractenddate to contract_end;

-- Delete queries
-- delete all vendors from chennai
delete from company_vendors 
where address like '%chennai%';

-- delete vendors where service rating is less than 3
delete from company_vendors 
where service_rating < 3;

-- delete vendors whose contract ends before september
delete from company_vendors 
where contract_end < '2025-09-01';

-- delete vendors offering 'video editing'
delete from company_vendors 
where servicesprovided = 'Video Editing';

-- update queries
-- update service rating to 5 for all vendors offering 'cybersecurity'
update company_vendors 
set service_rating = 5 
where servicesprovided = 'Cybersecurity';

-- update address to include country
update company_vendors 
set address = concat(address, ', India') 
where address not like '%, India';

-- update contract_end to '2025-12-31' where it is null
update company_vendors 
set contract_end = '2025-12-31' 
where contract_end is null;

-- update service_rating to 3 where not specified (null)
update company_vendors 
set service_rating = 3 
where service_rating is null;

-- Table 22: Meetings 
CREATE TABLE Meetings (
MeetingID INT PRIMARY KEY,
ProjectID INT,
OrganizerID INT,
MeetingDate DATE,
StartTime TIME,
EndTime TIME,
Location VARCHAR(100),
Purpose VARCHAR(100),
MinutesRecorded BOOLEAN,
Status VARCHAR(20),
FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID) 
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (OrganizerID) REFERENCES Consultants(ConsultantID)
ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Meetings VALUES
(1, 1, 1, '2025-07-01', '10:00:00', '11:00:00', 'Conference Room A', 'Kick-off Meeting', TRUE, 'Completed'),
(2, 2, 2, '2025-07-02', '14:00:00', '15:00:00', 'Zoom', 'Client Discussion', TRUE, 'Completed'),
(3, 3, 3, '2025-07-03', '09:30:00', '10:30:00', 'Conference Room B', 'Weekly Sync', FALSE, 'Scheduled'),
(4, 4, 4, '2025-07-04', '15:00:00', '16:00:00', 'Teams', 'Design Review', TRUE, 'Completed'),
(5, 5, 5, '2025-07-05', '11:00:00', '12:00:00', 'Conference Room A', 'Budget Planning', TRUE, 'Completed'),
(6, 6, 6, '2025-07-06', '10:00:00', '11:00:00', 'Google Meet', 'Status Update', FALSE, 'Cancelled'),
(7, 7, 7, '2025-07-07', '13:00:00', '14:00:00', 'Conference Room B', 'Team Briefing', TRUE, 'Completed'),
(8, 8, 8, '2025-07-08', '10:30:00', '11:30:00', 'Zoom', 'Client Feedback', TRUE, 'Completed'),
(9, 9, 9, '2025-07-09', '09:00:00', '10:00:00', 'Teams', 'Roadmap Planning', FALSE, 'Scheduled'),
(10, 10, 10, '2025-07-10', '14:30:00', '15:30:00', 'Conference Room C', 'Strategy Meeting', TRUE, 'Completed'),
(11, 11, 11, '2025-07-11', '10:00:00', '11:00:00', 'Conference Room A', 'Launch Review', TRUE, 'Completed'),
(12, 12, 12, '2025-07-12', '15:00:00', '16:00:00', 'Teams', 'Product Demo', FALSE, 'Scheduled'),
(13, 13, 13, '2025-07-13', '13:00:00', '14:00:00', 'Google Meet', 'Marketing Sync', TRUE, 'Completed'),
(14, 14, 14, '2025-07-14', '10:00:00', '11:00:00', 'Zoom', 'Tech Update', TRUE, 'Completed'),
(15, 15, 15, '2025-07-15', '09:00:00', '10:00:00', 'Conference Room D', 'Audit Meeting', TRUE, 'Completed'),
(16, 16, 16, '2025-07-16', '14:00:00', '15:00:00', 'Teams', 'Policy Review', FALSE, 'Cancelled'),
(17, 17, 17, '2025-07-17', '11:00:00', '12:00:00', 'Zoom', 'Performance Talk', TRUE, 'Completed'),
(18, 18, 18, '2025-07-18', '10:30:00', '11:30:00', 'Conference Room B', 'Vendor Meeting', TRUE, 'Completed'),
(19, 19, 19, '2025-07-19', '09:00:00', '10:00:00', 'Google Meet', 'Partner Call', FALSE, 'Scheduled'),
(20, 20, 20, '2025-07-20', '14:00:00', '15:00:00', 'Teams', 'Wrap-up Session', TRUE, 'Completed');

-- to display records
select * from Meetings ;

-- to remove records from the table
truncate table Meetings ;

-- to remove whole table from databse
drop table Meetings ;

-- Select queries
-- select meetings that are scheduled
select * from meetings 
where status = 'scheduled';

-- select top 5 meetings by start time
select meetingid, meetingdate, starttime from meetings order by starttime asc limit 5;

-- select all meetings held in 'zoom'
select * from meetings 
where location = 'zoom';

-- count meetings per location
select location, count(*) as total_meetings from meetings group by location;

-- select meetings with recorded minutes
select meetingid, purpose from meetings 
where minutesrecorded = true;

-- alter queries
-- add a new column for feedback collected
alter table meetings 
add column feedback_collected boolean default false;

-- make purpose not null
alter table meetings 
modify column purpose varchar(100) not null;

-- add a new column for meeting type
alter table meetings 
add column meeting_type varchar(50) default 'Internal';

-- set default value for status as 'scheduled'
alter table meetings 
alter column status set default 'scheduled';

-- Rename queries
-- rename table meetings to project_meetings
rename table meetings to project_meetings;

-- rename column meetingid to id
alter table project_meetings 
rename column meetingid to id;

-- rename column location to meeting_location
alter table project_meetings 
rename column location to meeting_location;

-- rename column minutesrecorded to minutes_taken
alter table project_meetings 
rename column minutesrecorded to minutes_taken;

-- rename column status to meeting_status
alter table project_meetings 
rename column status to meeting_status;

-- Delete queries
-- delete meetings that are cancelled
delete from project_meetings 
where meeting_status = 'cancelled';

-- delete meetings not held in conference rooms
delete from project_meetings 
where meeting_location not like 'conference room%';

-- delete meetings without recorded minutes
delete from project_meetings 
where minutes_taken = false;

-- delete meetings scheduled after '2025-07-18'
delete from project_meetings 
where meetingdate > '2025-07-18';

-- delete meetings where feedback was not collected
delete from project_meetings where feedback_collected = false;

-- update feedback collected to true for completed meetings
update project_meetings 
set feedback_collected = true 
where meeting_status = 'completed';

-- update meeting type to 'External' for all zoom meetings
update project_meetings 
set meeting_type = 'External' 
where meeting_location = 'zoom';

-- update all null meeting types to 'Internal'
update project_meetings 
set meeting_type = 'Internal' 
where meeting_type is null;

-- update meeting_status to 'archived' for meetings before '2025-07-05'
update project_meetings 
set meeting_status = 'archived' 
where meetingdate < '2025-07-05';

-- update all meetings without minutes to mark meeting_type as 'Briefing'
update project_meetings 
set meeting_type = 'Briefing' 
where minutes_taken = false;

-- Table 23: Evaluations
CREATE TABLE Evaluations (
EvaluationID INT PRIMARY KEY,
ConsultantID INT,
ProjectID INT,
EvaluationDate DATE,
Evaluator VARCHAR(50),
Score DECIMAL(4,2),
Comments TEXT,
Status VARCHAR(20),
FollowUpDate DATE,
Recommendations TEXT,
FOREIGN KEY (ConsultantID) REFERENCES Consultants(ConsultantID)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Evaluations 
VALUES
(1, 1, 1, '2025-07-01', 'Anita Mehta', 8.5, 'Excellent progress', 'Reviewed', '2025-07-15', 'Continue same pace'),
(2, 2, 2, '2025-07-02', 'Rahul Kapoor', 7.8, 'Good communication', 'Reviewed', '2025-07-16', ''),
(3, 3, 3, '2025-07-03', 'Sneha Rao', 6.9, 'Needs more clarity', 'Reviewed', '2025-07-17', 'Provide mentoring'),
(4, 4, 4, '2025-07-04', 'Manish Jain', 9.0, 'Outstanding performer', 'Reviewed', '2025-07-18', ''),
(5, 5, 5, '2025-07-05', 'Neha Patil', 7.0, 'Met expectations', 'Reviewed', '2025-07-19', ''),
(6, 6, 6, '2025-07-06', 'Karan Arora', 5.5, 'Underperformed', 'Pending', NULL, 'Re-evaluate next month'),
(7, 7, 7, '2025-07-07', 'Rita Shah', 8.0, 'Consistent', 'Reviewed', '2025-07-20', ''),
(8, 8, 8, '2025-07-08', 'Mohit Sinha', 6.0, 'Needs improvement', 'Reviewed', '2025-07-21', ''),
(9, 9, 9, '2025-07-09', 'Priya Nair', 9.2, 'Excellent!', 'Reviewed', '2025-07-22', ''),
(10, 10, 10, '2025-07-10', 'Sameer Bhosale', 7.4, 'Fair effort', 'Reviewed', '2025-07-23', ''),
(11, 11, 11, '2025-07-11', 'Dinesh Iyer', 6.5, 'Below average', 'Reviewed', '2025-07-24', 'Training needed'),
(12, 12, 12, '2025-07-12', 'Tanvi Gokhale', 8.3, 'Strong output', 'Reviewed', '2025-07-25', ''),
(13, 13, 13, '2025-07-13', 'Vivek Joshi', 5.9, 'Inconsistent', 'Pending', NULL, ''),
(14, 14, 14, '2025-07-14', 'Anjali Shetty', 7.6, 'Reliable', 'Reviewed', '2025-07-26', ''),
(15, 15, 15, '2025-07-15', 'Ramesh Kumar', 6.8, 'Average', 'Reviewed', '2025-07-27', ''),
(16, 16, 16, '2025-07-16', 'Deepa Deshmukh', 8.1, 'Fast learner', 'Reviewed', '2025-07-28', ''),
(17, 17, 17, '2025-07-17', 'Siddharth Bhatt', 6.3, 'Slow progress', 'Reviewed', '2025-07-29', ''),
(18, 18, 18, '2025-07-18', 'Namrata K.', 9.0, 'Very sharp', 'Reviewed', '2025-07-30', ''),
(19, 19, 19, '2025-07-19', 'Alok Menon', 7.7, 'Consistent improvement', 'Reviewed', '2025-07-31', ''),
(20, 20, 20, '2025-07-20', 'Divya Prasad', 5.5, 'Needs help', 'Pending', NULL, 'Assign coach');

-- to display records
select * from Evaluations ;

-- to remove records from the table
truncate table Evaluations;

-- to remove whole table from databse
drop table Evaluations ;

-- Select queries 
-- select all evaluations with score above 8
select * from evaluations 
where score > 8;

-- select evaluator names and scores for pending evaluations
select evaluator, score from evaluations 
where status = 'pending';

-- select count of evaluations per status
select status, count(*) as total from evaluations group by status;

-- select evaluations without any recommendations
select evaluationid, consultantid from evaluations 
where recommendations = '';

-- select evaluations sorted by evaluation date
select * from evaluations order by evaluationdate desc limit 10;

-- Alter queries
-- add a column for evaluation method
alter table evaluations 
add column method varchar(30) default 'Online';

-- modify evaluator column length to 100 characters
alter table evaluations 
modify column evaluator varchar(100);

-- add a check constraint on score (must be between 0 and 10)
alter table evaluations 
add constraint chk_score check (score between 0 and 10);

-- add a new column for evaluation round
alter table evaluations 
add column round int default 1;

-- set default value of status as 'pending'
alter table evaluations 
alter column status set default 'pending';

-- rename queries
-- rename table evaluations to performance_evaluations
rename table evaluations to performance_evaluations;

-- rename column evaluationid to id
alter table performance_evaluations 
rename column evaluationid to id;

-- rename column comments to feedback
alter table performance_evaluations 
rename column comments to feedback;

-- rename column evaluator to reviewed_by
alter table performance_evaluations 
rename column evaluator to reviewed_by;

-- rename column status to evaluation_status
alter table performance_evaluations 
rename column status to evaluation_status;

-- Delete queries
-- delete evaluations with score below 6
delete from performance_evaluations where score < 6;

-- delete evaluations where follow-up date is null and status is 'pending'
delete from performance_evaluations where followupdate is null and evaluation_status = 'pending';

-- delete evaluations reviewed by 'ramesh kumar'
delete from performance_evaluations where reviewed_by = 'ramesh kumar';

-- delete evaluations without any feedback
delete from performance_evaluations where feedback = '';

-- delete evaluations with no recommendations and score below 7
delete from performance_evaluations where recommendations = '' and score < 7;

-- update queries
-- update method to 'Offline' for scores above 9
update performance_evaluations 
set method = 'offline'
where score > 9;

-- update round to 2 for all reviewed evaluations
update performance_evaluations 
set round = 2 
where evaluation_status = 'reviewed';

-- update reviewed_by for id = 6
update performance_evaluations 
set reviewed_by = 'karan a. arora' 
where id = 6;

-- update feedback for id = 11
update performance_evaluations 
set feedback = 'Performance below average. Training assigned.'
 where id = 11;

-- update evaluation_status to 'archived' for evaluations older than '2025-07-05'
update performance_evaluations 
set evaluation_status = 'archived' 
where evaluationdate < '2025-07-05';

-- Table 24: Expenses
CREATE TABLE Expenses (
ExpenseID INT PRIMARY KEY,
ProjectID INT,
Description TEXT,
Amount DECIMAL(10,2),
ExpenseDate DATE,
SubmittedBy INT,
ApprovedBy INT,
Status VARCHAR(20),
Category VARCHAR(50),
Notes TEXT,
FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (SubmittedBy) REFERENCES Consultants(ConsultantID)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (ApprovedBy) REFERENCES Consultants(ConsultantID)
ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Expenses 
VALUES
(1, 1, 'Server upgrade', 20000.00, '2025-07-01', 1, 1, 'Approved', 'IT Infrastructure', ''),
(2, 2, 'Client dinner', 8500.00, '2025-07-02', 2, 2, 'Approved', 'Entertainment', ''),
(3, 3, 'Travel - Bangalore', 15000.00, '2025-07-03', 3, 3, 'Pending', 'Travel', ''),
(4, 4, 'Design software license', 12000.00, '2025-07-04', 4, 4, 'Approved', 'Software', ''),
(5, 5, 'Stationery', 2000.00, '2025-07-05', 5, 5, 'Approved', 'Office Supplies', ''),
(6, 6, 'Event Hosting', 30000.00, '2025-07-06', 6, 6, 'Pending', 'Marketing', ''),
(7, 7, 'Printer purchase', 9500.00, '2025-07-07', 7, 7, 'Approved', 'Hardware', ''),
(8, 8, 'Team lunch', 7500.00, '2025-07-08', 8, 8, 'Approved', 'Team Engagement', ''),
(9, 9, 'Internet setup', 4500.00, '2025-07-09', 9, 9, 'Pending', 'Utilities', ''),
(10, 10, 'External consultant fee', 25000.00, '2025-07-10', 10, 10, 'Approved', 'Professional Services', ''),
(11, 11, 'Workshop snacks', 3000.00, '2025-07-11', 11, 11, 'Approved', 'Event', ''),
(12, 12, 'Taxi fare', 1800.00, '2025-07-12', 12, 12, 'Pending', 'Travel', ''),
(13, 13, 'Google Ads', 22000.00, '2025-07-13', 13, 13, 'Approved', 'Advertising', ''),
(14, 14, 'Subscription tools', 6000.00, '2025-07-14', 14, 14, 'Approved', 'SaaS', ''),
(15, 15, 'Legal advisory fee', 16000.00, '2025-07-15', 15, 15, 'Approved', 'Legal', ''),
(16, 16, 'Courier services', 1300.00, '2025-07-16', 16, 16, 'Pending', 'Logistics', ''),
(17, 17, 'Market research agency', 18000.00, '2025-07-17', 17, 17, 'Approved', 'Research', ''),
(18, 18, 'Flyers & printing', 4000.00, '2025-07-18', 18, 18, 'Approved', 'Marketing Collateral', ''),
(19, 19, 'Laptop repair', 3500.00, '2025-07-19', 19, 19, 'Pending', 'Maintenance', ''),
(20, 20, 'Video campaign editing', 12500.00, '2025-07-20', 20, 20, 'Approved', 'Creative', '');

-- to display records
select * from Expenses ;

-- to remove records from the table
truncate table Expenses;

-- to remove whole table from databse
drop table Expenses ;

-- Select queries
-- select all approved expenses
select * from expenses 
where status = 'approved';

-- select total expense amount per category
select category, sum(amount) as total_amount from expenses group by category;

-- select top 5 highest expenses
select * from expenses order by amount desc limit 5;

-- select pending expenses submitted after 2025-07-10
select * from expenses 
where status = 'pending' and expensedate > '2025-07-10';

-- select count of expenses per status
select status, count(*) as count from expenses group by status;

-- Alter queries
-- add column payment_mode
alter table expenses 
add column payment_mode varchar(30) default 'Bank Transfer';

-- modify amount column to allow higher value
alter table expenses 
modify column amount decimal(12,2);

-- add column reimbursement_due
alter table expenses 
add column reimbursement_due boolean default false;

-- set default status as 'pending'
alter table expenses 
alter column status set default 'pending';

-- Rename queries
-- rename table expenses to project_expenses
rename table expenses to project_expenses;

-- rename column expenseid to id
alter table project_expenses 
rename column expenseid to id;

-- rename column description to expense_description
alter table project_expenses 
rename column description to expense_description;

-- rename column notes to remarks
alter table project_expenses 
rename column notes to remarks;

-- rename column status to approval_status
alter table project_expenses 
rename column status to approval_status;

-- delete queries
-- delete expenses under ₹2000
delete from project_expenses where amount < 2000;

-- delete expenses submitted by consultant id 10
delete from project_expenses where submittedby = 10;

-- delete rejected or unapproved expenses before 2025-07-05
delete from project_expenses where approval_status = 'pending' and expensedate < '2025-07-05';

-- delete expenses without any remarks
delete from project_expenses where remarks = '';

-- delete travel category expenses above ₹14000
delete from project_expenses where category = 'travel' and amount > 14000;

-- update queries
-- update payment_mode for category 'Legal'
update project_expenses 
set payment_mode = 'Cheque' 
where category = 'legal';

-- update reimbursement_due = true for approved expenses above ₹15000
update project_expenses 
set reimbursement_due = true 
where approval_status = 'approved' and amount > 15000;

-- update expense_description for id = 3
update project_expenses 
set expense_description = 'Flight & hotel - Bangalore visit' 
where id = 3;

-- update approval_status to 'review' for pending entries above ₹10000
update project_expenses 
set approval_status = 'review' 
where approval_status = 'pending' and amount > 10000;

-- update remarks for id = 16
update project_expenses 
set remarks = 'Urgent courier delivery to client' 
where id = 16;

-- Table 25: MarketingCampaigns
CREATE TABLE MarketingCampaigns (
CampaignID INT PRIMARY KEY,
CampaignName VARCHAR(100),
StartDate DATE,
EndDate DATE,
Budget DECIMAL(12,2),
TargetAudience VARCHAR(100),
Status VARCHAR(20),
CreatedBy INT,
Channel VARCHAR(50),
ROI DECIMAL(5,2),
FOREIGN KEY (CreatedBy) REFERENCES Consultants(ConsultantID)
ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO MarketingCampaigns VALUES
(1, 'Digital Launch Blitz', '2025-06-01', '2025-07-01', 150000, 'Young Professionals', 'Active', 1, 'Instagram', 7.5),
(2, 'Email Funnel Sprint', '2025-06-05', '2025-07-05', 80000, 'Corporate Buyers', 'Active', 2, 'Email', 5.2),
(3, 'YouTube Awareness', '2025-06-10', '2025-07-10', 120000, 'Students', 'Completed', 3, 'YouTube', 6.8),
(4, 'Offline Banners Drive', '2025-06-15', '2025-07-15', 90000, 'Walk-in Clients', 'Completed', 4, 'Print', 4.5),
(5, 'Referral Campaign', '2025-06-20', '2025-07-20', 30000, 'Existing Clients', 'Active', 5, 'Email', 8.1),
(6, 'LinkedIn B2B Pitch', '2025-06-25', '2025-07-25', 100000, 'Managers & Founders', 'Paused', 6, 'LinkedIn', 6.2),
(7, 'WhatsApp Blast', '2025-07-01', '2025-07-10', 20000, 'Retail Clients', 'Completed', 7, 'WhatsApp', 3.9),
(8, 'Facebook Re-Target', '2025-07-05', '2025-07-25', 85000, 'Urban Adults', 'Active', 8, 'Facebook', 6.5),
(9, 'Local Ads Campaign', '2025-07-10', '2025-08-10', 45000, 'Nearby Businesses', 'Planned', 9, 'Local Radio', 4.0),
(10, 'Twitter Influencer Boost', '2025-07-15', '2025-08-15', 75000, 'Tech Followers', 'Paused', 10, 'Twitter', 5.9),
(11, 'Google Display Ads', '2025-07-20', '2025-08-20', 95000, 'Blog Readers', 'Active', 11, 'Google', 7.0),
(12, 'Affiliate Campaign', '2025-07-25', '2025-08-25', 60000, 'Affiliate Sites', 'Planned', 12, 'Web Partners', 6.3),
(13, 'Event Sponsorship', '2025-08-01', '2025-08-15', 130000, 'Event Attendees', 'Approved', 13, 'Offline', 5.1),
(14, 'Pinterest Creative Ads', '2025-08-05', '2025-08-25', 30000, 'Artists & Creators', 'Active', 14, 'Pinterest', 4.8),
(15, 'SMS Blast', '2025-08-10', '2025-08-12', 10000, 'All Clients', 'Completed', 15, 'SMS', 3.4),
(16, 'Micro-Influencer Pilot', '2025-08-15', '2025-09-15', 40000, 'Niche Youth Groups', 'Running', 16, 'Instagram', 6.0),
(17, 'In-App Banner Ads', '2025-08-20', '2025-09-20', 70000, 'Mobile Users', 'Active', 17, 'In-App', 5.6),
(18, 'Festival Offer Push', '2025-08-25', '2025-10-01', 110000, 'General Public', 'Upcoming', 18, 'Multi-Channel', 7.8),
(19, 'SEO Optimization', '2025-09-01', '2025-10-01', 50000, 'Search Audiences', 'Planned', 19, 'Google', 5.0),
(20, 'App Store Promo', '2025-09-05', '2025-10-05', 95000, 'App Users', 'Pending', 20, 'App Store', 6.4);

-- to display records
select * from MarketingCampaigns ;

-- to remove records from the table
truncate table MarketingCampaigns;

-- to remove whole table from databse
drop table MarketingCampaigns ;

-- Select queries
-- select all active campaigns
select * from marketingcampaigns 
where status = 'active';

-- select campaigns with roi greater than 6
select campaignname, roi from marketingcampaigns 
where roi > 6;

-- select campaigns created in july
select * from marketingcampaigns 
where month(startdate) = 7;

-- select number of campaigns per status
select status, count(*) as total from marketingcampaigns group by status;

-- alter queries
-- add column impressions to track ad views
alter table marketingcampaigns 
add column impressions int default 0;

-- modify roi to allow more precise values
alter table marketingcampaigns 
modify column roi decimal(6,3);

-- add constraint to ensure roi is non-negative
alter table marketingcampaigns 
add constraint chk_roi check (roi >= 0);

-- add column feedback_score
alter table marketingcampaigns 
add column feedback_score decimal(3,2);

-- set default value for status as 'planned'
alter table marketingcampaigns 
alter column status set default 'planned';

-- rename queries
-- rename table marketingcampaigns to campaigns
rename table marketingcampaigns to campaigns;

-- rename column campaignid to id
alter table campaigns 
rename column campaignid to id;

-- rename column campaignname to name
alter table campaigns 
rename column campaignname to name;

-- rename column targetaudience to audience
alter table campaigns 
rename column targetaudience to audience;

-- rename column createdby to creatorid
alter table campaigns 
rename column createdby to creatorid;

-- Delete queries
-- delete campaigns with roi below 4
delete from campaigns where roi < 4;

-- delete all completed campaigns
delete from campaigns where status = 'completed';

-- delete campaigns that ended before july
delete from campaigns where enddate < '2025-07-01';

-- delete campaigns with empty channel names
delete from campaigns where channel = '';

-- delete campaigns where budget is less than 30000 and roi is below 5
delete from campaigns where budget < 30000 and roi < 5;

-- update queries
-- update impressions for high budget campaigns
update campaigns 
set impressions = 500000 
where budget > 100000;

-- update feedback_score for paused campaigns
update campaigns 
set feedback_score = 4.5 
where status = 'paused';

-- update status to 'closed' for campaigns that ended before august
update campaigns 
set status = 'closed' 
where enddate < '2025-08-01';

-- update channel name from 'sms' to 'bulk sms'
update campaigns 
set channel = 'bulk sms' 
where channel = 'sms';

-- update audience for campaign id 16
update campaigns 
set audience = 'Youth Influencer Network' 
where id = 16;














