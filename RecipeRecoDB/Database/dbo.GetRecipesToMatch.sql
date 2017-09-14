CREATE PROC dbo.GetRecipesToMatch
AS
BEGIN

SELECT RecipeId, External_recipe_id from Recipe
WHERE RecipeId NOT IN (select RecipeA from dbo.RecipesSimilarityIndex)

END