delete from Wojewodztwo;
delete from Gmina;
delete from GminaWojewodztwo;
delete from GminaRelacja;
delete from Powiat;
delete from GminaPowiat;
delete from PowiatWojewodztwo;

-- Wojewodztwa 1975-1998

insert into Wojewodztwo(ID, Nazwa, Rodzaj, StartDate, EndDate, StartDateVerified, EndDateVerified, CzyDataPowstania, Opis)
values (1,'Bielskie', 'Województwo', '1975-06-01', '1998-12-31', 1, 1, 1, null);

-- Gminy Miejskie 1975-1998

insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (1, 'Bielsko-Bia³a', 'Gmina Miejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (2, 'Andrychów', 'Gmina Miejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (3, 'Che³mek', 'Gmina Miejska', '1900-01-01', '1991-12-31', 1, 1, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (4, 'Cieszyn', 'Gmina Miejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (5, 'Kalwaria Zebrzydowska', 'Gmina Miejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (6, 'Kêty', 'Gmina Miejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (7, 'Maków Podhalañski', 'Gmina Miejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (8, 'Oœwiêcim', 'Gmina Miejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (9, 'Skoczów', 'Gmina Miejska', '1900-01-01', '1991-12-31', 1, 1, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (10, 'Strumieñ', 'Gmina Miejska', '1900-01-01', '1991-12-31', 1, 1, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (11, 'Sucha Beskidzka', 'Gmina Miejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (12, 'Szczyrk', 'Gmina Miejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (13, 'Ustroñ', 'Gmina Miejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (14, 'Wadowice', 'Gmina Miejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (15, 'Wilamowice', 'Gmina Miejska', '1900-01-01', '1991-12-31', 1, 1, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (16, 'Wis³a', 'Gmina Miejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (17, 'Zator', 'Gmina Miejska', '1900-01-01', '1991-12-31', 1, 1, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (18, '¯ywiec', 'Gmina Miejska', '1900-01-01', '1998-12-31', 0, 0, 0);

-- Gminy Wiejskie 1975-1998

insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (19, 'Andrychów', 'Gmina Wiejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (20, 'Brenna', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (21, 'Brody', 'Gmina Wiejska', '1900-01-01', '1976-07-01', 0, 1, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (22, 'BrzeŸnica', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (23, 'Buczkowice', 'Gmina Wiejska', '1900-01-01', '1976-07-01', 0, 1, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (23, 'Buczkowice', 'Gmina Wiejska', '1990-04-01', '1998-12-31', 1, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (24, 'Budzów', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (25, 'Che³mek', 'Gmina Wiejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (26, 'Chybie', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (27, 'Czernichów', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (28, 'Dêbowiec', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (29, 'Gilowice', 'Gmina Wiejska', '1900-01-01', '1976-07-01', 0, 1, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (29, 'Gilowice', 'Gmina Wiejska', '1991-04-01', '1998-12-31', 1, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (30, 'Gilowice-Œlemieñ', 'Gmina Wiejska', '1976-07-02', '1991-04-01', 1, 1, 1);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (31, 'Goleszów', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (32, 'Ha¿lach', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (33, 'Istebna', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (34, 'Jasienica', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (35, 'Jaworze', 'Gmina Wiejska', '1991-04-02', '1998-12-31', 1, 0, 1);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (36, 'Jeleœnia', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (37, 'Kalwaria Zebrzydowska', 'Gmina Wiejska', '1976-07-02', '1991-12-31', 1, 1, 1);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (38, 'Kêty', 'Gmina Wiejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (39, 'Komorowice', 'Gmina Wiejska', '1900-01-01', '1976-12-31', 0, 1, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (40, 'Koszarawa', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (41, 'Kozy', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (42, 'Lanckorona', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (43, 'Lipowa', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (44, '£êkawica', 'Gmina Wiejska', '1900-01-01', '1976-07-01', 0, 1, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (44, '£êkawica', 'Gmina Wiejska', '1991-04-02', '1998-12-31', 1, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (45, '£odygowice', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (46, 'Maków Podhalañski', 'Gmina Wiejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (47, 'Milówka', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (48, 'Mucharz', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (49, 'Osiek', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (50, 'Oœwiêcim', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (51, 'Polanka Wielka', 'Gmina Wiejska', '1976-07-02', '1998-12-31', 1, 0, 1);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (52, 'Por¹bka', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (53, 'Przeciszów', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (54, 'Radziechowy-Wieprz', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (55, 'Rajcza', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (56, 'Skoczów', 'Gmina Wiejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (57, 'Spytkowice', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (58, 'Stare Bielsko', 'Gmina Wiejska', '1900-01-01', '1976-12-31', 0, 1, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (59, 'Strumieñ', 'Gmina Wiejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (60, 'Stryszawa', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (61, 'Stryszów', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (62, 'Szczyrk', 'Gmina Wiejska', '1976-07-02', '1990-03-31', 1, 1, 1);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (63, 'Œlemieñ', 'Gmina Wiejska', '1900-01-01', '1976-04-01', 0, 1, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (63, 'Œlemieñ', 'Gmina Wiejska', '1991-04-02', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (64, 'Œwinna', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (65, 'Tomice', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (66, 'Ujso³y', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (67, 'Wadowice', 'Gmina Wiejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (68, 'Wapienica', 'Gmina Wiejska', '1900-01-01', '1976-12-31', 0, 1, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (69, 'Wêgierska Górka', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (70, 'Wieprz', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (71, 'Wilamowice', 'Gmina Wiejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (72, 'Wilkowice', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (73, 'Zator', 'Gmina Wiejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (74, 'Zawoja', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (75, 'Zembrzyce', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 0, 0);

-- Gminy Miejsko - Wiejskie 1975-1998

insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (76, 'Andrychów', 'Gmina Miejsko-Wiejska', '1992-01-01', '1998-12-31', 1, 1, 1);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (77, 'Che³mek', 'Gmina Miejsko-Wiejska', '1992-01-01', '1998-12-31', 1, 1, 1);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (78, 'Kalwaria Zebrzydowska', 'Gmina Miejsko-Wiejska', '1992-01-01', '1998-12-31', 1, 1, 1);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (79, 'Kêty', 'Gmina Miejsko-Wiejska', '1992-01-01', '1998-12-31', 1, 1, 1);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (80, 'Maków Podhalañski', 'Gmina Miejsko-Wiejska', '1992-01-01', '1998-12-31', 1, 1, 1);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (81, 'Skoczów', 'Gmina Miejsko-Wiejska', '1992-01-01', '1998-12-31', 1, 1, 1);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (82, 'Strumieñ', 'Gmina Miejsko-Wiejska', '1992-01-01', '1998-12-31', 1, 1, 1);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (83, 'Wadowice', 'Gmina Miejsko-Wiejska', '1992-01-01', '1998-12-31', 1, 1, 1);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (84, 'Wilamowice', 'Gmina Miejsko-Wiejska', '1992-01-01', '1998-12-31', 1, 1, 1);
insert into gmina(id, nazwa, rodzaj, startDate, enddate, StartDateVerified, EndDateVerified, CzyDataPowstania)
values (85, 'Zator', 'Gmina Miejsko-Wiejska', '1992-01-01', '1998-12-31', 1, 1, 1);

-- Relacje Gmina -> Wojewodztwo 1975-1998

merge into gminawojewodztwo gw 
using (	Select g.enddate, g.ID as IDGminy, g.startDate as StartDateGminy, g.startDateVerified, g.endDateVerified, w.ID as IDwojewodztwa, w.startDate as startDateWojewodztwa 
		from gmina g, wojewodztwo w) g on g.idGminy=gw.idGmina
when not matched then 
insert (IDGmina, StartDateGmina, IDWojewodztwo, StartDateWojewodztwo, StartDate, EndDate, StartDateVerified, EndDateVerified, Opis)
values (g.IDGminy, g.StartDateGminy, g.IDWojewodztwa, g.StartDateWojewodztwa, case when g.StartDateGminy = '1900-01-01' then '1975-06-01' else g.StartDateGminy end, g.endDate, g.StartDateVerified, g.endDateVerified, null);

-- Relacje Gmina -> Gmina 1975-1998

insert into GminaRelacja values (21, '1900-01-01', 37, '1976-07-02','1976-07-02', '1998-12-31', '2 lipca 1976 roku siedziba gminy zosta³a przeniesiona z Brodów do miasta Kalwaria Zebrzydowska, z jednoczesn¹ zmian¹ nazwy gminy na gmina Kalwaria Zebrzydowska');
insert into GminaRelacja values (29, '1900-01-01', 30, '1976-07-02', '1976-07-02', '01-04-1991', '2 lipca 1976 r. gmina Gilowice-Œlemieñ utworzona przez po³¹czenie gmin Gilowice i Œlemieñ oraz do³¹czenie zniesionej gminy £êkawica (a wiêc w praktyce utworzona z trzech zniesionych gmin)');
insert into GminaRelacja values (44, '1900-01-01', 30, '1976-07-02', '1976-07-02', '01-04-1991', '2 lipca 1976 r. gmina Gilowice-Œlemieñ utworzona przez po³¹czenie gmin Gilowice i Œlemieñ oraz do³¹czenie zniesionej gminy £êkawica (a wiêc w praktyce utworzona z trzech zniesionych gmin)');
insert into GminaRelacja values (63, '1900-01-01', 30, '1976-07-02', '1976-07-02', '01-04-1991', '2 lipca 1976 r. gmina Gilowice-Œlemieñ utworzona przez po³¹czenie gmin Gilowice i Œlemieñ oraz do³¹czenie zniesionej gminy £êkawica (a wiêc w praktyce utworzona z trzech zniesionych gmin)');
insert into GminaRelacja values (30, '1976-07-02', 29, '1991-04-01', '1991-02-04', '1998-12-31', '2 kwietnia 1991 gmina Gilowice-Œlemieñ zosta³a zlikwidowana, a z jej obszaru odtworzono dawne gminy Gilowice, Œlemieñ i £êkawica sprzed komasacji. Jedynie wieœ Oczków ze znoszonej gminy przy³¹czono do ¯ywca');
insert into GminaRelacja values (30, '1976-07-02', 44, '1900-01-01', '1991-02-04', '1998-12-31', '2 kwietnia 1991 gmina Gilowice-Œlemieñ zosta³a zlikwidowana, a z jej obszaru odtworzono dawne gminy Gilowice, Œlemieñ i £êkawica sprzed komasacji. Jedynie wieœ Oczków ze znoszonej gminy przy³¹czono do ¯ywca');
insert into GminaRelacja values (30, '1976-07-02', 63, '1900-01-01', '1991-02-04', '1998-12-31', '2 kwietnia 1991 gmina Gilowice-Œlemieñ zosta³a zlikwidowana, a z jej obszaru odtworzono dawne gminy Gilowice, Œlemieñ i £êkawica sprzed komasacji. Jedynie wieœ Oczków ze znoszonej gminy przy³¹czono do ¯ywca');
insert into GminaRelacja values (39, '1900-01-01', 1, '1900-01-01', '1977-01-01', '1998-12-31', '1 stycznia 1977 roku jednostka zosta³a zniesiona przez w³¹czenie jej terenów do miasta Bielska-Bia³ej');
insert into GminaRelacja values (58, '1900-01-01', 1, '1900-01-01', '1977-01-01', '1998-12-31', '1 stycznia 1977 roku gmina zosta³a zniesiona przez w³¹czenie so³ectwa Stare Bielsko do miasta Bielsko-Bia³a');
insert into GminaRelacja values (68, '1900-01-01', 1, '1900-01-01', '1977-01-01', '1998-12-31', '1 stycznia 1977 roku zosta³a zniesiona przez w³¹czenie so³ectwa Wapienica do miasta Bielsko-Bia³a');
insert into GminaRelacja values (23, '1900-01-01', 62, '1976-07-02', '1976-07-02','1990-04-01', '2 lipca 1976 siedziba gminy zosta³a przeniesiona do Szczyrku, z jednoczesn¹ zmian¹ nazwy gminy na gmina Szczyrk');
insert into GminaRelacja values (62, '1976-07-02', 23, '1900-01-01', '1990-04-01','1998-12-31', '1 kwietnia 1990 siedziba gminy zosta³a przeniesiona z powrotem do Buczkowic, z jednoczesn¹ zmian¹ nazwy gminy na gmina Buczkowice');

-- Wojewodztwa 1999+

insert into Wojewodztwo(ID, Nazwa, Rodzaj, StartDate, EndDate, StartDateVerified, EndDateVerified, CzyDataPowstania, Opis)
values (2,'Œl¹skie', 'Województwo', '1999-01-01', '9999-12-31', 1, 0, 1, null);
insert into Wojewodztwo(ID, Nazwa, Rodzaj, StartDate, EndDate, StartDateVerified, EndDateVerified, CzyDataPowstania, Opis)
values (3,'Ma³opolskie', 'Województwo', '1999-01-01', '9999-12-31', 1, 0, 1, null);

-- Powiaty 1999+

insert into Powiat values (1,'Bielski', 'Powiat', '1999-01-01', '9999-12-31', 1, 0, 1, null);
insert into Powiat values (2,'Cieszyñski', 'Powiat', '1999-01-01', '9999-12-31', 1, 0, 1, null);
insert into Powiat values (3,'¯ywiecki', 'Powiat', '1999-01-01', '9999-12-31', 1, 0, 1, null);
insert into Powiat values (4,'Oœwiêcimski', 'Powiat', '1999-01-01', '9999-12-31', 1, 0, 1, null);
insert into Powiat values (5,'Suski', 'Powiat', '1999-01-01', '9999-12-31', 1, 0, 1, null);
insert into Powiat values (6,'Wadowicki', 'Powiat', '1999-01-01', '9999-12-31', 1, 0, 1, null);

-- Relacje Powiat -> Wojewodztwo 1999+

insert into PowiatWojewodztwo values (1, '1999-01-01', 2, '1999-01-01','1999-01-01', '9999-12-31', 1, 1, null);
insert into PowiatWojewodztwo values (2, '1999-01-01', 2, '1999-01-01','1999-01-01', '9999-12-31', 1, 1, null);
insert into PowiatWojewodztwo values (3, '1999-01-01', 2, '1999-01-01','1999-01-01', '9999-12-31', 1, 1, null);
insert into PowiatWojewodztwo values (4, '1999-01-01', 3, '1999-01-01','1999-01-01', '9999-12-31', 1, 1, null);
insert into PowiatWojewodztwo values (5, '1999-01-01', 3, '1999-01-01','1999-01-01', '9999-12-31', 1, 1, null);
insert into PowiatWojewodztwo values (6, '1999-01-01', 3, '1999-01-01','1999-01-01', '9999-12-31', 1, 1, null);

-- Gminy 1999+

update Gmina
set EndDate = '9999-12-31', 
	EndDateVerified = 0
where 
	EndDate = '1998-12-31';

-- Relacje Gmina -> Powiat 1999

merge into GminaPowiat gp
using (	Select g.ID as IDGminy, g.StartDate, p.ID
		from gmina g
		join powiat p on p.nazwa = 'Bielski'
		where g.nazwa in ('Szczyrk', 'Wilamowice', 'Buczkowice', 'Jasienica', 'Jaworze', 'Kozy', 'Por¹bka', 'Wilkowice') 
		and g.endDate = '9999-12-31'
		) p on p.ID = gp.IDPowiat
when not matched then 
insert (IDGmina, StartDateGmina, IDPowiat, StartDatePowiat, StartDate, EndDate, StartDateVerified, EndDateVerified, Opis)
values (p.IDGminy, p.StartDate, p.ID, '1999-01-01', '1999-01-01', '9999-12-31', 1, 0, null);

merge into GminaPowiat gp
using (	Select g.ID as IDGminy, g.StartDate, p.ID
		from gmina g
		join powiat p on p.nazwa = 'Cieszyñski'
		where g.nazwa in ('Cieszyn', 'Ustroñ', 'Wis³a', 'Skoczów', 'Strumieñ', 'Brenna', 'Chybie', 'Dêbowiec', 'Goleszów', 'Ha¿lach', 'Istebna') 
		and g.endDate = '9999-12-31'
		) p on p.ID = gp.IDPowiat
when not matched then 
insert (IDGmina, StartDateGmina, IDPowiat, StartDatePowiat, StartDate, EndDate, StartDateVerified, EndDateVerified, Opis)
values (p.IDGminy, p.StartDate, p.ID, '1999-01-01', '1999-01-01', '9999-12-31', 1, 0, null);

merge into GminaPowiat gp
using (	Select g.ID as IDGminy, g.StartDate, p.ID
		from gmina g
		join powiat p on p.nazwa = '¯ywiecki'
		where g.nazwa in ('¯ywiec', 'Czernichów', 'Gilowice', 'Jeleœnia', 'Koszarawa', 'Lipowa', '£êkawica', '£odygowice', 'Milówka', 'Radziechowy-Wieprz', 'Rajcza', 'Œlemieñ', 'Œwinna', 'Ujso³y', 'Wêgierska Górka')
		and g.endDate = '9999-12-31'
		) p on p.ID = gp.IDPowiat
when not matched then 
insert (IDGmina, StartDateGmina, IDPowiat, StartDatePowiat, StartDate, EndDate, StartDateVerified, EndDateVerified, Opis)
values (p.IDGminy, p.StartDate, p.ID, '1999-01-01', '1999-01-01', '9999-12-31', 1, 0, null);

merge into GminaPowiat gp
using (	Select g.ID as IDGminy, g.StartDate, p.ID
		from gmina g
		join powiat p on p.nazwa = 'Oœwiêcimski'
		where g.nazwa in ('Oœwiêcim', 'Che³mek', 'Kêty', 'Zator', 'Osiek', 'Oœwiêcim', 'Polanka Wielka', 'Przeciszów')
		and g.endDate = '9999-12-31'
		) p on p.ID = gp.IDPowiat
when not matched then 
insert (IDGmina, StartDateGmina, IDPowiat, StartDatePowiat, StartDate, EndDate, StartDateVerified, EndDateVerified, Opis)
values (p.IDGminy, p.StartDate, p.ID, '1999-01-01', '1999-01-01', '9999-12-31', 1, 0, null);

merge into GminaPowiat gp
using (	Select g.ID as IDGminy, g.StartDate, p.ID
		from gmina g
		join powiat p on p.nazwa = 'Suski'
		where g.nazwa in ('Sucha Beskidzka', 'Maków Podhalañski', 'Budzów', 'Stryszawa', 'Zawoja', 'Zembrzyce')
		and g.endDate = '9999-12-31'
		) p on p.ID = gp.IDPowiat
when not matched then 
insert (IDGmina, StartDateGmina, IDPowiat, StartDatePowiat, StartDate, EndDate, StartDateVerified, EndDateVerified, Opis)
values (p.IDGminy, p.StartDate, p.ID, '1999-01-01', '1999-01-01', '9999-12-31', 1, 0, null);

merge into GminaPowiat gp
using (	Select g.ID as IDGminy, g.StartDate, p.ID
		from gmina g
		join powiat p on p.nazwa = 'Wadowicki'
		where g.nazwa in ('Andrychów', 'Kalwaria Zebrzydowska', 'Wadowice', 'BrzeŸnica', 'Lanckorona', 'Mucharz', 'Spytkowice', 'Stryszów', 'Tomice', 'Wieprz')
		and g.endDate = '9999-12-31'
		) p on p.ID = gp.IDPowiat
when not matched then 
insert (IDGmina, StartDateGmina, IDPowiat, StartDatePowiat, StartDate, EndDate, StartDateVerified, EndDateVerified, Opis)
values (p.IDGminy, p.StartDate, p.ID, '1999-01-01', '1999-01-01', '9999-12-31', 1, 0, null);


select * from wojewodztwo;
select * from gmina;
select * from GminaWojewodztwo;
select * from GminaRelacja;
select * from Powiat;
select * from PowiatWojewodztwo;
select * from gminaPowiat;