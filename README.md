# Superstore SQL Analytics & Data Cleaning Project

## Description
This repository contains the end-to-end SQL analysis of the Superstore dataset. The project covers data cleaning, deduplication, regional financial analysis, customer profitability profiling, and shipping optimization.

## Tools Used
* **Database:** MySQL / MySQL Workbench
* **Language:** SQL

## Key SQL Techniques Applied
* Table Deduplication via `INNER JOIN` deletion
* Conditional Grouping and Aggregations (`SUM`, `AVG`, `COUNT DISTINCT`)
* Filtering Aggregates via `HAVING` clauses
* Date Arithmetic via `DATEDIFF()`

## Project Results Summary
* **Cleaned Data:** Identified and removed duplicate records based on compound keys (`Order ID` + `Product ID`).
* **Profit Driver:** Identified West region as top performing (14.97% margin).
* **Root Cause Analysis:** Identified aggressive discounting in Central Technology as the primary organizational profit leak.
