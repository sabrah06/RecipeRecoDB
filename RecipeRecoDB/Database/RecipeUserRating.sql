USE [RecipeReco]
GO

/****** Object:  Table [dbo].[RecipeUserRating]    Script Date: 29/07/2017 06:57:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

drop TABLE [dbo].[RecipeUserRating]
CREATE TABLE [dbo].[RecipeUserRating](
	[UserRatingId] [int] NOT NULL,
	[RecipeId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Rating] [float] NOT NULL,
	[LikeDislike] bit 
) ON [PRIMARY]

GO


