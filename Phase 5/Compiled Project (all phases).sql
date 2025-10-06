-- Single line comment 

/* 
multi 
line 
comment
*/
-- ---------------------------------------------- PHASE I ----------------------------------------------------------------------
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

-- --------------------------------------------------- PHASE II -----------------------------------------------------------------------------------
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

drop table campaigns;

-- -------------------------------------------------------- PHASE III -------------------------------------------------------------
-- Use the correct database
USE Consulting_firm_Management;

-- ====================================================================================================
-- TABLE 1: Consultants
-- ====================================================================================================
-- Foreign Keys & Relationships:
-- ConsultantID (PK) -> Timesheets.ConsultantID
-- ConsultantID (PK) -> Tasks.AssignedTo (implicit)

-- ------------------------------
-- 1. JOIN QUERIES
-- ------------------------------

-- INNER JOIN: List consultants and the tasks they are assigned to.
SELECT
    c.FirstName,
    c.LastName,
    t.Taskname
FROM
    Consultants AS c
INNER JOIN
    Tasks AS t ON c.ConsultantID = t.AssignedTo;

-- LEFT JOIN: List all consultants and any tasks they are assigned to. Consultants with no tasks are included.
SELECT
    c.FirstName,
    c.LastName,
    t.TaskName
FROM
    Consultants AS c
LEFT JOIN
    Tasks AS t ON c.ConsultantID = t.AssignedTo;

-- RIGHT JOIN: List all tasks and the consultant assigned to them. Tasks with no consultant (if possible) would be included.
SELECT
    c.FirstName,
    c.LastName,
    t.TaskName
FROM
    Consultants AS c
RIGHT JOIN
    Tasks AS t ON c.ConsultantID = t.AssignedTo;

-- LEFT EXCLUSIVE JOIN: Find consultants who are not assigned to any tasks.
SELECT
    c.FirstName,
    c.LastName
FROM
    Consultants AS c
LEFT JOIN
    Tasks AS t ON c.ConsultantID = t.AssignedTo
WHERE
    t.AssignedTo IS NULL;

-- RIGHT EXCLUSIVE JOIN: Find tasks that have not been assigned to a consultant.
SELECT
    t.TaskName
FROM
    Consultants AS c
RIGHT JOIN
    Tasks AS t ON c.ConsultantID = t.AssignedTo
WHERE
    c.ConsultantID IS NULL;

-- ------------------------------
-- 2. SUBQUERIES
-- ------------------------------

-- Find consultants with a salary above the average salary of all consultants.
SELECT
    FirstName,
    LastName,
    Salary
FROM
    Consultants
WHERE
    Salary > (SELECT AVG(Salary) FROM Consultants);

-- Find consultants who have worked on a project with a 'high' priority.
SELECT
    FirstName,
    LastName
FROM
    Consultants
WHERE
    ConsultantID IN (SELECT AssignedTo FROM Tasks WHERE ProjectID IN (SELECT ProjectID FROM Projects WHERE Priority = 'High'));

-- Find the consultant with the highest experience years.
SELECT
    FirstName,
    LastName,
    ExperienceYears
FROM
    Consultants
WHERE
    ExperienceYears = (SELECT MAX(ExperienceYears) FROM Consultants);

-- Find consultants who have a joining date in 2024.
SELECT
    FirstName,
    LastName
FROM
    Consultants
WHERE
    ConsultantID IN (SELECT ConsultantID FROM Consultants WHERE JoiningDate BETWEEN '2015-01-01' AND '2017-12-31');

-- Select a consultant whose ID is not present in the Timesheets table (i.e., has not logged any time).
SELECT
    FirstName,
    LastName
FROM
    Consultants
WHERE
    NOT EXISTS (SELECT 1 FROM Timesheets WHERE Timesheets.ConsultantID = Consultants.ConsultantID);

-- ------------------------------
-- 3. BUILT-IN FUNCTIONS
-- ------------------------------

-- Count the number of consultants for each specialization.
SELECT
    Specialization,
    COUNT(*) AS NumberOfConsultants
FROM
    Consultants
GROUP BY
    Specialization;

-- Calculate the average salary of all active consultants.
SELECT
    AVG(Salary) AS AverageSalary
FROM
    Consultants
WHERE
    Status = 'Active';

-- Find the total number of years of experience of all consultants.
SELECT
    SUM(ExperienceYears) AS TotalExperience
FROM
    Consultants;

-- Get the full name of a consultant in a single column.
SELECT
    CONCAT(FirstName, ' ', LastName) AS FullName
FROM
    Consultants;

-- Find the number of days a consultant has been with the firm.
SELECT
    FirstName,
    LastName,
    DATEDIFF(CURDATE(), JoiningDate) AS DaysSinceJoining
FROM
    Consultants;

-- ------------------------------
-- 4. USER-DEFINED FUNCTIONS
-- ------------------------------

-- A UDF to get the full name of a consultant by their ID.
DELIMITER //
CREATE FUNCTION GetConsultantFullName(consultantId INT)
RETURNS VARCHAR(255)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE fullName VARCHAR(255);
    SELECT CONCAT(FirstName, ' ', LastName) INTO fullName
    FROM Consultants
    WHERE ConsultantID = consultantId;
    RETURN fullName;
END //
DELIMITER ;

-- A UDF to calculate a consultant's years of experience based on joining date.
DELIMITER //
CREATE FUNCTION GetConsultantExperienceInYears(consultantId INT)
RETURNS INT
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE joiningDate DATE;
    DECLARE years INT;
    SELECT JoiningDate INTO joiningDate FROM Consultants WHERE ConsultantID = consultantId;
    SET years = DATEDIFF(CURDATE(), joiningDate) / 365;
    RETURN years;
END //
DELIMITER ;

-- A UDF to check if a consultant is a 'Senior' consultant (10+ years experience).
DELIMITER //
CREATE FUNCTION IsSeniorConsultant(consultantId INT)
RETURNS VARCHAR(10)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE exp_years INT;
    SELECT ExperienceYears INTO exp_years FROM Consultants WHERE ConsultantID = consultantId;
    IF exp_years >= 10 THEN
        RETURN 'Yes';
    ELSE
        RETURN 'No';
    END IF;
END //
DELIMITER ;

-- A UDF to get the total salary of consultants in a specific specialization.
DELIMITER //
CREATE FUNCTION GetTotalSalaryBySpecialization(specialization_name VARCHAR(255))
RETURNS DECIMAL(10, 2)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE total_salary DECIMAL(10, 2);
    SELECT SUM(Salary) INTO total_salary FROM Consultants WHERE Specialization = specialization_name;
    RETURN total_salary;
END //
DELIMITER ;

-- A UDF to get the email address of a consultant by their ID.
DELIMITER //
CREATE FUNCTION GetConsultantEmail(consultantId INT)
RETURNS VARCHAR(255)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE email_address VARCHAR(255);
    SELECT Email INTO email_address
    FROM Consultants
    WHERE ConsultantID = consultantId;
    RETURN email_address;
END //
DELIMITER ;

-- Clean up the functions after use
DROP FUNCTION IF EXISTS GetConsultantFullName;
DROP FUNCTION IF EXISTS GetConsultantExperienceInYears;
DROP FUNCTION IF EXISTS IsSeniorConsultant;
DROP FUNCTION IF EXISTS GetTotalSalaryBySpecialization;
DROP FUNCTION IF EXISTS GetConsultantEmail;

-- ====================================================================================================
-- TABLE 2: Clients
-- ====================================================================================================

-- Foreign Keys & Relationships:
-- ClientID (PK) -> Projects.ClientID
-- ClientID (PK) -> Invoices.ClientID

-- ------------------------------
-- 1. JOIN QUERIES
-- ------------------------------

-- INNER JOIN: List clients and the projects they have commissioned.
SELECT
    cl.CompanyName,
    p.ProjectName
FROM
    Clients AS cl
INNER JOIN
    Projects AS p ON cl.ClientID = p.ClientID;

-- LEFT JOIN: List all clients and any projects they have. Clients with no projects are included.
SELECT
    cl.CompanyName,
    p.ProjectName
FROM
    Clients AS cl
LEFT JOIN
    Projects AS p ON cl.ClientID = p.ClientID;

-- RIGHT JOIN: List all projects and the client who commissioned them. Projects with no client would be included.
SELECT
    cl.CompanyName,
    p.ProjectName
FROM
    Clients AS cl
RIGHT JOIN
    Projects AS p ON cl.ClientID = p.ClientID;

-- LEFT EXCLUSIVE JOIN: Find clients who have not commissioned any projects.
SELECT
    cl.CompanyName
FROM
    Clients AS cl
LEFT JOIN
    Projects AS p ON cl.ClientID = p.ClientID
WHERE
    p.ProjectID IS NULL;

-- RIGHT EXCLUSIVE JOIN: Find projects that are not associated with any client.
SELECT
    p.ProjectName
FROM
    Clients AS cl
RIGHT JOIN
    Projects AS p ON cl.ClientID = p.ClientID
WHERE
    cl.ClientID IS NULL;

-- ------------------------------
-- 2. SUBQUERIES
-- ------------------------------

-- Find clients who have a project with a budget over $100,000.
SELECT
    CompanyName
FROM
    Clients
WHERE
    ClientID IN (SELECT ClientID FROM Projects WHERE Budget > 100000);

-- Find the client with the most registered projects.
SELECT
    CompanyName
FROM
    Clients
WHERE
    ClientID = (SELECT ClientID FROM Projects GROUP BY ClientID ORDER BY COUNT(*) DESC LIMIT 1);

-- Find clients whose registration date is earlier than a specific date.
SELECT
    CompanyName,
    RegistrationDate
FROM
    Clients
WHERE
    RegistrationDate < (SELECT MIN(StartDate) FROM Projects);

-- Find clients with a status of 'Active'.
SELECT
    CompanyName
FROM
    Clients
WHERE
    Status = (SELECT DISTINCT Status FROM Clients WHERE Status = 'Active');

-- Find clients who have an invoice with a total amount greater than a specific value.
SELECT
    CompanyName
FROM
    Clients
WHERE
    ClientID IN (SELECT ClientID FROM Invoices WHERE TotalAmount > 50000);

-- ------------------------------
-- 3. BUILT-IN FUNCTIONS
-- ------------------------------

-- Count the number of clients in each industry.
SELECT
    Industry,
    COUNT(*) AS NumberOfClients
FROM
    Clients
GROUP BY
    Industry;

-- Find the oldest client registration date.
SELECT
    MIN(RegistrationDate) AS OldestRegistrationDate
FROM
    Clients;

-- Find the client with the longest company name.
SELECT
    CompanyName
FROM
    Clients
ORDER BY
    LENGTH(CompanyName) DESC
LIMIT 1;

-- Get the contact person's name in uppercase.
SELECT
    UPPER(ContactPerson) AS UpperCaseContact
FROM
    Clients;

-- Extract the year from the registration date.
SELECT
    CompanyName,
    YEAR(RegistrationDate) AS RegistrationYear
FROM
    Clients;

-- ------------------------------
-- 4. USER-DEFINED FUNCTIONS
-- ------------------------------

-- A UDF to get the total number of projects for a given client ID.
DELIMITER //
CREATE FUNCTION GetTotalProjectsForClient(clientId INT)
RETURNS INT
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE total_projects INT;
    SELECT COUNT(*) INTO total_projects FROM Projects WHERE ClientID = clientId;
    RETURN total_projects;
END //
DELIMITER ;

-- A UDF to get the industry of a client by their ID.
DELIMITER //
CREATE FUNCTION GetClientIndustry(clientId INT)
RETURNS VARCHAR(255)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE industry_name VARCHAR(255);
    SELECT Industry INTO industry_name FROM Clients WHERE ClientID = clientId;
    RETURN industry_name;
END //
DELIMITER ;

-- A UDF to get the city of a client by their ID.
DELIMITER //
CREATE FUNCTION GetClientCity(clientId INT)
RETURNS VARCHAR(255)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE client_city VARCHAR(255);
    SELECT City INTO client_city FROM Clients WHERE ClientID = clientId;
    RETURN client_city;
END //
DELIMITER ;

-- A UDF to check if a client has 'tech' in their industry name.
DELIMITER //
CREATE FUNCTION IsTechClient(clientId INT)
RETURNS VARCHAR(10)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE industry_name VARCHAR(255);
    SELECT Industry INTO industry_name FROM Clients WHERE ClientID = clientId;
    IF industry_name LIKE '%Tech%' THEN
        RETURN 'Yes';
    ELSE
        RETURN 'No';
    END IF;
END //
DELIMITER ;

-- A UDF to get the full address of a client by their ID.
DELIMITER //
CREATE FUNCTION GetClientFullAddress(clientId INT)
RETURNS VARCHAR(500)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE full_address VARCHAR(500);
    SELECT CONCAT(Address, ', ', City) INTO full_address FROM Clients WHERE ClientID = clientId;
    RETURN full_address;
END //
DELIMITER ;

-- Clean up the functions after use
DROP FUNCTION IF EXISTS GetTotalProjectsForClient;
DROP FUNCTION IF EXISTS GetClientIndustry;
DROP FUNCTION IF EXISTS GetClientCity;
DROP FUNCTION IF EXISTS IsTechClient;
DROP FUNCTION IF EXISTS GetClientFullAddress;

-- ====================================================================================================
-- TABLE 3: Projects
-- ====================================================================================================

-- Foreign Keys & Relationships:
-- ProjectID (PK) -> Tasks.ProjectID
-- ClientID (FK) -> Clients.ClientID
-- ProjectManagerID (FK) -> Consultants.ConsultantID

-- ------------------------------
-- 1. JOIN QUERIES
-- ------------------------------

-- INNER JOIN: List all projects with their assigned client company name.
SELECT
    p.ProjectName,
    c.CompanyName
FROM
    Projects AS p
INNER JOIN
    Clients AS c ON p.ClientID = c.ClientID;

-- LEFT JOIN: List all projects and their client company name. Projects with no client would be included.
SELECT
    p.ProjectName,
    c.CompanyName
FROM
    Projects AS p
LEFT JOIN
    Clients AS c ON p.ClientID = c.ClientID;

-- RIGHT JOIN: List all clients and any projects they have. Clients with no projects would be included.
SELECT
    p.ProjectName,
    c.CompanyName
FROM
    Projects AS p
RIGHT JOIN
    Clients AS c ON p.ClientID = c.ClientID;

-- LEFT EXCLUSIVE JOIN: Find projects that do not have an associated client.
SELECT
    p.ProjectName
FROM
    Projects AS p
LEFT JOIN
    Clients AS c ON p.ClientID = c.ClientID
WHERE
    c.ClientID IS NULL;

-- RIGHT EXCLUSIVE JOIN: Find clients who do not have any projects.
SELECT
    c.CompanyName
FROM
    Projects AS p
RIGHT JOIN
    Clients AS c ON p.ClientID = c.ClientID
WHERE
    p.ProjectID IS NULL;

-- ------------------------------
-- 2. SUBQUERIES
-- ------------------------------

-- Find projects with a budget greater than the average budget of all projects.
SELECT
    ProjectName,
    Budget
FROM
    Projects
WHERE
    Budget > (SELECT AVG(Budget) FROM Projects);

-- Find projects that have at least one task with a status of 'In Progress'.
SELECT
    ProjectName
FROM
    Projects
WHERE
    ProjectID IN (SELECT ProjectID FROM Tasks WHERE Status = 'In Progress');

-- Find the project with the lowest budget.
SELECT
    ProjectName
FROM
    Projects
WHERE
    Budget = (SELECT MIN(Budget) FROM Projects);

-- Find all projects managBudgeted by a specific consultant (e.g., ConsultantID = 101).
SELECT
    ProjectName
FROM
    Projects
WHERE
    ProjectManagerName = (SELECT ConsultantID FROM Consultants WHERE ConsultantID = 101);

-- Find projects that have a start date in the past.
SELECT
    ProjectName
FROM
    Projects
WHERE
    StartDate < (SELECT CURDATE());

-- ------------------------------
-- 3. BUILT-IN FUNCTIONS
-- ------------------------------

-- Count the number of projects for each status.
SELECT
    Status,
    COUNT(*) AS NumberOfProjects
FROM
    Projects
GROUP BY
    Status;

-- Calculate the total budget for all 'In Progress' projects.
SELECT
    SUM(Budget) AS TotalInProgressBudget
FROM
    Projects
WHERE
    Status = 'In Progress';

-- Find the average budget for 'High' priority projects.
SELECT
    AVG(Budget) AS AverageHighPriorityBudget
FROM
    Projects
WHERE
    Priority = 'High';

-- Get the month and year of a project's start date.
SELECT
    ProjectName,
    DATE_FORMAT(StartDate, '%Y-%m') AS StartMonthYear
FROM
    Projects;

-- Find the number of days a project has been running.
SELECT
    ProjectName,
    DATEDIFF(CURDATE(), StartDate) AS DaysRunning
FROM
    Projects;

-- ------------------------------
-- 4. USER-DEFINED FUNCTIONS
-- ------------------------------

-- A UDF to get the client's company name for a given project ID.
DELIMITER //
CREATE FUNCTION GetClientCompanyNameForProject(projectId INT)
RETURNS VARCHAR(255)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE clientName VARCHAR(255);
    SELECT c.CompanyName INTO clientName
    FROM Projects AS p
    JOIN Clients AS c ON p.ClientID = c.ClientID
    WHERE p.ProjectID = projectId;
    RETURN clientName;
END //
DELIMITER ;

-- A UDF to get the total number of tasks for a project.
DELIMITER //
CREATE FUNCTION GetTotalTasksForProject(projectId INT)
RETURNS INT
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE taskCount INT;
    SELECT COUNT(*) INTO taskCount FROM Tasks WHERE ProjectID = projectId;
    RETURN taskCount;
END //
DELIMITER ;

-- A UDF to check if a project is overdue.
DELIMITER //
CREATE FUNCTION IsProjectOverdue(projectId INT)
RETURNS VARCHAR(10)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE deadline_date DATE;
    DECLARE is_overdue VARCHAR(10);
    SELECT EndDate INTO deadline_date FROM Projects WHERE ProjectID = projectId;
    IF CURDATE() > deadline_date THEN
        SET is_overdue = 'Yes';
    ELSE
        SET is_overdue = 'No';
    END IF;
    RETURN is_overdue;
END //
DELIMITER ;

-- A UDF to calculate the budget spent per day for a project.
DELIMITER //
CREATE FUNCTION CalculateDailyBudget(projectId INT)
RETURNS DECIMAL(10, 2)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE project_budget DECIMAL(10, 2);
    DECLARE days_duration INT;
    DECLARE daily_budget DECIMAL(10, 2);
    SELECT Budget, DATEDIFF(EndDate, StartDate) INTO project_budget, days_duration FROM Projects WHERE ProjectID = projectId;
    IF days_duration > 0 THEN
        SET daily_budget = project_budget / days_duration;
    ELSE
        SET daily_budget = 0;
    END IF;
    RETURN daily_budget;
END //
DELIMITER ;

-- A UDF to get the project manager's name by a project ID.
DELIMITER //
CREATE FUNCTION GetProjectManagerName(projectId INT)
RETURNS VARCHAR(255)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE manager_name VARCHAR(255);
    SELECT CONCAT(c.FirstName, ' ', c.LastName) INTO manager_name
    FROM Projects AS p
    JOIN Consultants AS c ON p.ProjectManagerID = c.ConsultantID
    WHERE p.ProjectID = projectId;
    RETURN manager_name;
END //
DELIMITER ;

-- Clean up the functions after use
DROP FUNCTION IF EXISTS GetClientCompanyNameForProject;
DROP FUNCTION IF EXISTS GetTotalTasksForProject;
DROP FUNCTION IF EXISTS IsProjectOverdue;
DROP FUNCTION IF EXISTS CalculateDailyBudget;
DROP FUNCTION IF EXISTS GetProjectManagerName;

