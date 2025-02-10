# 🛒 Walmart Sales Data Analysis – End-to-End Project  

## 📌 Problem Statement  
This project analyzes **10,000 rows** of Walmart sales data, focusing on sales trends, revenue insights, and customer behaviors. The dataset includes details like **branch, city, category, unit price, quantity, date, time, payment method, rating,** and **profit margin**. The goal is to clean, transform, and analyze the data using **Python** and **SQL** to derive meaningful business insights.  

## 🔍 Approach  

### 1️⃣ Data Cleaning (Python)  
- Loaded the dataset using **Pandas**.  
- Removed duplicates and handled missing values.  
- Converted **date** and **time** columns into proper formats using `pd.to_datetime()`.  
- Standardized data types for smooth SQL querying.

### 2️⃣ Data Storage (MySQL)  
- Exported the cleaned dataset to **MySQL** using **SQLAlchemy**.  
- Created structured tables and inserted data into **MySQL** for analysis.  

### 3️⃣ Business Analysis (SQL)  
Performed key business queries to uncover insights:  
- 🔸 Identified **top-performing branches and product categories**.  
- 🔸 Analyzed **revenue trends** across different years.  
- 🔸 Found the **most preferred payment methods** per branch.  
- 🔸 Calculated **profit margins** and highlighted high/low-profit branches.  
- 🔸 Categorized transactions into **morning, afternoon, and evening shifts** to find peak sales hours.

### 4️⃣ Key Insights  
- 📉 Certain branches experienced a **notable revenue drop** compared to the previous year. (Branches: WALM045, WALM047, WALM098, WALM033, WALM081)
- 🏆 **Afternoon** transactions were the highest, indicating peak customer engagement.  
- 💳 **E-wallets** were the most popular payment method across most branches.  
- 💰 Some categories significantly contributed to **profit margins** across cities like Electronic accessories, Food and beverages, Health and beauty


