# Consulting Management Project – Phase 3

## 📌 Overview

This project is part of the **Consulting Firm Management System**, designed to simulate and manage various operations of a consulting organization.

**Phase 3** focuses on implementing **advanced SQL operations** for querying, reporting, and business logic automation. It builds upon the database schema (Consultants, Clients, Projects, Departments, Tasks, Timesheets, Invoices, Payments, Appointments, Feedback, Reports, Resources, Assets, etc.) created in earlier phases.

The main goals of Phase 3 are:

* Practicing **JOIN queries** (INNER, LEFT, RIGHT, and Exclusive joins).
* Using **subqueries** to extract insights.
* Applying **built-in SQL functions** for analysis.
* Writing and testing **user-defined functions (UDFs)** to extend database functionality.

---

## ⚙️ Features Implemented in Phase 3

### 1. **Join Queries**

* Link consultants with their assigned tasks.
* Show projects with their client companies.
* Identify departments without managers or consultants without departments.
* List invoices and payments with client/project details.

### 2. **Subqueries**

* Find consultants with salaries above the average.
* Get projects with a budget higher than the overall average.
* Identify clients with the most projects.
* Track overdue tasks, projects, and invoices.

### 3. **Built-in SQL Functions**

* Aggregate operations (COUNT, SUM, AVG, MAX, MIN).
* Date and time functions (`DATEDIFF`, `YEAR`, `MONTH`, etc.).
* String operations (`CONCAT`, `UPPER`, `LOWER`, `LENGTH`).

### 4. **User-Defined Functions (UDFs)**

* Retrieve consultant or client details (full names, emails, industries, locations).
* Check business logic conditions (e.g., **IsSeniorConsultant**, **IsProjectOverdue**, **IsTaskOverdue**, **IsInvoiceOverdue**).
* Compute KPIs (e.g., total salary per specialization, average hours worked, days to complete tasks, daily project budget).

---

## 📂 Project Structure

* **`project_phase3.sql`** → Contains all queries, built-in functions, and user-defined functions for Phase 3.
* **Database Used:** `Consulting_firm_Management`

---

## 🚀 How to Run

1. Import or create the `Consulting_firm_Management` database in MySQL or MariaDB.
2. Execute the **Phase 3 SQL script** (`project_phase3.sql`).
3. Test the queries and functions step by step to verify outputs.

---

## 📝 Example Use Cases

* Get consultants who are not assigned to any tasks.
* List all projects managed by a specific consultant.
* Find unpaid invoices and calculate the outstanding amount.
* Generate insights on department budgets and employee counts.
* Track client appointments and feedback trends.

---

## 🔮 Next Steps (Phase 4 – if applicable)

* Implement **Stored Procedures** for automation.
* Add **Triggers** for maintaining data integrity.
* Create **Views** for simplified reporting.
* Explore **performance optimization** using indexes.

---
