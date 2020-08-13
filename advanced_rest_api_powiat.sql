select p.ID as IDPowiatu, p.Nazwa as NazwaPowiatu, p.StartDate as StartDatePowiatu, p.EndDate as EndDatePowiatu, g.Rodzaj as RodzajJednostki, g.ID as IDJednostki, g.Nazwa as NazwaJednostki, g.StartDate as StartDateJednostki, g.EndDate as EndDateJednostki, gp.StartDate as StartDateRelacji, gp.EndDate as EndDateRelacji
from powiat p
join gminapowiat gp on p.ID = gp.IDPowiat and p.StartDate = gp.StartDatePowiat
join gmina g on g.id = gp.IDGmina and g.StartDate = gp.StartDateGmina
where p.id = 1 --and '2020-01-01' between g.startdate and g.enddate
union
select p.ID as IDPowiatu, p.Nazwa as NazwaPowiatu, p.StartDate as StartDatePowiatu, p.EndDate as EndDatePowiatu, w.Rodzaj as RodzajJednostki, w.ID as IDJednostki, w.Nazwa as NazwaJednostki, w.StartDate as StartDateJednostki, w.EndDate as EndDateJednostki, pw.StartDate as StartDateRelacji, pw.EndDate as EndDateRelacji
from powiat p
join powiatwojewodztwo pw on p.ID = pw.IDPowiat and p.StartDate = pw.StartDatePowiat
join Wojewodztwo w on w.id = pw.IDWojewodztwo and w.StartDate = pw.StartDateWojewodztwo
where p.id = 1 --and '2020-01-01' between g.startdate and g.enddate
order by StartDateRelacji;

