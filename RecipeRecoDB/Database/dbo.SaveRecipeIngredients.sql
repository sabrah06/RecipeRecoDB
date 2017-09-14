CREATE PROCEDURE dbo.SaveRecipeIngredients
(
	@RecipeId int,
    @Ingredient varchar(100)
)
AS
BEGIN

	INSERT INTO dbo.RecipeIngredients(RecipeId, Ingredient)
	values(@RecipeId, @Ingredient)

END  