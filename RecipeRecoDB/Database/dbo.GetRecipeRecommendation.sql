ALTER PROC dbo.GetRecipeRecommendation
(
	@userId int
)
AS
BEGIN
	declare @RecipeRecos table
	(
		recipeid int
		, external_recipe_id varchar(20)
		, title varchar(200)
		, cookingEffort varchar(20)
		, CuisineMealType varchar(100)
		, Rating int
		, PredictedRating int
		, PredictedRatingValue float
	)
	insert into @RecipeRecos(recipeid, external_recipe_id, title, cookingEffort, CuisineMealType)
	select RecipeId, External_recipe_id, title, CookingEffort, CuisineMealType
	from dbo.recipe
	where recipeid in (select top 5 recipeid from [dbo].[RecipeUserRating] rr
						where userId = @UserId  and (Rating IS NULL or Rating = -1) 
						and PredictedRating >= 1 
						order by PedictedRatingValue  desc)
	update rr
	set rr.PredictedRating = ISNULL(rur.PredictedRating , 0)
	, rr.PredictedRatingValue = ISNULL(rur.PedictedRatingValue, 0)
	, rr.Rating = ISNULL(rur.Rating, 0)
	from @RecipeRecos rr
	join [RecipeUserRating] rur on rur.RecipeId = rr.recipeid and rur.UserId = @userId

	----select * from @RecipeRecos
	insert into @RecipeRecos(recipeid, external_recipe_id, title, cookingEffort, CuisineMealType)
	select distinct rsi.RecipeB, rsi.ExternalRecipeBId, rs.Title, rs.CookingEffort, rs.CuisineMealType
	from @RecipeRecos r
	join dbo.RecipesSimilarityIndex rsi on rsi.RecipeA = r.RecipeId 
	join dbo.Recipe rs on rs.RecipeId = rsi.RecipeB
	where (SimiIndiValue > 0.2 or CuisineMatch = 1)
	and rsi.ExternalRecipeBId not in (select External_recipe_id from @RecipeRecos)

	---select * from @RecipeRecos

	insert into @RecipeRecos(recipeid, external_recipe_id, title, cookingEffort, CuisineMealType)
	select distinct rsi.RecipeA, rs.external_recipe_id, rs.Title, rs.CookingEffort, rs.CuisineMealType
	from @RecipeRecos r
	join dbo.RecipesSimilarityIndex rsi on rsi.RecipeB = r.RecipeId 
	join dbo.Recipe rs on rs.RecipeId = rsi.RecipeA
	where (SimiIndiValue > 0.2 or CuisineMatch = 1)
	and rs.External_recipe_id not in (select External_recipe_id from @RecipeRecos)
	and rs.RecipeId not in (select RecipeId from [RecipeUserRating]
										where userId = @userId and Rating > 0 )

	select * from @RecipeRecos order by PredictedRatingValue desc
end

exec dbo.GetRecipeRecommendation 13
exec dbo.GetRatedRecipes 13
select * from dbo.UserPreferences where userid = 1

select * from RecipeIngredients where RecipeId = 591052

select * from recipe where External_recipe_id in ('729953', '246395' , '770626')
select * from recipe where title = 'Brown Butter Lobster Ravioli with Tomato Cream Sauce'
select * from [dbo].[RecipesSimilarityIndex] where ExternalRecipeAId = 591052 or ExternalRecipeBId = 591052