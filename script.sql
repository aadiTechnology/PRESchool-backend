SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.users', 'U') IS NOT NULL
    DROP TABLE dbo.users;
GO

IF OBJECT_ID('dbo.roles', 'U') IS NOT NULL
    DROP TABLE dbo.roles;
GO

CREATE TABLE [dbo].[roles](
    [id] [int] IDENTITY(1,1) NOT NULL,
    [name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED ([id] ASC),
UNIQUE NONCLUSTERED ([name] ASC)
);
GO

CREATE TABLE [dbo].[users](
    [id] [int] IDENTITY(1,1) NOT NULL,
    [firstName] [nvarchar](50) NULL,
    [lastName] [nvarchar](50) NULL,
    [email] [nvarchar](100) NULL,
    [phone] [nvarchar](20) NULL,
    [hashedPassword] [nvarchar](255) NULL,
    [password] [nvarchar](255) NULL,
    [role_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED ([id] ASC),
UNIQUE NONCLUSTERED ([email] ASC),
FOREIGN KEY ([role_id]) REFERENCES [dbo].[roles]([id])
);
GO
