USE [RecipeReco]
GO
/****** Object:  StoredProcedure [dbo].[GetRecipeRating]    Script Date: 02/08/2017 21:22:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetRecipeRating]
(
	@recipeId int
)
AS
BEGIN
	select UserId, isnull(rr.Rating, -1) [RecipeRating]
	from dbo.RecipeUserRating rr
	where rr.RecipeId = @recipeId
END