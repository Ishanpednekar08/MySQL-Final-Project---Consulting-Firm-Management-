# 📊 Consulting Firm Management Project (Phase 4)

This project is part of the **Consulting Firm Management System**, developed as a continuation of earlier phases.  
Phase 4 focuses on implementing **advanced SQL features** such as **Views, Cursors, Stored Procedures, Window Functions, DCL & TCL, and Triggers** across multiple tables to simulate real-world consulting firm operations.

---

## 📌 Project Overview

The database models a consulting firm, covering consultants, clients, projects, departments, tasks, timesheets, invoices, payments, and more.  
In Phase 4, we extend functionality to include:

- Simplified and complex **Views** for quick insights.
- **Cursors** for row-by-row processing.
- **Stored Procedures** for modular database operations.
- **Window Functions** for ranking and aggregations.
- **DCL (Data Control Language)** for permissions.
- **TCL (Transaction Control Language)** for transactions.
- **Triggers** for enforcing business rules.

---

## 🏗️ Database Objects Implemented

The following features have been implemented for each major table in the system:

### ✅ Views
- Simple Views for quick access (e.g., Active Consultants, High-Priority Projects).
- Complex Views for aggregations and joins (e.g., Average Salary by Specialization, Client Invoice Summary).

### ✅ Cursors
- Demonstrations of row-by-row iteration (e.g., iterate high earners, pending tasks, unpaid invoices).

### ✅ Stored Procedures
- Parameterized procedures for updating and managing data (e.g., Update Consultant Salary, Approve Leave, Cancel Meeting).

### ✅ Window Functions
- Ranking and aggregate comparisons (e.g., Salary Rank by Specialization, Ranking Projects by Budget).

### ✅ DCL & TCL
- **GRANT** and **REVOKE** statements to manage permissions.
- **Transactions** using `START TRANSACTION`, `COMMIT`, and `ROLLBACK`.

### ✅ Triggers
- Enforcing constraints and logging changes (e.g., prevent negative values, ensure valid dates, log inserts).

---

## 📂 Key Entities Covered

1. **Consultants** – Active consultants, salary ranks, audit logs.  
2. **Clients** – Active clients, industry grouping, restrictions on deletions.  
3. **Projects** – Priority projects, budget validations, status updates.  
4. **Departments** – Budget-based views, employee counts, triggers for employee validation.  
5. **Tasks** – Highest priority tasks, consultant-task mapping, negative hours prevention.  
6. **Timesheets** – Pending approvals, consultant hours ranking, validation triggers.  
7. **Invoices & Payments** – Unpaid invoices, payment summaries, financial triggers.  
8. **Appointments** – Consultant schedules, validations for start/end times.  
9. **Feedback** – Ratings, project averages, triggers to enforce valid scores.  
10. **Reports** – Status updates, reviewer validations, creation ranks.  
11. **Resources & Assets** – Availability tracking, location assignments, value constraints.  
12. **Technologies & Trainings** – Status updates, expiry checks, ranking by cost/purchase.  
13. **JobRoles & Leaves** – Active roles, leave approvals, validations for dates/experience.  
14. **Attendance** – Tracking work hours, validation of check-in/check-out.  
15. **Contracts & Proposals** – Validations for values and approvers.  
16. **Vendors & Meetings** – Vendor services, meeting durations, triggers for contracts.  
17. **Evaluations, Expenses, Campaigns** – Performance tracking, expense validations, marketing ROI.

---

## 🚀 Getting Started

### Prerequisites
- **MySQL** (or compatible RDBMS)
- Database name: `consulting_firm_management`

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/consulting-firm-management-phase4.git
   cd consulting-firm-management-phase4
````

2. Open MySQL Workbench or terminal.
3. Run the SQL script:

   ```sql
   source project_phase4.sql;
   ```
4. Verify the database objects using:

   ```sql
   SHOW FULL TABLES;
   SHOW PROCEDURE STATUS;
   SHOW TRIGGERS;
   ```

---

## 📖 Example Usage

* **Update Consultant Salary**:

  ```sql
  CALL UpdateConsultantSalary(3, 95000.00);
  ```

* **View Active Clients**:

  ```sql
  SELECT * FROM ActiveClients;
  ```

* **Trigger in Action** (prevents negative salary):

  ```sql
  UPDATE Consultants SET Salary = -5000 WHERE ConsultantID = 2;
  -- Error: Salary cannot be zero or negative
  ```

---

## ✨ Features Highlight

* Demonstrates **real-world consulting firm management** operations.
* Implements **modular, reusable SQL code** via procedures and views.
* Ensures **data integrity** through triggers and validations.
* Adds **role-based access** with DCL.
* Provides **transaction safety** with TCL.

---

