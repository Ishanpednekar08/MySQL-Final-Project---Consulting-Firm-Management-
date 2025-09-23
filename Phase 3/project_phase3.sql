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
