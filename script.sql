USE [erpdb]
GO

/****** Object:  Table [dbo].[users]    Script Date: 7/9/2025 5:54:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

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
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_classes] FOREIGN KEY([classId])
REFERENCES [dbo].[classes] ([id])
GO

ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_classes]
GO

ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_divisions] FOREIGN KEY([divisionId])
REFERENCES [dbo].[divisions] ([id])
GO

ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_divisions]
GO


