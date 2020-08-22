create or alter view GminaGmina as
select 
g.id as IDGmina1, g.nazwa as Nazwa1, g.Rodzaj as Rodzaj1, g.StartDate as StartDate1, g.Opis as Opis1,
g2.id as IDGmina2, g2.nazwa as Nazwa2, g2.Rodzaj as Rodzaj2, g2.StartDate as StartDate2, g2.Opis as Opis2,
gr.StartDate, gr.EndDate, gr.Typ
from GminaRelacja gr
join gmina g on g.ID = gr.IDGmina_Old and g.StartDate = gr.Start_Date_Old
join gmina g2 on g2.ID = gr.IDGmina_New and g2.StartDate = gr.Start_Date_New;
 