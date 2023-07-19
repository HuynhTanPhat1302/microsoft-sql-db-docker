USE [master]
GO
/****** Object:  Database [DentistBooking]    Script Date: 7/16/2023 12:00:04 PM ******/
CREATE DATABASE [DentistBooking]

GO
ALTER DATABASE [DentistBooking] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DentistBooking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DentistBooking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DentistBooking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DentistBooking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DentistBooking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DentistBooking] SET ARITHABORT OFF 
GO
ALTER DATABASE [DentistBooking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DentistBooking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DentistBooking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DentistBooking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DentistBooking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DentistBooking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DentistBooking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DentistBooking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DentistBooking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DentistBooking] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DentistBooking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DentistBooking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DentistBooking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DentistBooking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DentistBooking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DentistBooking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DentistBooking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DentistBooking] SET RECOVERY FULL 
GO
ALTER DATABASE [DentistBooking] SET  MULTI_USER 
GO
ALTER DATABASE [DentistBooking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DentistBooking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DentistBooking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DentistBooking] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DentistBooking] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DentistBooking] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DentistBooking', N'ON'
GO
ALTER DATABASE [DentistBooking] SET QUERY_STORE = OFF
GO
USE [DentistBooking]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 7/16/2023 12:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[AppointmentID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NULL,
	[DentistID] [int] NULL,
	[StaffID] [int] NULL,
	[Datetime] [datetime] NULL,
	[Duration] [float] NULL,
	[Status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[AppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppointmentDetail]    Script Date: 7/16/2023 12:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppointmentDetail](
	[AppointmentDetailID] [int] IDENTITY(1,1) NOT NULL,
	[AppointmentID] [int] NULL,
	[MedicalRecordID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AppointmentDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dentist]    Script Date: 7/16/2023 12:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dentist](
	[DentistID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[DentistName] [nvarchar](150) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[DentistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DentistAvailability]    Script Date: 7/16/2023 12:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DentistAvailability](
	[AvailabilityID] [int] IDENTITY(1,1) NOT NULL,
	[DentistID] [int] NULL,
	[DayOfWeek] [nvarchar](20) NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[AvailabilityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Illness]    Script Date: 7/16/2023 12:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Illness](
	[IllnessID] [int] IDENTITY(1,1) NOT NULL,
	[IllnessName] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[IllnessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalRecord]    Script Date: 7/16/2023 12:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalRecord](
	[MedicalRecordID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NULL,
	[DentistID] [int] NULL,
	[TeethNumber] [int] NULL,
	[IllnessID] [int] NULL,
	[TreatmentID] [int] NULL,
	[Status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[MedicalRecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 7/16/2023 12:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[PatientID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[PatientName] [nvarchar](150) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[DateOfBirth] [datetime] NULL,
	[PatientCode] [nvarchar](20) NULL,
	[Address] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProposeAppointment]    Script Date: 7/16/2023 12:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProposeAppointment](
	[ProposeAppointmentID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NULL,
	[Datetime] [datetime] NULL,
	[Name] [nvarchar](150) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[Note] [nvarchar](max) NULL,
	[Status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProposeAppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 7/16/2023 12:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffID] [int] IDENTITY(1,1) NOT NULL,
	[StaffName] [nvarchar](150) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[Email] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Treatment]    Script Date: 7/16/2023 12:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Treatment](
	[TreatmentID] [int] IDENTITY(1,1) NOT NULL,
	[TreatmentName] [nvarchar](150) NULL,
	[Price] [money] NULL,
	[EstimatedTime] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[TreatmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Appointment] ON 

INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [DentistID], [StaffID], [Datetime], [Duration], [Status]) VALUES (8, 4, 2, 1, CAST(N'2023-07-18T09:00:00.000' AS DateTime), 2.5, N'Finished')
INSERT [dbo].[Appointment] ([AppointmentID], [PatientID], [DentistID], [StaffID], [Datetime], [Duration], [Status]) VALUES (10, 5, 2, 1, CAST(N'2023-07-18T12:30:00.000' AS DateTime), 1.5, N'Scheduled')
SET IDENTITY_INSERT [dbo].[Appointment] OFF
GO
SET IDENTITY_INSERT [dbo].[AppointmentDetail] ON 

INSERT [dbo].[AppointmentDetail] ([AppointmentDetailID], [AppointmentID], [MedicalRecordID]) VALUES (4, 8, 4)
INSERT [dbo].[AppointmentDetail] ([AppointmentDetailID], [AppointmentID], [MedicalRecordID]) VALUES (5, 10, 5)
SET IDENTITY_INSERT [dbo].[AppointmentDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Dentist] ON 

INSERT [dbo].[Dentist] ([DentistID], [Email], [DentistName], [PhoneNumber]) VALUES (1, N'dentist@gmail.com', N'Dr. John Doe', N'1234567890')
INSERT [dbo].[Dentist] ([DentistID], [Email], [DentistName], [PhoneNumber]) VALUES (2, N'dentist1@gmail.com', N'Dr. Jane Smith', N'9876543210')
SET IDENTITY_INSERT [dbo].[Dentist] OFF
GO
SET IDENTITY_INSERT [dbo].[DentistAvailability] ON 

INSERT [dbo].[DentistAvailability] ([AvailabilityID], [DentistID], [DayOfWeek], [StartTime], [EndTime]) VALUES (1, 1, N'Monday', CAST(N'08:00:00' AS Time), CAST(N'11:00:00' AS Time))
INSERT [dbo].[DentistAvailability] ([AvailabilityID], [DentistID], [DayOfWeek], [StartTime], [EndTime]) VALUES (2, 2, N'Tuesday', CAST(N'09:00:00' AS Time), CAST(N'16:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[DentistAvailability] OFF
GO
SET IDENTITY_INSERT [dbo].[Illness] ON 

INSERT [dbo].[Illness] ([IllnessID], [IllnessName]) VALUES (1, N'Tooth Decay')
INSERT [dbo].[Illness] ([IllnessID], [IllnessName]) VALUES (2, N'Cracked Teeth')
INSERT [dbo].[Illness] ([IllnessID], [IllnessName]) VALUES (3, N'Root Infection')
INSERT [dbo].[Illness] ([IllnessID], [IllnessName]) VALUES (4, N'Root Infection')
INSERT [dbo].[Illness] ([IllnessID], [IllnessName]) VALUES (5, N'Sensitive Teeth')
INSERT [dbo].[Illness] ([IllnessID], [IllnessName]) VALUES (6, N'Gum Disease')
SET IDENTITY_INSERT [dbo].[Illness] OFF
GO
SET IDENTITY_INSERT [dbo].[MedicalRecord] ON 

INSERT [dbo].[MedicalRecord] ([MedicalRecordID], [PatientID], [DentistID], [TeethNumber], [IllnessID], [TreatmentID], [Status]) VALUES (1, 1, 1, 12, 1, 1, N'Finished')
INSERT [dbo].[MedicalRecord] ([MedicalRecordID], [PatientID], [DentistID], [TeethNumber], [IllnessID], [TreatmentID], [Status]) VALUES (2, 2, 2, 28, 3, 3, N'Finished')
INSERT [dbo].[MedicalRecord] ([MedicalRecordID], [PatientID], [DentistID], [TeethNumber], [IllnessID], [TreatmentID], [Status]) VALUES (3, 1, 1, 13, 1, 5, N'Finished')
INSERT [dbo].[MedicalRecord] ([MedicalRecordID], [PatientID], [DentistID], [TeethNumber], [IllnessID], [TreatmentID], [Status]) VALUES (4, 4, 2, 10, 2, 2, N'Finished')
INSERT [dbo].[MedicalRecord] ([MedicalRecordID], [PatientID], [DentistID], [TeethNumber], [IllnessID], [TreatmentID], [Status]) VALUES (5, 5, 2, 12, 3, 3, N'Finished')
SET IDENTITY_INSERT [dbo].[MedicalRecord] OFF
GO
SET IDENTITY_INSERT [dbo].[Patient] ON 

INSERT [dbo].[Patient] ([PatientID], [Email], [PatientName], [PhoneNumber], [DateOfBirth], [PatientCode], [Address]) VALUES (1, N'patient@gmail.com', N'John Smith', N'5551234567', CAST(N'1980-05-10T00:00:00.000' AS DateTime), N'P12345', N'123 Main St')
INSERT [dbo].[Patient] ([PatientID], [Email], [PatientName], [PhoneNumber], [DateOfBirth], [PatientCode], [Address]) VALUES (2, N'patient2@example.com', N'Jane Doe', N'5559876543', CAST(N'1990-10-15T00:00:00.000' AS DateTime), N'P54321', N'456 Elm St')
INSERT [dbo].[Patient] ([PatientID], [Email], [PatientName], [PhoneNumber], [DateOfBirth], [PatientCode], [Address]) VALUES (3, N'patient2@gmail.com', N'Chandler Bing', N'0205080104', CAST(N'2002-07-14T01:17:07.203' AS DateTime), N'P303304', N'London Ent')
INSERT [dbo].[Patient] ([PatientID], [Email], [PatientName], [PhoneNumber], [DateOfBirth], [PatientCode], [Address]) VALUES (4, N'nguyentanphat@gmail.com', N'Nguyen Tan Phat', N'0103040523', CAST(N'2001-05-23T00:00:00.000' AS DateTime), N'P303305', N'Ho Chi Minh.city')
INSERT [dbo].[Patient] ([PatientID], [Email], [PatientName], [PhoneNumber], [DateOfBirth], [PatientCode], [Address]) VALUES (5, N'huynhtanphat@gmail.com', N'Huynh Tan Phat', N'0938957692', CAST(N'2001-05-23T00:00:00.000' AS DateTime), N'P303306', N'Ho Chi Minh.city')
SET IDENTITY_INSERT [dbo].[Patient] OFF
GO
SET IDENTITY_INSERT [dbo].[ProposeAppointment] ON 

INSERT [dbo].[ProposeAppointment] ([ProposeAppointmentID], [PatientID], [Datetime], [Name], [PhoneNumber], [Note], [Status]) VALUES (1, NULL, CAST(N'2023-07-22T09:00:00.000' AS DateTime), N'John Smithathan', N'5551234567', N'Check-up', N'NotSeen')
INSERT [dbo].[ProposeAppointment] ([ProposeAppointmentID], [PatientID], [Datetime], [Name], [PhoneNumber], [Note], [Status]) VALUES (2, 2, CAST(N'2023-07-23T14:30:00.000' AS DateTime), N'Jane Doe', N'5559876543', N'Toothache', N'NotSeen')
INSERT [dbo].[ProposeAppointment] ([ProposeAppointmentID], [PatientID], [Datetime], [Name], [PhoneNumber], [Note], [Status]) VALUES (12, 1, CAST(N'2023-07-19T05:08:27.840' AS DateTime), N'Dlow', N'0903020108', N'Cracked Teeth', N'NotSeen')
INSERT [dbo].[ProposeAppointment] ([ProposeAppointmentID], [PatientID], [Datetime], [Name], [PhoneNumber], [Note], [Status]) VALUES (13, NULL, CAST(N'2023-07-18T10:00:00.000' AS DateTime), N'Phat Nguyen', N'0903020108', N'Check Up', N'Seen')
INSERT [dbo].[ProposeAppointment] ([ProposeAppointmentID], [PatientID], [Datetime], [Name], [PhoneNumber], [Note], [Status]) VALUES (14, NULL, CAST(N'2023-07-18T12:00:00.000' AS DateTime), N'Huynh Tan Phat', N'0938957692', N'Kiem tra rang mieng', N'Seen')
SET IDENTITY_INSERT [dbo].[ProposeAppointment] OFF
GO
SET IDENTITY_INSERT [dbo].[Staff] ON 

INSERT [dbo].[Staff] ([StaffID], [StaffName], [PhoneNumber], [Email]) VALUES (1, N'Mbape', N'5551112222', N'staff@gmail.com')
INSERT [dbo].[Staff] ([StaffID], [StaffName], [PhoneNumber], [Email]) VALUES (2, N'Messi', N'5553334444', N'messi@gmail.com')
SET IDENTITY_INSERT [dbo].[Staff] OFF
GO
SET IDENTITY_INSERT [dbo].[Treatment] ON 

INSERT [dbo].[Treatment] ([TreatmentID], [TreatmentName], [Price], [EstimatedTime]) VALUES (1, N'Filling', 50.0000, 1.5)
INSERT [dbo].[Treatment] ([TreatmentID], [TreatmentName], [Price], [EstimatedTime]) VALUES (2, N'Cleaning', 80.0000, 2)
INSERT [dbo].[Treatment] ([TreatmentID], [TreatmentName], [Price], [EstimatedTime]) VALUES (3, N'Extraction', 100.0000, 1)
INSERT [dbo].[Treatment] ([TreatmentID], [TreatmentName], [Price], [EstimatedTime]) VALUES (4, N'Root Canal', 120.0000, 1)
INSERT [dbo].[Treatment] ([TreatmentID], [TreatmentName], [Price], [EstimatedTime]) VALUES (5, N'Gum Craft', 150.0000, 2)
INSERT [dbo].[Treatment] ([TreatmentID], [TreatmentName], [Price], [EstimatedTime]) VALUES (6, N'Examination', 10.0000, 0.5)
SET IDENTITY_INSERT [dbo].[Treatment] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Patient__A9D105345AD22B83]    Script Date: 7/16/2023 12:00:04 PM ******/
ALTER TABLE [dbo].[Patient] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Staff__A9D105348B725B8F]    Script Date: 7/16/2023 12:00:04 PM ******/
ALTER TABLE [dbo].[Staff] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD FOREIGN KEY([DentistID])
REFERENCES [dbo].[Dentist] ([DentistID])
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([PatientID])
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
GO
ALTER TABLE [dbo].[AppointmentDetail]  WITH CHECK ADD FOREIGN KEY([AppointmentID])
REFERENCES [dbo].[Appointment] ([AppointmentID])
GO
ALTER TABLE [dbo].[AppointmentDetail]  WITH CHECK ADD FOREIGN KEY([MedicalRecordID])
REFERENCES [dbo].[MedicalRecord] ([MedicalRecordID])
GO
ALTER TABLE [dbo].[DentistAvailability]  WITH CHECK ADD FOREIGN KEY([DentistID])
REFERENCES [dbo].[Dentist] ([DentistID])
GO
ALTER TABLE [dbo].[MedicalRecord]  WITH CHECK ADD FOREIGN KEY([DentistID])
REFERENCES [dbo].[Dentist] ([DentistID])
GO
ALTER TABLE [dbo].[MedicalRecord]  WITH CHECK ADD FOREIGN KEY([IllnessID])
REFERENCES [dbo].[Illness] ([IllnessID])
GO
ALTER TABLE [dbo].[MedicalRecord]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([PatientID])
GO
ALTER TABLE [dbo].[MedicalRecord]  WITH CHECK ADD FOREIGN KEY([TreatmentID])
REFERENCES [dbo].[Treatment] ([TreatmentID])
GO
ALTER TABLE [dbo].[ProposeAppointment]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patient] ([PatientID])
GO
USE [master]
GO
ALTER DATABASE [DentistBooking] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [UserManagement]    Script Date: 7/16/2023 10:29:09 PM ******/
CREATE DATABASE [UserManagement]

GO
ALTER DATABASE [UserManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UserManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UserManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UserManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UserManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UserManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UserManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [UserManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UserManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UserManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UserManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UserManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UserManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UserManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UserManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UserManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UserManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [UserManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UserManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UserManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UserManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UserManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UserManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UserManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UserManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [UserManagement] SET  MULTI_USER 
GO
ALTER DATABASE [UserManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UserManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UserManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UserManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UserManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UserManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'UserManagement', N'ON'
GO
ALTER DATABASE [UserManagement] SET QUERY_STORE = OFF
GO
USE [UserManagement]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/16/2023 10:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/16/2023 10:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	[CreatedAt] [datetime] NULL,
	[RoleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'patient')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'dentist')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'staff')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [Email], [Password], [CreatedAt], [RoleID]) VALUES (1, N'patient@gmail.com', N'patient123', CAST(N'2023-05-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[User] ([UserID], [Email], [Password], [CreatedAt], [RoleID]) VALUES (2, N'dentist@gmail.com', N'dentist123', CAST(N'2023-05-23T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[User] ([UserID], [Email], [Password], [CreatedAt], [RoleID]) VALUES (3, N'staff@gmail.com', N'staff123', CAST(N'2023-05-23T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[User] ([UserID], [Email], [Password], [CreatedAt], [RoleID]) VALUES (4, N'patient2@gmail.com', N'patient123', CAST(N'2023-07-14T01:17:07.203' AS DateTime), 1)
INSERT [dbo].[User] ([UserID], [Email], [Password], [CreatedAt], [RoleID]) VALUES (5, N'nguyentanphat@gmail.com', N'patient123', CAST(N'2023-07-15T12:00:00.000' AS DateTime), 1)
INSERT [dbo].[User] ([UserID], [Email], [Password], [CreatedAt], [RoleID]) VALUES (6, N'huynhtanphat@gmail.com', N'patient123', CAST(N'2023-07-15T12:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
USE [master]
GO
ALTER DATABASE [UserManagement] SET  READ_WRITE 
GO

