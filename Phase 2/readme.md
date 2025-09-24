# Consulting Firm Management Project – Phase 2

## 📌 Project Overview

Phase 2 of the **Consulting Firm Management System** focuses on building the database schema, inserting sample data, and implementing various SQL operations to manage day-to-day consulting firm activities.
The system helps manage consultants, clients, projects, departments, tasks, financial transactions, and appointments in an organized manner.

---

## ⚙️ Database Setup

1. **Create Database**

   ```sql
   CREATE DATABASE Consulting_firm_Management;
   USE Consulting_firm_Management;
   ```

2. **Core Entities**

   * **Consultants**: Employee/consultant details (HR, IT, Finance, Marketing, Operations, etc.)
   * **Clients**: Companies with their contacts, industry, and registration details
   * **Projects**: Client-based projects with budget, timelines, managers, and status
   * **Departments**: Internal firm departments with budgets, managers, and objectives
   * **Tasks**: Project tasks assigned to consultants with deadlines and hours logged
   * **Timesheets**: Consultant work logs for tasks/projects
   * **Invoices & Payments**: Client billing and payments tracking
   * **Appointments**: Client-consultant meetings scheduling

---

## 📂 Tables Implemented (Phase 2)

1. **Consultants** – Consultant records with CRUD + Alterations
2. **Clients** – Client companies and industries with queries for status, date filters, etc.
3. **Projects** – Project details with budget, priority, and manager relationships
4. **Departments** – Firm departments with budget, employees, objectives
5. **Tasks** – Tasks linked to consultants & projects with priority levels
6. **Timesheets** – Work logs mapped to consultants, tasks, and projects
7. **Invoices** – Billing system with tax, amounts, and paid/unpaid tracking
8. **Payments** – Payments linked to invoices with method, reference, and verification
9. **Appointments** – Client-consultant meeting schedules

*(Phase 2 includes additional entities beyond this list as expansion, e.g., Feedback, Assets, Marketing Campaigns, etc.)*

---

## 🛠️ SQL Operations Covered

Each table includes:

* **CREATE TABLE** – Schema design with constraints & relationships
* **INSERT** – Sample data population
* **SELECT** – Queries for filtering, grouping, sorting, aggregates
* **ALTER** – Schema modifications (add, modify, drop, constraints)
* **RENAME** – Renaming tables & columns
* **DELETE** – Conditional deletions
* **UPDATE** – Data updates based on business logic

---

## ✅ Sample Queries

* **Consultants**: Find consultants with >5 years of experience.
* **Clients**: List active finance clients in New York or Boston.
* **Projects**: Select completed projects with budget > 100,000.
* **Departments**: Get departments with >20 employees ordered by size.
* **Tasks**: Select completed tasks with hours logged >5.
* **Timesheets**: Get total hours worked per consultant.
* **Invoices**: Select unpaid invoices with amount >50,000.
* **Payments**: Fetch all bank transfer payments above 80,000.
* **Appointments**: List scheduled meetings in March 2023.

---

## 🔗 Relationships

* **Consultants ↔ Tasks ↔ Timesheets ↔ Projects**
* **Clients ↔ Projects ↔ Invoices ↔ Payments**
* **Departments ↔ Consultants**
* **Clients ↔ Appointments ↔ Consultants**

---

## 📖 Learning Outcomes

* Practical database design for a consulting firm
* Advanced SQL operations (DDL, DML, Constraints, Joins)
* Data normalization and relationship handling
* Real-world use cases for HR, Finance, IT, Projects, and Client management

---

## 🚀 Next Steps (Phase 3)

* Add advanced **joins & subqueries** for reporting
* Implement **views, triggers, and stored procedures**
* Create **role-based access and permissions**
* Build **analytics reports** for revenue, performance, and utilization

---

Would you like me to **generate this README as a Markdown file (`README.md`)** so you can directly use it in your project folder?

