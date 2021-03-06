USE [RecipeReco]
GO
/****** Object:  StoredProcedure [dbo].[SaveUserPreference]    Script Date: 23/07/2017 21:51:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[SaveUserPreference](
	@UserId int
	, @ChosenOption varchar(100)
	, @OptionValue varchar(200)
	, @UserPrefId int OUTPUT
)
AS BEGIN

insert into dbo.UserPreferences(UserId, ChosenOption, OptionValue)
select @UserId, @ChosenOption, @OptionValue

set @UserPrefId = scope_identity()

END