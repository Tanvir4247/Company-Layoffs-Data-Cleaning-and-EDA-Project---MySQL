# Data Cleaning and Transformation Project - MySQL

This document outlines the process of data cleaning and transformation using MySQL for a dataset related to company layoffs. The aim of this project is to prepare the data for analysis by removing duplicates, standardizing values, and ensuring data consistency.

## 1. Project Overview

In this project, the focus is on cleaning and transforming a dataset that contains information about company layoffs. The main goals are to remove duplicate records, standardize certain column values, and correct data types. This process is crucial to ensure the accuracy and reliability of any subsequent analysis.

## 2. Data Source

The dataset used in this project comes from a table named `layoffs` which contains details about layoffs in various companies.

## 3. Tools Used

### i) MySQL

## 4. Data Cleaning and Transformation Steps

### Step 1: Working with a New Table

- **Created a new table** `additional` identical to the `layoffs` table to work on a copy rather than the main table.

### Step 2: Removing Duplicate Rows

- Used a Common Table Expression (CTE) to identify duplicate rows based on multiple columns.
- Created a new table `additional2` and added a `row_num` column to count duplicate rows.
- Removed duplicate rows by keeping only the first occurrence.

### Step 3: Trimming Strings

- Identified and trimmed extra spaces in the `company` column to ensure uniformity.
- Updated the `company` column with trimmed values.

### Step 4: Standardizing Industry Names

- Identified variations of industry names, specifically those starting with "crypto".
- Updated these values to a standardized format "Crypto".

### Step 5: Standardizing Country Names

- Identified and corrected variations of country names such as 'United States.' to 'United States'.
- Ensured consistency in the `country` column.

### Step 6: Changing Data Type of Date Column

- Converted the `date` column from a string to a `DATE` data type for accurate date handling.
- Updated the table to reflect the new data type.

### Step 7: Handling Null or Empty Industry Values

- Identified rows with null or empty `industry` values.
- Updated these rows by filling in missing industry information based on company name matches.

### Step 8: Additional Data Cleaning

- Ensured there were no remaining unnecessary spaces in the `stage` column.
- Checked for and updated any remaining null or empty values in the `industry` column.

## 5. Results

The data cleaning and transformation process resulted in a clean and standardized dataset, ready for analysis. Key improvements include:

- Removal of duplicate records.
- Standardization of industry and country names.
- Corrected data types for date values.
- Uniformity in text fields with trimmed strings.

This clean dataset is now reliable for further analysis and reporting, ensuring accurate insights and decision-making.

## Project Insight:

This project demonstrates the importance and effectiveness of data cleaning and transformation in preparing datasets for analysis. By meticulously addressing duplicates, inconsistencies, and incorrect data types, the final dataset is both accurate and ready for insightful analysis.
