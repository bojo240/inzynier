create or alter view Zawartosc_wojewodztw as 
select w.ID as IDWojewodztwa, w.Nazwa as NazwaWojewodztwa, w.StartDate as StartDateWojewodztwa, w.EndDate 
as EndDateWojewodztwa, g.Rodzaj as RodzajJednostki, g.ID as IDJednostki, g.Nazwa as NazwaJednostki, 
g.StartDate as StartDateJednostki, g.EndDate as EndDateJednostki, gw.StartDate as StartDateRelacji, gw.EndDate 
as EndDateRelacji
from wojewodztwo w
join GminaWojewodztwo gw on w.ID = gw.IDWojewodztwo and w.StartDate = gw.StartDateWojewodztwo
join gmina g on g.id = gw.IDGmina and g.StartDate = gw.StartDateGmina
union
select w.ID as IDWojewodztwa, w.Nazwa as NazwaWojewodztwa, w.StartDate as StartDateWojewodztwa, w.EndDate as  
EndDateWojewodztwa, p.Rodzaj as RodzajJednostki, p.ID as IDJednostki, p.Nazwa as NazwaJednostki, 
p.StartDate as StartDateJednostki, p.EndDate as EndDateJednostki, pw.StartDate as StartDateRelacji, 
pw.EndDate as  EndDateRelacji
from wojewodztwo w
join PowiatWojewodztwo pw on w.ID = pw.IDWojewodztwo and w.StartDate = pw.StartDateWojewodztwo
join powiat p on p.id = pw.IDPowiat and p.StartDate = pw.StartDatePowiat;