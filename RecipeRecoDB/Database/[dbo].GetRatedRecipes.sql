USE [RecipeReco]
GO
/****** Object:  StoredProcedure [dbo].[GetRatedRecipes]    Script Date: 16/08/2017 22:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetRatedRecipes]
(
	@UserId int
)
AS
BEGIN
	select rr.RecipeId, r.External_recipe_id, r.Title, r.CookingEffort,r.CuisineMealType
	, rr.Rating, rr.PredictedRating, rr.PedictedRatingValue PredictedRatingValue
	from dbo.Recipe r 
    join dbo.RecipeUserRating rr on rr.Recipeid = r.RecipeId
	where rr.UserId = @UserId
	and rr.Rating > 0
END
