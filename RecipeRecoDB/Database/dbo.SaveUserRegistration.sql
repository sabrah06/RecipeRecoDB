create procedure dbo.SaveUserRegistration(
	@FullName varchar(200)
	, @UserName varchar(200)
	, @pass varchar(200)
	, @E_mail varchar(200)
	, @UserId int OUTPUT
)
AS
BEGIN
	if not exists (select 1 from dbo.AppUser where E_mail = @E_mail)
	BEGIN
		insert into dbo.AppUser(FullName, UserName, UserPass, E_mail)
		values (@FullName, @UserName, @pass, @E_mail)
		SET @UserId = SCOPE_IDENTITY()
	END
	ELSE
	BEGIN
		UPDATE dbo.AppUser
		SET FullName = @FullName
		, UserName = @UserName
		, UserPass = @pass
		where E_mail = @E_mail

		SELECT @UserId = userid from dbo.AppUser where E_mail = @E_mail
	END
END