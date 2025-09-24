# Consulting Firm Management Project – Phase 1

**Database Design & Implementation**

## 📌 Overview

Phase 1 of the *Consulting Firm Management Project* focuses on creating the core database structure for managing operations in a consulting firm. This phase establishes foundational tables, relationships, and seed data to simulate real-world consulting workflows.

The database is named:

```
Consulting_firm_Management
```

---

## 🎯 Objectives of Phase 1

1. Design a **relational database schema** to manage consultants, clients, projects, and operations.
2. Implement **table creation scripts** with appropriate constraints (Primary Key, Foreign Key, Check, Default, Unique).
3. Insert **sample data** for realistic testing and validation.
4. Establish **relationships** between consultants, clients, projects, departments, and resources.
5. Enable **basic queries** for analysis, reporting, and operational tracking.

---

## 🏗️ Database Entities (Phase 1)

Below are the main tables created in this phase:

1. **Consultants** – Consultant profiles, skills, salaries, status.
2. **Clients** – Client details including company, contact info, and industry.
3. **Projects** – Projects linked to clients and managed by consultants.
4. **Departments** – Departmental structure, budget, and objectives.
5. **Tasks** – Tasks under projects assigned to consultants.
6. **Timesheets** – Consultant work logs and approvals.
7. **Invoices** – Client billing details with tax and payment status.
8. **Payments** – Tracking of client payments and methods.
9. **Appointments** – Meetings between consultants and clients.
10. **Feedback** – Client ratings and comments on project outcomes.
11. **Reports** – Consultant-prepared project reports.
12. **Resources** – Physical and digital resources assigned to consultants.
13. **Assets** – Company assets such as laptops, servers, and furniture.
14. **Technologies** – Tools, software, and licenses in use.
15. **Trainings** – Employee training programs with costs and schedules.
16. **JobRoles** – Roles across departments with experience and salary range.
    *(Additional tables will be included in later phases for HR, compliance, proposals, marketing, etc.)*

---

## 🔗 Relationships

* **Consultants ↔ Clients** → via *Appointments, Projects, Feedback*.
* **Clients ↔ Projects** → A client can have multiple projects.
* **Projects ↔ Tasks ↔ Timesheets** → Tracks consultant work allocation and hours.
* **Projects ↔ Invoices ↔ Payments** → Financial tracking from billing to settlement.
* **Departments ↔ JobRoles ↔ Consultants** → HR and org structure.
* **Resources/Assets/Technologies ↔ Consultants** → Resource allocation.

---

## 📂 Key Features Implemented in Phase 1

* **Data Integrity:** Primary & foreign key relationships, constraints (`CHECK`, `DEFAULT`, `UNIQUE`).
* **Data Seeding:** Sample records for each table (20+ rows per major entity).
* **Business Simulation:** End-to-end consulting firm operations – from project kickoff to payments.
* **Scalability:** Designed to support Phase 2 (advanced HR, marketing, proposals, and analytics).

---

## ▶️ How to Use

1. Open the file: `project_phase1.sql`.
2. Run the script in **MySQL** (or any compatible RDBMS).
3. Use queries like:

   ```sql
   SELECT * FROM Consultants;
   SELECT * FROM Clients;
   SELECT * FROM Projects;
   ```

   to verify table structures and inserted data.
4. Extend with custom queries for reports, analytics, and testing.

---

## ✅ Completion Status

* **Database schema:** ✔️ Done
* **Data insertion:** ✔️ Done
* **Testing with sample queries:** ✔️ Done
* **Ready for Phase 2:** 🔜 (expanding to HR processes, proposals, and marketing)

---

