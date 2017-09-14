CREATE PROCEDURE dbo.SaveRecipeMeta
(
	@RecipeId int,
    @GlutenFree bit,
    @DiaryFree bit,
    @Vegetarian bit,
    @Vegan bit,
    @VeryPopular bit,
    @Veryhealthy bit
)
AS
BEGIN

	INSERT INTO dbo.RecipeMeta (RecipeId, GlutenFree, Vegetarian, Vegan, VeryPopular,
	VeryHealthy, DairyFree)
	values(@RecipeId, @GlutenFree, @Vegetarian, @Vegan, @VeryPopular, @Veryhealthy, @DiaryFree)

END  