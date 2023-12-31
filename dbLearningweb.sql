USE [master]
GO
/****** Object:  Database [Project_PRJ2]    Script Date: 11/18/2023 4:18:14 AM ******/
CREATE DATABASE [Project_PRJ2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project_PRJ2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Project_PRJ2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Project_PRJ2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Project_PRJ2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Project_PRJ2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project_PRJ2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project_PRJ2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project_PRJ2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project_PRJ2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project_PRJ2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project_PRJ2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project_PRJ2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Project_PRJ2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project_PRJ2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project_PRJ2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project_PRJ2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project_PRJ2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project_PRJ2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project_PRJ2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project_PRJ2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project_PRJ2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Project_PRJ2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project_PRJ2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project_PRJ2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project_PRJ2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project_PRJ2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project_PRJ2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project_PRJ2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project_PRJ2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Project_PRJ2] SET  MULTI_USER 
GO
ALTER DATABASE [Project_PRJ2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project_PRJ2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project_PRJ2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project_PRJ2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Project_PRJ2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Project_PRJ2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Project_PRJ2] SET QUERY_STORE = OFF
GO
USE [Project_PRJ2]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/18/2023 4:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](100) NOT NULL,
	[password] [varchar](100) NULL,
	[role] [int] NULL,
	[fullname] [nvarchar](50) NULL,
	[phone] [varchar](20) NULL,
	[email] [nvarchar](100) NULL,
	[address] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/18/2023 4:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 11/18/2023 4:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[item_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL,
	[price] [decimal](10, 2) NULL,
	[subtotal] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/18/2023 4:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](100) NULL,
	[customer_name] [nvarchar](50) NULL,
	[customer_phone] [varchar](20) NULL,
	[customer_email] [nvarchar](100) NULL,
	[customer_address] [nvarchar](255) NULL,
	[order_date] [date] NULL,
	[total] [decimal](10, 2) NULL,
	[status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/18/2023 4:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](max) NULL,
	[price] [decimal](10, 2) NULL,
	[quantity] [int] NULL,
	[category_id] [int] NULL,
	[img] [nvarchar](250) NULL,
	[demo] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password], [role], [fullname], [phone], [email], [address]) VALUES (N'daodao', N'123', 1, N'sir', N'', N'asdmsadmld@gmail.com', N'')
