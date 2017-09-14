CREATE PROCEDURE dbo.GetAllRecpies
AS
BEGIN
SELECT recipeid, External_recipe_id
FROM dbo.Recipe r
WHERE recipeid NOT IN (SELECT recipeid FROM dbo.RecipeIngredients ri
					    WHERE ri.RecipeId = r.RecipeId)
END