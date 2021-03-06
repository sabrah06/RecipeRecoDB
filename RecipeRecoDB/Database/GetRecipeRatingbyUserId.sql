USE [RecipeReco]
GO
/****** Object:  StoredProcedure [dbo].[GetRecipeRatingbyUserId]    Script Date: 02/08/2017 07:04:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetRecipeRatingbyUserId]
(
	@UserId int
)
AS
BEGIN
	/*
	select UserRatingId, rr.RecipeId, ISNULL(rr.Rating, -1) [UserRating], r.UserRating [RecipeRating]
	from dbo.RecipeUserRating rr
	left join dbo.Recipe r on rr.Recipeid = r.RecipeId
	where rr.UserId = @UserId
	and r.RecipeId in (select recipeId from dbo.RecipeUserRating rr 
						group by recipeid having count(1) > 2)

	*/
	select UserRatingId, rr.RecipeId, ISNULL(rr.Rating, -1) [UserRating], rr.UserId
	from dbo.Recipe r 
	left join dbo.RecipeUserRating rr on rr.Recipeid = r.RecipeId
	where rr.UserId = @UserId
	UNION
	select UserRatingId, rr.RecipeId, ISNULL(rr.Rating, -1) [UserRating], rr.UserId
	from dbo.Recipe r 
	left join dbo.RecipeUserRating rr on rr.Recipeid = r.RecipeId
	where r.RecipeId in (select recipeId from dbo.RecipeUserRating rr 
						group by recipeid having count(1) > 2)
	order by Userid

END