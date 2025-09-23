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













