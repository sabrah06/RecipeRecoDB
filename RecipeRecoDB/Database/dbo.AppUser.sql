USE [RecipeReco]
GO

/****** Object:  Table [dbo].[AppUser]    Script Date: 16/08/2017 13:52:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
drop table dbo.AppUser
CREATE TABLE [dbo].[AppUser](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](200) NULL,
	[UserName] [varchar](20) NULL,
	[UserPass] [varchar](20) NULL,
	[VerifiedPin] [varchar](10) NULL,
	[E_mail] varchar(200)
 CONSTRAINT [PK__AppUser__1788CC4CDCB5CDBD] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


