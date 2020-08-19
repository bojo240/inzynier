select g.ID as IDGminy, g.Nazwa as NazwaGminy, g.StartDate as StartDateGminy, g.EndDate as EndDateGminy, p.Rodzaj as RodzajJednostki, p.ID as IDJednostki, p.Nazwa as NazwaJednostki, p.StartDate as StartDateJednostki, p.EndDate as EndDateJednostki, gp.StartDate as StartDateRelacji, gp.EndDate as EndDateRelacji
from gmina g
join gminapowiat gp on g.ID = gp.IDGmina and g.StartDate = gp.StartDateGmina
join powiat p on p.id = gp.IDPowiat and p.StartDate = gp.StartDatePowiat
where g.id = 1 --and '2020-01-01' between g.startdate and g.enddate
union
select g.ID as IDGminy, g.Nazwa as NazwaGminy, g.StartDate as StartDateGminy, g.EndDate as EndDateGminy, w.Rodzaj as RodzajJednostki, w.ID as IDJednostki, w.Nazwa as NazwaJednostki, w.StartDate as StartDateJednostki, w.EndDate as EndDateJednostki, gw.StartDate as StartDateRelacji, gw.EndDate as EndDateRelacji
from gmina g
join gminawojewodztwo gw on g.ID = gw.IDGmina and g.StartDate = gw.StartDateGmina
join Wojewodztwo w on w.id = gw.IDWojewodztwo and w.StartDate = gw.StartDateWojewodztwo
where g.id = 1 and '2020-01-01' between g.startdate and g.enddate
order by StartDateRelacji;