INSERT [dbo].[Account] ([username], [password], [role], [fullname], [phone], [email], [address]) VALUES (N'daodao2', N'123', 3, N'instructor1', N'047-835-9992', N'dangnamsau02@gmail.com', N'Ha Noi')
INSERT [dbo].[Account] ([username], [password], [role], [fullname], [phone], [email], [address]) VALUES (N'daonmhe173415', N'123', 3, N'buyer', N'', N'nguyenminhdao@gmail.com', N'viet tri')
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([category_id], [name]) VALUES (1, N'IT & Software')
INSERT [dbo].[Category] ([category_id], [name]) VALUES (2, N'Business')
INSERT [dbo].[Category] ([category_id], [name]) VALUES (3, N'Finance & Accounting')
INSERT [dbo].[Category] ([category_id], [name]) VALUES (4, N'Music')
INSERT [dbo].[Category] ([category_id], [name]) VALUES (5, N'Office Productivity')
INSERT [dbo].[Category] ([category_id], [name]) VALUES (6, N'Personal Development')
INSERT [dbo].[Category] ([category_id], [name]) VALUES (7, N'Design')
INSERT [dbo].[Category] ([category_id], [name]) VALUES (8, N'Marketing')
INSERT [dbo].[Category] ([category_id], [name]) VALUES (9, N'Health & Fitness')
INSERT [dbo].[Category] ([category_id], [name]) VALUES (11, N'Entertainment')
INSERT [dbo].[Category] ([category_id], [name]) VALUES (12, N'Software Engineering')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([item_id], [order_id], [product_id], [quantity], [price], [subtotal]) VALUES (1, 1, 1, 1, CAST(599.00 AS Decimal(10, 2)), CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[Item] ([item_id], [order_id], [product_id], [quantity], [price], [subtotal]) VALUES (2, 2, 1, 2, CAST(5.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)))
INSERT [dbo].[Item] ([item_id], [order_id], [product_id], [quantity], [price], [subtotal]) VALUES (3, 3, 1, 1, CAST(5.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Item] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([order_id], [username], [customer_name], [customer_phone], [customer_email], [customer_address], [order_date], [total], [status]) VALUES (1, N'Daonmhe173415', N'daodao', N'086-839-1359', N'nguyenminhdao4@gmail.com', N'dai hoc fpt', CAST(N'2023-07-18' AS Date), CAST(599.00 AS Decimal(10, 2)), N'completed')
INSERT [dbo].[Orders] ([order_id], [username], [customer_name], [customer_phone], [customer_email], [customer_address], [order_date], [total], [status]) VALUES (2, N'Daonmhe173415', N'Nguyen Minh Dao', N'012-345-6789', N'nguyenminhdao@gmail.com', N'viet tri', CAST(N'2023-07-21' AS Date), CAST(10.00 AS Decimal(10, 2)), N'completed')
INSERT [dbo].[Orders] ([order_id], [username], [customer_name], [customer_phone], [customer_email], [customer_address], [order_date], [total], [status]) VALUES (3, N'Daonmhe173415', N'buyer', N'087-912-3812', N'nguyenminhdao@gmail.com', N'viet tri', CAST(N'2023-07-21' AS Date), CAST(5.00 AS Decimal(10, 2)), N'pending')
INSERT [dbo].[Orders] ([order_id], [username], [customer_name], [customer_phone], [customer_email], [customer_address], [order_date], [total], [status]) VALUES (4, N'Daonmhe173415', N'buyer', N'087-912-3812', N'nguyenminhdao@gmail.com', N'viet tri', CAST(N'2023-07-21' AS Date), CAST(5.00 AS Decimal(10, 2)), N'pending')
INSERT [dbo].[Orders] ([order_id], [username], [customer_name], [customer_phone], [customer_email], [customer_address], [order_date], [total], [status]) VALUES (5, N'Daonmhe173415', N'buyer', N'012-345-6789', N'nguyenminhdao4@gmail.com', N'viet tri phu tho', CAST(N'2023-07-21' AS Date), CAST(5.00 AS Decimal(10, 2)), N'pending')
INSERT [dbo].[Orders] ([order_id], [username], [customer_name], [customer_phone], [customer_email], [customer_address], [order_date], [total], [status]) VALUES (6, N'Daonmhe173415', N'dao', N'012-345-6789', N'nguyenminhdao4@gmail.com', N'viet tri phu tho', CAST(N'2023-07-21' AS Date), CAST(5.00 AS Decimal(10, 2)), N'pending')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([product_id], [name], [description], [price], [quantity], [category_id], [img], [demo]) VALUES (1, N'Introduction to Java and OOP Programming', N'The Java Programming Fundamentals course is designed to provide a comprehensive introduction to the world of Java programming. Whether you''re a complete beginner or have some programming experience, this course will take you on a journey to master the fundamentals of Java.

In this course, you will learn the core concepts of Java programming, including variables, data types, control statements, loops, and methods. You will understand object-oriented programming principles and how to create and use classes and objects in Java.

Throughout the course, you will work on practical exercises and projects to apply your knowledge and gain hands-on experience. By the end of the course, you will have a solid understanding of Java syntax and be able to write simple Java programs to solve real-world problems.

Whether you want to pursue a career in software development, web development, or mobile app development, mastering Java will open up a world of opportunities. Join this course and embark on your journey to becoming a proficient Java programmer.', CAST(5.00 AS Decimal(10, 2)), 7, 1, N'img\apple\it1.jpg', N'<iframe width="560" height="315" src="https://www.youtube.com/embed/eIrMbAQSU34" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [quantity], [category_id], [img], [demo]) VALUES (2, N'Basic Python Tutorials', N'The Python Programming Course is a comprehensive and beginner-friendly program designed to introduce participants to the world of Python programming. Whether you are new to coding or have some experience in other languages, this course will lay a solid foundation in Python, one of the most versatile and widely used programming languages in the industry.

Throughout the course, you will learn the fundamentals of Python, including variables, data types, loops, conditional statements, and functions. As you progress, you''ll gain hands-on experience by working on practical projects and exercises, allowing you to apply what you''ve learned in real-world scenarios.

By the end of the Python Programming Course, you will have the skills to write Python scripts, build simple applications, and manipulate data efficiently. You''ll also explore more advanced topics such as file handling, object-oriented programming, and using Python libraries for data analysis and web development.

Join us in this exciting Python journey and unlock endless opportunities in software development, data science, automation, web development, and more! Whether you''re pursuing a career in tech or just want to enhance your coding skills, this course is the perfect starting point for your Python adventure.', CAST(10.00 AS Decimal(10, 2)), 10, 1, N'img\apple\t2.jpg', N'<iframe width="560" height="315" src="https://www.youtube.com/embed/eWRfhZUzrAc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [quantity], [category_id], [img], [demo]) VALUES (3, N'Principles of Web Design', N'The Web Design course is a comprehensive program designed to equip students with the essential skills and knowledge to create visually stunning and user-friendly websites. This course covers the fundamental principles of web design, including layout, color theory, typography, and user experience. Students will gain proficiency in industry-standard software such as Adobe Photoshop and Adobe Illustrator to create captivating graphics and visuals.

Throughout the course, students will explore modern web design trends and best practices, learning how to design responsive and mobile-friendly websites that adapt to various devices and screen sizes. They will also delve into HTML, CSS, and JavaScript, the core building blocks of web development, to bring their designs to life and create interactive web elements.

By the end of the Web Design course, students will have developed a strong foundation in both the artistic and technical aspects of web design, empowering them to craft engaging and functional websites that leave a lasting impact on users. Whether aspiring to become professional web designers or seeking to enhance their existing skillset, this course is ideal for anyone eager to explore the exciting world of web design.', CAST(70.00 AS Decimal(10, 2)), 10, 1, N'img\apple\it3.jpg', N'<iframe width="560" height="315" src="https://www.youtube.com/embed/Kl3nOXQjVnQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [quantity], [category_id], [img], [demo]) VALUES (4, N'Learn C# Quickly: A Complete Beginner''s Guide', N'The Introduction to C# Programming course is designed for beginners who want to learn the fundamentals of the C# programming language. C# is a powerful and versatile programming language developed by Microsoft, widely used for building various types of applications such as desktop, web, and mobile applications.

In this course, students will be introduced to the syntax and basic concepts of C#. They will learn how to write and execute C# programs, understand data types, variables, and control structures, and explore object-oriented programming (OOP) principles like classes, objects, inheritance, and polymorphism.

Throughout the course, hands-on coding exercises and practical projects will reinforce the concepts taught in lectures. By the end of the course, students will have gained a solid foundation in C# programming and be well-prepared to take on more advanced C# courses or embark on their journey to build real-world applications.', CAST(119.00 AS Decimal(10, 2)), 10, 1, N'img\apple\it4.jpg', N'<iframe width="560" height="315" src="https://www.youtube.com/embed/gfkTfcpWqAY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [quantity], [category_id], [img], [demo]) VALUES (5, N'The Complete JavaScript Course 2023: From Zero to Expert!', N'Embark on a transformative journey in the world of business with our comprehensive Business Courses. Whether you are a seasoned professional seeking to enhance your skills or an aspiring entrepreneur eager to launch your own venture, our carefully curated courses offer a wide range of topics, including Business Strategy, Marketing, Finance, Leadership, and more. Learn from industry experts and gain practical insights through real-world case studies, simulations, and interactive exercises. Our Business Courses provide you with the tools and knowledge needed to thrive in the dynamic global business landscape, empowering you to make strategic decisions, drive innovation, and achieve sustainable success in your career or business pursuits.', CAST(99.00 AS Decimal(10, 2)), 10, 1, N'img\apple\it5.jpg', N'<iframe width="560" height="315" src="https://www.youtube.com/embed/jS4aFq5-91M" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [quantity], [category_id], [img], [demo]) VALUES (9, N'Critical Business Skills for Success', N'Embark on a transformative journey in the world of business with our comprehensive Business Courses. Whether you are a seasoned professional seeking to enhance your skills or an aspiring entrepreneur eager to launch your own venture, our carefully curated courses offer a wide range of topics, including Business Strategy, Marketing, Finance, Leadership, and more. Learn from industry experts and gain practical insights through real-world case studies, simulations, and interactive exercises. Our Business Courses provide you with the tools and knowledge needed to thrive in the dynamic global business landscape, empowering you to make strategic decisions, drive innovation, and achieve sustainable success in your career or business pursuits.', CAST(97.00 AS Decimal(10, 2)), 10, 2, N'img\samsung\bus1.jpg', N'<iframe width="560" height="315" src="https://www.youtube.com/embed/moEqdbluBDY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [quantity], [category_id], [img], [demo]) VALUES (10, N'Leadership: Practical Leadership Skills', N'Embark on a transformative journey in the world of business with our comprehensive Business Courses. Whether you are a seasoned professional seeking to enhance your skills or an aspiring entrepreneur eager to launch your own venture, our carefully curated courses offer a wide range of topics, including Business Strategy, Marketing, Finance, Leadership, and more. Learn from industry experts and gain practical insights through real-world case studies, simulations, and interactive exercises. Our Business Courses provide you with the tools and knowledge needed to thrive in the dynamic global business landscape, empowering you to make strategic decisions, drive innovation, and achieve sustainable success in your career or business pursuits.', CAST(79.00 AS Decimal(10, 2)), 10, 2, N'img\samsung\bus2.jpg', N'<iframe width="560" height="315" src="https://www.youtube.com/embed/R2qu_j6GAG8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [quantity], [category_id], [img], [demo]) VALUES (11, N'Emotional Intelligence at Work: Learn from Your Emotions', N'Embark on a transformative journey in the world of business with our comprehensive Business Courses. Whether you are a seasoned professional seeking to enhance your skills or an aspiring entrepreneur eager to launch your own venture, our carefully curated courses offer a wide range of topics, including Business Strategy, Marketing, Finance, Leadership, and more. Learn from industry experts and gain practical insights through real-world case studies, simulations, and interactive exercises. Our Business Courses provide you with the tools and knowledge needed to thrive in the dynamic global business landscape, empowering you to make strategic decisions, drive innovation, and achieve sustainable success in your career or business pursuits.', CAST(9.00 AS Decimal(10, 2)), 10, 2, N'img\samsung\bus3.jpg', N'<iframe width="560" height="315" src="https://www.youtube.com/embed/2vuEs-9odGU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [quantity], [category_id], [img], [demo]) VALUES (14, N'Financial Management - Branka International College', N'The Finance & Accounting course offers a comprehensive understanding of financial principles and practices, equipping students with essential skills to manage financial resources effectively in both corporate and personal settings. This course covers a wide range of topics, including financial analysis, budgeting, investment strategies, tax planning, auditing, and financial reporting.

Students will learn how to interpret financial statements, make informed investment decisions, and analyze financial data to optimize business performance. The curriculum also delves into accounting principles, teaching students how to prepare financial statements, track expenses, and manage financial transactions accurately.

Throughout the course, students will gain hands-on experience using accounting software and financial tools to simulate real-world scenarios. Industry experts and experienced faculty will guide students in understanding the complexities of financial markets, risk management, and regulatory compliance.

By completing the Finance & Accounting course, students will be well-prepared to pursue careers in finance, accounting, investment banking, financial consulting, or to effectively manage their own financial portfolios and make informed financial decisions in their personal lives.', CAST(514.00 AS Decimal(10, 2)), 10, 3, N'img\xiaomi\f1.jpg', N'<iframe width="560" height="315" src="https://www.youtube.com/embed/o7VpZbQ5k-A" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [quantity], [category_id], [img], [demo]) VALUES (15, N'International Financial Reporting Standards (IFRS)', N'The Finance & Accounting course offers a comprehensive understanding of financial principles and practices, equipping students with essential skills to manage financial resources effectively in both corporate and personal settings. This course covers a wide range of topics, including financial analysis, budgeting, investment strategies, tax planning, auditing, and financial reporting.

Students will learn how to interpret financial statements, make informed investment decisions, and analyze financial data to optimize business performance. The curriculum also delves into accounting principles, teaching students how to prepare financial statements, track expenses, and manage financial transactions accurately.

Throughout the course, students will gain hands-on experience using accounting software and financial tools to simulate real-world scenarios. Industry experts and experienced faculty will guide students in understanding the complexities of financial markets, risk management, and regulatory compliance.

By completing the Finance & Accounting course, students will be well-prepared to pursue careers in finance, accounting, investment banking, financial consulting, or to effectively manage their own financial portfolios and make informed financial decisions in their personal lives.', CAST(70.00 AS Decimal(10, 2)), 10, 3, N'img\xiaomi\f2.jpg', N'<iframe width="560" height="315" src="https://www.youtube.com/embed/0zM-W499LT8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [quantity], [category_id], [img], [demo]) VALUES (17, N'Premier Piano Course: Lesson', N'Explore the world of music and unleash your creative potential with our comprehensive Music courses. Whether you''re a beginner or an aspiring musician, our expert instructors will guide you through a rich curriculum covering music theory, instrument mastery, composition, and performance techniques. Discover the nuances of various musical genres, from classical to contemporary, and develop your artistic voice. Embrace the joy of learning music and join a vibrant community of fellow enthusiasts. Unlock your musical talents and embark on a rewarding journey of self-expression and skill development with our Music courses.', CAST(99.00 AS Decimal(10, 2)), 10, 4, N'img\huawei\mu2.jpg', N'<iframe width="560" height="315" src="https://www.youtube.com/embed/827jmswqnEA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [quantity], [category_id], [img], [demo]) VALUES (18, N'Andy Guitar Beginner''s Guitar Course: Guitar Method for the Complete Beginner', N'Explore the world of music and unleash your creative potential with our comprehensive Music courses. Whether you''re a beginner or an aspiring musician, our expert instructors will guide you through a rich curriculum covering music theory, instrument mastery, composition, and performance techniques. Discover the nuances of various musical genres, from classical to contemporary, and develop your artistic voice. Embrace the joy of learning music and join a vibrant community of fellow enthusiasts. Unlock your musical talents and embark on a rewarding journey of self-expression and skill development with our Music courses.', CAST(49.00 AS Decimal(10, 2)), 10, 4, N'img\huawei\mu1.jpg', N'<iframe width="560" height="315" src="https://www.youtube.com/embed/BBz-Jyr23M4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [quantity], [category_id], [img], [demo]) VALUES (19, N'Ultimate Microsoft Office Course - Zero to Hero', N'Office Productivity Course: Boost Your Efficiency and Master Essential Tools
Unlock your full potential in the workplace with our Office Productivity course. This comprehensive program is designed to equip you with the skills and knowledge to streamline your workflow, optimize time management, and become proficient in using essential office tools. From mastering Microsoft Office applications like Word, Excel, and PowerPoint, to learning efficient email management and collaboration techniques, this course empowers you to excel in a modern work environment. Enhance your productivity, improve document creation and data analysis, and gain valuable insights on team collaboration to become a more effective and indispensable member of any organization. Take control of your productivity journey and elevate your career prospects with our Office Productivity course today.', CAST(69.00 AS Decimal(10, 2)), 10, 5, N'img\google\of1.jpg', N'<iframe width="560" height="315" src="https://www.youtube.com/embed/DXOq1xiIaF0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [quantity], [category_id], [img], [demo]) VALUES (20, N'55298-A: Introduction to SharePoint 2019', N'Office Productivity Course: Boost Your Efficiency and Master Essential Tools
Unlock your full potential in the workplace with our Office Productivity course. This comprehensive program is designed to equip you with the skills and knowledge to streamline your workflow, optimize time management, and become proficient in using essential office tools. From mastering Microsoft Office applications like Word, Excel, and PowerPoint, to learning efficient email management and collaboration techniques, this course empowers you to excel in a modern work environment. Enhance your productivity, improve document creation and data analysis, and gain valuable insights on team collaboration to become a more effective and indispensable member of any organization. Take control of your productivity journey and elevate your career prospects with our Office Productivity course today.', CAST(129.00 AS Decimal(10, 2)), 10, 5, N'img\google\of2.jpg', N'<iframe width="560" height="315" src="https://www.youtube.com/embed/odixpcyqOgQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [quantity], [category_id], [img], [demo]) VALUES (22, N'Transform Your Lifestyle', N'Personal Development is a transformative course designed to empower individuals with essential skills and insights to enhance their personal and professional lives. Through a series of engaging modules, participants explore various aspects of self-awareness, goal-setting, time management, and effective communication. The course focuses on building confidence, resilience, and emotional intelligence, enabling individuals to navigate challenges and embrace personal growth. Participants learn valuable strategies to unlock their full potential, cultivate a growth mindset, and create a fulfilling and balanced life. Whether you''re seeking to boost your career, improve relationships, or achieve personal goals, this course equips you with the tools to unlock your true potential and lead a more purposeful and successful life.', CAST(69.00 AS Decimal(10, 2)), 10, 6, N'img\rog\pe1.jpg', N'<iframe width="560" height="315" src="https://www.youtube.com/embed/zIZaDTfmVsA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [quantity], [category_id], [img], [demo]) VALUES (23, N'Self-Improvement now and then', N'Personal Development is a transformative course designed to empower individuals with essential skills and insights to enhance their personal and professional lives. Through a series of engaging modules, participants explore various aspects of self-awareness, goal-setting, time management, and effective communication. The course focuses on building confidence, resilience, and emotional intelligence, enabling individuals to navigate challenges and embrace personal growth. Participants learn valuable strategies to unlock their full potential, cultivate a growth mindset, and create a fulfilling and balanced life. Whether you''re seeking to boost your career, improve relationships, or achieve personal goals, this course equips you with the tools to unlock your true potential and lead a more purposeful and successful life.', CAST(83.00 AS Decimal(10, 2)), 10, 6, N'img\rog\pe2.jpg', N'<iframe width="560" height="315" src="https://www.youtube.com/embed/De-bLfEUeLE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [quantity], [category_id], [img], [demo]) VALUES (24, N'Graphic Design and Typography Course', N'Discover the art of creative expression through our Designing course. This comprehensive program is perfect for aspiring designers looking to develop their skills and creativity in various design disciplines. Learn the principles of graphic design, web design, user interface (UI) design, and more, using industry-standard software and tools. Gain hands-on experience in creating visually stunning and effective designs for print and digital media. Whether you''re a beginner or looking to enhance your existing knowledge, our Designing course offers a supportive and inspiring environment to unleash your artistic potential and create captivating visual experiences.', CAST(30.00 AS Decimal(10, 2)), 10, 7, N'img\vivo\ga1.jpg', N'<iframe width="560" height="315" src="https://www.youtube.com/embed/yAuUDyUC-GM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [quantity], [category_id], [img], [demo]) VALUES (25, N'Advanced Graphic Design Course', N'Discover the art of creative expression through our Designing course. This comprehensive program is perfect for aspiring designers looking to develop their skills and creativity in various design disciplines. Learn the principles of graphic design, web design, user interface (UI) design, and more, using industry-standard software and tools. Gain hands-on experience in creating visually stunning and effective designs for print and digital media. Whether you''re a beginner or looking to enhance your existing knowledge, our Designing course offers a supportive and inspiring environment to unleash your artistic potential and create captivating visual experiences.', CAST(49.00 AS Decimal(10, 2)), 10, 7, N'img\vivo\ga2.jpg', N'<iframe width="560" height="315" src="https://www.youtube.com/embed/XNkV6m4fosw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [quantity], [category_id], [img], [demo]) VALUES (28, N'Human To Human Marketing – New Era of Marketing', N'Our Marketing course offers a comprehensive and dynamic learning experience to equip aspiring marketers with the knowledge and skills needed to thrive in today''s competitive business landscape. Through a blend of theoretical concepts and real-world applications, students will gain insights into market research, consumer behavior, branding strategies, digital marketing, and more.', CAST(15.00 AS Decimal(10, 2)), 10, 8, N'img\oppo\ma2.jpg', N'<iframe width="560" height="315" src="https://www.youtube.com/embed/Hg6xHqgyzhE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [quantity], [category_id], [img], [demo]) VALUES (30, N'Complete Digital Marketing Practical Live Course', N'Our Marketing course offers a comprehensive and dynamic learning experience to equip aspiring marketers with the knowledge and skills needed to thrive in today''s competitive business landscape. Through a blend of theoretical concepts and real-world applications, students will gain insights into market research, consumer behavior, branding strategies, digital marketing, and more.', CAST(49.00 AS Decimal(10, 2)), 10, 8, N'img\oppo\ma1.jpg', N'<iframe width="560" height="315" src="https://www.youtube.com/embed/rchKaSMQ__8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
INSERT [dbo].[Product] ([product_id], [name], [description], [price], [quantity], [category_id], [img], [demo]) VALUES (32, N'Active IQ Level 3 Award in Nutrition for Exercise and Health', N'This sleek and powerful device boasts a stunning display, lightning-fast performance, and an array of cutting-edge features. With its advanced camera system, you can capture professional-grade photos and videos with ease. The BPhone 3 also offers enhanced security measures, including facial recognition and fingerprint scanning, to keep your data safe. Its long-lasting battery ensures that you stay connected throughout the day, while its intuitive user interface provides a seamless and enjoyable experience. Get ready to elevate your smartphone experience with the BPhone 3.', CAST(113.00 AS Decimal(10, 2)), 10, 9, N'img\bphone\fit1.jpg', N'<iframe width="560" height="315" src="https://www.youtube.com/embed/BVNbBVBE5Dw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
USE [master]
GO
ALTER DATABASE [Project_PRJ2] SET  READ_WRITE 
GO
