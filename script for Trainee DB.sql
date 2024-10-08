USE [master]
GO
/****** Object:  Database [Trainee]    Script Date: 22-08-2024 22:52:16 ******/
CREATE DATABASE [Trainee]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Trainee', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Trainee.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Trainee_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Trainee_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Trainee] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trainee].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trainee] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trainee] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trainee] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trainee] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trainee] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trainee] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Trainee] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trainee] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trainee] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trainee] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trainee] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trainee] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trainee] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trainee] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trainee] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Trainee] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trainee] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trainee] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trainee] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trainee] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trainee] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trainee] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trainee] SET RECOVERY FULL 
GO
ALTER DATABASE [Trainee] SET  MULTI_USER 
GO
ALTER DATABASE [Trainee] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trainee] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trainee] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trainee] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trainee] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Trainee] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Trainee', N'ON'
GO
ALTER DATABASE [Trainee] SET QUERY_STORE = ON
GO
ALTER DATABASE [Trainee] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Trainee]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 22-08-2024 22:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 22-08-2024 22:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 22-08-2024 22:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[Role] [nvarchar](256) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 22-08-2024 22:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](25) NULL,
	[Price] [decimal](18, 2) NULL,
	[Quantity] [int] NULL,
	[DateModified] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 22-08-2024 22:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentID] [varchar](10) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[DOB] [date] NOT NULL,
	[Created_On] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 22-08-2024 22:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 22-08-2024 22:52:17 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)
INCLUDE([UserId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
/****** Object:  StoredProcedure [dbo].[AddProduct]    Script Date: 22-08-2024 22:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddProduct]
    @Name NVARCHAR(100),
    @Price DECIMAL(18, 2),
    @Quantity INT
AS
BEGIN
    INSERT INTO Products (Name, Price, Quantity)
    VALUES (@Name, @Price, @Quantity);
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 22-08-2024 22:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteProduct]
    @ProductId INT
AS
BEGIN
    DELETE FROM Products WHERE ProductId = @ProductId;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetProductById]    Script Date: 22-08-2024 22:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductById]
    @ProductId INT
AS
BEGIN
    SELECT * FROM Products WHERE ProductId = @ProductId;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetProducts]    Script Date: 22-08-2024 22:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProducts]
AS
BEGIN
    SELECT * FROM Products;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetUserByUsername]    Script Date: 22-08-2024 22:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserByUsername]
    @Username NVARCHAR(100)
AS
BEGIN
    SELECT * FROM Users WHERE Username = @Username;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertUser]    Script Date: 22-08-2024 22:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertUser]
    @Username NVARCHAR(100),
    @PasswordHash NVARCHAR(255),
    @Email NVARCHAR(100),
    @Role NVARCHAR(50)
AS
BEGIN
    INSERT INTO Users (Username, PasswordHash, Email, Role)
    VALUES (@Username, @PasswordHash, @Email, @Role);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteStudent]    Script Date: 22-08-2024 22:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteStudent]
    @StudentID VARCHAR(10)
AS
BEGIN
    DELETE FROM Students
    WHERE StudentID = @StudentID;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllStudents]    Script Date: 22-08-2024 22:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAllStudents]
AS
BEGIN
    SELECT * FROM Students
	ORDER BY Created_On ASC;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetStudentById]    Script Date: 22-08-2024 22:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetStudentById]
    @StudentID VARCHAR(10)
AS
BEGIN
    SELECT * FROM Students
    WHERE StudentID = @StudentID;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertStudent]    Script Date: 22-08-2024 22:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[sp_InsertStudent]
   (
    @StudentID VARCHAR(10),
    @Name NVARCHAR(100),
    @DOB DATE,
    @Created_On DATETIME
	)
AS
BEGIN
    DECLARE @Rowcount INT = 0;
    SET @Rowcount = (SELECT COUNT(1) FROM dbo.Students WHERE Name = @Name);

    BEGIN TRY
        BEGIN TRAN
            IF (@Rowcount = 0)
            BEGIN
                INSERT INTO Students (StudentID, Name, DOB, Created_On)
                VALUES (@StudentID, @Name, @DOB, @Created_On);
            END
        COMMIT TRAN
    END TRY
    BEGIN CATCH
        ROLLBACK TRAN
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateStudent]    Script Date: 22-08-2024 22:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateStudent]
(
    @StudentID VARCHAR(10),
    @Name NVARCHAR(100),
    @DOB DATE
)
AS
BEGIN
DECLARE @Rowcount INT= 0
SET @Rowcount = (SELECT COUNT(1) FROM dbo.Students WHERE Name = @Name AND StudentID <> @StudentID)
BEGIN TRY
BEGIN TRAN
IF(@Rowcount =0 )
 BEGIN
   UPDATE dbo.Students
   SET Name = @Name,
       DOB = @DOB
   WHERE StudentID = @StudentID
END;
COMMIT TRAN
END TRY
BEGIN CATCH 
       ROLLBACK TRAN
	    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 22-08-2024 22:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateProduct]
    @ProductId INT,
    @Name NVARCHAR(100),
    @Price DECIMAL(18, 2),
    @Quantity INT
AS
BEGIN
    UPDATE Products
    SET Name = @Name, Price = @Price, Quantity = @Quantity
    WHERE ProductId = @ProductId;
END;
GO
USE [master]
GO
ALTER DATABASE [Trainee] SET  READ_WRITE 
GO
