📰 TechBlog

A full-stack Java web application that allows users to register, log in, write blog posts, categorize them, and like posts.
Built using JSP, Servlets, JDBC, MySQL, and styled with Bootstrap.

🚀 Features

🧑‍💻 User registration and login

📝 Create, edit, and delete blog posts

🗂️ Organize posts into categories

❤️ Like posts

👤 Manage user profiles

📸 Upload profile pictures

⏱️ Real-time timestamps for posts and likes

🛠️ Tech Stack

Frontend: HTML, CSS, Bootstrap, JSP
Backend: Java (Servlets, JDBC)
Database: MySQL
Server: Apache Tomcat
IDE: Eclipse

🗄️ Database Schema

Database Name: techblog

🔹 Table: user
Field	Type	Key	Description
id	int	PK	Auto-increment user ID
name	varchar(500)		User name
email	varchar(500)	UNI	Unique email
password	varchar(100)		User password
gender	varchar(10)		Gender
about	varchar(100)		Bio (default: "Hey! I am using TechBlog")
rdate	timestamp		Registration date (CURRENT_TIMESTAMP)
profile	varchar(100)		Profile picture (default: default.png)
🔹 Table: category
Field	Type	Key	Description
cid	int	PK	Auto-increment category ID
name	varchar(100)		Category name
description	varchar(300)		Category description
🔹 Table: post
Field	Type	Key	Description
pid	int	PK	Auto-increment post ID
pTitle	varchar(255)		Post title
pContent	longtext		Post content
pCode	longtext		Code snippet (optional)
pPic	varchar(500)		Post image
pDate	timestamp		Post date (CURRENT_TIMESTAMP)
catId	int	FK	References category(cid)
userId	int	FK	References user(id)
🔹 Table: liked
Field	Type	Key	Description
lid	int	PK	Auto-increment like ID
pid	int	FK	References post(pid)
uid	int	FK	References user(id)
liked_on	timestamp		Liked time (CURRENT_TIMESTAMP)
⚙️ Setup Instructions
1️⃣ Clone the repository
git clone https://github.com/Atul-singh03/TechBlog.git
cd TechBlog

2️⃣ Import into Eclipse

Open Eclipse IDE

Go to File → Import → Existing Projects into Workspace

Select the cloned project folder

3️⃣ Configure Database

Create a MySQL database named techblog

Run the provided SQL script (you can generate one from the tables shown above)

Update your ConnectionProvider.java with your database credentials:

private static String url = "jdbc:mysql://localhost:3306/techblog";
private static String username = "root";
private static String password = "your_password";

4️⃣ Configure Tomcat Server

Add Apache Tomcat in Eclipse

Right-click the project → Run on Server

5️⃣ Access the app

Open your browser and go to:

http://localhost:8080/TechBlog/


📸 Screenshots 

<img width="434" height="379" alt="1" src="https://github.com/user-attachments/assets/d6ecec33-ee2c-448c-acaf-14f55fb66933" />


<img width="493" height="377" alt="2" src="https://github.com/user-attachments/assets/0ccb21f8-f7e7-4b7e-ad19-3cc5d55fe1ef" />

