ALTER PROCEDURE dbo.GetRecipeRatingbyUserId
(
	@UserId int
)
AS
BEGIN
	select UserRatingId, rr.RecipeId, ISNULL(rr.Rating, -1) [UserRating], r.UserRating [RecipeRating]
	from dbo.RecipeUserRating rr
	left join dbo.Recipe r on rr.Recipeid = r.RecipeId
	where rr.UserId = @UserId
END

CREATE PROCEDURE dbo.GetUserRatingbyRecipeId
(
	@RecipeId int
)
AS
BEGIN
	select UserRatingId, UserId, Rating from dbo.RecipeuserRating
	where RecipeId = @RecipeId
END