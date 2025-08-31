
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Drop constraints first (if exist)
IF OBJECT_ID('dbo.FK_users_classes', 'F') IS NOT NULL
    ALTER TABLE dbo.users DROP CONSTRAINT FK_users_classes;

IF OBJECT_ID('dbo.FK_users_divisions', 'F') IS NOT NULL
    ALTER TABLE dbo.users DROP CONSTRAINT FK_users_divisions;

-- Drop the table if it already exists
IF OBJECT_ID('dbo.users', 'U') IS NOT NULL
    DROP TABLE dbo.users;
GO

-- Recreate the table
CREATE TABLE [dbo].[users](
    [id] [int] IDENTITY(1,1) NOT NULL,
    [firstName] [nvarchar](50) NULL,
    [lastName] [nvarchar](50) NULL,
    [email] [nvarchar](100) NULL,
    [phone] [nvarchar](20) NULL,
    [hashedPassword] [nvarchar](255) NULL,
    [password] [nvarchar](255) NULL,
    [role] [int] NULL,
    [preschoolId] [int] NULL,
    [childName] [nvarchar](255) NULL,
    [childAge] [int] NULL,
    [otp] [varchar](10) NULL,
    [otpExpiry] [datetime] NULL,
    [classId] [int] NULL,
    [divisionId] [int] NULL,
    [qualification] [varchar](255) NULL,
PRIMARY KEY CLUSTERED ([id] ASC),
UNIQUE NONCLUSTERED ([email] ASC)
);
GO

-- Add foreign keys only if parent tables exist
IF OBJECT_ID('dbo.classes', 'U') IS NOT NULL
BEGIN
    ALTER TABLE [dbo].[users]  WITH CHECK ADD CONSTRAINT [FK_users_classes] 
    FOREIGN KEY([classId]) REFERENCES [dbo].[classes] ([id]);
    ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_classes];
END

IF OBJECT_ID('dbo.divisions', 'U') IS NOT NULL
BEGIN
    ALTER TABLE [dbo].[users]  WITH CHECK ADD CONSTRAINT [FK_users_divisions] 
    FOREIGN KEY([divisionId]) REFERENCES [dbo].[divisions] ([id]);
    ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_divisions];
END
GO
