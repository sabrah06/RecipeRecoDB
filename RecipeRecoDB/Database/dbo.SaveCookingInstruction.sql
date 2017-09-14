CREATE PROCEDURE dbo.SaveCookingInstruction
(
	@RecipeId int,
    @CookingInst1 varchar(500),
	@CookingInst2 varchar(500),
	@CookingInst3 varchar(500),
	@CookingInst4 varchar(500),
	@CookingInst5 varchar(500)
)
AS
BEGIN

	INSERT INTO dbo.CookingInstruction (RecipeId, CookingInstruction1, CookingInstruction2
	, CookingInstruction3, CookingInstruction4, CookingInstruction5)
	values(@RecipeId, @CookingInst1, @CookingInst2, @CookingInst3, @CookingInst4, @CookingInst5)

END  