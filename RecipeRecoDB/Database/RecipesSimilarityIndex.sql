USE [RecipeReco]
GO

/****** Object:  Table [dbo].[RecipesSimilarityIndex]    Script Date: 15/07/2017 07:00:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
drop table dbo.RecipesSimilarityIndex
CREATE TABLE [dbo].[RecipesSimilarityIndex](
	[RecipeSimilarityIndexId] [int] IDENTITY(1,1) NOT NULL,
	[RecipeA] [int] NULL,
	[RecipeB] [int] NULL,
	ExternalRecipeAId varchar(20),
	ExternalRecipeBId varchar(20),
	[SimiIndiValue] [float] NULL,
	[CuisineMatch] [bit] NULL,
	[MealTypeMatch] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[RecipeSimilarityIndexId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[RecipesSimilarityIndex]  WITH CHECK ADD FOREIGN KEY([RecipeA])
REFERENCES [dbo].[Recipe] ([RecipeId])
GO

ALTER TABLE [dbo].[RecipesSimilarityIndex]  WITH CHECK ADD FOREIGN KEY([RecipeB])
REFERENCES [dbo].[Recipe] ([RecipeId])
GO


