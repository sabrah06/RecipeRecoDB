USE [RecipeReco]
GO
/****** Object:  StoredProcedure [dbo].[SaveRecipeSimilarities]    Script Date: 16/08/2017 06:40:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[SaveRecipeSimilarities]
(
	  @RecipeA_Id int
	, @RecipeB_Id int
	, @ExternalRecipeA_id varchar(20)
	, @ExternalRecipeB_Id varchar(20)
	, @SimiIndiValue float
)

AS
BEGIN
	declare @cusineMatch bit
	select @cusineMatch = 1 from dbo.Recipe 
		where RecipeId = @RecipeA_Id
		and exists (select CuisineMealType from dbo.recipe where Recipeid = @RecipeB_Id) 

	set @cusineMatch = isnull(@cusineMatch, 0)
	if not exists (select 1 from dbo.RecipesSimilarityIndex where RecipeA = @RecipeA_Id and RecipeB = @RecipeB_Id)
	BEGIN
		insert into dbo.RecipesSimilarityIndex (RecipeA, RecipeB, ExternalRecipeAid, ExternalRecipeBid, SimiIndiValue, CuisineMatch)
		values (@RecipeA_Id, @RecipeB_Id, @ExternalRecipeA_id, @ExternalRecipeB_Id, @SimiIndiValue, @cusineMatch)
	END
	ELSE
	BEGIN
		update dbo.RecipesSimilarityIndex 
		set SimiIndiValue = @SimiIndiValue
		where RecipeA = @RecipeA_Id and RecipeB = @RecipeB_Id
	END
END