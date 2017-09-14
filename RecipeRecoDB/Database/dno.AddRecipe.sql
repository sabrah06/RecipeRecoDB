ALTER PROCEDURE dbo.AddRecipe(
	@ExternalRecipeId varchar(30)
   , @Title varchar(200)
   , @Cusine varchar(100)
   , @ImageLink varchar(200)
   , @ExternallLink varchar(200)
   , @ReadyinMinutes varchar(3)
   , @SearchParams varchar(100)
   , @RecipeId int OUTPUT
)
AS
BEGIN
	declare @CookingEffort varchar(100)
	if (@readyinMinutes <= 30)
		SET @CookingEffort = 'Quick ' + CAST(@readyinMinutes as varchar) + ' minutes'
	else if (@readyinMinutes > 30 and @readyinMinutes <= 45)
		SET @CookingEffort = 'Easy ' + CAST(@readyinMinutes as varchar) + ' minutes'
	else if (@readyinMinutes > 45 and @readyinMinutes <= 60)
		SET @CookingEffort = 'Medium ' + CAST(@readyinMinutes as varchar) + ' minutes'
	else
		SET @CookingEffort = 'Hard ' + CAST(@readyinMinutes as varchar) + ' minutes'

	insert into dbo.Recipe (External_recipe_id, Title, ExternalLink, CuisineMealType, ImageLink, CookingEffort, SearchParams, createdOn, updatedOn)
	select @ExternalRecipeId, @Title, @ExternallLink, @Cusine, @ImageLink, @CookingEffort, @SearchParams, getdate(), getdate()

	SET @RecipeId = SCOPE_IDENTITY();
END