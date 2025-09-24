# 📊 Consulting Firm Management Project (Phase 5)

This repository contains **Phase 5** of the **Consulting Firm Management System**.  
It extends the system by implementing **advanced SQL concepts** including **DDL, DML, DQL, constraints, joins, subqueries, functions, views, CTEs, stored procedures, window functions, transactions, and triggers**.  

---

## 📌 Project Overview

The database models the operations of a consulting firm, covering consultants, clients, projects, departments, tasks, timesheets, invoices, payments, and more.  
Phase 5 builds on previous phases by integrating **comprehensive SQL operations** for database management and business rule enforcement.

---

## 🏗️ SQL Components Implemented

### ✅ DDL (Data Definition Language) – 10 Queries
- Create new tables (e.g., `EmployeeCertifications`, `OfficeLocations`, `ProjectTasks`, `AssetAssignments`).
- Alter tables to **add/drop columns, constraints, and indexes**.
- Add **ON DELETE / ON UPDATE CASCADE** relationships for data integrity.
- Rename and drop tables as demonstrations.

### ✅ DML (Data Manipulation Language) – 10 Queries
- Insert consultant, client, project, invoice, and timesheet records.
- Update consultant salaries and project statuses.
- Delete old/unwanted timesheets, trainings, and resources.

### ✅ DQL (Data Query Language) – 10 Queries
- Select queries for insights:
  - Active consultants
  - Projects by year
  - Hours worked per project
  - Clients registered in the last year
  - Upcoming appointments

### ✅ Clauses & Operators – 10 Queries
- Usage of **WHERE, LIKE, BETWEEN, IN, ANY, ALL, OR, NOT** operators.
- Examples include:  
  - Consultants earning more than HR consultants.  
  - Projects with budgets exceeding completed projects.  
  - Marketing campaigns in July 2025.

### ✅ Constraints & Cascades – 10 Queries
- Unique, Check, Cascade constraints.
- Examples:  
  - One attendance record per consultant per day.  
  - Cascade delete contracts when clients are deleted.  
  - Employee hierarchy with self-referencing table.

### ✅ Joins – 10 Queries
- **INNER JOIN, LEFT JOIN, RIGHT JOIN, SELF JOIN, FULL OUTER JOIN (via UNION)**.
- Examples:  
  - Project–client pairs.  
  - Consultants with same specialization.  
  - Attendance comparisons across consecutive days.

### ✅ Subqueries – 10 Queries
- Used for filtering and aggregations.
- Examples:  
  - Projects with budgets above average.  
  - Consultants above specialization average.  
  - Clients with more proposals than average.  
  - Projects with no tasks.  

### ✅ Functions – 10 Queries
- Aggregate and string functions:  
  - COUNT, SUM, AVG, MAX, MIN, LENGTH, UPPER, LOWER.  
  - Task count by status, average leave length, longest resource name.

### ✅ Views & CTEs – 10 Queries
- Views like `ConsultantInfo`, `ProjectSummary`, `HighValueInvoices`.  
- CTEs for:  
  - Task counts per project.  
  - Yearly consultant hours.  
  - Recursive sequences and running totals.

### ✅ Stored Procedures – 5 Queries
- Add new clients, consultants, timesheets.  
- Update project status.  
- Get total invoices for a client.  
- Delete consultant by ID.

### ✅ Window Functions – 5 Queries
- Ranking and analytic queries:  
  - Salary rank of consultants.  
  - Project budget ranks.  
  - LEAD/LAG for deadlines and meetings.  
  - Rank consultants within specialization.

### ✅ Transactions – 5 Queries
- Demonstrations of **COMMIT, ROLLBACK, SAVEPOINT**.  
- Examples:  
  - Update project budgets and client status.  
  - Insert payments after invoice is marked paid.  
  - Rollback partial task deletions.

### ✅ Triggers – 5 Queries
- Enforcing business rules and logging:
  - Deduct cost from project budget after timesheet insert.  
  - Prevent drastic project budget cuts.  
  - Log client deletions.  
  - Auto-update invoice status after payment.  
  - Auto-set feedback submission date.

---

## 🚀 Getting Started

### Prerequisites
- **MySQL** (or compatible RDBMS) installed.
- Database name: `Consulting_firm_Management`.

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/consulting-firm-management-phase5.git
   cd consulting-firm-management-phase5

