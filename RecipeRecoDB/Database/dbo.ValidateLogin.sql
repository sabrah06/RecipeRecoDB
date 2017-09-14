USE [RecipeReco]
GO
/****** Object:  StoredProcedure [dbo].[ValidateLogin]    Script Date: 16/08/2017 22:04:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[ValidateLogin]
(
	@Username varchar(20)
	, @pass varchar(20)
	, @Verifiedpin varchar(20)
)
AS
BEGIN

declare @FullName varchar(200)
, @userId int

select @FullName = FullName, @userId = UserId from  dbo.AppUser 
where UserName = @Username
and UserPass = @pass
and VerifiedPin = @Verifiedpin


SET @FullName =isnull(@FullName, '')

SELECT @FullName 'FullName', @userId 'UserId'

END