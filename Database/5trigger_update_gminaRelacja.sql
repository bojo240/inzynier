create or alter trigger TUgminaRelacja
on Gmina
after update
as
DECLARE @rowc int
begin
	SELECT @rowc = COUNT(*) FROM inserted
	IF @rowc > 1
	BEGIN
	   ROLLBACK TRANSACTION
	   RAISERROR ('Multi-row updates not permitted', 16, 1)
	   RETURN
	END
	ELSE IF @rowc = 0
		RETURN
	UPDATE gminaRelacja 
	SET IDGmina_New = (select id from inserted), Start_Date_New = (select startDate from inserted)
	where IDGmina_New = (select id from deleted) and Start_Date_New = (select startDate from deleted)
	UPDATE gminaRelacja 
	SET IDGmina_Old = (select id from inserted), Start_Date_Old = (select startDate from inserted)
	where IDGmina_Old = (select id from deleted) and Start_Date_Old = (select startDate from deleted)
end