-- ====================================================================================================
-- TABLE 4: Departments
-- ====================================================================================================

-- Foreign Keys & Relationships:
-- DepartmentID (PK) -> (no direct FK in other tables based on the schema)
-- ManagerID (FK) -> Consultants.ConsultantID (assumed)

-- ------------------------------
-- 1. JOIN QUERIES
-- ------------------------------

-- INNER JOIN: List all departments with their assigned manager.
SELECT
    d.DepartmentName,
    c.FirstName,
    c.LastName
FROM
    Departments AS d
INNER JOIN
    Consultants AS c ON d.ManagerID = c.ConsultantID;

-- LEFT JOIN: List all departments and their manager, including departments with no assigned manager.
SELECT
    d.DepartmentName,
    c.FirstName,
    c.LastName
FROM
    Departments AS d
LEFT JOIN
    Consultants AS c ON d.ManagerID = c.ConsultantID;

-- RIGHT JOIN: List all consultants and any department they manage, including consultants who are not managers.
SELECT
    d.DepartmentName,
    c.FirstName,
    c.LastName
FROM
    Departments AS d
RIGHT JOIN
    Consultants AS c ON d.ManagerID = c.ConsultantID;

-- LEFT EXCLUSIVE JOIN: Find departments that do not have an assigned manager.
SELECT
    d.DepartmentName
FROM
    Departments AS d
LEFT JOIN
    Consultants AS c ON d.ManagerID = c.ConsultantID
WHERE
    c.ConsultantID IS NULL;

-- RIGHT EXCLUSIVE JOIN: Find consultants who are not managing any department.
SELECT
    c.FirstName,
    c.LastName
FROM
    Departments AS d
RIGHT JOIN
    Consultants AS c ON d.ManagerID = c.ConsultantID
WHERE
    d.DepartmentID IS NULL;

-- ------------------------------
-- 2. SUBQUERIES
-- ------------------------------

-- Find departments with a budget greater than the total budget of a specific department (e.g., 'Finance').
SELECT
    DepartmentName
FROM
    Departments
WHERE
    Budget > (SELECT Budget FROM Departments WHERE DepartmentName = 'Finance');

-- Find departments with more than 10 employees.
SELECT
    DepartmentName
FROM
    Departments
WHERE
    NumberOfEmployees > (SELECT MIN(NumberOfEmployees) FROM Departments WHERE NumberOfEmployees > 10);

-- Find the department with the highest number of employees.
SELECT
    DepartmentName
FROM
    Departments
WHERE
    NumberOfEmployees = (SELECT MAX(NumberOfEmployees) FROM Departments);

-- Find departments created in 2024.
SELECT
    DepartmentName
FROM
    Departments
WHERE
    CreatedDate BETWEEN '2024-01-01' AND '2024-12-31';

-- Find departments managed by a consultant with 'Senior' status (assumed).
SELECT
    DepartmentName
FROM
    Departments
WHERE
    ManagerID IN (SELECT ConsultantID FROM Consultants WHERE Specialization LIKE '%Senior%');

-- ------------------------------
-- 3. BUILT-IN FUNCTIONS
-- ------------------------------

-- Count the total number of employees across all departments.
SELECT
    SUM(NumberOfEmployees) AS TotalEmployees
FROM
    Departments;

-- Find the average budget per department.
SELECT
    AVG(Budget) AS AverageDepartmentBudget
FROM
    Departments;

-- Get the department name in lowercase.
SELECT
    LOWER(DepartmentName) AS LowercaseName
FROM
    Departments;

-- Find the number of days since a department was created.
SELECT
    DepartmentName,
    DATEDIFF(CURDATE(), CreatedDate) AS DaysSinceCreation
FROM
    Departments;

-- Check if a department's status is 'Active'.
SELECT
    DepartmentName,
    IF(Status = 'Active', 'Yes', 'No') AS IsActive
FROM
    Departments;

-- ------------------------------
-- 4. USER-DEFINED FUNCTIONS
-- ------------------------------

-- A UDF to get the total budget for a specific department.
DELIMITER //
CREATE FUNCTION GetDepartmentBudget(departmentId INT)
RETURNS DECIMAL(10, 2)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE dept_budget DECIMAL(10, 2);
    SELECT Budget INTO dept_budget FROM Departments WHERE DepartmentID = departmentId;
    RETURN dept_budget;
END //
DELIMITER ;

-- A UDF to get the number of employees in a department by its name.
DELIMITER //
CREATE FUNCTION GetEmployeeCountByDepartment(deptName VARCHAR(255))
RETURNS INT
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE num_employees INT;
    SELECT NumberOfEmployees INTO num_employees FROM Departments WHERE DepartmentName = deptName;
    RETURN num_employees;
END //
DELIMITER ;

-- A UDF to get the manager's name for a given department ID.
DELIMITER //
CREATE FUNCTION GetDepartmentManagerName(departmentId INT)
RETURNS VARCHAR(255)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE manager_name VARCHAR(255);
    SELECT CONCAT(c.FirstName, ' ', c.LastName) INTO manager_name
    FROM Departments AS d
    JOIN Consultants AS c ON d.ManagerID = c.ConsultantID
    WHERE d.DepartmentID = departmentId;
    RETURN manager_name;
END //
DELIMITER ;

-- A UDF to check if a department is considered 'Large' (more than 20 employees).
DELIMITER //
CREATE FUNCTION IsLargeDepartment(departmentId INT)
RETURNS VARCHAR(10)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE num_employees INT;
    SELECT NumberOfEmployees INTO num_employees FROM Departments WHERE DepartmentID = departmentId;
    IF num_employees > 20 THEN
        RETURN 'Yes';
    ELSE
        RETURN 'No';
    END IF;
END //
DELIMITER ;

-- A UDF to get the location of a department by its name.
DELIMITER //
CREATE FUNCTION GetDepartmentLocation(deptName VARCHAR(255))
RETURNS VARCHAR(255)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE dept_location VARCHAR(255);
    SELECT Location INTO dept_location FROM Departments WHERE DepartmentName = deptName;
    RETURN dept_location;
END //
DELIMITER ;

-- Clean up the functions after use
DROP FUNCTION IF EXISTS GetDepartmentBudget;
DROP FUNCTION IF EXISTS GetEmployeeCountByDepartment;
DROP FUNCTION IF EXISTS GetDepartmentManagerName;
DROP FUNCTION IF EXISTS IsLargeDepartment;
DROP FUNCTION IF EXISTS GetDepartmentLocation;

-- ====================================================================================================
-- TABLE 5: Tasks
-- ====================================================================================================

-- Foreign Keys & Relationships:
-- TaskID (PK) -> Timesheets.TaskID
-- ProjectID (FK) -> Projects.ProjectID
-- AssignedTo (FK) -> Consultants.ConsultantID

-- ------------------------------
-- 1. JOIN QUERIES
-- ------------------------------

-- INNER JOIN: List tasks and the projects they belong to.
SELECT
    t.TaskName,
    p.ProjectName
FROM
    Tasks AS t
INNER JOIN
    Projects AS p ON t.ProjectID = p.ProjectID;

-- LEFT JOIN: List all tasks and their project, including tasks that may not have a project.
SELECT
    t.TaskName,
    p.ProjectName
FROM
    Tasks AS t
LEFT JOIN
    Projects AS p ON t.ProjectID = p.ProjectID;

-- RIGHT JOIN: List all projects and any tasks assigned to them. Projects with no tasks are included.
SELECT
    t.TaskName,
    p.ProjectName
FROM
    Tasks AS t
RIGHT JOIN
    Projects AS p ON t.ProjectID = p.ProjectID;

-- LEFT EXCLUSIVE JOIN: Find tasks that do not belong to any project.
SELECT
    t.TaskName
FROM
    Tasks AS t
LEFT JOIN
    Projects AS p ON t.ProjectID = p.ProjectID
WHERE
    p.ProjectID IS NULL;

-- RIGHT EXCLUSIVE JOIN: Find projects that have no tasks assigned to them.
SELECT
    p.ProjectName
FROM
    Tasks AS t
RIGHT JOIN
    Projects AS p ON t.ProjectID = p.ProjectID
WHERE
    t.TaskID IS NULL;

-- ------------------------------
-- 2. SUBQUERIES
-- ------------------------------

-- Find tasks with more logged hours than a specific task (e.g., TaskID = 100).
SELECT
    TaskName,
    HoursLogged
FROM
    Tasks
WHERE
    HoursLogged > (SELECT HoursLogged FROM Tasks WHERE TaskID = 100);

-- Find tasks for projects with a 'High' priority.
SELECT
    TaskName
FROM
    Tasks
WHERE
    ProjectID IN (SELECT ProjectID FROM Projects WHERE Priority = 'High');

-- Find tasks that are assigned to consultants with more than 5 years of experience.
SELECT
    TaskName
FROM
    Tasks
WHERE
    AssignedTo IN (SELECT ConsultantID FROM Consultants WHERE ExperienceYears > 5);

-- Find the task with the longest description.
SELECT
    TaskName
FROM
    Tasks
WHERE
    LENGTH(Description) = (SELECT MAX(LENGTH(Description)) FROM Tasks);

-- Find tasks that are not yet completed.
SELECT
    TaskName
FROM
    Tasks
WHERE
    Status <> 'Completed';

-- ------------------------------
-- 3. BUILT-IN FUNCTIONS
-- ------------------------------

-- Count the number of tasks for each priority level.
SELECT
    Priority,
    COUNT(*) AS NumberOfTasks
FROM
    Tasks
GROUP BY
    Priority;

-- Calculate the total hours logged for 'In Progress' tasks.
SELECT
    SUM(HoursLogged) AS TotalHoursLogged
FROM
    Tasks
WHERE
    Status = 'In Progress';

-- Find the average hours logged per task.
SELECT
    AVG(HoursLogged) AS AverageHoursLogged
FROM
    Tasks;

-- Get the deadline month and year for all tasks.
SELECT
    TaskName,
    DATE_FORMAT(Deadline, '%Y-%m') AS DeadlineMonthYear
FROM
    Tasks;

-- Find the difference in days between the start date and deadline.
SELECT
    TaskName,
    DATEDIFF(Deadline, StartDate) AS DaysToComplete
FROM
    Tasks;

-- ------------------------------
-- 4. USER-DEFINED FUNCTIONS
-- ------------------------------

-- A UDF to check if a task is overdue.
DELIMITER //
CREATE FUNCTION IsTaskOverdue(taskId INT)
RETURNS VARCHAR(10)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE deadline_date DATE;
    SELECT Deadline INTO deadline_date FROM Tasks WHERE TaskID = taskId;
    IF CURDATE() > deadline_date AND Status <> 'Completed' THEN
        RETURN 'Yes';
    ELSE
        RETURN 'No';
    END IF;
END //
DELIMITER ;

-- A UDF to get the assigned consultant's full name for a task.
DELIMITER //
CREATE FUNCTION GetAssignedConsultantName(taskId INT)
RETURNS VARCHAR(255)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE consultant_name VARCHAR(255);
    SELECT CONCAT(c.FirstName, ' ', c.LastName) INTO consultant_name
    FROM Tasks AS t
    JOIN Consultants AS c ON t.AssignedTo = c.ConsultantID
    WHERE t.TaskID = taskId;
    RETURN consultant_name;
END //
DELIMITER ;

-- A UDF to get the project name for a given task ID.
DELIMITER //
CREATE FUNCTION GetTaskProjectName(taskId INT)
RETURNS VARCHAR(255)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE project_name VARCHAR(255);
    SELECT p.ProjectName INTO project_name
    FROM Tasks AS t
    JOIN Projects AS p ON t.ProjectID = p.ProjectID
    WHERE t.TaskID = taskId;
    RETURN project_name;
END //
DELIMITER ;

-- A UDF to get the total hours logged for a task by its name.
DELIMITER //
CREATE FUNCTION GetTaskHoursLogged(taskName VARCHAR(255))
RETURNS INT
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE total_hours INT;
    SELECT HoursLogged INTO total_hours FROM Tasks WHERE TaskName = taskName;
    RETURN total_hours;
END //
DELIMITER ;

-- A UDF to get the priority of a task by its ID.
DELIMITER //
CREATE FUNCTION GetTaskPriority(taskId INT)
RETURNS VARCHAR(50)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE task_priority VARCHAR(50);
    SELECT Priority INTO task_priority FROM Tasks WHERE TaskID = taskId;
    RETURN task_priority;
END //
DELIMITER ;

-- Clean up the functions after use
DROP FUNCTION IF EXISTS IsTaskOverdue;
DROP FUNCTION IF EXISTS GetAssignedConsultantName;
DROP FUNCTION IF EXISTS GetTaskProjectName;
DROP FUNCTION IF EXISTS GetTaskHoursLogged;
DROP FUNCTION IF EXISTS GetTaskPriority;

-- ====================================================================================================
-- TABLE 6: Timesheets
-- ====================================================================================================

-- Foreign Keys & Relationships:
-- TimesheetID (PK) -> (no direct FK in other tables)
-- ConsultantID (FK) -> Consultants.ConsultantID
-- ProjectID (FK) -> Projects.ProjectID
-- TaskID (FK) -> Tasks.TaskID

-- ------------------------------
-- 1. JOIN QUERIES
-- ------------------------------

-- INNER JOIN: List timesheet entries with consultant and project names.
SELECT
    t.Date,
    t.HoursWorked,
    c.FirstName,
    c.LastName,
    p.ProjectName
FROM
    Timesheets AS t
INNER JOIN
    Consultants AS c ON t.ConsultantID = c.ConsultantID
INNER JOIN
    Projects AS p ON t.ProjectID = p.ProjectID;

-- LEFT JOIN: List all timesheet entries and their corresponding project name.
SELECT
    t.Date,
    t.HoursWorked,
    p.ProjectName
FROM
    Timesheets AS t
LEFT JOIN
    Projects AS p ON t.ProjectID = p.ProjectID;

-- RIGHT JOIN: List all projects and any timesheet entries logged against them.
SELECT
    t.Date,
    t.HoursWorked,
    p.ProjectName
FROM
    Timesheets AS t
RIGHT JOIN
    Projects AS p ON t.ProjectID = p.ProjectID;

-- LEFT EXCLUSIVE JOIN: Find timesheet entries that do not have a corresponding task.
SELECT
    t.TimesheetID
FROM
    Timesheets AS t
LEFT JOIN
    Tasks AS ts ON t.TaskID = ts.TaskID
WHERE
    ts.TaskID IS NULL;

-- RIGHT EXCLUSIVE JOIN: Find projects that have no timesheet entries logged against them.
SELECT
    p.ProjectName
FROM
    Timesheets AS t
RIGHT JOIN
    Projects AS p ON t.ProjectID = p.ProjectID
WHERE
    t.TimesheetID IS NULL;

-- ------------------------------
-- 2. SUBQUERIES
-- ------------------------------

-- Find timesheets submitted by a consultant with a specific specialization.
SELECT
    TimesheetID,
    Date
FROM
    Timesheets
WHERE
    ConsultantID IN (SELECT ConsultantID FROM Consultants WHERE Specialization = 'IT');

-- Find the timesheet entry with the highest number of hours worked.
SELECT
    TimesheetID,
    HoursWorked
FROM
    Timesheets
WHERE
    HoursWorked = (SELECT MAX(HoursWorked) FROM Timesheets);

-- Find timesheets for projects with a budget greater than $50,000.
SELECT
    TimesheetID
FROM
    Timesheets
WHERE
    ProjectID IN (SELECT ProjectID FROM Projects WHERE Budget > 50000);

-- Find timesheets where the hours worked are below the average.
SELECT
    TimesheetID,
    HoursWorked
FROM
    Timesheets
WHERE
    HoursWorked < (SELECT AVG(HoursWorked) FROM Timesheets);

-- Find the timesheets that were submitted on the same date as a specific project's start date.
SELECT
    TimesheetID
FROM
    Timesheets
WHERE
    Date IN (SELECT StartDate FROM Projects WHERE ProjectID = 10);

-- ------------------------------
-- 3. BUILT-IN FUNCTIONS
-- ------------------------------

-- Count the number of timesheet entries per consultant.
SELECT
    ConsultantID,
    COUNT(*) AS NumberOfEntries
FROM
    Timesheets
GROUP BY
    ConsultantID;

-- Calculate the total hours worked across all timesheet entries.
SELECT
    SUM(HoursWorked) AS TotalHoursWorked
FROM
    Timesheets;

-- Find the average hours worked per entry.
SELECT
    AVG(HoursWorked) AS AverageHoursWorked
FROM
    Timesheets;

-- Get the difference in days between submitted and approval dates.
SELECT
    TimesheetID,
    DATEDIFF(ApprovalDate, SubmittedDate) AS ApprovalTimeInDays
FROM
    Timesheets;

-- Extract the month from the timesheet date.
SELECT
    TimesheetID,
    MONTH(Date) AS EntryMonth
FROM
    Timesheets;

-- ------------------------------
-- 4. USER-DEFINED FUNCTIONS
-- ------------------------------

-- A UDF to get the total hours worked by a specific consultant.
DELIMITER //
CREATE FUNCTION GetTotalConsultantHours(consultantId INT)
RETURNS DECIMAL(10, 2)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE total_hours DECIMAL(10, 2);
    SELECT SUM(HoursWorked) INTO total_hours FROM Timesheets WHERE ConsultantID = consultantId;
    RETURN total_hours;
END //
DELIMITER ;

-- A UDF to get the project name for a given timesheet ID.
DELIMITER //
CREATE FUNCTION GetProjectNameForTimesheet(timesheetId INT)
RETURNS VARCHAR(255)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE project_name VARCHAR(255);
    SELECT p.ProjectName INTO project_name
    FROM Timesheets AS t
    JOIN Projects AS p ON t.ProjectID = p.ProjectID
    WHERE t.TimesheetID = timesheetId;
    RETURN project_name;
END //
DELIMITER ;

