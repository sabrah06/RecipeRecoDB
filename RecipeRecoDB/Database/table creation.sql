ListOfPreferences(preference_id, preference_name)
UserPreference (userpreferenceid, preference_id, preference_value)
Recipe (Recipeid, external_recipe_id, title, external_link, cuisine, meal_type, image_link, Cooking_effort, external_recipe_rating, user_rating, like_dislike, createdOn)
HealthyOptions (recipeid, option_name)
RecipeIngredients( RecipeIngredientsId, RecipeId, main_ingredient)
All_Ingredients(All_IngredientsId, recipeId, ListofIngredients)
RecipeUserLink(Userid, recipeId)

use Recipereco;

truncate table dbo.
delete dbo.Recipe 
drop table dbo.Recipe
create table dbo.Recipe 
(
	RecipeId int iDENTITY(1,1) PRIMARY KEY NOT NULL
   , External_recipe_id varchar(20)
   , Title varchar(200)
   , ExternalLink varchar(200)
   , CuisineMealType varchar(100)
   , ImageLink varchar(200)
   , CookingEffort varchar(20)
   , ExternalRecipeRating varchar(100)
   , SearchParam varchar(100)
   , UserRating smallint
   , LikeDislike bit
   , CreatedOn datetime 
   , UpdatedOn datetime
)

create table dbo.RecipeIngredients
(
	RecipeIngredientsLinkID int NOT NULL IDENTITY(1,1) PRIMARY KEY 
   , RecipeId int foreign key references Recipe(RecipeId) NOT NULL
   , Ingredient varchar(100)
)

create table dbo.AllRecipeIngredients
(
	AllRecipeIngredientsID int NOT NULL IDENTITY(1,1) PRIMARY KEY 
   , RecipeId int foreign key references Recipe(RecipeId) NOT NULL
   , Ingredient varchar(500)  -- coma sepearted ingredient list
)

create table dbo.AppUser
(
	UserId int NOT NULL IDENTiTY(1,1) PRIMARY KEY
   , FullName varchar(200)
   , UserName varchar(200)
   , UserPass varchar(20)
   , VerifiedPin varchar(10)
 )

 CREATE TABLE dbo.OptionsAndPreferences
 (
	PreferenceId int NOT NULL IDENTITY(1,1) PRIMARY KEY
   , OptionName varchar(200) 
)
 Drop TABLE dbo.OptionsValue
 CREATE TABLE dbo.OptionsValue
 (
	PreferenceLinkId int NOT NULL IDENTITY(1,1) PRIMARY KEY
   , PreferenceId int FOREIGN Key references OptionsAndPreferences(PreferenceId) 
   , OptionValue varchar(100)
   , IsFreeText bit
)

CREATE TABle dbo.UserPreferences
(
	UserPrefId int NOT NULL IDENTITY(1,1) PRIMARY KEY
	, UserId int foreign key references AppUser(UserId)
	, ChosenOptionId int foreign key references OptionsValue(PreferenceLinkId)
	, FreeTextValue varchar(100)
)

CREATE TABLE RecipesUserLink
(
	RecipeUserLinkId int NOT NULL IDENTITY(1,1) PRIMARY KEY
   , RecipeId int foreign key references Recipe(RecipeId)
   , UserId int foreign key references AppUser(UserId)
)

CREATE TABLE dbo.RecipesSimilarityIndex
(
  RecipeSimilarityIndexId int not null identity(1,1) primary key
  , RecipeA int foreign key references Recipe(RecipeId)
  , RecipeB int foreign key references Recipe(RecipeId)
  , SimiIndiValue float 
)

CREATE TABLE dbo.UsersSimilarityIndex
(
  UserSimilarityIndexId int not null identity(1,1) primary key
  , UserA int foreign key references AppUser(UserId)
  , UserB int foreign key references AppUser(UserId)
  , SimiIndiValue float 
)

drop table dbo.RecipesforUsersPreference
create table dbo.RecipesforUsersPreference
(
  RecipePrefId bigInt identity(1,1) primary key not null
  , RecipeId int foreign key references Recipe(RecipeId)
  , UserId int foreign key references AppUser(UserId)
)
