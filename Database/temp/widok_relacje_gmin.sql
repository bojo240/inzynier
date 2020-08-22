create or alter view GminaRelacje as 
select g.ID as Gmina_ID, g.Nazwa as Gmina_Nazwa, g.StartDate as Gmina_StartDate, g.EndDate as Gmina_EndDate, 
p.Rodzaj as RodzajJednostki, p.ID as IDJednostki, p.Nazwa as NazwaJednostki, p.StartDate as 
StartDateJednostki, p.EndDate as EndDateJednostki, gp.StartDate, gp.EndDate
from gmina g 
join gminapowiat gp on g.ID = gp.IDGmina and g.StartDate = gp.StartDateGmina 
join powiat p on p.id = gp.IDPowiat and p.StartDate = gp.StartDatePowiat 
union
select g.ID as Gmina_ID, g.Nazwa as Gmina_Nazwa, g.StartDate as Gmina_StartDate, g.EndDate as Gmina_EndDate, 
w.Rodzaj as RodzajJednostki, w.ID as IDJednostki, w.Nazwa as NazwaJednostki, w.StartDate as 
StartDateJednostki, w.EndDate as EndDateJednostki, gw.StartDate, gw.EndDate
from gmina g 
join gminawojewodztwo gw on g.ID = gw.IDGmina and g.StartDate = gw.StartDateGmina 
join Wojewodztwo w on w.id = gw.IDWojewodztwo and w.StartDate = gw.StartDateWojewodztwo;

