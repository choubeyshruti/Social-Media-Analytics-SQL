# 📊 Social Media Analytics (MySQL Project)

Hello! I built this **Social Media Analytics** project using **MySQL Workbench 8.0** to simulate the backend of a real-world social media platform. My goal was to practice advanced SQL concepts like **joins**, **aggregations**, **foreign keys**, **cascading deletes**, and **sentiment analysis using SQL logic**.

---

## 🧠 Project Overview

**I designed a relational database that mimics the structure of a social media platform**![Screenshot (155)](https://github.com/user-attachments/assets/85d5e4fa-58c1-4f78-8f8a-3aa6294728ee)
![Screenshot (155)](https://github.com/user-attachments/assets/626738cc-4562-4530-8a63-d6b90441760e)
![Screenshot (155)](https://github.com/user-attachments/assets/83bc97d1-9e2e-43cb-8b91-f18445ae1528)
, complete with:

- Users and their profiles
- Posts and engagement (likes, comments, shares)
- Social connections (follow, friend, blocked)
- Sentiment classification of posts based on keywords

---

## 🛠 Technologies Used

- **MySQL Workbench 8.0 CE**
- SQL Queries (DDL + DML + DQL)
- ER Modeling
- Foreign Key Constraints
- ENUM Data Types
- Cascading Deletes

---

## 🗃️ Database Schema

**Tables Created:**

- `Users` → Basic user profile info
- `Posts` → Posts created by users
- `Engagements` → Likes, comments, and shares on posts
- `Connections` → Social connections between users

---

## 🚀 Features & Highlights

### ✔️ Schema Design
- Implemented relational structure using `FOREIGN KEY` constraints
- Used `ENUM`, `AUTO_INCREMENT`, and timestamp fields

### ✔️ Data Insertion
- Inserted sample user data, posts, engagements, and connections

### ✔️ Analysis Performed
1. **Most Liked Posts**
2. **Top Influencers (Most Followers)**
3. **Campaign Engagement**
4. **Keyword-Based Sentiment Analysis**

### ✔️ Sentiment Classification
I added a `Sentiments` column in the `Posts` table and classified text into:
- Positive
- Negative
- Neutral

Using keywords like `happy`, `love`, `bad`, etc. inside SQL `LIKE` statements.

---
### EER diagram snapshot
![image 1](https://github.com/user-attachments/assets/3922282c-9fd2-4d4e-a02c-1b1fe2030894)

## 📌 Sample SQL Insights

-- Find Top Influencers
SELECT u.UserName, COUNT(c.User2) AS Followercount
FROM Users u
JOIN Connections c ON u.UserID = c.User2
WHERE c.ConnectionType = 'Follow'
GROUP BY u.UserID
ORDER BY Followercount DESC;


