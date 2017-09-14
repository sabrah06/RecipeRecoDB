ALTER PROCEDURE [dbo].GetRatedRecipeUserId
(
	@UserId int
)
AS
BEGIN
	select UserRatingId, rr.RecipeId, ISNULL(rr.Rating, -1) [UserRating], rr.UserId
	from dbo.Recipe r 
    join dbo.RecipeUserRating rr on rr.Recipeid = r.RecipeId
	where rr.UserId = @UserId
	and rr.Rating > 0

END