-- A UDF to check if a timesheet was submitted late (after its project's end date).
DELIMITER //
CREATE FUNCTION IsTimesheetSubmittedLate(timesheetId INT)
RETURNS VARCHAR(10)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE submitted_date DATE;
    DECLARE end_date DATE;
    SELECT t.SubmittedDate, p.EndDate INTO submitted_date, end_date
    FROM Timesheets AS t
    JOIN Projects AS p ON t.ProjectID = p.ProjectID
    WHERE t.TimesheetID = timesheetId;
    IF submitted_date > end_date THEN
        RETURN 'Yes';
    ELSE
        RETURN 'No';
    END IF;
END //
DELIMITER ;

-- A UDF to get the number of hours worked on a specific task within a timesheet.
DELIMITER //
CREATE FUNCTION GetHoursForTaskInTimesheet(timesheetId INT)
RETURNS DECIMAL(5, 2)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE hours DECIMAL(5, 2);
    SELECT HoursWorked INTO hours FROM Timesheets WHERE TimesheetID = timesheetId;
    RETURN hours;
END //
DELIMITER ;

-- A UDF to get the consultant's name for a timesheet ID.
DELIMITER //
CREATE FUNCTION GetTimesheetConsultantName(timesheetId INT)
RETURNS VARCHAR(255)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE consultant_name VARCHAR(255);
    SELECT CONCAT(c.FirstName, ' ', c.LastName) INTO consultant_name
    FROM Timesheets AS t
    JOIN Consultants AS c ON t.ConsultantID = c.ConsultantID
    WHERE t.TimesheetID = timesheetId;
    RETURN consultant_name;
END //
DELIMITER ;

-- Clean up the functions after use
DROP FUNCTION IF EXISTS GetTotalConsultantHours;
DROP FUNCTION IF EXISTS GetProjectNameForTimesheet;
DROP FUNCTION IF EXISTS IsTimesheetSubmittedLate;
DROP FUNCTION IF EXISTS GetHoursForTaskInTimesheet;
DROP FUNCTION IF EXISTS GetTimesheetConsultantName;

-- ====================================================================================================
-- TABLE 7: Invoices
-- ====================================================================================================

-- Foreign Keys & Relationships:
-- InvoiceID (PK) -> Payments.InvoiceID
-- ClientID (FK) -> Clients.ClientID
-- ProjectID (FK) -> Projects.ProjectID

-- ------------------------------
-- 1. JOIN QUERIES
-- ------------------------------

-- INNER JOIN: List invoices with their corresponding client company name.
SELECT
    i.InvoiceID,
    i.TotalAmount,
    c.CompanyName
FROM
    Invoices AS i
INNER JOIN
    Clients AS c ON i.ClientID = c.ClientID;

-- LEFT JOIN: List all invoices and their client, including invoices with no client.
SELECT
    i.InvoiceID,
    i.TotalAmount,
    c.CompanyName
FROM
    Invoices AS i
LEFT JOIN
    Clients AS c ON i.ClientID = c.ClientID;

-- RIGHT JOIN: List all clients and any invoices they have. Clients with no invoices are included.
SELECT
    i.InvoiceID,
    i.TotalAmount,
    c.CompanyName
FROM
    Invoices AS i
RIGHT JOIN
    Clients AS c ON i.ClientID = c.ClientID;

-- LEFT EXCLUSIVE JOIN: Find invoices that are not associated with any client.
SELECT
    i.InvoiceID
FROM
    Invoices AS i
LEFT JOIN
    Clients AS c ON i.ClientID = c.ClientID
WHERE
    c.ClientID IS NULL;

-- RIGHT EXCLUSIVE JOIN: Find clients who have no invoices.
SELECT
    c.CompanyName
FROM
    Invoices AS i
RIGHT JOIN
    Clients AS c ON i.ClientID = c.ClientID
WHERE
    i.InvoiceID IS NULL;

-- ------------------------------
-- 2. SUBQUERIES
-- ------------------------------

-- Find invoices with an amount greater than the average invoice amount.
SELECT
    InvoiceID,
    Amount
FROM
    Invoices
WHERE
    Amount > (SELECT AVG(Amount) FROM Invoices);

-- Find invoices for clients in the 'Finance' industry.
SELECT
    InvoiceID
FROM
    Invoices
WHERE
    ClientID IN (SELECT ClientID FROM Clients WHERE Industry = 'Finance');

-- Find invoices for projects with a 'Completed' status.
SELECT
    InvoiceID
FROM
    Invoices
WHERE
    ProjectID IN (SELECT ProjectID FROM Projects WHERE Status = 'Completed');

-- Find the client with the highest total invoiced amount.
SELECT
    CompanyName
FROM
    Clients
WHERE
    ClientID = (SELECT ClientID FROM Invoices GROUP BY ClientID ORDER BY SUM(TotalAmount) DESC LIMIT 1);

-- Find invoices that have not been paid yet.
SELECT
    InvoiceID
FROM
    Invoices
WHERE
    PaidStatus = 'Unpaid';

-- ------------------------------
-- 3. BUILT-IN FUNCTIONS
-- ------------------------------

-- Count the number of invoices for each paid status.
SELECT
    PaidStatus,
    COUNT(*) AS NumberOfInvoices
FROM
    Invoices
GROUP BY
    PaidStatus;

-- Calculate the sum of all 'Unpaid' invoices.
SELECT
    SUM(TotalAmount) AS TotalUnpaidAmount
FROM
    Invoices
WHERE
    PaidStatus = 'Unpaid';

-- Find the maximum invoice amount.
SELECT
    MAX(TotalAmount) AS MaxTotalAmount
FROM
    Invoices;

-- Get the due date month for all invoices.
SELECT
    InvoiceID,
    MONTH(DueDate) AS DueDateMonth
FROM
    Invoices;

-- Find the difference in days between the invoice date and payment date.
SELECT
    InvoiceID,
    DATEDIFF(PaymentDate, InvoiceDate) AS DaysToPay
FROM
    Invoices;

-- ------------------------------
-- 4. USER-DEFINED FUNCTIONS
-- ------------------------------

-- A UDF to get the total amount for a given invoice ID.
DELIMITER //
CREATE FUNCTION GetInvoiceTotalAmount(invoiceId INT)
RETURNS DECIMAL(10, 2)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE total_amount DECIMAL(10, 2);
    SELECT TotalAmount INTO total_amount FROM Invoices WHERE InvoiceID = invoiceId;
    RETURN total_amount;
END //
DELIMITER ;

-- A UDF to check if an invoice is overdue.
DELIMITER //
CREATE FUNCTION IsInvoiceOverdue(invoiceId INT)
RETURNS VARCHAR(10)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE due_date DATE;
    DECLARE paid_status VARCHAR(50);
    SELECT DueDate, PaidStatus INTO due_date, paid_status FROM Invoices WHERE InvoiceID = invoiceId;
    IF CURDATE() > due_date AND paid_status = 'Unpaid' THEN
        RETURN 'Yes';
    ELSE
        RETURN 'No';
    END IF;
END //
DELIMITER ;

-- A UDF to get the project name associated with an invoice.
DELIMITER //
CREATE FUNCTION GetProjectNameForInvoice(invoiceId INT)
RETURNS VARCHAR(255)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE project_name VARCHAR(255);
    SELECT p.ProjectName INTO project_name
    FROM Invoices AS i
    JOIN Projects AS p ON i.ProjectID = p.ProjectID
    WHERE i.InvoiceID = invoiceId;
    RETURN project_name;
END //
DELIMITER ;

-- A UDF to get the client company name for a given invoice ID.
DELIMITER //
CREATE FUNCTION GetClientNameForInvoice(invoiceId INT)
RETURNS VARCHAR(255)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE client_name VARCHAR(255);
    SELECT c.CompanyName INTO client_name
    FROM Invoices AS i
    JOIN Clients AS c ON i.ClientID = c.ClientID
    WHERE i.InvoiceID = invoiceId;
    RETURN client_name;
END //
DELIMITER ;

-- A UDF to calculate the tax amount from a total.
DELIMITER //
CREATE FUNCTION CalculateTaxFromTotal(invoiceId INT)
RETURNS DECIMAL(10, 2)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE total_amount DECIMAL(10, 2);
    DECLARE tax DECIMAL(10, 2);
    SELECT TotalAmount, Tax INTO total_amount, tax FROM Invoices WHERE InvoiceID = invoiceId;
    RETURN total_amount - (total_amount / (1 + tax));
END //
DELIMITER ;

-- Clean up the functions after use
DROP FUNCTION IF EXISTS GetInvoiceTotalAmount;
DROP FUNCTION IF EXISTS IsInvoiceOverdue;
DROP FUNCTION IF EXISTS GetProjectNameForInvoice;
DROP FUNCTION IF EXISTS GetClientNameForInvoice;
DROP FUNCTION IF EXISTS CalculateTaxFromTotal;

-- ====================================================================================================
-- TABLE 8: Payments
-- ====================================================================================================

-- Foreign Keys & Relationships:
-- PaymentID (PK) -> (no direct FK in other tables)
-- InvoiceID (FK) -> Invoices.InvoiceID

-- ------------------------------
-- 1. JOIN QUERIES
-- ------------------------------

-- INNER JOIN: List payments and their corresponding invoice ID and total amount.
SELECT
    p.PaymentID,
    p.Amount,
    i.TotalAmount AS InvoiceTotal
FROM
    Payments AS p
INNER JOIN
    Invoices AS i ON p.InvoiceID = i.InvoiceID;

-- LEFT JOIN: List all payments and their corresponding invoice data. Payments with no invoice are included.
SELECT
    p.PaymentID,
    p.Amount,
    i.TotalAmount AS InvoiceTotal
FROM
    Payments AS p
LEFT JOIN
    Invoices AS i ON p.InvoiceID = i.InvoiceID;

-- RIGHT JOIN: List all invoices and any payments made against them. Invoices with no payment are included.
SELECT
    p.PaymentID,
    p.Amount,
    i.TotalAmount AS InvoiceTotal
FROM
    Payments AS p
RIGHT JOIN
    Invoices AS i ON p.InvoiceID = i.InvoiceID;

-- LEFT EXCLUSIVE JOIN: Find payments that are not associated with any invoice.
SELECT
    p.PaymentID
FROM
    Payments AS p
LEFT JOIN
    Invoices AS i ON p.InvoiceID = i.InvoiceID
WHERE
    i.InvoiceID IS NULL;

-- RIGHT EXCLUSIVE JOIN: Find invoices that have not received any payments.
SELECT
    i.InvoiceID
FROM
    Payments AS p
RIGHT JOIN
    Invoices AS i ON p.InvoiceID = i.InvoiceID
WHERE
    p.PaymentID IS NULL;

-- ------------------------------
-- 2. SUBQUERIES
-- ------------------------------

-- Find payments with an amount greater than the total amount of a specific invoice (e.g., InvoiceID = 100).
SELECT
    PaymentID,
    Amount
FROM
    Payments
WHERE
    Amount > (SELECT TotalAmount FROM Invoices WHERE InvoiceID = 1);

-- Find payments for invoices that are marked as 'Paid'.
SELECT
    PaymentID,
    PaymentDate
FROM
    Payments
WHERE
    InvoiceID IN (SELECT InvoiceID FROM Invoices WHERE PaidStatus = 'Paid');

-- Find payments with a payment method of 'Credit Card'.
SELECT
    PaymentID
FROM
    Payments
WHERE
    PaymentMethod = (SELECT DISTINCT PaymentMethod FROM Payments WHERE PaymentMethod = 'Credit Card');

-- Find the payment with the highest amount.
SELECT
    PaymentID,
    Amount
FROM
    Payments
WHERE
    Amount = (SELECT MAX(Amount) FROM Payments);

-- Find payments made on the same date as a specific invoice date.
SELECT
    PaymentID
FROM
    Payments
WHERE
    PaymentDate IN (SELECT InvoiceDate FROM Invoices WHERE InvoiceID = 8);

-- ------------------------------
-- 3. BUILT-IN FUNCTIONS
-- ------------------------------

-- Count the number of payments for each payment method.
SELECT
    PaymentMethod,
    COUNT(*) AS NumberOfPayments
FROM
    Payments
GROUP BY
    PaymentMethod;

-- Calculate the total amount paid across all payments.
SELECT
    SUM(Amount) AS TotalAmountPaid
FROM
    Payments;

-- Find the average payment amount.
SELECT
    AVG(Amount) AS AveragePaymentAmount
FROM
    Payments;

-- Get the year of the payment date.
SELECT
    PaymentID,
    YEAR(PaymentDate) AS PaymentYear
FROM
    Payments;

-- Get the reference number in uppercase.
SELECT
    PaymentID,
    UPPER(ReferenceNumber) AS UpperCaseReference
FROM
    Payments;

-- ------------------------------
-- 4. USER-DEFINED FUNCTIONS
-- ------------------------------

-- A UDF to get the invoice total amount for a given payment ID.
DELIMITER //
CREATE FUNCTION GetInvoiceTotalForPayment(paymentId INT)
RETURNS DECIMAL(10, 2)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE invoice_total DECIMAL(10, 2);
    SELECT i.TotalAmount INTO invoice_total
    FROM Payments AS p
    JOIN Invoices AS i ON p.InvoiceID = i.InvoiceID
    WHERE p.PaymentID = paymentId;
    RETURN invoice_total;
END //
DELIMITER ;

-- A UDF to check if a payment covers the full invoice amount.
DELIMITER //
CREATE FUNCTION IsPaymentFull(paymentId INT)
RETURNS VARCHAR(10)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE payment_amount DECIMAL(10, 2);
    DECLARE invoice_total DECIMAL(10, 2);
    SELECT p.Amount, i.TotalAmount INTO payment_amount, invoice_total
    FROM Payments AS p
    JOIN Invoices AS i ON p.InvoiceID = i.InvoiceID
    WHERE p.PaymentID = paymentId;
    IF payment_amount >= invoice_total THEN
        RETURN 'Yes';
    ELSE
        RETURN 'No';
    END IF;
END //
DELIMITER ;

-- A UDF to get the client's company name for a given payment ID.
DELIMITER //
CREATE FUNCTION GetClientNameForPayment(paymentId INT)
RETURNS VARCHAR(255)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE client_name VARCHAR(255);
    SELECT c.CompanyName INTO client_name
    FROM Payments AS p
    JOIN Invoices AS i ON p.InvoiceID = i.InvoiceID
    JOIN Clients AS c ON i.ClientID = c.ClientID
    WHERE p.PaymentID = paymentId;
    RETURN client_name;
END //
DELIMITER ;

-- A UDF to calculate the amount still due on an invoice after a payment.
DELIMITER //
CREATE FUNCTION GetAmountDueAfterPayment(paymentId INT)
RETURNS DECIMAL(10, 2)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE payment_amount DECIMAL(10, 2);
    DECLARE invoice_total DECIMAL(10, 2);
    DECLARE amount_due DECIMAL(10, 2);
    SELECT p.Amount, i.TotalAmount INTO payment_amount, invoice_total
    FROM Payments AS p
    JOIN Invoices AS i ON p.InvoiceID = i.InvoiceID
    WHERE p.PaymentID = paymentId;
    SET amount_due = invoice_total - payment_amount;
    IF amount_due < 0 THEN
        SET amount_due = 0;
    END IF;
    RETURN amount_due;
END //
DELIMITER ;

-- A UDF to get the payment method for a given payment ID.
DELIMITER //
CREATE FUNCTION GetPaymentMethod(paymentId INT)
RETURNS VARCHAR(50)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE payment_method VARCHAR(50);
    SELECT PaymentMethod INTO payment_method FROM Payments WHERE PaymentID = paymentId;
    RETURN payment_method;
END //
DELIMITER ;

-- Clean up the functions after use
DROP FUNCTION IF EXISTS GetInvoiceTotalForPayment;
DROP FUNCTION IF EXISTS IsPaymentFull;
DROP FUNCTION IF EXISTS GetClientNameForPayment;
DROP FUNCTION IF EXISTS GetAmountDueAfterPayment;
DROP FUNCTION IF EXISTS GetPaymentMethod;

-- ====================================================================================================
-- TABLE 9: Appointments
-- ====================================================================================================

-- Foreign Keys & Relationships:
-- AppointmentID (PK) -> (no direct FK in other tables)
-- ClientID (FK) -> Clients.ClientID
-- ConsultantID (FK) -> Consultants.ConsultantID
-- ------------------------------
-- 1. JOIN QUERIES
-- ------------------------------

-- INNER JOIN: Lists appointments with the names of the clients and consultants involved.
SELECT
    a.AppointmentID,
    a.AppointmentDate,
    cl.CompanyName AS ClientName,
    CONCAT(co.FirstName, ' ', co.LastName) AS ConsultantName
FROM
    Appointments AS a
INNER JOIN
    Clients AS cl ON a.ClientID = cl.ClientID
INNER JOIN
    Consultants AS co ON a.ConsultantID = co.ConsultantID;

-- LEFT JOIN: Lists all appointments, including client details where available.
SELECT
    a.AppointmentID,
    a.Purpose,
    cl.CompanyName AS ClientName
FROM
    Appointments AS a
LEFT JOIN
    Clients AS cl ON a.ClientID = cl.ClientID;

-- RIGHT JOIN: Lists all consultants and any appointments scheduled with them.
SELECT
    CONCAT(co.FirstName, ' ', co.LastName) AS ConsultantName,
    a.AppointmentID,
    a.AppointmentDate
FROM
    Appointments AS a
RIGHT JOIN
    Consultants AS co ON a.ConsultantID = co.ConsultantID;

-- LEFT EXCLUSIVE JOIN: Finds appointments that are not associated with a client.
SELECT
    a.AppointmentID
FROM
    Appointments AS a
LEFT JOIN
    Clients AS cl ON a.ClientID = cl.ClientID
WHERE
    cl.ClientID IS NULL;

-- RIGHT EXCLUSIVE JOIN: Finds consultants who do not have any appointments.
SELECT
    CONCAT(co.FirstName, ' ', co.LastName) AS ConsultantName
FROM
    Appointments AS a
RIGHT JOIN
    Consultants AS co ON a.ConsultantID = co.ConsultantID
WHERE
    a.AppointmentID IS NULL;

-- ------------------------------
-- 2. SUBQUERIES
-- ------------------------------

-- Find appointments for clients located in 'New York'.
SELECT
    AppointmentID,
    Purpose
FROM
    Appointments
WHERE
    ClientID IN (SELECT ClientID FROM Clients WHERE City = 'New York');

-- Find appointments with a start time after a specific appointment (e.g., AppointmentID = 10).
SELECT
    AppointmentID,
    StartTime
FROM
    Appointments
WHERE
    StartTime > (SELECT StartTime FROM Appointments WHERE AppointmentID = 10);

-- Find appointments for a specific consultant.
SELECT
    AppointmentID
FROM
    Appointments
WHERE
    ConsultantID = (SELECT ConsultantID FROM Consultants WHERE FirstName = 'John' AND LastName = 'Doe');

-- Find the longest appointment duration.
SELECT
    AppointmentID,
    TIMESTAMPDIFF(MINUTE, StartTime, EndTime) AS DurationInMinutes
FROM
    Appointments
WHERE
    TIMESTAMPDIFF(MINUTE, StartTime, EndTime) = (SELECT MAX(TIMESTAMPDIFF(MINUTE, StartTime, EndTime)) FROM Appointments);

-- Find appointments that are scheduled in a location other than 'Online'.
SELECT
    AppointmentID,
    Location
FROM
    Appointments
WHERE
    Location NOT IN (SELECT Location FROM Appointments WHERE Location = 'Online');

-- ------------------------------
-- 3. BUILT-IN FUNCTIONS
-- ------------------------------

-- Count the number of appointments for each location.
SELECT
    Location,
    COUNT(*) AS NumberOfAppointments
FROM
    Appointments
GROUP BY
    Location;

-- Calculate the average duration of appointments in minutes.
SELECT
    AVG(TIMESTAMPDIFF(MINUTE, StartTime, EndTime)) AS AverageDurationMinutes
FROM
    Appointments;

-- Get the day of the week for each appointment.
SELECT
    AppointmentID,
    DAYNAME(AppointmentDate) AS DayOfWeek
FROM
    Appointments;

-- Concatenate the purpose and notes for each appointment.
SELECT
    AppointmentID,
    CONCAT(Purpose, ' - ', Notes) AS AppointmentSummary
FROM
    Appointments;

-- Convert the purpose to lowercase.
SELECT
    AppointmentID,
    LOWER(Purpose) AS LowerCasePurpose
FROM
    Appointments;

-- ------------------------------
-- 4. USER-DEFINED FUNCTIONS
-- ------------------------------

-- A UDF to get the client's company name for a given `AppointmentID`.
DELIMITER //
CREATE FUNCTION GetClientCompanyFromAppointment(appointmentId INT)
RETURNS VARCHAR(100)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE client_name VARCHAR(100);
    SELECT cl.CompanyName INTO client_name
    FROM Appointments AS a
    JOIN Clients AS cl ON a.ClientID = cl.ClientID
    WHERE a.AppointmentID = appointmentId;
    RETURN client_name;
END //
DELIMITER ;

-- A UDF to get the consultant's full name for a given `AppointmentID`.
DELIMITER //
CREATE FUNCTION GetConsultantNameFromAppointment(appointmentId INT)
RETURNS VARCHAR(100)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE consultant_name VARCHAR(100);
    SELECT CONCAT(co.FirstName, ' ', co.LastName) INTO consultant_name
    FROM Appointments AS a
    JOIN Consultants AS co ON a.ConsultantID = co.ConsultantID
    WHERE a.AppointmentID = appointmentId;
    RETURN consultant_name;
END //
DELIMITER ;

-- A UDF to check if an appointment is 'Completed'.
DELIMITER //
CREATE FUNCTION IsAppointmentCompleted(appointmentId INT)
RETURNS VARCHAR(10)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE status_val VARCHAR(20);
    SELECT Status INTO status_val
    FROM Appointments
    WHERE AppointmentID = appointmentId;
    IF status_val = 'Completed' THEN
        RETURN 'Yes';
    ELSE
        RETURN 'No';
    END IF;
END //
DELIMITER ;

-- A UDF to calculate the duration of an appointment in minutes.
DELIMITER //
CREATE FUNCTION GetAppointmentDuration(appointmentId INT)
RETURNS INT
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE duration INT;
    SELECT TIMESTAMPDIFF(MINUTE, StartTime, EndTime) INTO duration
    FROM Appointments
    WHERE AppointmentID = appointmentId;
    RETURN duration;
END //
DELIMITER ;

-- A UDF to get the location for a given `AppointmentID`.
DELIMITER //
CREATE FUNCTION GetAppointmentLocation(appointmentId INT)
RETURNS VARCHAR(50)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE loc VARCHAR(50);
    SELECT Location INTO loc FROM Appointments WHERE AppointmentID = appointmentId;
    RETURN loc;
END //
DELIMITER ;

-- Clean up the functions after use
DROP FUNCTION IF EXISTS GetClientCompanyFromAppointment;
DROP FUNCTION IF EXISTS GetConsultantNameFromAppointment;
DROP FUNCTION IF EXISTS IsAppointmentCompleted;
DROP FUNCTION IF EXISTS GetAppointmentDuration;
DROP FUNCTION IF EXISTS GetAppointmentLocation;

-- ====================================================================================================
-- TABLE 10: Feedback
-- ====================================================================================================

-- Foreign Keys & Relationships:
-- FeedbackID (PK) -> (no direct FK in other tables)
-- ClientID (FK) -> Clients.ClientID
-- ProjectID (FK) -> Projects.ProjectID
-- ConsultantID (FK) -> Consultants.ConsultantID
-- ------------------------------
-- 1. JOIN QUERIES
-- ------------------------------

-- INNER JOIN: Lists feedback with client and project names.
SELECT
    f.FeedbackID,
    cl.CompanyName AS ClientName,
    p.ProjectName,
    f.Rating,
    f.Comments
FROM
    Feedback AS f
INNER JOIN
    Clients AS cl ON f.ClientID = cl.ClientID
INNER JOIN
    Projects AS p ON f.ProjectID = p.ProjectID;

-- LEFT JOIN: Lists all feedback and the responding consultant's name if available.
SELECT
    f.FeedbackID,
    f.Rating,
    CONCAT(co.FirstName, ' ', co.LastName) AS ConsultantName
FROM
    Feedback AS f
LEFT JOIN
    Consultants AS co ON f.ConsultantID = co.ConsultantID;

-- RIGHT JOIN: Lists all clients and their feedback entries. Clients with no feedback are included.
SELECT
    cl.CompanyName AS ClientName,
    f.FeedbackID,
    f.Comments
FROM
    Feedback AS f
RIGHT JOIN
    Clients AS cl ON f.ClientID = cl.ClientID;

-- LEFT EXCLUSIVE JOIN: Finds feedback that is not linked to any project.
SELECT
    f.FeedbackID
FROM
    Feedback AS f
LEFT JOIN
    Projects AS p ON f.ProjectID = p.ProjectID
WHERE
    p.ProjectID IS NULL;

-- RIGHT EXCLUSIVE JOIN: Finds projects that have not received any feedback.
SELECT
    p.ProjectName
FROM
    Feedback AS f
RIGHT JOIN
    Projects AS p ON f.ProjectID = p.ProjectID
WHERE
    f.FeedbackID IS NULL;

-- ------------------------------
-- 2. SUBQUERIES
-- ------------------------------

-- Find comments for all feedback with a rating of 5.
SELECT
    Comments
FROM
    Feedback
WHERE
    Rating = 5;

-- Find feedback from a specific client (e.g., ClientID = 1).
SELECT
    FeedbackID,
    Comments
FROM
    Feedback
WHERE
    ClientID IN (SELECT ClientID FROM Clients WHERE ClientID = 1);

-- Find all feedback where the `ResolvedStatus` is 'Unresolved'.
SELECT
    FeedbackID,
    SubmittedDate
FROM
    Feedback
WHERE
    ResolvedStatus = 'Unresolved';

-- Find the feedback entry with the highest rating.
SELECT
    FeedbackID,
    Rating
FROM
    Feedback
WHERE
    Rating = (SELECT MAX(Rating) FROM Feedback);

-- Find feedback that was submitted on the same date as a specific project's start date (e.g., ProjectID = 1).
SELECT
    FeedbackID
FROM
    Feedback
WHERE
    SubmittedDate IN (SELECT StartDate FROM Projects WHERE ProjectID = 1);

-- ------------------------------
-- 3. BUILT-IN FUNCTIONS
-- ------------------------------

-- Count the number of feedback entries for each `Rating`.
SELECT
    Rating,
    COUNT(*) AS NumberOfEntries
FROM
    Feedback
GROUP BY
    Rating;

-- Calculate the average rating across all feedback.
SELECT
    AVG(Rating) AS AverageRating
FROM
    Feedback;

-- Find the number of days it took to respond to feedback.
SELECT
    FeedbackID,
    DATEDIFF(ResponseDate, SubmittedDate) AS DaysToRespond
FROM
    Feedback
WHERE
    ResponseDate IS NOT NULL;

-- Extract the year and month from the `SubmittedDate`.
SELECT
    FeedbackID,
    YEAR(SubmittedDate) AS SubmittedYear,
    MONTH(SubmittedDate) AS SubmittedMonth
FROM
    Feedback;

-- Find the length of the `Comments` string.
SELECT
    FeedbackID,
    LENGTH(Comments) AS CommentLength
FROM
    Feedback;

-- ------------------------------
-- 4. USER-DEFINED FUNCTIONS
-- ------------------------------

-- A UDF to get the project name for a given `FeedbackID`.
DELIMITER //
CREATE FUNCTION GetProjectNameFromFeedback(feedbackId INT)
RETURNS VARCHAR(100)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE project_name VARCHAR(100);
    SELECT p.ProjectName INTO project_name
    FROM Feedback AS f
    JOIN Projects AS p ON f.ProjectID = p.ProjectID
    WHERE f.FeedbackID = feedbackId;
    RETURN project_name;
END //
DELIMITER ;

-- A UDF to get the client's company name for a given `FeedbackID`.
DELIMITER //
CREATE FUNCTION GetClientNameFromFeedback(feedbackId INT)
RETURNS VARCHAR(100)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE client_name VARCHAR(100);
    SELECT cl.CompanyName INTO client_name
    FROM Feedback AS f
    JOIN Clients AS cl ON f.ClientID = cl.ClientID
    WHERE f.FeedbackID = feedbackId;
    RETURN client_name;
END //
DELIMITER ;

-- A UDF to check if a feedback has been responded to.
DELIMITER //
CREATE FUNCTION IsFeedbackResponded(feedbackId INT)
RETURNS VARCHAR(10)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE response_date DATE;
    SELECT ResponseDate INTO response_date
    FROM Feedback
    WHERE FeedbackID = feedbackId;
    IF response_date IS NOT NULL THEN
        RETURN 'Yes';
    ELSE
        RETURN 'No';
    END IF;
END //
DELIMITER ;

-- A UDF to get the rating for a given `FeedbackID`.
DELIMITER //
CREATE FUNCTION GetFeedbackRating(feedbackId INT)
RETURNS INT
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE rating_val INT;
    SELECT Rating INTO rating_val FROM Feedback WHERE FeedbackID = feedbackId;
    RETURN rating_val;
END //
DELIMITER ;

-- A UDF to calculate the number of days between submission and response.
DELIMITER //
CREATE FUNCTION GetDaysToRespond(feedbackId INT)
RETURNS INT
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE days_diff INT;
    SELECT DATEDIFF(ResponseDate, SubmittedDate) INTO days_diff
    FROM Feedback
    WHERE FeedbackID = feedbackId;
    RETURN days_diff;
END //
DELIMITER ;

-- Clean up the functions after use
DROP FUNCTION IF EXISTS GetProjectNameFromFeedback;
DROP FUNCTION IF EXISTS GetClientNameFromFeedback;
DROP FUNCTION IF EXISTS IsFeedbackResponded;
DROP FUNCTION IF EXISTS GetFeedbackRating;
DROP FUNCTION IF EXISTS GetDaysToRespond;

-- ====================================================================================================
-- TABLE 11: Reports
-- ====================================================================================================

-- Foreign Keys & Relationships:
-- ReportID (PK) -> (no direct FK in other tables)
-- ProjectID (FK) -> Projects.ProjectID
-- CreatedBy (FK) -> Consultants.ConsultantID
-- ReviewedBy (FK) -> Consultants.ConsultantID
-- ------------------------------
-- 1. JOIN QUERIES
-- ------------------------------

-- INNER JOIN: Lists reports with project and consultant names.
SELECT
    r.ReportID,
    r.Title,
    p.ProjectName,
    CONCAT(co.FirstName, ' ', co.LastName) AS CreatedBy
FROM
    Reports AS r
INNER JOIN
    Projects AS p ON r.ProjectID = p.ProjectID
INNER JOIN
    Consultants AS co ON r.CreatedBy = co.ConsultantID;

-- LEFT JOIN: Lists all reports and the reviewer's name if available.
SELECT
    r.ReportID,
    r.Title,
    CONCAT(co.FirstName, ' ', co.LastName) AS ReviewedBy
FROM
    Reports AS r
LEFT JOIN
    Consultants AS co ON r.ReviewedBy = co.ConsultantID;

-- RIGHT JOIN: Lists all consultants and the reports they have created.
SELECT
    CONCAT(co.FirstName, ' ', co.LastName) AS ConsultantName,
    r.Title
FROM
    Reports AS r
RIGHT JOIN
    Consultants AS co ON r.CreatedBy = co.ConsultantID;

-- LEFT EXCLUSIVE JOIN: Finds reports that are not linked to a project.
SELECT
    r.ReportID
FROM
    Reports AS r
LEFT JOIN
    Projects AS p ON r.ProjectID = p.ProjectID
WHERE
    p.ProjectID IS NULL;

-- RIGHT EXCLUSIVE JOIN: Finds consultants who have not created any reports.
SELECT
    CONCAT(co.FirstName, ' ', co.LastName) AS ConsultantName
FROM
    Reports AS r
RIGHT JOIN
    Consultants AS co ON r.CreatedBy = co.ConsultantID
WHERE
    r.ReportID IS NULL;

-- ------------------------------
-- 2. SUBQUERIES
-- ------------------------------

-- Find reports for projects with a budget greater than $150,000.
SELECT
    ReportID,
    Title
FROM
    Reports
WHERE
    ProjectID IN (SELECT ProjectID FROM Projects WHERE Budget > 150000);

-- Find reports created by a specific consultant.
SELECT
    Title
FROM
    Reports
WHERE
    CreatedBy = (SELECT ConsultantID FROM Consultants WHERE FirstName = 'Alice' AND LastName = 'Johnson');

-- Find reports with a status of 'Pending'.
SELECT
    ReportID,
    Title
FROM
    Reports
WHERE
    Status = 'Pending';

-- Find the report created most recently.
SELECT
    ReportID,
    Title,
    CreatedDate
FROM
    Reports
WHERE
    CreatedDate = (SELECT MAX(CreatedDate) FROM Reports);

-- Find reports that were reviewed after their creation date.
SELECT
    ReportID
FROM
    Reports
WHERE
    ReviewDate > CreatedDate;

-- ------------------------------
-- 3. BUILT-IN FUNCTIONS
-- ------------------------------

-- Count the number of reports for each `Status`.
SELECT
    Status,
    COUNT(*) AS NumberOfReports
FROM
    Reports
GROUP BY
    Status;

-- Calculate the number of days between the report creation and review date.
SELECT
    ReportID,
    DATEDIFF(ReviewDate, CreatedDate) AS DaysToReview
FROM
    Reports
WHERE
    ReviewDate IS NOT NULL;

-- Extract the year from the `CreatedDate`.
SELECT
    ReportID,
    YEAR(CreatedDate) AS CreationYear
FROM
    Reports;

-- Get the length of the `Title` string.
SELECT
    ReportID,
    LENGTH(Title) AS TitleLength
FROM
    Reports;

-- Find reports with a 'pdf' file path extension.
SELECT
    ReportID,
    FilePath
FROM
    Reports
WHERE
    FilePath LIKE '%.pdf';

-- ------------------------------
-- 4. USER-DEFINED FUNCTIONS
-- ------------------------------

-- A UDF to get the project name for a given `ReportID`.
DELIMITER //
CREATE FUNCTION GetProjectNameFromReport(reportId INT)
RETURNS VARCHAR(100)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE project_name VARCHAR(100);
    SELECT p.ProjectName INTO project_name
    FROM Reports AS r
    JOIN Projects AS p ON r.ProjectID = p.ProjectID
    WHERE r.ReportID = reportId;
    RETURN project_name;
END //
DELIMITER ;

-- A UDF to get the name of the consultant who created a report.
DELIMITER //
CREATE FUNCTION GetCreatorNameFromReport(reportId INT)
RETURNS VARCHAR(100)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE creator_name VARCHAR(100);
    SELECT CONCAT(c.FirstName, ' ', c.LastName) INTO creator_name
    FROM Reports AS r
    JOIN Consultants AS c ON r.CreatedBy = c.ConsultantID
    WHERE r.ReportID = reportId;
    RETURN creator_name;
END //
DELIMITER ;

-- A UDF to check if a report has been reviewed.
DELIMITER //
CREATE FUNCTION IsReportReviewed(reportId INT)
RETURNS VARCHAR(10)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE review_date DATE;
    SELECT ReviewDate INTO review_date FROM Reports WHERE ReportID = reportId;
    IF review_date IS NOT NULL THEN
        RETURN 'Yes';
    ELSE
        RETURN 'No';
    END IF;
END //
DELIMITER ;

-- A UDF to get the title of a report by its ID.
DELIMITER //
CREATE FUNCTION GetReportTitle(reportId INT)
RETURNS VARCHAR(100)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE title VARCHAR(100);
    SELECT Title INTO title FROM Reports WHERE ReportID = reportId;
    RETURN title;
END //
DELIMITER ;

-- A UDF to get the `Status` of a report.
DELIMITER //
CREATE FUNCTION GetReportStatus(reportId INT)
RETURNS VARCHAR(20)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE status VARCHAR(20);
    SELECT Status INTO status FROM Reports WHERE ReportID = reportId;
    RETURN status;
END //
DELIMITER ;

-- Clean up the functions after use
DROP FUNCTION IF EXISTS GetProjectNameFromReport;
DROP FUNCTION IF EXISTS GetCreatorNameFromReport;
DROP FUNCTION IF EXISTS IsReportReviewed;
DROP FUNCTION IF EXISTS GetReportTitle;
DROP FUNCTION IF EXISTS GetReportStatus;

-- ====================================================================================================
-- TABLE 12: Resources
-- ====================================================================================================

-- Foreign Keys & Relationships:
-- ResourceID (PK) -> (no direct FK in other tables)
-- ------------------------------
-- 1. JOIN QUERIES
-- ------------------------------

-- INNER JOIN: Not applicable as there are no foreign keys to join with.
-- LEFT JOIN: Not applicable as there are no foreign keys to join with.
-- RIGHT JOIN: Not applicable as there are no foreign keys to join with.
-- LEFT EXCLUSIVE JOIN: Not applicable as there are no foreign keys to join with.
-- RIGHT EXCLUSIVE JOIN: Not applicable as there are no foreign keys to join with.

-- ------------------------------
-- 2. SUBQUERIES
-- ------------------------------

-- Find resources with a `Condition` of 'New'.
SELECT
    ResourceID,
    ResourceName
FROM
    Resources
WHERE
    Condition = 'New';

-- Find all resources with a `Type` of 'Electronics'.
SELECT
    ResourceName,
    Quantity
FROM
    Resources
WHERE
    Type = 'Electronics';

-- Find resources with a quantity greater than the average quantity.
SELECT
    ResourceID,
    ResourceName
FROM
    Resources
WHERE
    Quantity > (SELECT AVG(Quantity) FROM Resources);

-- Find all resources that are 'In Use'.
SELECT
    ResourceName,
    Location
FROM
    Resources
WHERE
    Status = 'In Use';

-- Find resources with a purchase date in the year 2023.
SELECT
    ResourceID,
    ResourceName
FROM
    Resources
WHERE
    YEAR(PurchaseDate) = 2023;

-- ------------------------------
-- 3. BUILT-IN FUNCTIONS
-- ------------------------------

-- Count the number of resources for each `Type`.
SELECT
    Type,
    COUNT(*) AS NumberOfResources
FROM
    Resources
GROUP BY
    Type;

-- Calculate the total quantity of resources.
SELECT
    SUM(Quantity) AS TotalQuantity
FROM
    Resources;

-- Find the most recent `PurchaseDate`.
SELECT
    MAX(PurchaseDate) AS LastPurchaseDate
FROM
    Resources;

-- Get the day of the month for the `PurchaseDate`.
SELECT
    ResourceID,
    DAYOFMONTH(PurchaseDate) AS PurchaseDay
FROM
    Resources;

-- Convert the `ResourceName` to uppercase.
SELECT
    ResourceID,
    UPPER(ResourceName) AS UpperCaseName
FROM
    Resources;

-- ------------------------------
-- 4. USER-DEFINED FUNCTIONS
-- ------------------------------

-- A UDF to get the `Location` of a specific resource.
DELIMITER //
CREATE FUNCTION GetResourceLocation(resourceId INT)
RETURNS VARCHAR(50)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE loc VARCHAR(50);
    SELECT Location INTO loc FROM Resources WHERE ResourceID = resourceId;
    RETURN loc;
END //
DELIMITER ;

-- A UDF to get the `Quantity` of a specific resource.
DELIMITER //
CREATE FUNCTION GetResourceQuantity(resourceId INT)
RETURNS INT
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE qty INT;
    SELECT Quantity INTO qty FROM Resources WHERE ResourceID = resourceId;
    RETURN qty;
END //
DELIMITER ;

-- A UDF to check if a resource is 'Available'.
DELIMITER //
CREATE FUNCTION IsResourceAvailable(resourceId INT)
RETURNS VARCHAR(10)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE status_val VARCHAR(20);
    SELECT Status INTO status_val FROM Resources WHERE ResourceID = resourceId;
    IF status_val = 'Available' THEN
        RETURN 'Yes';
    ELSE
        RETURN 'No';
    END IF;
END //
DELIMITER ;

-- A UDF to get the `Condition` of a resource.
DELIMITER //
CREATE FUNCTION GetResourceCondition(resourceId INT)
RETURNS VARCHAR(20)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE cond VARCHAR(20);
    SELECT Conditions INTO cond FROM Resources WHERE ResourceID = resourceId;
    RETURN cond;
END //
DELIMITER ;

-- A UDF to get the `Type` of a resource.
DELIMITER //
CREATE FUNCTION GetResourceType(resourceId INT)
RETURNS VARCHAR(50)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE resource_type VARCHAR(50);
    SELECT Type INTO resource_type FROM Resources WHERE ResourceID = resourceId;
    RETURN resource_type;
END //
DELIMITER ;

-- Clean up the functions after use
DROP FUNCTION IF EXISTS GetResourceLocation;
DROP FUNCTION IF EXISTS GetResourceQuantity;
DROP FUNCTION IF EXISTS IsResourceAvailable;
DROP FUNCTION IF EXISTS GetResourceCondition;
DROP FUNCTION IF EXISTS GetResourceType;

-- ====================================================================================================
-- TABLE 13: Assets
-- ====================================================================================================

-- Foreign Keys & Relationships:
-- AssetID (PK) -> (no direct FK in other tables)
-- ------------------------------
-- 1. JOIN QUERIES
-- ------------------------------

-- INNER JOIN: Not applicable as there are no foreign keys to join with.
-- LEFT JOIN: Not applicable as there are no foreign keys to join with.
-- RIGHT JOIN: Not applicable as there are no foreign keys to join with.
-- LEFT EXCLUSIVE JOIN: Not applicable as there are no foreign keys to join with.
-- RIGHT EXCLUSIVE JOIN: Not applicable as there are no foreign keys to join with.

-- ------------------------------
-- 2. SUBQUERIES
-- ------------------------------

-- Find assets with a `Value` greater than $10,000.
SELECT
    AssetID,
    AssetName
FROM
    Assets
WHERE
    Value > 10000;

-- Find all assets of `Type` 'Vehicle'.
SELECT
    AssetName,
    Location
FROM
    Assets
WHERE
    Type = 'Vehicle';

-- Find assets with a `WarrantyExpiry` in the year 2025.
SELECT
    AssetID,
    AssetName
FROM
    Assets
WHERE
    YEAR(WarrantyExpiry) = 2025;

-- Find the asset with the highest `Value`.
SELECT
    AssetID,
    AssetName,
    Value
FROM
    Assets
WHERE
    Value = (SELECT MAX(Value) FROM Assets);

-- Find assets that are 'Operational'.
SELECT
    AssetName,
    Location
FROM
    Assets
WHERE
    Status = 'Operational';

-- ------------------------------
-- 3. BUILT-IN FUNCTIONS
-- ------------------------------

-- Count the number of assets for each `Type`.
SELECT
    Type,
    COUNT(*) AS NumberOfAssets
FROM
    Assets
GROUP BY
    Type;

-- Calculate the total `Value` of all assets.
SELECT
    SUM(Value) AS TotalAssetValue
FROM
    Assets;

-- Find the average `Value` of assets.
SELECT
    AVG(Value) AS AverageAssetValue
FROM
    Assets;

-- Get the month of the `PurchaseDate`.
SELECT
    AssetID,
    MONTH(PurchaseDate) AS PurchaseMonth
FROM
    Assets;

-- Find the number of days until the `WarrantyExpiry` for each asset.
SELECT
    AssetID,
    DATEDIFF(WarrantyExpiry, CURDATE()) AS DaysUntilExpiry
FROM
    Assets
WHERE
    WarrantyExpiry IS NOT NULL;

-- ------------------------------
-- 4. USER-DEFINED FUNCTIONS
-- ------------------------------

-- A UDF to get the `Value` of a specific asset.
DELIMITER //
CREATE FUNCTION GetAssetValue(assetId INT)
RETURNS DECIMAL(10, 2)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE asset_value DECIMAL(10, 2);
    SELECT Value INTO asset_value FROM Assets WHERE AssetID = assetId;
    RETURN asset_value;
END //
DELIMITER ;

-- A UDF to get the `Location` of an asset.
DELIMITER //
CREATE FUNCTION GetAssetLocation(assetId INT)
RETURNS VARCHAR(50)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE loc VARCHAR(50);
    SELECT Location INTO loc FROM Assets WHERE AssetID = assetId;
    RETURN loc;
END //
DELIMITER ;

-- A UDF to check if an asset's warranty has expired.
DELIMITER //
CREATE FUNCTION HasWarrantyExpired(assetId INT)
RETURNS VARCHAR(10)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE expiry_date DATE;
    SELECT WarrantyExpiry INTO expiry_date FROM Assets WHERE AssetID = assetId;
    IF expiry_date < CURDATE() THEN
        RETURN 'Yes';
    ELSE
        RETURN 'No';
    END IF;
END //
DELIMITER ;

-- A UDF to get the `AssetName`.
DELIMITER //
CREATE FUNCTION GetAssetName(assetId INT)
RETURNS VARCHAR(100)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE asset_name VARCHAR(100);
    SELECT AssetName INTO asset_name FROM Assets WHERE AssetID = assetId;
    RETURN asset_name;
END //
DELIMITER ;

-- A UDF to get the `PurchaseDate` of an asset.
DELIMITER //
CREATE FUNCTION GetAssetPurchaseDate(assetId INT)
RETURNS DATE
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE purchase_date DATE;
    SELECT PurchaseDate INTO purchase_date FROM Assets WHERE AssetID = assetId;
    RETURN purchase_date;
END //
DELIMITER ;

-- Clean up the functions after use
DROP FUNCTION IF EXISTS GetAssetValue;
DROP FUNCTION IF EXISTS GetAssetLocation;
DROP FUNCTION IF EXISTS HasWarrantyExpired;
DROP FUNCTION IF EXISTS GetAssetName;
DROP FUNCTION IF EXISTS GetAssetPurchaseDate;

-- ====================================================================================================
-- TABLE 14: Technologies
-- ====================================================================================================

-- Foreign Keys & Relationships:
-- TechnologyID (PK) -> (no direct FK in other tables)
-- ------------------------------
-- 1. JOIN QUERIES
-- ------------------------------

-- INNER JOIN: Not applicable as there are no foreign keys to join with.
-- LEFT JOIN: Not applicable as there are no foreign keys to join with.
-- RIGHT JOIN: Not applicable as there are no foreign keys to join with.
-- LEFT EXCLUSIVE JOIN: Not applicable as there are no foreign keys to join with.
-- RIGHT EXCLUSIVE JOIN: Not applicable as there are no foreign keys to join with.

-- ------------------------------
-- 2. SUBQUERIES
-- ------------------------------

-- Find technologies with a `Vendor` of 'Microsoft'.
SELECT
    TechnologyID,
    Name
FROM
    Technologies
WHERE
    Vendor = 'Microsoft';

-- Find technologies that were purchased after a specific date (e.g., '2023-01-15').
SELECT
    Name,
    PurchaseDate
FROM
    Technologies
WHERE
    PurchaseDate > '2023-01-15';

-- Find all technologies that are 'Active'.
SELECT
    Name
FROM
    Technologies
WHERE
    Status = 'Active';

-- Find technologies with an `ExpiryDate` in 2024.
SELECT
    Name,
    ExpiryDate
FROM
    Technologies
WHERE
    YEAR(ExpiryDate) = 2024;

-- Find the technology with a `Vendor` that is a 'Microsoft Corp.'.
SELECT
    TechnologyID,
    Name
FROM
    Technologies
WHERE
    Vendor = 'Microsoft Corp.';

-- ------------------------------
-- 3. BUILT-IN FUNCTIONS
-- ------------------------------

-- Count the number of technologies for each `Vendor`.
SELECT
    Vendor,
    COUNT(*) AS NumberOfTechnologies
FROM
    Technologies
GROUP BY
    Vendor;

-- Find the most recent `PurchaseDate`.
SELECT
    MAX(PurchaseDate) AS LatestPurchaseDate
FROM
    Technologies;

-- Find the number of days until the `ExpiryDate`.
SELECT
    TechnologyID,
    DATEDIFF(ExpiryDate, CURDATE()) AS DaysUntilExpiry
FROM
    Technologies
WHERE
    ExpiryDate IS NOT NULL;

-- Concatenate the `Name` and `Version`.
SELECT
    TechnologyID,
    CONCAT(Name, ' v', Version) AS TechVersion
FROM
    Technologies;

-- Convert the `Vendor` name to uppercase.
SELECT
    TechnologyID,
    UPPER(Vendor) AS UpperCaseVendor
FROM
    Technologies;

-- ------------------------------
-- 4. USER-DEFINED FUNCTIONS
-- ------------------------------

-- A UDF to get the `Vendor` for a given `TechnologyID`.
DELIMITER //
CREATE FUNCTION GetTechnologyVendor(techId INT)
RETURNS VARCHAR(50)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE vendor_name VARCHAR(50);
    SELECT Vendor INTO vendor_name FROM Technologies WHERE TechnologyID = techId;
    RETURN vendor_name;
END //
DELIMITER ;

-- A UDF to check if a technology license has expired.
DELIMITER //
CREATE FUNCTION HasLicenseExpired(techId INT)
RETURNS VARCHAR(10)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE expiry_date DATE;
    SELECT ExpiryDate INTO expiry_date FROM Technologies WHERE TechnologyID = techId;
    IF expiry_date < CURDATE() THEN
        RETURN 'Yes';
    ELSE
        RETURN 'No';
    END IF;
END //
DELIMITER ;

-- A UDF to get the `Status` of a technology.
DELIMITER //
CREATE FUNCTION GetTechnologyStatus(techId INT)
RETURNS VARCHAR(20)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE status_val VARCHAR(20);
    SELECT Status INTO status_val FROM Technologies WHERE TechnologyID = techId;
    RETURN status_val;
END //
DELIMITER ;

-- A UDF to get the name of a technology by its ID.
DELIMITER //
CREATE FUNCTION GetTechnologyName(techId INT)
RETURNS VARCHAR(100)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE tech_name VARCHAR(100);
    SELECT Name INTO tech_name FROM Technologies WHERE TechnologyID = techId;
    RETURN tech_name;
END //
DELIMITER ;

-- A UDF to get the `PurchaseDate` of a technology.
DELIMITER //
CREATE FUNCTION GetTechnologyPurchaseDate(techId INT)
RETURNS DATE
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE purchase_date DATE;
    SELECT PurchaseDate INTO purchase_date FROM Technologies WHERE TechnologyID = techId;
    RETURN purchase_date;
END //
DELIMITER ;

-- Clean up the functions after use
DROP FUNCTION IF EXISTS GetTechnologyVendor;
DROP FUNCTION IF EXISTS HasLicenseExpired;
DROP FUNCTION IF EXISTS GetTechnologyStatus;
DROP FUNCTION IF EXISTS GetTechnologyName;
DROP FUNCTION IF EXISTS GetTechnologyPurchaseDate;

-- ====================================================================================================
-- TABLE 15: Trainings
-- ====================================================================================================

-- Foreign Keys & Relationships:
-- TrainingID (PK) -> (no direct FK in other tables)
-- ------------------------------
-- 1. JOIN QUERIES
-- ------------------------------

-- INNER JOIN: Not applicable as there are no foreign keys to join with.
-- LEFT JOIN: Not applicable as there are no foreign keys to join with.
-- RIGHT JOIN: Not applicable as there are no foreign keys to join with.
-- LEFT EXCLUSIVE JOIN: Not applicable as there are no foreign keys to join with.
-- RIGHT EXCLUSIVE JOIN: Not applicable as there are no foreign keys to join with.

-- ------------------------------
-- 2. SUBQUERIES
-- ------------------------------

-- Find trainings with a `Status` of 'Upcoming'.
SELECT
    TrainingID,
    Title
FROM
    Trainings
WHERE
    Status = 'Upcoming';

-- Find trainings with a `Cost` greater than the average cost.
SELECT
    TrainingID,
    Title
FROM
    Trainings
WHERE
    Cost > (SELECT AVG(Cost) FROM Trainings);

-- Find trainings with a `Location` of 'Online'.
SELECT
    Title,
    Trainer
FROM
    Trainings
WHERE
    Location = 'Online';

-- Find the most expensive training.
SELECT
    Title,
    Cost
FROM
    Trainings
WHERE
    Cost = (SELECT MAX(Cost) FROM Trainings);

-- Find all trainings conducted by 'Mr. A'.
SELECT
    Title,
    StartDate
FROM
    Trainings
WHERE
    Trainer = 'Mr. A';

-- ------------------------------
-- 3. BUILT-IN FUNCTIONS
-- ------------------------------

-- Count the number of trainings for each `Status`.
SELECT
    Status,
    COUNT(*) AS NumberOfTrainings
FROM
    Trainings
GROUP BY
    Status;

-- Calculate the average `Cost` of all trainings.
SELECT
    AVG(Cost) AS AverageTrainingCost
FROM
    Trainings;

-- Find the total `Cost` of all trainings.
SELECT
    SUM(Cost) AS TotalTrainingCost
FROM
    Trainings;

-- Find the number of days each training lasts.
SELECT
    TrainingID,
    DATEDIFF(EndDate, StartDate) AS DurationInDays
FROM
    Trainings;

-- Get the year of the `StartDate`.
SELECT
    TrainingID,
    YEAR(StartDate) AS TrainingYear
FROM
    Trainings;

-- ------------------------------
-- 4. USER-DEFINED FUNCTIONS
-- ------------------------------

-- A UDF to get the `Cost` of a specific training.
DELIMITER //
CREATE FUNCTION GetTrainingCost(trainingId INT)
RETURNS DECIMAL(10, 2)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE training_cost DECIMAL(10, 2);
    SELECT Cost INTO training_cost FROM Trainings WHERE TrainingID = trainingId;
    RETURN training_cost;
END //
DELIMITER ;

-- A UDF to check if a training is 'Upcoming'.
DELIMITER //
CREATE FUNCTION IsTrainingUpcoming(trainingId INT)
RETURNS VARCHAR(10)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE status_val VARCHAR(20);
    SELECT Status INTO status_val FROM Trainings WHERE TrainingID = trainingId;
    IF status_val = 'Upcoming' THEN
        RETURN 'Yes';
    ELSE
        RETURN 'No';
    END IF;
END //
DELIMITER ;

-- A UDF to get the `Location` of a training.
DELIMITER //
CREATE FUNCTION GetTrainingLocation(trainingId INT)
RETURNS VARCHAR(50)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE loc VARCHAR(50);
    SELECT Location INTO loc FROM Trainings WHERE TrainingID = trainingId;
    RETURN loc;
END //
DELIMITER ;

-- A UDF to calculate the number of days a training lasts.
DELIMITER //
CREATE FUNCTION GetTrainingDuration(trainingId INT)
RETURNS INT
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE duration INT;
    SELECT DATEDIFF(EndDate, StartDate) INTO duration
    FROM Trainings
    WHERE TrainingID = trainingId;
    RETURN duration;
END //
DELIMITER ;

-- A UDF to get the `Title` of a training.
DELIMITER //
CREATE FUNCTION GetTrainingTitle(trainingId INT)
RETURNS VARCHAR(100)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE training_title VARCHAR(100);
    SELECT Title INTO training_title FROM Trainings WHERE TrainingID = trainingId;
    RETURN training_title;
END //
DELIMITER ;

-- Clean up the functions after use
DROP FUNCTION IF EXISTS GetTrainingCost;
DROP FUNCTION IF EXISTS IsTrainingUpcoming;
DROP FUNCTION IF EXISTS GetTrainingLocation;
DROP FUNCTION IF EXISTS GetTrainingDuration;
DROP FUNCTION IF EXISTS GetTrainingTitle;

-- ====================================================================================================
-- TABLE 16: JobRoles
-- ====================================================================================================

-- Foreign Keys & Relationships:
-- RoleID (PK) -> (no direct FK in other tables)
-- DepartmentID (FK) -> Departments.DepartmentID
-- ------------------------------
-- 1. JOIN QUERIES
-- ------------------------------

-- INNER JOIN: Lists job roles with their corresponding department names.
SELECT
    jr.RoleID,
    jr.RoleName,
    d.DepartmentName
FROM
    JobRoles AS jr
INNER JOIN
    Departments AS d ON jr.DepartmentID = d.DepartmentID;

-- LEFT JOIN: Lists all job roles, including department details if available.
SELECT
    jr.RoleID,
    jr.RoleName,
    d.DepartmentName
FROM
    JobRoles AS jr
LEFT JOIN
    Departments AS d ON jr.DepartmentID = d.DepartmentID;

-- RIGHT JOIN: Lists all departments and the job roles within them. Departments with no roles are included.
SELECT
    d.DepartmentName,
    jr.RoleName
FROM
    JobRoles AS jr
RIGHT JOIN
    Departments AS d ON jr.DepartmentID = d.DepartmentID;

-- LEFT EXCLUSIVE JOIN: Finds job roles that are not linked to a department.
SELECT
    jr.RoleID
FROM
    JobRoles AS jr
LEFT JOIN
    Departments AS d ON jr.DepartmentID = d.DepartmentID
WHERE
    d.DepartmentID IS NULL;

-- RIGHT EXCLUSIVE JOIN: Finds departments that do not have any defined job roles.
SELECT
    d.DepartmentName
FROM
    JobRoles AS jr
RIGHT JOIN
    Departments AS d ON jr.DepartmentID = d.DepartmentID
WHERE
    jr.RoleID IS NULL;

-- ------------------------------
-- 2. SUBQUERIES
-- ------------------------------

-- Find all job roles in the 'IT' department.
SELECT
    RoleName
FROM
    JobRoles
WHERE
    DepartmentID = (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'IT');

-- Find roles with a minimum experience greater than 3 years.
SELECT
    RoleID,
    RoleName
FROM
    JobRoles
WHERE
    MinimumExperience > 3;

-- Find all roles that are marked as 'Active'.
SELECT
    RoleID,
    RoleName
FROM
    JobRoles
WHERE
    Status = 'Active';

-- Find the role with the highest `MinimumExperience`.
SELECT
    RoleName,
    MinimumExperience
FROM
    JobRoles
WHERE
    MinimumExperience = (SELECT MAX(MinimumExperience) FROM JobRoles);

-- Find roles that require approval.
SELECT
    RoleName,
    ApprovalRequired
FROM
    JobRoles
WHERE
    ApprovalRequired = 'Yes';

-- ------------------------------
-- 3. BUILT-IN FUNCTIONS
-- ------------------------------

-- Count the number of job roles for each `DepartmentID`.
SELECT
    DepartmentID,
    COUNT(*) AS NumberOfRoles
FROM
    JobRoles
GROUP BY
    DepartmentID;

-- Find the average `MinimumExperience` required for all roles.
SELECT
    AVG(MinimumExperience) AS AverageMinExperience
FROM
    JobRoles;

-- Get the year of the `CreatedDate`.
SELECT
    RoleID,
    YEAR(CreatedDate) AS CreationYear
FROM
    JobRoles;

-- Convert `RoleName` to uppercase.
SELECT
    RoleID,
    UPPER(RoleName) AS UpperCaseRoleName
FROM
    JobRoles;

-- Find the length of the `Description` string.
SELECT
    RoleID,
    LENGTH(Description) AS DescriptionLength
FROM
    JobRoles;

-- ------------------------------
-- 4. USER-DEFINED FUNCTIONS
-- ------------------------------

-- A UDF to get the `DepartmentName` for a given `RoleID`.
DELIMITER //
CREATE FUNCTION GetDepartmentNameForRole(roleId INT)
RETURNS VARCHAR(50)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE dept_name VARCHAR(50);
    SELECT d.DepartmentName INTO dept_name
    FROM JobRoles AS jr
    JOIN Departments AS d ON jr.DepartmentID = d.DepartmentID
    WHERE jr.RoleID = roleId;
    RETURN dept_name;
END //
DELIMITER ;

-- A UDF to get the `MinimumExperience` for a role.
DELIMITER //
CREATE FUNCTION GetMinExperienceForRole(roleId INT)
RETURNS INT
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE min_exp INT;
    SELECT MinimumExperience INTO min_exp FROM JobRoles WHERE RoleID = roleId;
    RETURN min_exp;
END //
DELIMITER ;

-- A UDF to check if a role's `Status` is 'Active'.
DELIMITER //
CREATE FUNCTION IsRoleActive(roleId INT)
RETURNS VARCHAR(10)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE status_val VARCHAR(20);
    SELECT Status INTO status_val FROM JobRoles WHERE RoleID = roleId;
    IF status_val = 'Active' THEN
        RETURN 'Yes';
    ELSE
        RETURN 'No';
    END IF;
END //
DELIMITER ;

-- A UDF to get the `RoleName` by its ID.
DELIMITER //
CREATE FUNCTION GetRoleName(roleId INT)
RETURNS VARCHAR(50)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE role_name VARCHAR(50);
    SELECT RoleName INTO role_name FROM JobRoles WHERE RoleID = roleId;
    RETURN role_name;
END //
DELIMITER ;

-- A UDF to get the `SalaryRange` for a given `RoleID`.
DELIMITER //
CREATE FUNCTION GetRoleSalaryRange(roleId INT)
RETURNS VARCHAR(50)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE salary_range VARCHAR(50);
    SELECT SalaryRange INTO salary_range FROM JobRoles WHERE RoleID = roleId;
    RETURN salary_range;
END //
DELIMITER ;

-- Clean up the functions after use
DROP FUNCTION IF EXISTS GetDepartmentNameForRole;
DROP FUNCTION IF EXISTS GetMinExperienceForRole;
DROP FUNCTION IF EXISTS IsRoleActive;
DROP FUNCTION IF EXISTS GetRoleName;
DROP FUNCTION IF EXISTS GetRoleSalaryRange;

-- ====================================================================================================
-- TABLE 17: Leaves
-- ====================================================================================================

-- Foreign Keys & Relationships:
-- LeaveID (PK) -> (no direct FK in other tables)
-- ConsultantID (FK) -> Consultants.ConsultantID
-- ApprovedBy (FK) -> Consultants.ConsultantID
-- ------------------------------
-- 1. JOIN QUERIES
-- ------------------------------

-- INNER JOIN: Lists leave requests with the consultant's name.
SELECT
    l.LeaveID,
    l.StartDate,
    l.EndDate,
    CONCAT(c.FirstName, ' ', c.LastName) AS ConsultantName
FROM
    Leaves AS l
INNER JOIN
    Consultants AS c ON l.ConsultantID = c.ConsultantID;

-- LEFT JOIN: Lists all leave requests, including approval details if available.
SELECT
    l.LeaveID,
    l.Reason,
    l.Status,
    l.ApprovedBy AS ApproverID
FROM
    Leaves AS l
LEFT JOIN
    Consultants AS c ON l.ApprovedBy = c.ConsultantID;

-- RIGHT JOIN: Lists all consultants and their leave requests.
SELECT
    CONCAT(c.FirstName, ' ', c.LastName) AS ConsultantName,
    l.LeaveID,
    l.LeaveType
FROM
    Leaves AS l
RIGHT JOIN
    Consultants AS c ON l.ConsultantID = c.ConsultantID;

-- LEFT EXCLUSIVE JOIN: Finds leave requests that are not linked to a consultant.
SELECT
    l.LeaveID
FROM
    Leaves AS l
LEFT JOIN
    Consultants AS c ON l.ConsultantID = c.ConsultantID
WHERE
    c.ConsultantID IS NULL;

-- RIGHT EXCLUSIVE JOIN: Finds consultants who have not submitted any leave requests.
SELECT
    CONCAT(c.FirstName, ' ', c.LastName) AS ConsultantName
FROM
    Leaves AS l
RIGHT JOIN
    Consultants AS c ON l.ConsultantID = c.ConsultantID
WHERE
    l.LeaveID IS NULL;

-- ------------------------------
-- 2. SUBQUERIES
-- ------------------------------

-- Find all leave requests for a specific consultant.
SELECT
    LeaveID,
    StartDate,
    EndDate
FROM
    Leaves
WHERE
    ConsultantID = (SELECT ConsultantID FROM Consultants WHERE FirstName = 'Jane' AND LastName = 'Smith');

-- Find all 'Pending' leave requests.
SELECT
    LeaveID,
    Reason
FROM
    Leaves
WHERE
    Status = 'Pending';

-- Find leave requests with a `LeaveType` of 'Sick Leave'.
SELECT
    LeaveID
FROM
    Leaves
WHERE
    LeaveType = 'Sick Leave';

-- Find the most recently applied leave request.
SELECT
    LeaveID,
    AppliedDate
FROM
    Leaves
WHERE
    AppliedDate = (SELECT MAX(AppliedDate) FROM Leaves);

-- Find leave requests that are 'Approved' and start in 2025.
SELECT
    LeaveID,
    StartDate
FROM
    Leaves
WHERE
    Status = 'Approved' AND YEAR(StartDate) = 2025;

-- ------------------------------
-- 3. BUILT-IN FUNCTIONS
-- ------------------------------

-- Count the number of leave requests for each `Status`.
SELECT
    Status,
    COUNT(*) AS NumberOfLeaves
FROM
    Leaves
GROUP BY
    Status;

-- Calculate the number of days for each leave request.
SELECT
    LeaveID,
    DATEDIFF(EndDate, StartDate) AS DurationInDays
FROM
    Leaves;

-- Find the year of the `AppliedDate`.
SELECT
    LeaveID,
    YEAR(AppliedDate) AS ApplicationYear
FROM
    Leaves;

-- Find the average duration of leave requests in days.
SELECT
    AVG(DATEDIFF(EndDate, StartDate)) AS AverageLeaveDuration
FROM
    Leaves;

-- Get the first 5 characters of the `Reason` column.
SELECT
    LeaveID,
    SUBSTRING(Reason, 1, 5) AS ReasonSnippet
FROM
    Leaves;

-- ------------------------------
-- 4. USER-DEFINED FUNCTIONS
-- ------------------------------

-- A UDF to get the consultant's name for a given `LeaveID`.
DELIMITER //
CREATE FUNCTION GetConsultantNameFromLeave(leaveId INT)
RETURNS VARCHAR(100)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE consultant_name VARCHAR(100);
    SELECT CONCAT(c.FirstName, ' ', c.LastName) INTO consultant_name
    FROM Leaves AS l
    JOIN Consultants AS c ON l.ConsultantID = c.ConsultantID
    WHERE l.LeaveID = leaveId;
    RETURN consultant_name;
END //
DELIMITER ;

-- A UDF to get the `LeaveType` for a request.
DELIMITER //
CREATE FUNCTION GetLeaveType(leaveId INT)
RETURNS VARCHAR(50)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE leave_type VARCHAR(50);
    SELECT LeaveType INTO leave_type FROM Leaves WHERE LeaveID = leaveId;
    RETURN leave_type;
END //
DELIMITER ;

-- A UDF to check if a leave request is 'Approved'.
DELIMITER //
CREATE FUNCTION IsLeaveApproved(leaveId INT)
RETURNS VARCHAR(10)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE status_val VARCHAR(20);
    SELECT Status INTO status_val FROM Leaves WHERE LeaveID = leaveId;
    IF status_val = 'Approved' THEN
        RETURN 'Yes';
    ELSE
        RETURN 'No';
    END IF;
END //
DELIMITER ;

-- A UDF to get the number of days for a leave request.
DELIMITER //
CREATE FUNCTION GetLeaveDurationInDays(leaveId INT)
RETURNS INT
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE duration INT;
    SELECT DATEDIFF(EndDate, StartDate) INTO duration
    FROM Leaves
    WHERE LeaveID = leaveId;
    RETURN duration;
END //
DELIMITER ;

-- A UDF to get the `Reason` for a leave request.
DELIMITER //
CREATE FUNCTION GetLeaveReason(leaveId INT)
RETURNS VARCHAR(255)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE reason_text VARCHAR(255);
    SELECT Reason INTO reason_text FROM Leaves WHERE LeaveID = leaveId;
    RETURN reason_text;
END //
DELIMITER ;

-- Clean up the functions after use
DROP FUNCTION IF EXISTS GetConsultantNameFromLeave;
DROP FUNCTION IF EXISTS GetLeaveType;
DROP FUNCTION IF EXISTS IsLeaveApproved;
DROP FUNCTION IF EXISTS GetLeaveDurationInDays;
DROP FUNCTION IF EXISTS GetLeaveReason;

-- ====================================================================================================
-- TABLE 18: Attendance
-- ====================================================================================================

-- Foreign Keys & Relationships:
-- AttendanceID (PK) -> (no direct FK in other tables)
-- ConsultantID (FK) -> Consultants.ConsultantID
-- ApprovedBy (FK) -> Consultants.ConsultantID
-- ------------------------------
-- 1. JOIN QUERIES
-- ------------------------------

-- INNER JOIN: Lists attendance records with the consultant's name.
SELECT
    a.AttendanceID,
    a.Date,
    a.WorkHours,
    CONCAT(c.FirstName, ' ', c.LastName) AS ConsultantName
FROM
    Attendance AS a
INNER JOIN
    Consultants AS c ON a.ConsultantID = c.ConsultantID;

-- LEFT JOIN: Lists all attendance records and the name of the consultant who approved it if available.
SELECT
    a.AttendanceID,
    a.Date,
    a.Status,
    a.ApprovedBy AS ApproverID
FROM
    Attendance AS a
LEFT JOIN
    Consultants AS c ON a.ApprovedBy = c.ConsultantID;

-- RIGHT JOIN: Lists all consultants and their attendance records.
SELECT
    CONCAT(c.FirstName, ' ', c.LastName) AS ConsultantName,
    a.Date,
    a.WorkHours
FROM
    Attendance AS a
RIGHT JOIN
    Consultants AS c ON a.ConsultantID = c.ConsultantID;

-- LEFT EXCLUSIVE JOIN: Finds attendance records that are not linked to a consultant.
SELECT
    a.AttendanceID
FROM
    Attendance AS a
LEFT JOIN
    Consultants AS c ON a.ConsultantID = c.ConsultantID
WHERE
    c.ConsultantID IS NULL;

-- RIGHT EXCLUSIVE JOIN: Finds consultants who do not have any attendance records.
SELECT
    CONCAT(c.FirstName, ' ', c.LastName) AS ConsultantName
FROM
    Attendance AS a
RIGHT JOIN
    Consultants AS c ON a.ConsultantID = c.ConsultantID
WHERE
    a.AttendanceID IS NULL;

-- ------------------------------
-- 2. SUBQUERIES
-- ------------------------------

-- Find all attendance records for a specific consultant.
SELECT
    Date,
    WorkHours
FROM
    Attendance
WHERE
    ConsultantID = (SELECT ConsultantID FROM Consultants WHERE FirstName = 'Henry' AND LastName = 'Lee');

-- Find records where `WorkHours` is greater than 8.
SELECT
    AttendanceID,
    WorkHours
FROM
    Attendance
WHERE
    WorkHours > 8;

-- Find all attendance records with 'Present' status.
SELECT
    AttendanceID,
    Date
FROM
    Attendance
WHERE
    Status = 'Present';

-- Find the attendance record with the maximum `WorkHours`.
SELECT
    AttendanceID,
    WorkHours
FROM
    Attendance
WHERE
    WorkHours = (SELECT MAX(WorkHours) FROM Attendance);

-- Find attendance records for consultants with 'IT' specialization.
SELECT
    a.AttendanceID,
    a.Date
FROM
    Attendance AS a
WHERE
    a.ConsultantID IN (SELECT ConsultantID FROM Consultants WHERE Specialization = 'IT');

-- ------------------------------
-- 3. BUILT-IN FUNCTIONS
-- ------------------------------

-- Count the number of attendance records for each `Status`.
SELECT
    Status,
    COUNT(*) AS NumberOfRecords
FROM
    Attendance
GROUP BY
    Status;

-- Calculate the total `WorkHours` logged by a consultant (e.g., ConsultantID = 1).
SELECT
    SUM(WorkHours) AS TotalWorkHours
FROM
    Attendance
WHERE
    ConsultantID = 1;

-- Calculate the average `WorkHours` for all records.
SELECT
    AVG(WorkHours) AS AverageWorkHours
FROM
    Attendance;

-- Get the month from the `Date`.
SELECT
    AttendanceID,
    MONTH(Date) AS AttendanceMonth
FROM
    Attendance;

-- Find the duration between `CheckInTime` and `CheckOutTime` in minutes.
SELECT
    AttendanceID,
    TIMESTAMPDIFF(MINUTE, CheckInTime, CheckOutTime) AS DurationInMinutes
FROM
    Attendance;

-- ------------------------------
-- 4. USER-DEFINED FUNCTIONS
-- ------------------------------

-- A UDF to get the consultant's name for a given `AttendanceID`.
DELIMITER //
CREATE FUNCTION GetConsultantNameFromAttendance(attendanceId INT)
RETURNS VARCHAR(100)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE consultant_name VARCHAR(100);
    SELECT CONCAT(c.FirstName, ' ', c.LastName) INTO consultant_name
    FROM Attendance AS a
    JOIN Consultants AS c ON a.ConsultantID = c.ConsultantID
    WHERE a.AttendanceID = attendanceId;
    RETURN consultant_name;
END //
DELIMITER ;

-- A UDF to get the `WorkHours` for a record.
DELIMITER //
CREATE FUNCTION GetWorkHours(attendanceId INT)
RETURNS DECIMAL(4, 2)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE hours DECIMAL(4, 2);
    SELECT WorkHours INTO hours FROM Attendance WHERE AttendanceID = attendanceId;
    RETURN hours;
END //
DELIMITER ;

-- A UDF to check if an attendance record has been 'Approved'.
DELIMITER //
CREATE FUNCTION IsAttendanceApproved(attendanceId INT)
RETURNS VARCHAR(10)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE status_val VARCHAR(20);
    SELECT Status INTO status_val FROM Attendance WHERE AttendanceID = attendanceId;
    IF status_val = 'Approved' THEN
        RETURN 'Yes';
    ELSE
        RETURN 'No';
    END IF;
END //
DELIMITER ;

-- A UDF to get the `Location` of an attendance record.
DELIMITER //
CREATE FUNCTION GetAttendanceLocation(attendanceId INT)
RETURNS VARCHAR(50)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE loc VARCHAR(50);
    SELECT Location INTO loc FROM Attendance WHERE AttendanceID = attendanceId;
    RETURN loc;
END //
DELIMITER ;

-- A UDF to calculate the duration between check-in and check-out in hours.
DELIMITER //
CREATE FUNCTION GetAttendanceDurationHours(attendanceId INT)
RETURNS DECIMAL(4, 2)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE duration DECIMAL(4, 2);
    SELECT TIMESTAMPDIFF(MINUTE, CheckInTime, CheckOutTime) / 60 INTO duration
    FROM Attendance
    WHERE AttendanceID = attendanceId;
    RETURN duration;
END //
DELIMITER ;

-- Clean up the functions after use
DROP FUNCTION IF EXISTS GetConsultantNameFromAttendance;
DROP FUNCTION IF EXISTS GetWorkHours;
DROP FUNCTION IF EXISTS IsAttendanceApproved;
DROP FUNCTION IF EXISTS GetAttendanceLocation;
DROP FUNCTION IF EXISTS GetAttendanceDurationHours;

-- ====================================================================================================
-- TABLE 19: Contracts
-- ====================================================================================================

-- Foreign Keys & Relationships:
-- ContractID (PK) -> (no direct FK in other tables)
-- ClientID (FK) -> Clients.ClientID
-- ProjectID (FK) -> Projects.ProjectID
-- ------------------------------
-- 1. JOIN QUERIES
-- ------------------------------

-- INNER JOIN: Lists contracts with client and project names.
SELECT
    c.ContractID,
    c.ContractValue,
    cl.CompanyName AS ClientName,
    p.ProjectName
FROM
    Contracts AS c
INNER JOIN
    Clients AS cl ON c.ClientID = cl.ClientID
INNER JOIN
    Projects AS p ON c.ProjectID = p.ProjectID;

-- LEFT JOIN: Lists all contracts, including project details if available.
SELECT
    c.ContractID,
    c.ContractValue,
    p.ProjectName
FROM
    Contracts AS c
LEFT JOIN
    Projects AS p ON c.ProjectID = p.ProjectID;

-- RIGHT JOIN: Lists all clients and their contracts.
SELECT
    cl.CompanyName AS ClientName,
    c.ContractID,
    c.ContractValue
FROM
    Contracts AS c
RIGHT JOIN
    Clients AS cl ON c.ClientID = cl.ClientID;

-- LEFT EXCLUSIVE JOIN: Finds contracts that are not linked to a client.
SELECT
    c.ContractID
FROM
    Contracts AS c
LEFT JOIN
    Clients AS cl ON c.ClientID = cl.ClientID
WHERE
    cl.ClientID IS NULL;

-- RIGHT EXCLUSIVE JOIN: Finds projects that do not have any contracts.
SELECT
    p.ProjectName
FROM
    Contracts AS c
RIGHT JOIN
    Projects AS p ON c.ProjectID = p.ProjectID
WHERE
    c.ContractID IS NULL;

-- ------------------------------
-- 2. SUBQUERIES
-- ------------------------------

-- Find all contracts with a `ContractValue` greater than $100,000.
SELECT
    ContractID,
    ContractValue
FROM
    Contracts
WHERE
    ContractValue > 100000;

-- Find contracts for a specific project (e.g., ProjectID = 1).
SELECT
    ContractID,
    StartDate,
    EndDate
FROM
    Contracts
WHERE
    ProjectID IN (SELECT ProjectID FROM Projects WHERE ProjectID = 1);

-- Find all contracts with 'Active' status.
SELECT
    ContractID,
    SignedDate
FROM
    Contracts
WHERE
    Status = 'Active';

-- Find the contract with the highest `ContractValue`.
SELECT
    ContractID,
    ContractValue
FROM
    Contracts
WHERE
    ContractValue = (SELECT MAX(ContractValue) FROM Contracts);

-- Find contracts that have been renewed.
SELECT
    ContractID,
    RenewedDate
FROM
    Contracts
WHERE
    RenewedDate IS NOT NULL;

-- ------------------------------
-- 3. BUILT-IN FUNCTIONS
-- ------------------------------

-- Count the number of contracts for each `Status`.
SELECT
    Status,
    COUNT(*) AS NumberOfContracts
FROM
    Contracts
GROUP BY
    Status;

-- Calculate the total `ContractValue` of all contracts.
SELECT
    SUM(ContractValue) AS TotalContractValue
FROM
    Contracts;

-- Find the average `ContractValue`.
SELECT
    AVG(ContractValue) AS AverageContractValue
FROM
    Contracts;

-- Find the number of days a contract is valid.
SELECT
    ContractID,
    DATEDIFF(EndDate, StartDate) AS DurationInDays
FROM
    Contracts;

-- Get the year of the `SignedDate`.
SELECT
    ContractID,
    YEAR(SignedDate) AS SignedYear
FROM
    Contracts;

-- ------------------------------
-- 4. USER-DEFINED FUNCTIONS
-- ------------------------------

-- A UDF to get the client's company name for a given `ContractID`.
DELIMITER //
CREATE FUNCTION GetClientNameFromContract(contractId INT)
RETURNS VARCHAR(100)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE client_name VARCHAR(100);
    SELECT cl.CompanyName INTO client_name
    FROM Contracts AS c
    JOIN Clients AS cl ON c.ClientID = cl.ClientID
    WHERE c.ContractID = contractId;
    RETURN client_name;
END //
DELIMITER ;

-- A UDF to get the project name for a given `ContractID`.
DELIMITER //
CREATE FUNCTION GetProjectNameFromContract(contractId INT)
RETURNS VARCHAR(100)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE project_name VARCHAR(100);
    SELECT p.ProjectName INTO project_name
    FROM Contracts AS c
    JOIN Projects AS p ON c.ProjectID = p.ProjectID
    WHERE c.ContractID = contractId;
    RETURN project_name;
END //
DELIMITER ;

-- A UDF to get the `ContractValue`.
DELIMITER //
CREATE FUNCTION GetContractValue(contractId INT)
RETURNS DECIMAL(12, 2)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE contract_value DECIMAL(12, 2);
    SELECT ContractValue INTO contract_value FROM Contracts WHERE ContractID = contractId;
    RETURN contract_value;
END //
DELIMITER ;

-- A UDF to check if a contract is 'Active'.
DELIMITER //
CREATE FUNCTION IsContractActive(contractId INT)
RETURNS VARCHAR(10)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE status_val VARCHAR(20);
    SELECT Status INTO status_val FROM Contracts WHERE ContractID = contractId;
    IF status_val = 'Active' THEN
        RETURN 'Yes';
    ELSE
        RETURN 'No';
    END IF;
END //
DELIMITER ;

-- A UDF to get the `SignedDate` for a contract.
DELIMITER //
CREATE FUNCTION GetContractSignedDate(contractId INT)
RETURNS DATE
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE signed_date DATE;
    SELECT SignedDate INTO signed_date FROM Contracts WHERE ContractID = contractId;
    RETURN signed_date;
END //
DELIMITER ;

-- Clean up the functions after use
DROP FUNCTION IF EXISTS GetClientNameFromContract;
DROP FUNCTION IF EXISTS GetProjectNameFromContract;
DROP FUNCTION IF EXISTS GetContractValue;
DROP FUNCTION IF EXISTS IsContractActive;
DROP FUNCTION IF EXISTS GetContractSignedDate;

-- ====================================================================================================
-- TABLE 20: Proposals
-- ====================================================================================================

-- Foreign Keys & Relationships:
-- ProposalID (PK) -> (no direct FK in other tables)
-- ClientID (FK) -> Clients.ClientID
-- ApprovedBy (FK) -> Consultants.ConsultantID
-- ------------------------------
-- 1. JOIN QUERIES
-- ------------------------------

-- INNER JOIN: Lists proposals with client names.
SELECT
    p.ProposalID,
    p.Title,
    cl.CompanyName AS ClientName,
    p.EstimatedBudget
FROM
    Proposals AS p
INNER JOIN
    Clients AS cl ON p.ClientID = cl.ClientID;

-- LEFT JOIN: Lists all proposals, including the name of the approver if available.
SELECT
    p.ProposalID,
    p.Title,
    p.Status,
    p.ApprovedBy AS ApproverID
FROM
    Proposals AS p
LEFT JOIN
    Consultants AS c ON p.ApprovedBy = c.ConsultantID;

-- RIGHT JOIN: Lists all clients and their proposals.
SELECT
    cl.CompanyName AS ClientName,
    p.ProposalID,
    p.Title
FROM
    Proposals AS p
RIGHT JOIN
    Clients AS cl ON p.ClientID = cl.ClientID;

-- LEFT EXCLUSIVE JOIN: Finds proposals that are not linked to a client.
SELECT
    p.ProposalID
FROM
    Proposals AS p
LEFT JOIN
    Clients AS cl ON p.ClientID = cl.ClientID
WHERE
    cl.ClientID IS NULL;

-- RIGHT EXCLUSIVE JOIN: Finds clients who have not received any proposals.
SELECT
    cl.CompanyName
FROM
    Proposals AS p
RIGHT JOIN
    Clients AS cl ON p.ClientID = cl.ClientID
WHERE
    p.ProposalID IS NULL;

-- ------------------------------
-- 2. SUBQUERIES
-- ------------------------------

-- Find proposals with a `Status` of 'Approved'.
SELECT
    ProposalID,
    Title
FROM
    Proposals
WHERE
    Status = 'Approved';

-- Find all proposals for a specific client (e.g., ClientID = 1).
SELECT
    Title,
    SubmissionDate
FROM
    Proposals
WHERE
    ClientID = (SELECT ClientID FROM Clients WHERE ClientID = 1);

-- Find proposals with an `EstimatedBudget` greater than $100,000.
SELECT
    ProposalID,
    Title
FROM
    Proposals
WHERE
    EstimatedBudget > 100000;

-- Find the proposal with the highest `EstimatedBudget`.
SELECT
    ProposalID,
    Title,
    EstimatedBudget
FROM
    Proposals
WHERE
    EstimatedBudget = (SELECT MAX(EstimatedBudget) FROM Proposals);

-- Find proposals that are valid until after 2024.
SELECT
    ProposalID,
    Title
FROM
    Proposals
WHERE
    YEAR(ValidUntil) > 2024;

-- ------------------------------
-- 3. BUILT-IN FUNCTIONS
-- ------------------------------

-- Count the number of proposals for each `Status`.
SELECT
    Status,
    COUNT(*) AS NumberOfProposals
FROM
    Proposals
GROUP BY
    Status;

-- Calculate the total `EstimatedBudget` of all proposals.
SELECT
    SUM(EstimatedBudget) AS TotalEstimatedBudget
FROM
    Proposals;

-- Find the average `EstimatedBudget`.
SELECT
    AVG(EstimatedBudget) AS AverageEstimatedBudget
FROM
    Proposals;

-- Find the number of days a proposal is valid.
SELECT
    ProposalID,
    DATEDIFF(ValidUntil, SubmissionDate) AS ValidityInDays
FROM
    Proposals;

-- Convert the `Title` to uppercase.
SELECT
    ProposalID,
    UPPER(Title) AS UpperCaseTitle
FROM
    Proposals;

-- ------------------------------
-- 4. USER-DEFINED FUNCTIONS
-- ------------------------------

-- A UDF to get the client's company name for a given `ProposalID`.
DELIMITER //
CREATE FUNCTION GetClientNameFromProposal(proposalId INT)
RETURNS VARCHAR(100)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE client_name VARCHAR(100);
    SELECT cl.CompanyName INTO client_name
    FROM Proposals AS p
    JOIN Clients AS cl ON p.ClientID = cl.ClientID
    WHERE p.ProposalID = proposalId;
    RETURN client_name;
END //
DELIMITER ;

-- A UDF to get the `EstimatedBudget` for a proposal.
DELIMITER //
CREATE FUNCTION GetProposalBudget(proposalId INT)
RETURNS DECIMAL(10, 2)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE estimated_budget DECIMAL(10, 2);
    SELECT EstimatedBudget INTO estimated_budget FROM Proposals WHERE ProposalID = proposalId;
    RETURN estimated_budget;
END //
DELIMITER ;

-- A UDF to check if a proposal's `Status` is 'Pending'.
DELIMITER //
CREATE FUNCTION IsProposalPending(proposalId INT)
RETURNS VARCHAR(10)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE status_val VARCHAR(20);
    SELECT Status INTO status_val FROM Proposals WHERE ProposalID = proposalId;
    IF status_val = 'Pending' THEN
        RETURN 'Yes';
    ELSE
        RETURN 'No';
    END IF;
END //
DELIMITER ;

-- A UDF to get the `Title` of a proposal.
DELIMITER //
CREATE FUNCTION GetProposalTitle(proposalId INT)
RETURNS VARCHAR(100)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE title_name VARCHAR(100);
    SELECT Title INTO title_name FROM Proposals WHERE ProposalID = proposalId;
    RETURN title_name;
END //
DELIMITER ;

-- A UDF to get the `SubmissionDate` for a proposal.
DELIMITER //
CREATE FUNCTION GetProposalSubmissionDate(proposalId INT)
RETURNS DATE
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE submission_date DATE;
    SELECT SubmissionDate INTO submission_date FROM Proposals WHERE ProposalID = proposalId;
    RETURN submission_date;
END //
DELIMITER ;

-- Clean up the functions after use
DROP FUNCTION IF EXISTS GetClientNameFromProposal;
DROP FUNCTION IF EXISTS GetProposalBudget;
DROP FUNCTION IF EXISTS IsProposalPending;
DROP FUNCTION IF EXISTS GetProposalTitle;
DROP FUNCTION IF EXISTS GetProposalSubmissionDate;

-- ====================================================================================================
-- TABLE 21: Vendors
-- ====================================================================================================

-- Foreign Keys & Relationships:
-- VendorID (PK) -> (no direct FK in other tables)
-- ------------------------------
-- 1. JOIN QUERIES
-- ------------------------------

-- INNER JOIN: Not applicable as there are no foreign keys to join with.
-- LEFT JOIN: Not applicable as there are no foreign keys to join with.
-- RIGHT JOIN: Not applicable as there are no foreign keys to join with.
-- LEFT EXCLUSIVE JOIN: Not applicable as there are no foreign keys to join with.
-- RIGHT EXCLUSIVE JOIN: Not applicable as there are no foreign keys to join with.

-- ------------------------------
-- 2. SUBQUERIES
-- ------------------------------

-- Find vendors with a `ServicesProvided` of 'Software Services'.
SELECT
    VendorID,
    VendorName
FROM
    Vendors
WHERE
    ServicesProvided = 'Software Services';

-- Find vendors located in 'Mumbai'.
SELECT
    VendorName,
    ContactPerson
FROM
    Vendors
WHERE
    Address = 'Mumbai, India'
OR
    Address = 'Mumbai';

-- Find vendors whose `ContractEndDate` is in the year 2025.
SELECT
    VendorName
FROM
    Vendors
WHERE
    YEAR(ContractEndDate) = 2025;

-- Find all vendors with an 'Active' `Status`.
SELECT
    VendorID,
    VendorName
FROM
    Vendors
WHERE
    Status = 'Active';

-- Find the vendor with the most recent `ContractStartDate`.
SELECT
    VendorName,
    ContractStartDate
FROM
    Vendors
WHERE
    ContractStartDate = (SELECT MAX(ContractStartDate) FROM Vendors);

-- ------------------------------
-- 3. BUILT-IN FUNCTIONS
-- ------------------------------

-- Count the number of vendors for each `ServicesProvided`.
SELECT
    ServicesProvided,
    COUNT(*) AS NumberOfVendors
FROM
    Vendors
GROUP BY
    ServicesProvided;

-- Find the number of days a contract is valid.
SELECT
    VendorName,
    DATEDIFF(ContractEndDate, ContractStartDate) AS ContractDurationInDays
FROM
    Vendors;

-- Get the month from the `ContractStartDate`.
SELECT
    VendorName,
    MONTH(ContractStartDate) AS StartMonth
FROM
    Vendors;

-- Concatenate the `VendorName` and `ContactPerson`.
SELECT
    VendorID,
    CONCAT(VendorName, ' (Contact: ', ContactPerson, ')') AS VendorContact
FROM
    Vendors;

-- Convert the `Email` to lowercase.
SELECT
    VendorID,
    LOWER(Email) AS LowerCaseEmail
FROM
    Vendors;

-- ------------------------------
-- 4. USER-DEFINED FUNCTIONS
-- ------------------------------

-- A UDF to get the `VendorName` for a given `VendorID`.
DELIMITER //
CREATE FUNCTION GetVendorName(vendorId INT)
RETURNS VARCHAR(100)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE vendor_name VARCHAR(100);
    SELECT VendorName INTO vendor_name FROM Vendors WHERE VendorID = vendorId;
    RETURN vendor_name;
END //
DELIMITER ;

-- A UDF to get the `ServicesProvided` by a vendor.
DELIMITER //
CREATE FUNCTION GetVendorServices(vendorId INT)
RETURNS VARCHAR(100)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE services VARCHAR(100);
    SELECT ServicesProvided INTO services FROM Vendors WHERE VendorID = vendorId;
    RETURN services;
END //
DELIMITER ;

-- A UDF to check if a vendor is 'Active'.
DELIMITER //
CREATE FUNCTION IsVendorActive(vendorId INT)
RETURNS VARCHAR(10)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE status_val VARCHAR(20);
    SELECT Status INTO status_val FROM Vendors WHERE VendorID = vendorId;
    IF status_val = 'Active' THEN
        RETURN 'Yes';
    ELSE
        RETURN 'No';
    END IF;
END //
DELIMITER ;

-- A UDF to get the `ContactPerson` for a vendor.
DELIMITER //
CREATE FUNCTION GetVendorContactPerson(vendorId INT)
RETURNS VARCHAR(50)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE contact VARCHAR(50);
    SELECT ContactPerson INTO contact FROM Vendors WHERE VendorID = vendorId;
    RETURN contact;
END //
DELIMITER ;

-- A UDF to get the `ContractEndDate` for a vendor.
DELIMITER //
CREATE FUNCTION GetVendorContractEndDate(vendorId INT)
RETURNS DATE
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE end_date DATE;
    SELECT ContractEndDate INTO end_date FROM Vendors WHERE VendorID = vendorId;
    RETURN end_date;
END //
DELIMITER ;

-- Clean up the functions after use
DROP FUNCTION IF EXISTS GetVendorName;
DROP FUNCTION IF EXISTS GetVendorServices;
DROP FUNCTION IF EXISTS IsVendorActive;
DROP FUNCTION IF EXISTS GetVendorContactPerson;
DROP FUNCTION IF EXISTS GetVendorContractEndDate;

-- ====================================================================================================
-- TABLE 22: Meetings
-- ====================================================================================================

-- Foreign Keys & Relationships:
-- MeetingID (PK) -> (no direct FK in other tables)
-- ProjectID (FK) -> Projects.ProjectID
-- OrganizerID (FK) -> Consultants.ConsultantID
-- ------------------------------
-- 1. JOIN QUERIES
-- ------------------------------

-- INNER JOIN: Lists meetings with project names and organizer names.
SELECT
    m.MeetingID,
    m.MeetingDate,
    p.ProjectName,
    CONCAT(c.FirstName, ' ', c.LastName) AS OrganizerName
FROM
    Meetings AS m
INNER JOIN
    Projects AS p ON m.ProjectID = p.ProjectID
INNER JOIN
    Consultants AS c ON m.OrganizerID = c.ConsultantID;

-- LEFT JOIN: Lists all meetings, including project details where available.
SELECT
    m.MeetingID,
    m.Purpose,
    p.ProjectName
FROM
    Meetings AS m
LEFT JOIN
    Projects AS p ON m.ProjectID = p.ProjectID;

-- RIGHT JOIN: Lists all projects and any meetings associated with them.
SELECT
    p.ProjectName,
    m.MeetingID,
    m.MeetingDate
FROM
    Meetings AS m
RIGHT JOIN
    Projects AS p ON m.ProjectID = p.ProjectID;

-- LEFT EXCLUSIVE JOIN: Finds meetings that are not associated with a project.
SELECT
    m.MeetingID
FROM
    Meetings AS m
LEFT JOIN
    Projects AS p ON m.ProjectID = p.ProjectID
WHERE
    p.ProjectID IS NULL;

-- RIGHT EXCLUSIVE JOIN: Finds projects that do not have any meetings.
SELECT
    p.ProjectName
FROM
    Meetings AS m
RIGHT JOIN
    Projects AS p ON m.ProjectID = p.ProjectID
WHERE
    m.MeetingID IS NULL;

-- ------------------------------
-- 2. SUBQUERIES
-- ------------------------------

-- Find meetings for the 'Project Phoenix' project.
SELECT
    MeetingID,
    MeetingDate
FROM
    Meetings
WHERE
    ProjectID IN (SELECT ProjectID FROM Projects WHERE ProjectName = 'Project Phoenix');

-- Find meetings organized by a specific consultant.
SELECT
    MeetingID,
    Purpose
FROM
    Meetings
WHERE
    OrganizerID = (SELECT ConsultantID FROM Consultants WHERE FirstName = 'Alice' AND LastName = 'Johnson');

-- Find all meetings with a `Status` of 'Completed'.
SELECT
    MeetingID,
    Location
FROM
    Meetings
WHERE
    Status = 'Completed';

-- Find meetings with a duration longer than 60 minutes.
SELECT
    MeetingID,
    Purpose
FROM
    Meetings
WHERE
    TIMESTAMPDIFF(MINUTE, StartTime, EndTime) > 60;

-- Find meetings held in 'Conference Room A'.
SELECT
    MeetingID,
    Purpose
FROM
    Meetings
WHERE
    Location = 'Conference Room A';

-- ------------------------------
-- 3. BUILT-IN FUNCTIONS
-- ------------------------------

-- Count the number of meetings for each `Status`.
SELECT
    Status,
    COUNT(*) AS NumberOfMeetings
FROM
    Meetings
GROUP BY
    Status;

-- Calculate the average duration of meetings in minutes.
SELECT
    AVG(TIMESTAMPDIFF(MINUTE, StartTime, EndTime)) AS AverageDurationMinutes
FROM
    Meetings;

-- Get the day of the week for each meeting.
SELECT
    MeetingID,
    DAYNAME(MeetingDate) AS DayOfWeek
FROM
    Meetings;

-- Concatenate the purpose and location for each meeting.
SELECT
    MeetingID,
    CONCAT(Purpose, ' at ', Location) AS MeetingSummary
FROM
    Meetings;

-- Convert the purpose to lowercase.
SELECT
    MeetingID,
    LOWER(Purpose) AS LowerCasePurpose
FROM
    Meetings;

-- ------------------------------
-- 4. USER-DEFINED FUNCTIONS
-- ------------------------------

-- A UDF to get the project name for a given `MeetingID`.
DELIMITER //
CREATE FUNCTION GetProjectNameFromMeeting(meetingId INT)
RETURNS VARCHAR(100)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE project_name VARCHAR(100);
    SELECT p.ProjectName INTO project_name
    FROM Meetings AS m
    JOIN Projects AS p ON m.ProjectID = p.ProjectID
    WHERE m.MeetingID = meetingId;
    RETURN project_name;
END //
DELIMITER ;

-- A UDF to get the organizer's name for a given `MeetingID`.
DELIMITER //
CREATE FUNCTION GetOrganizerNameFromMeeting(meetingId INT)
RETURNS VARCHAR(100)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE organizer_name VARCHAR(100);
    SELECT CONCAT(c.FirstName, ' ', c.LastName) INTO organizer_name
    FROM Meetings AS m
    JOIN Consultants AS c ON m.OrganizerID = c.ConsultantID
    WHERE m.MeetingID = meetingId;
    RETURN organizer_name;
END //
DELIMITER ;

-- A UDF to check if a meeting has `MinutesRecorded`.
DELIMITER //
CREATE FUNCTION AreMinutesRecorded(meetingId INT)
RETURNS VARCHAR(10)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE minutes_recorded BOOLEAN;
    SELECT MinutesRecorded INTO minutes_recorded FROM Meetings WHERE MeetingID = meetingId;
    IF minutes_recorded THEN
        RETURN 'Yes';
    ELSE
        RETURN 'No';
    END IF;
END //
DELIMITER ;

-- A UDF to get the `Location` of a meeting.
DELIMITER //
CREATE FUNCTION GetMeetingLocation(meetingId INT)
RETURNS VARCHAR(100)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE loc VARCHAR(100);
    SELECT Location INTO loc FROM Meetings WHERE MeetingID = meetingId;
    RETURN loc;
END //
DELIMITER ;

-- A UDF to get the `Status` of a meeting.
DELIMITER //
CREATE FUNCTION GetMeetingStatus(meetingId INT)
RETURNS VARCHAR(20)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE status_val VARCHAR(20);
    SELECT Status INTO status_val FROM Meetings WHERE MeetingID = meetingId;
    RETURN status_val;
END //
DELIMITER ;

-- Clean up the functions after use
DROP FUNCTION IF EXISTS GetProjectNameFromMeeting;
DROP FUNCTION IF EXISTS GetOrganizerNameFromMeeting;
DROP FUNCTION IF EXISTS AreMinutesRecorded;
DROP FUNCTION IF EXISTS GetMeetingLocation;
DROP FUNCTION IF EXISTS GetMeetingStatus;

-- ====================================================================================================
-- TABLE 23: Evaluations
-- ====================================================================================================

-- Foreign Keys & Relationships:
-- EvaluationID (PK) -> (no direct FK in other tables)
-- ConsultantID (FK) -> Consultants.ConsultantID
-- ProjectID (FK) -> Projects.ProjectID
-- ------------------------------
-- 1. JOIN QUERIES
-- ------------------------------

-- INNER JOIN: Lists evaluations with consultant and project names.
SELECT
    e.EvaluationID,
    CONCAT(c.FirstName, ' ', c.LastName) AS ConsultantName,
    p.ProjectName,
    e.Score
FROM
    Evaluations AS e
INNER JOIN
    Consultants AS c ON e.ConsultantID = c.ConsultantID
INNER JOIN
    Projects AS p ON e.ProjectID = p.ProjectID;

-- LEFT JOIN: Lists all evaluations and the consultant's name if available.
SELECT
    e.EvaluationID,
    e.EvaluationDate,
    CONCAT(c.FirstName, ' ', c.LastName) AS ConsultantName
FROM
    Evaluations AS e
LEFT JOIN
    Consultants AS c ON e.ConsultantID = c.ConsultantID;

-- RIGHT JOIN: Lists all consultants and any evaluations they have received.
SELECT
    CONCAT(c.FirstName, ' ', c.LastName) AS ConsultantName,
    e.Score,
    e.Comments
FROM
    Evaluations AS e
RIGHT JOIN
    Consultants AS c ON e.ConsultantID = c.ConsultantID;

-- LEFT EXCLUSIVE JOIN: Finds evaluations that are not linked to a project.
SELECT
    e.EvaluationID
FROM
    Evaluations AS e
LEFT JOIN
    Projects AS p ON e.ProjectID = p.ProjectID
WHERE
    p.ProjectID IS NULL;

-- RIGHT EXCLUSIVE JOIN: Finds projects that have not had any evaluations.
SELECT
    p.ProjectName
FROM
    Evaluations AS e
RIGHT JOIN
    Projects AS p ON e.ProjectID = p.ProjectID
WHERE
    e.EvaluationID IS NULL;

-- ------------------------------
-- 2. SUBQUERIES
-- ------------------------------

-- Find evaluations for a consultant named 'Jane Smith'.
SELECT
    EvaluationID,
    Score
FROM
    Evaluations
WHERE
    ConsultantID = (SELECT ConsultantID FROM Consultants WHERE FirstName = 'Jane' AND LastName = 'Smith');

-- Find all evaluations with a `Score` greater than 8.0.
SELECT
    EvaluationID,
    Comments
FROM
    Evaluations
WHERE
    Score > 8.0;

-- Find evaluations for 'Project Alpha'.
SELECT
    EvaluationID,
    EvaluationDate
FROM
    Evaluations
WHERE
    ProjectID IN (SELECT ProjectID FROM Projects WHERE ProjectName = 'Project Alpha');

-- Find the evaluation with the lowest score.
SELECT
    EvaluationID,
    Score
FROM
    Evaluations
WHERE
    Score = (SELECT MIN(Score) FROM Evaluations);

-- Find evaluations that have a `FollowUpDate` scheduled.
SELECT
    EvaluationID
FROM
    Evaluations
WHERE
    FollowUpDate IS NOT NULL;

-- ------------------------------
-- 3. BUILT-IN FUNCTIONS
-- ------------------------------

-- Count the number of evaluations for each `Status`.
SELECT
    Status,
    COUNT(*) AS NumberOfEvaluations
FROM
    Evaluations
GROUP BY
    Status;

-- Calculate the average `Score` across all evaluations.
SELECT
    AVG(Score) AS AverageScore
FROM
    Evaluations;

-- Find the number of days between the `EvaluationDate` and the `FollowUpDate`.
SELECT
    EvaluationID,
    DATEDIFF(FollowUpDate, EvaluationDate) AS DaysUntilFollowUp
FROM
    Evaluations
WHERE
    FollowUpDate IS NOT NULL;

-- Get the length of the `Comments` string.
SELECT
    EvaluationID,
    LENGTH(Comments) AS CommentLength
FROM
    Evaluations;

-- Convert the `Evaluator` name to uppercase.
SELECT
    EvaluationID,
    UPPER(Evaluator) AS UpperCaseEvaluator
FROM
    Evaluations;

-- ------------------------------
-- 4. USER-DEFINED FUNCTIONS
-- ------------------------------

-- A UDF to get the consultant's name for a given `EvaluationID`.
DELIMITER //
CREATE FUNCTION GetConsultantNameFromEvaluation(evaluationId INT)
RETURNS VARCHAR(100)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE consultant_name VARCHAR(100);
    SELECT CONCAT(c.FirstName, ' ', c.LastName) INTO consultant_name
    FROM Evaluations AS e
    JOIN Consultants AS c ON e.ConsultantID = c.ConsultantID
    WHERE e.EvaluationID = evaluationId;
    RETURN consultant_name;
END //
DELIMITER ;

-- A UDF to get the `Score` for an evaluation.
DELIMITER //
CREATE FUNCTION GetEvaluationScore(evaluationId INT)
RETURNS DECIMAL(4, 2)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE score_val DECIMAL(4, 2);
    SELECT Score INTO score_val FROM Evaluations WHERE EvaluationID = evaluationId;
    RETURN score_val;
END //
DELIMITER ;

-- A UDF to check if an evaluation has been 'Reviewed'.
DELIMITER //
CREATE FUNCTION IsEvaluationReviewed(evaluationId INT)
RETURNS VARCHAR(10)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE status_val VARCHAR(20);
    SELECT Status INTO status_val FROM Evaluations WHERE EvaluationID = evaluationId;
    IF status_val = 'Reviewed' THEN
        RETURN 'Yes';
    ELSE
        RETURN 'No';
    END IF;
END //
DELIMITER ;

-- A UDF to get the `Comments` for an evaluation.
DELIMITER //
CREATE FUNCTION GetEvaluationComments(evaluationId INT)
RETURNS TEXT
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE comments_text TEXT;
    SELECT Comments INTO comments_text FROM Evaluations WHERE EvaluationID = evaluationId;
    RETURN comments_text;
END //
DELIMITER ;

-- A UDF to get the `Recommendations` for an evaluation.
DELIMITER //
CREATE FUNCTION GetEvaluationRecommendations(evaluationId INT)
RETURNS TEXT
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE recommendations_text TEXT;
    SELECT Recommendations INTO recommendations_text FROM Evaluations WHERE EvaluationID = evaluationId;
    RETURN recommendations_text;
END //
DELIMITER ;

-- Clean up the functions after use
DROP FUNCTION IF EXISTS GetConsultantNameFromEvaluation;
DROP FUNCTION IF EXISTS GetEvaluationScore;
DROP FUNCTION IF EXISTS IsEvaluationReviewed;
DROP FUNCTION IF EXISTS GetEvaluationComments;
DROP FUNCTION IF EXISTS GetEvaluationRecommendations;

-- ====================================================================================================
-- TABLE 24: Expenses
-- ====================================================================================================

-- Foreign Keys & Relationships:
-- ExpenseID (PK) -> (no direct FK in other tables)
-- ProjectID (FK) -> Projects.ProjectID
-- SubmittedBy (FK) -> Consultants.ConsultantID
-- ApprovedBy (FK) -> Consultants.ConsultantID
-- ------------------------------
-- 1. JOIN QUERIES
-- ------------------------------

-- INNER JOIN: Lists expenses with project, submitter, and approver names.
SELECT
    e.ExpenseID,
    e.Amount,
    p.ProjectName,
    CONCAT(c1.FirstName, ' ', c1.LastName) AS SubmittedBy,
    CONCAT(c2.FirstName, ' ', c2.LastName) AS ApprovedBy
FROM
    Expenses AS e
INNER JOIN
    Projects AS p ON e.ProjectID = p.ProjectID
INNER JOIN
    Consultants AS c1 ON e.SubmittedBy = c1.ConsultantID
LEFT JOIN
    Consultants AS c2 ON e.ApprovedBy = c2.ConsultantID;

-- LEFT JOIN: Lists all expenses, including the approver's name if available.
SELECT
    e.ExpenseID,
    e.Description,
    CONCAT(c.FirstName, ' ', c.LastName) AS ApprovedBy
FROM
    Expenses AS e
LEFT JOIN
    Consultants AS c ON e.ApprovedBy = c.ConsultantID;

-- RIGHT JOIN: Lists all consultants and any expenses they have submitted.
SELECT
    CONCAT(c.FirstName, ' ', c.LastName) AS ConsultantName,
    e.Description,
    e.Amount
FROM
    Expenses AS e
RIGHT JOIN
    Consultants AS c ON e.SubmittedBy = c.ConsultantID;

-- LEFT EXCLUSIVE JOIN: Finds expenses that are not linked to a project.
SELECT
    e.ExpenseID
FROM
    Expenses AS e
LEFT JOIN
    Projects AS p ON e.ProjectID = p.ProjectID
WHERE
    p.ProjectID IS NULL;

-- RIGHT EXCLUSIVE JOIN: Finds projects that have no recorded expenses.
SELECT
    p.ProjectName
FROM
    Expenses AS e
RIGHT JOIN
    Projects AS p ON e.ProjectID = p.ProjectID
WHERE
    e.ExpenseID IS NULL;

-- ------------------------------
-- 2. SUBQUERIES
-- ------------------------------

-- Find all expenses with an `Amount` greater than $10,000.
SELECT
    ExpenseID,
    Description,
    Amount
FROM
    Expenses
WHERE
    Amount > 10000;

-- Find expenses for a specific project (e.g., ProjectID = 1).
SELECT
    Description,
    Amount
FROM
    Expenses
WHERE
    ProjectID IN (SELECT ProjectID FROM Projects WHERE ProjectID = 1);

-- Find all expenses with 'Pending' status.
SELECT
    ExpenseID,
    Description
FROM
    Expenses
WHERE
    Status = 'Pending';

-- Find the expense with the highest `Amount`.
SELECT
    ExpenseID,
    Amount
FROM
    Expenses
WHERE
    Amount = (SELECT MAX(Amount) FROM Expenses);

-- Find expenses submitted by consultants with 'Marketing' specialization.
SELECT
    e.ExpenseID,
    e.Description
FROM
    Expenses AS e
WHERE
    e.SubmittedBy IN (SELECT ConsultantID FROM Consultants WHERE Specialization = 'Marketing');

-- ------------------------------
-- 3. BUILT-IN FUNCTIONS
-- ------------------------------

-- Count the number of expenses for each `Category`.
SELECT
    Category,
    COUNT(*) AS NumberOfExpenses
FROM
    Expenses
GROUP BY
    Category;

-- Calculate the total `Amount` for all expenses.
SELECT
    SUM(Amount) AS TotalExpenses
FROM
    Expenses;

-- Find the average expense `Amount`.
SELECT
    AVG(Amount) AS AverageExpenseAmount
FROM
    Expenses;

-- Find the most recent `ExpenseDate`.
SELECT
    MAX(ExpenseDate) AS LatestExpenseDate
FROM
    Expenses;

-- Get the year from the `ExpenseDate`.
SELECT
    ExpenseID,
    YEAR(ExpenseDate) AS ExpenseYear
FROM
    Expenses;

-- ------------------------------
-- 4. USER-DEFINED FUNCTIONS
-- ------------------------------

-- A UDF to get the project name for a given `ExpenseID`.
DELIMITER //
CREATE FUNCTION GetProjectNameFromExpense(expenseId INT)
RETURNS VARCHAR(100)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE project_name VARCHAR(100);
    SELECT p.ProjectName INTO project_name
    FROM Expenses AS e
    JOIN Projects AS p ON e.ProjectID = p.ProjectID
    WHERE e.ExpenseID = expenseId;
    RETURN project_name;
END //
DELIMITER ;

-- A UDF to get the `Amount` of an expense.
DELIMITER //
CREATE FUNCTION GetExpenseAmount(expenseId INT)
RETURNS DECIMAL(10, 2)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE expense_amount DECIMAL(10, 2);
    SELECT Amount INTO expense_amount FROM Expenses WHERE ExpenseID = expenseId;
    RETURN expense_amount;
END //
DELIMITER ;

-- A UDF to check if an expense has been 'Approved'.
DELIMITER //
CREATE FUNCTION IsExpenseApproved(expenseId INT)
RETURNS VARCHAR(10)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE status_val VARCHAR(20);
    SELECT Status INTO status_val FROM Expenses WHERE ExpenseID = expenseId;
    IF status_val = 'Approved' THEN
        RETURN 'Yes';
    ELSE
        RETURN 'No';
    END IF;
END //
DELIMITER ;

-- A UDF to get the name of the consultant who submitted an expense.
DELIMITER //
CREATE FUNCTION GetSubmitterNameForExpense(expenseId INT)
RETURNS VARCHAR(100)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE submitter_name VARCHAR(100);
    SELECT CONCAT(c.FirstName, ' ', c.LastName) INTO submitter_name
    FROM Expenses AS e
    JOIN Consultants AS c ON e.SubmittedBy = c.ConsultantID
    WHERE e.ExpenseID = expenseId;
    RETURN submitter_name;
END //
DELIMITER ;

-- A UDF to get the `Category` of an expense.
DELIMITER //
CREATE FUNCTION GetExpenseCategory(expenseId INT)
RETURNS VARCHAR(50)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE category_name VARCHAR(50);
    SELECT Category INTO category_name FROM Expenses WHERE ExpenseID = expenseId;
    RETURN category_name;
END //
DELIMITER ;

-- Clean up the functions after use
DROP FUNCTION IF EXISTS GetProjectNameFromExpense;
DROP FUNCTION IF EXISTS GetExpenseAmount;
DROP FUNCTION IF EXISTS IsExpenseApproved;
DROP FUNCTION IF EXISTS GetSubmitterNameForExpense;
DROP FUNCTION IF EXISTS GetExpenseCategory;

-- ====================================================================================================
-- TABLE 25: MarketingCampaigns
-- ====================================================================================================

-- Foreign Keys & Relationships:
-- CampaignID (PK) -> (no direct FK in other tables)
-- CreatedBy (FK) -> Consultants.ConsultantID
-- ------------------------------
-- 1. JOIN QUERIES
-- ------------------------------

-- INNER JOIN: Lists marketing campaigns with the name of the consultant who created them.
SELECT
    mc.CampaignID,
    mc.CampaignName,
    mc.Budget,
    CONCAT(c.FirstName, ' ', c.LastName) AS CreatedBy
FROM
    MarketingCampaigns AS mc
INNER JOIN
    Consultants AS c ON mc.CreatedBy = c.ConsultantID;

-- LEFT JOIN: Lists all marketing campaigns and the creator's name if available.
SELECT
    mc.CampaignID,
    mc.CampaignName,
    CONCAT(c.FirstName, ' ', c.LastName) AS CreatedBy
FROM
    MarketingCampaigns AS mc
LEFT JOIN
    Consultants AS c ON mc.CreatedBy = c.ConsultantID;

-- RIGHT JOIN: Lists all consultants and any marketing campaigns they have created.
SELECT
    CONCAT(c.FirstName, ' ', c.LastName) AS ConsultantName,
    mc.CampaignName
FROM
    MarketingCampaigns AS mc
RIGHT JOIN
    Consultants AS c ON mc.CreatedBy = c.ConsultantID;

-- LEFT EXCLUSIVE JOIN: Finds campaigns that are not linked to a consultant.
SELECT
    mc.CampaignID
FROM
    MarketingCampaigns AS mc
LEFT JOIN
    Consultants AS c ON mc.CreatedBy = c.ConsultantID
WHERE
    c.ConsultantID IS NULL;

-- RIGHT EXCLUSIVE JOIN: Finds consultants who have not created any marketing campaigns.
SELECT
    CONCAT(c.FirstName, ' ', c.LastName) AS ConsultantName
FROM
    MarketingCampaigns AS mc
RIGHT JOIN
    Consultants AS c ON mc.CreatedBy = c.ConsultantID
WHERE
    mc.CampaignID IS NULL;

-- ------------------------------
-- 2. SUBQUERIES
-- ------------------------------

-- Find all campaigns with a `Budget` greater than $100,000.
SELECT
    CampaignID,
    CampaignName,
    Budget
FROM
    MarketingCampaigns
WHERE
    Budget > 100000;

-- Find campaigns created by a specific consultant.
SELECT
    CampaignName,
    Status
FROM
    MarketingCampaigns
WHERE
    CreatedBy = (SELECT ConsultantID FROM Consultants WHERE FirstName = 'Alice' AND LastName = 'Johnson');

-- Find all 'Active' campaigns.
SELECT
    CampaignID,
    CampaignName
FROM
    MarketingCampaigns
WHERE
    Status = 'Active';

-- Find the campaign with the highest `ROI`.
SELECT
    CampaignName,
    ROI
FROM
    MarketingCampaigns
WHERE
    ROI = (SELECT MAX(ROI) FROM MarketingCampaigns);

-- Find campaigns that target 'Students'.
SELECT
    CampaignID,
    CampaignName
FROM
    MarketingCampaigns
WHERE
    TargetAudience = 'Students';

-- ------------------------------
-- 3. BUILT-IN FUNCTIONS
-- ------------------------------

-- Count the number of campaigns for each `Status`.
SELECT
    Status,
    COUNT(*) AS NumberOfCampaigns
FROM
    MarketingCampaigns
GROUP BY
    Status;

-- Calculate the total `Budget` of all campaigns.
SELECT
    SUM(Budget) AS TotalBudget
FROM
    MarketingCampaigns;

-- Find the average `ROI`.
SELECT
    AVG(ROI) AS AverageROI
FROM
    MarketingCampaigns;

-- Find the number of days each campaign lasted.
SELECT
    CampaignID,
    DATEDIFF(EndDate, StartDate) AS DurationInDays
FROM
    MarketingCampaigns;

-- Get the year from the `StartDate`.
SELECT
    CampaignID,
    YEAR(StartDate) AS StartYear
FROM
    MarketingCampaigns;

-- ------------------------------
-- 4. USER-DEFINED FUNCTIONS
-- ------------------------------

-- A UDF to get the consultant's name who created a campaign.
DELIMITER //
CREATE FUNCTION GetCampaignCreatorName(campaignId INT)
RETURNS VARCHAR(100)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE creator_name VARCHAR(100);
    SELECT CONCAT(c.FirstName, ' ', c.LastName) INTO creator_name
    FROM MarketingCampaigns AS mc
    JOIN Consultants AS c ON mc.CreatedBy = c.ConsultantID
    WHERE mc.CampaignID = campaignId;
    RETURN creator_name;
END //
DELIMITER ;

-- A UDF to get the `Budget` for a campaign.
DELIMITER //
CREATE FUNCTION GetCampaignBudget(campaignId INT)
RETURNS DECIMAL(12, 2)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE budget_amount DECIMAL(12, 2);
    SELECT Budget INTO budget_amount FROM MarketingCampaigns WHERE CampaignID = campaignId;
    RETURN budget_amount;
END //
DELIMITER ;

-- A UDF to check if a campaign is 'Active'.
DELIMITER //
CREATE FUNCTION IsCampaignActive(campaignId INT)
RETURNS VARCHAR(10)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE status_val VARCHAR(20);
    SELECT Status INTO status_val FROM MarketingCampaigns WHERE CampaignID = campaignId;
    IF status_val = 'Active' THEN
        RETURN 'Yes';
    ELSE
        RETURN 'No';
    END IF;
END //
DELIMITER ;

-- A UDF to get the `ROI` of a campaign.
DELIMITER //
CREATE FUNCTION GetCampaignROI(campaignId INT)
RETURNS DECIMAL(5, 2)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE roi_val DECIMAL(5, 2);
    SELECT ROI INTO roi_val FROM MarketingCampaigns WHERE CampaignID = campaignId;
    RETURN roi_val;
END //
DELIMITER ;

-- A UDF to get the `Channel` of a campaign.
DELIMITER //
CREATE FUNCTION GetCampaignChannel(campaignId INT)
RETURNS VARCHAR(50)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE channel_name VARCHAR(50);
    SELECT Channel INTO channel_name FROM MarketingCampaigns WHERE CampaignID = campaignId;
    RETURN channel_name;
END //
DELIMITER ;

-- Clean up the functions after use
DROP FUNCTION IF EXISTS GetCampaignCreatorName;
DROP FUNCTION IF EXISTS GetCampaignBudget;
DROP FUNCTION IF EXISTS IsCampaignActive;
DROP FUNCTION IF EXISTS GetCampaignROI;
DROP FUNCTION IF EXISTS GetCampaignChannel;
-- ====================================================================================================
-- End of Script
-- ====================================================================================================

-- -------------------------------------------------------- PHASE IV ----------------------------------------------------------
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

-- ----------------------------------------------------------- PHASE 5 ----------------------------------------------------------------------
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

-- ----------------------------------------------------------------------------------------------------------------------------------




















