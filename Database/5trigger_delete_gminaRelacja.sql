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
	on gr.IDGmina_2 = d.ID and gr.Start_Date_2 = d.StartDate
	or gr.IDGmina_1 = d.ID and gr.Start_Date_1 = d.StartDate
end