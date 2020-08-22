USE [Inzynier]
GO
create or alter trigger TDgminaRelacja
on Gmina
after delete
as
begin
	delete gminaRelacja 
	from gminaRelacja gr
	inner join deleted d 
	on gr.IDGmina_New = d.ID and gr.Start_Date_New = d.StartDate
	or gr.IDGmina_Old = d.ID and gr.Start_Date_Old = d.StartDate
end