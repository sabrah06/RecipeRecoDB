alter procedure dbo.GenerateUserRecipeRatingBase
(
	@userId int
)
AS
BEGIN
declare @UserRating table
(
	Recipeid int
	, External_recipe_id varchar(20)
	, userId int
	, Rating int
	, GlutenFreeMatch tinyint
	, DiaryFreeMatch tinyint
	, VegetarianMatch tinyint
	, VeganMatch tinyint
	, VeryHealtyMatch tinyint
)
insert into @UserRating(recipeid, External_recipe_id, userid, Rating)
select RecipeId, External_recipe_id, @UserId, -1
from Recipe r
where CuisineMealType in (select OptionValue from dbo.UserPreferences 
							where userid = @UserId		
							and ChosenOption = 'CusineType')

update ur
set VeryHealtyMatch = rm.VeryHealthy
, VegetarianMatch = rm.Vegetarian
,  DiaryFreeMatch = rm.DairyFree
, VeganMatch = rm.Vegan
, GlutenFreeMatch = rm.GlutenFree
from @UserRating ur
join dbo.RecipeMeta rm on rm.RecipeId = ur.External_recipe_id

--select * from @UserRating

if not exists (select 1 from dbo.RecipeUserRating where userid = @userId)
BEGIN
	insert into dbo.RecipeUserRating (recipeid, userid, Rating)
	select RecipeId, userId, Rating
	from @UserRating
	where ( VeryHealtyMatch = 1 or VegetarianMatch = 1 or DiaryFreeMatch = 1 or VeganMatch = 1 or GlutenFreeMatch = 1)
END
END

exec dbo.GenerateUserRecipeRatingBase 3

select * from RecipeUserRating where userid = 3
delete RecipeUserRating where userid = 3
select * from [dbo].[RecipeMeta] where recipeid = 41