create or alter view WojewodztwoRelacje as 
select w.ID as Wojewodztwo_ID, w.Nazwa as Wojewodztwo_Nazwa, w.StartDate as Wojewodztwo_StartDate, w.EndDate 
as Wojewodztwo_EndDate, g.Rodzaj as RodzajJednostki, g.ID as IDJednostki, g.Nazwa as NazwaJednostki, 
g.StartDate as StartDateJednostki, g.EndDate as EndDateJednostki, gw.StartDate, gw.EndDate
from wojewodztwo w
join GminaWojewodztwo gw on w.ID = gw.IDWojewodztwo and w.StartDate = gw.StartDateWojewodztwo
join gmina g on g.id = gw.IDGmina and g.StartDate = gw.StartDateGmina
union
select w.ID as Wojewodztwo_ID, w.Nazwa as Wojewodztwo_Nazwa, w.StartDate as Wojewodztwo_StartDate, w.EndDate 
as Wojewodztwo_EndDate, p.Rodzaj as RodzajJednostki, p.ID as IDJednostki, p.Nazwa as NazwaJednostki, 
p.StartDate as StartDateJednostki, p.EndDate as EndDateJednostki, pw.StartDate, pw.EndDate
from wojewodztwo w
join PowiatWojewodztwo pw on w.ID = pw.IDWojewodztwo and w.StartDate = pw.StartDateWojewodztwo
join powiat p on p.id = pw.IDPowiat and p.StartDate = pw.StartDatePowiat;