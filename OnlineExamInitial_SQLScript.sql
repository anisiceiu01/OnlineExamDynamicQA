USE [master]
GO
/****** Object:  Database [StudentDB]    Script Date: 9/8/2016 7:26:00 PM ******/
CREATE DATABASE [StudentDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\StudentDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StudentDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\StudentDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StudentDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [StudentDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudentDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StudentDB] SET  MULTI_USER 
GO
ALTER DATABASE [StudentDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [StudentDB]
GO
/****** Object:  Schema [OnlineExam]    Script Date: 9/8/2016 7:26:01 PM ******/
CREATE SCHEMA [OnlineExam]
GO
/****** Object:  Table [dbo].[tblAttendence]    Script Date: 9/8/2016 7:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAttendence](
	[AttendenceId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[Date] [datetime] NULL,
	[Status] [char](1) NULL,
 CONSTRAINT [PK_tblAttendence] PRIMARY KEY CLUSTERED 
(
	[AttendenceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblClass]    Script Date: 9/8/2016 7:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClass](
	[ClassId] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblClass] PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLeave]    Script Date: 9/8/2016 7:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLeave](
	[LeaveId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Reason] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblLeave] PRIMARY KEY CLUSTERED 
(
	[LeaveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSection]    Script Date: 9/8/2016 7:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSection](
	[SectionId] [int] IDENTITY(1,1) NOT NULL,
	[SectionName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblSection] PRIMARY KEY CLUSTERED 
(
	[SectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblStudentInfo]    Script Date: 9/8/2016 7:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStudentInfo](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [nvarchar](50) NULL,
	[ClassId] [int] NULL,
	[SectionId] [int] NULL,
	[Address] [nvarchar](max) NULL,
	[ContactNo] [nchar](11) NULL,
	[DateOfBirth] [datetime] NULL,
	[FatherName] [nvarchar](50) NULL,
	[MotherName] [nvarchar](50) NULL,
	[Roll] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblStudentInfo] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [OnlineExam].[tblCategory]    Script Date: 9/8/2016 7:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [OnlineExam].[tblCategory](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](150) NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [OnlineExam].[tblExamType]    Script Date: 9/8/2016 7:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [OnlineExam].[tblExamType](
	[ExamTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ExamTypeName] [nvarchar](50) NULL,
	[ExamTypeDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblExamType] PRIMARY KEY CLUSTERED 
(
	[ExamTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [OnlineExam].[tblOptions]    Script Date: 9/8/2016 7:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [OnlineExam].[tblOptions](
	[OptionId] [int] IDENTITY(1,1) NOT NULL,
	[Options] [xml] NOT NULL,
 CONSTRAINT [PK_tblOptions] PRIMARY KEY CLUSTERED 
(
	[OptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [OnlineExam].[tblQuestions]    Script Date: 9/8/2016 7:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [OnlineExam].[tblQuestions](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[TopicId] [int] NULL,
	[Question] [nvarchar](max) NULL,
	[OptionId] [int] NULL,
	[QuestionTypeId] [int] NULL,
 CONSTRAINT [PK_tblQuestions] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [OnlineExam].[tblQuestionType]    Script Date: 9/8/2016 7:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [OnlineExam].[tblQuestionType](
	[QuestionTypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NULL,
	[TypeDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblQuestionType] PRIMARY KEY CLUSTERED 
(
	[QuestionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [OnlineExam].[tblSubCategory]    Script Date: 9/8/2016 7:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [OnlineExam].[tblSubCategory](
	[SubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[SubCategoryName] [nvarchar](150) NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_tblSubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [OnlineExam].[tblTopic]    Script Date: 9/8/2016 7:26:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [OnlineExam].[tblTopic](
	[TopicId] [int] IDENTITY(1,1) NOT NULL,
	[TopicName] [nvarchar](50) NULL,
	[CategoryId] [int] NULL,
	[SubCategoryId] [int] NULL,
 CONSTRAINT [PK_tblTopic] PRIMARY KEY CLUSTERED 
(
	[TopicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblClass] ON 

INSERT [dbo].[tblClass] ([ClassId], [ClassName]) VALUES (1, N'One')
INSERT [dbo].[tblClass] ([ClassId], [ClassName]) VALUES (2, N'Two')
INSERT [dbo].[tblClass] ([ClassId], [ClassName]) VALUES (3, N'Three')
INSERT [dbo].[tblClass] ([ClassId], [ClassName]) VALUES (4, N'Four')
INSERT [dbo].[tblClass] ([ClassId], [ClassName]) VALUES (5, N'Five')
INSERT [dbo].[tblClass] ([ClassId], [ClassName]) VALUES (6, N'Six')
INSERT [dbo].[tblClass] ([ClassId], [ClassName]) VALUES (7, N'Seven')
INSERT [dbo].[tblClass] ([ClassId], [ClassName]) VALUES (8, N'Eight')
INSERT [dbo].[tblClass] ([ClassId], [ClassName]) VALUES (9, N'Nine')
INSERT [dbo].[tblClass] ([ClassId], [ClassName]) VALUES (10, N'Ten')
SET IDENTITY_INSERT [dbo].[tblClass] OFF
SET IDENTITY_INSERT [dbo].[tblSection] ON 

INSERT [dbo].[tblSection] ([SectionId], [SectionName]) VALUES (1, N'A')
INSERT [dbo].[tblSection] ([SectionId], [SectionName]) VALUES (2, N'B')
INSERT [dbo].[tblSection] ([SectionId], [SectionName]) VALUES (3, N'C')
INSERT [dbo].[tblSection] ([SectionId], [SectionName]) VALUES (4, N'D')
SET IDENTITY_INSERT [dbo].[tblSection] OFF
SET IDENTITY_INSERT [dbo].[tblStudentInfo] ON 

INSERT [dbo].[tblStudentInfo] ([StudentId], [StudentName], [ClassId], [SectionId], [Address], [ContactNo], [DateOfBirth], [FatherName], [MotherName], [Roll]) VALUES (1, N'Anisuzzaman', 1, 1, N'Dhaka', N'01739181612', CAST(N'1989-12-16 00:00:00.000' AS DateTime), N'Late Shahjahan Ali', N'Late Sharifun Nessa', N'ST001')
SET IDENTITY_INSERT [dbo].[tblStudentInfo] OFF
SET IDENTITY_INSERT [OnlineExam].[tblCategory] ON 

INSERT [OnlineExam].[tblCategory] ([CategoryId], [CategoryName]) VALUES (1, N'History and events')
INSERT [OnlineExam].[tblCategory] ([CategoryId], [CategoryName]) VALUES (2, N'Philosophy and thinking')
INSERT [OnlineExam].[tblCategory] ([CategoryId], [CategoryName]) VALUES (3, N'Culture and the arts')
INSERT [OnlineExam].[tblCategory] ([CategoryId], [CategoryName]) VALUES (4, N'Mathematics and logic')
INSERT [OnlineExam].[tblCategory] ([CategoryId], [CategoryName]) VALUES (5, N'Religion and belief systems')
INSERT [OnlineExam].[tblCategory] ([CategoryId], [CategoryName]) VALUES (6, N'Geography and places')
INSERT [OnlineExam].[tblCategory] ([CategoryId], [CategoryName]) VALUES (7, N'Natural and physical sciences')
INSERT [OnlineExam].[tblCategory] ([CategoryId], [CategoryName]) VALUES (8, N'Society and social sciences')
INSERT [OnlineExam].[tblCategory] ([CategoryId], [CategoryName]) VALUES (9, N'Health and fitness')
INSERT [OnlineExam].[tblCategory] ([CategoryId], [CategoryName]) VALUES (10, N'People and self')
INSERT [OnlineExam].[tblCategory] ([CategoryId], [CategoryName]) VALUES (11, N'Technology and applied sciences')
SET IDENTITY_INSERT [OnlineExam].[tblCategory] OFF
SET IDENTITY_INSERT [OnlineExam].[tblExamType] ON 

INSERT [OnlineExam].[tblExamType] ([ExamTypeId], [ExamTypeName], [ExamTypeDescription]) VALUES (1, N'Single Sitting Auto Evaluation Exam', N'In this exam type a student has to finish the exam in one sitting .And Result will be generated automatically.')
INSERT [OnlineExam].[tblExamType] ([ExamTypeId], [ExamTypeName], [ExamTypeDescription]) VALUES (2, N'Multi Session Auto Evaluation Exam', N'In this exam type a student can expand his exam over multiple session .And Result will be generated automatically.')
INSERT [OnlineExam].[tblExamType] ([ExamTypeId], [ExamTypeName], [ExamTypeDescription]) VALUES (3, N'Single Sitting Manual Evaluation Exam', N'Same as "Single Sitting Auto Evaluation Exam" except Evaluation will be performed by one or many Persons.')
INSERT [OnlineExam].[tblExamType] ([ExamTypeId], [ExamTypeName], [ExamTypeDescription]) VALUES (4, N'Multi Session Manual Evaluation Exam', N'Same as "Multi Session Auto Evaluation Exam" except Evaluation will be performed by one or many Persons.')
INSERT [OnlineExam].[tblExamType] ([ExamTypeId], [ExamTypeName], [ExamTypeDescription]) VALUES (6, N'Single Sitting Auto Evaluation Exam(NM)', N'Same as "Single Sitting Auto Evaluation Exam" except while evaluated Negative Marking will be Considered')
INSERT [OnlineExam].[tblExamType] ([ExamTypeId], [ExamTypeName], [ExamTypeDescription]) VALUES (7, N'Multi Session Auto Evaluation Exam(NM)', N'Same as "Multi Session Auto Evaluation Exam" except while evaluated Negative Marking will be Considered')
SET IDENTITY_INSERT [OnlineExam].[tblExamType] OFF
SET IDENTITY_INSERT [OnlineExam].[tblQuestionType] ON 

INSERT [OnlineExam].[tblQuestionType] ([QuestionTypeId], [TypeName], [TypeDescription]) VALUES (1, N'Single-answer questions', N'These questions allow one and only one answer to be chosen by providing radio buttons next to the answers. You can specify negative or non-negative marks for each answer, usually zero marks for wrong answers, maximum marks for correct answers and partial marks for partially correct answers.')
INSERT [OnlineExam].[tblQuestionType] ([QuestionTypeId], [TypeName], [TypeDescription]) VALUES (2, N'Multiple-answer questions', N'The teacher can select "multiple answers are allowed" in a Multiple Choice question type. "Multiple answers" questions types in a quiz allow one or more answers to be chosen by providing check boxes next to the answers. Each answer may carry a positive or negative grade, so that choosing ALL the options will not necessarily result in good grade. If the total grade is negative then the total grade for this question will be zero. ')
INSERT [OnlineExam].[tblQuestionType] ([QuestionTypeId], [TypeName], [TypeDescription]) VALUES (3, N'Numerical-answer question', N'From the student perspective, a numerical question looks just like a short-answer question. The difference is that numerical answers are allowed to have an accepted error. This allows a fixed range of answers to be evaluated as one answer. ')
INSERT [OnlineExam].[tblQuestionType] ([QuestionTypeId], [TypeName], [TypeDescription]) VALUES (4, N'True/False  question', N'A student is given only two choices for an answer in this kind of question: True or False. ')
INSERT [OnlineExam].[tblQuestionType] ([QuestionTypeId], [TypeName], [TypeDescription]) VALUES (5, N'Yes/No  question', N'A student is given only two choices for an answer in this kind of question: YES or No. ')
INSERT [OnlineExam].[tblQuestionType] ([QuestionTypeId], [TypeName], [TypeDescription]) VALUES (6, N'Short-Answer question', N'In a short answer question, the student types in a word or phrase in response to a question (that may include a image). Answers may or may not be case sensitive. The answer could be a word or a phrase, but it must match one of your acceptable answers exactly. It''s a good idea to keep the required answer as short as possible to avoid missing a correct answer that''s phrased differently. ')
INSERT [OnlineExam].[tblQuestionType] ([QuestionTypeId], [TypeName], [TypeDescription]) VALUES (7, N'Exact word or phrase-answer question ', N'A question type where expected answer is either a word or a phrase')
SET IDENTITY_INSERT [OnlineExam].[tblQuestionType] OFF
SET IDENTITY_INSERT [OnlineExam].[tblSubCategory] ON 

INSERT [OnlineExam].[tblSubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (1, N'History and events', 1)
INSERT [OnlineExam].[tblSubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (2, N'Social philosophy', 2)
INSERT [OnlineExam].[tblSubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (3, N'Concepts', 2)
INSERT [OnlineExam].[tblSubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (4, N'Theories', 2)
INSERT [OnlineExam].[tblSubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (5, N'Ethics', 2)
INSERT [OnlineExam].[tblSubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (6, N'Concepts', 2)
INSERT [OnlineExam].[tblSubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (7, N'Movements', 2)
INSERT [OnlineExam].[tblSubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (8, N'Culture and Humanities', 3)
INSERT [OnlineExam].[tblSubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (9, N'Architecture', 3)
INSERT [OnlineExam].[tblSubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (10, N'Crafts', 3)
INSERT [OnlineExam].[tblSubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (11, N'Sports', 3)
INSERT [OnlineExam].[tblSubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (12, N'Mathematics', 4)
INSERT [OnlineExam].[tblSubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (13, N'Logic', 4)
INSERT [OnlineExam].[tblSubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (14, N'Statistics', 4)
INSERT [OnlineExam].[tblSubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (15, N'Belief systems', 5)
INSERT [OnlineExam].[tblSubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (16, N'Mythology', 5)
INSERT [OnlineExam].[tblSubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (17, N'World', 6)
INSERT [OnlineExam].[tblSubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (18, N'Biology', 7)
INSERT [OnlineExam].[tblSubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (19, N'Nature', 7)
INSERT [OnlineExam].[tblSubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (20, N'Physical sciences', 7)
INSERT [OnlineExam].[tblSubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (21, N'Society', 8)
INSERT [OnlineExam].[tblSubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (22, N'Law', 8)
INSERT [OnlineExam].[tblSubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (23, N'Nutrition', 9)
INSERT [OnlineExam].[tblSubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (24, N'Health science', 9)
INSERT [OnlineExam].[tblSubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (25, N'Medicine', 9)
INSERT [OnlineExam].[tblSubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (26, N'Self', 10)
INSERT [OnlineExam].[tblSubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (27, N'Personal life', 10)
INSERT [OnlineExam].[tblSubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (28, N'Computing', 11)
INSERT [OnlineExam].[tblSubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (29, N'Electronics', 11)
INSERT [OnlineExam].[tblSubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId]) VALUES (30, N'Transport', 11)
SET IDENTITY_INSERT [OnlineExam].[tblSubCategory] OFF
USE [master]
GO
ALTER DATABASE [StudentDB] SET  READ_WRITE 
GO
