create or alter view PowiatRelacje as 
select p.ID as Powiat_ID, p.Nazwa as Powiat_Nazwa, p.StartDate as Powiat_StartDate, p.EndDate as 
Powiat_EndDate, g.Rodzaj as RodzajJednostki, g.ID as IDJednostki, g.Nazwa as NazwaJednostki, g.StartDate as 
StartDateJednostki, g.EndDate as EndDateJednostki, gp.StartDate, gp.EndDate
from powiat p
join gminapowiat gp on p.ID = gp.IDPowiat and p.StartDate = gp.StartDatePowiat
join gmina g on g.id = gp.IDGmina and g.StartDate = gp.StartDateGmina
union
select p.ID as Powiat_ID, p.Nazwa as Powiat_Nazwa, p.StartDate as Powiat_StartDate, p.EndDate as 
Powiat_EndDate, w.Rodzaj as RodzajJednostki, w.ID as IDJednostki, w.Nazwa as NazwaJednostki, w.StartDate as 
StartDateJednostki, w.EndDate as EndDateJednostki, pw.StartDate, pw.EndDate
from powiat p
join powiatwojewodztwo pw on p.ID = pw.IDPowiat and p.StartDate = pw.StartDatePowiat
join Wojewodztwo w on w.id = pw.IDWojewodztwo and w.StartDate = pw.StartDateWojewodztwo;