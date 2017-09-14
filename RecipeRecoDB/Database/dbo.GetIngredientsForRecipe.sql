
ALtER PROC dbo.GetIngredientsForRecipe
(
	@RecipeId int
)
AS
BEGIN
	SELECT distinct ingredient from dbo.RecipeIngredients Where RecipeId = @RecipeId
END