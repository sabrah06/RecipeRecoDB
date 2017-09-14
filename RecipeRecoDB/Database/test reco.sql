select ri.* from dbo.RecipeIngredients ri
join dbo.recipe r on r.RecipeId = ri.RecipeId
where r.External_recipe_id = '773578'

exec GetIngredientsForRecipe '532669'
exec GetIngredientsForRecipe '605535'
select * from dbo.RecipeIngredients where RecipeId = 61

exec dbo.GetRecipeRecommendation 1
select * from dbo.UserPreferences where userid = 3
select top 3 * from dbo.RecipeMeta
exec GetIngredientsForRecipe '511045'
select * from RecipesSimilarityIndex where ExternalRecipeAId =511045 or ExternalRecipeBId =511045

select top 5 recipeid, Rating, PredictedRating from [dbo].[RecipeUserRating] rr
where userId = 1  and (Rating IS NULL or Rating = 0)
and PredictedRating >= 1 

select RecipeId, External_recipe_id, title, CookingEffort, CuisineMealType
	from dbo.recipe
	where recipeid in (select top 5 recipeid from [dbo].[RecipeUserRating] rr
						where userId = 1  and (Rating IS NULL or Rating = 0) 
						and PredictedRating >= 1 
						order by PedictedRatingValue  desc)
--populate recipeuserrating
select u.UserId, rr.RecipeId, rating from [RecipeUserRating] rr
left join dbo.AppUser u on rr.UserId = u.UserId
left join dbo.Recipe r on r.RecipeId = rr.RecipeId
where u.userid = 3 and r.RecipeId is null

delete [dbo].[RecipeUserRating] where userid = 3

select recipeid, External_recipe_id, title, CuisineMealType from Recipe r
where recipeid not in (select RecipeId from [RecipeUserRating])
