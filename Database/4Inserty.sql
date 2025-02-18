USE [Inzynier]
GO

DISABLE Trigger ALL ON ALL SERVER;  

--SET IDENTITY_INSERT Gmina ON;
--SET IDENTITY_INSERT Powiat ON;
--SET IDENTITY_INSERT Wojewodztwo ON;

delete from Wojewodztwo;
delete from Gmina;
delete from GminaWojewodztwo;
delete from GminaRelacja;
delete from Powiat;
delete from GminaPowiat;
delete from PowiatWojewodztwo;

-- Wojewodztwa 1975-1998

insert into Wojewodztwo(ID, Name, Type, StartDate, EndDate, StartDateVerified, EndDateVerified, IsCreationDate, Description)
values (1,'Bielskie', 'Wojew�dztwo', '1975-06-01', '1998-12-31', 1, 1, 1, null);

-- Gminy Miejskie 1975-1998

insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (1, 'Bielsko-Bia�a', 'Gmina Miejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (2, 'Andrych�w', 'Gmina Miejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (3, 'Che�mek', 'Gmina Miejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (4, 'Cieszyn', 'Gmina Miejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (5, 'Kalwaria Zebrzydowska', 'Gmina Miejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (6, 'K�ty', 'Gmina Miejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (7, 'Mak�w Podhala�ski', 'Gmina Miejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (8, 'O�wi�cim', 'Gmina Miejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (9, 'Skocz�w', 'Gmina Miejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (10, 'Strumie�', 'Gmina Miejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (11, 'Sucha Beskidzka', 'Gmina Miejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (12, 'Szczyrk', 'Gmina Miejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (13, 'Ustro�', 'Gmina Miejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (14, 'Wadowice', 'Gmina Miejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (15, 'Wilamowice', 'Gmina Miejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (16, 'Wis�a', 'Gmina Miejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (17, 'Zator', 'Gmina Miejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (18, '�ywiec', 'Gmina Miejska', '1900-01-01', '1998-12-31', 0, 1, 0);

-- Gminy Wiejskie 1975-1998

insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (19, 'Andrych�w', 'Gmina Wiejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (20, 'Brenna', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (21, 'Brody', 'Gmina Wiejska', '1900-01-01', '1976-07-01', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (22, 'Brze�nica', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (23, 'Buczkowice', 'Gmina Wiejska', '1900-01-01', '1976-07-01', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (23, 'Buczkowice', 'Gmina Wiejska', '1990-04-01', '1998-12-31', 1, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (24, 'Budz�w', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (25, 'Che�mek', 'Gmina Wiejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (26, 'Chybie', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (27, 'Czernich�w', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (28, 'D�bowiec', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (29, 'Gilowice', 'Gmina Wiejska', '1900-01-01', '1976-07-01', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (29, 'Gilowice', 'Gmina Wiejska', '1991-04-01', '1998-12-31', 1, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (30, 'Gilowice-�lemie�', 'Gmina Wiejska', '1976-07-02', '1991-04-01', 1, 1, 1);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (31, 'Golesz�w', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (32, 'Ha�lach', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (33, 'Istebna', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (34, 'Jasienica', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (35, 'Jaworze', 'Gmina Wiejska', '1991-04-02', '1998-12-31', 1, 1, 1);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (36, 'Jele�nia', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (37, 'Kalwaria Zebrzydowska', 'Gmina Wiejska', '1976-07-02', '1991-12-31', 1, 1, 1);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (38, 'K�ty', 'Gmina Wiejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (39, 'Komorowice', 'Gmina Wiejska', '1900-01-01', '1976-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (40, 'Koszarawa', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (41, 'Kozy', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (42, 'Lanckorona', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (43, 'Lipowa', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (44, '��kawica', 'Gmina Wiejska', '1900-01-01', '1976-07-01', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (44, '��kawica', 'Gmina Wiejska', '1991-04-02', '1998-12-31', 1, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (45, '�odygowice', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (46, 'Mak�w Podhala�ski', 'Gmina Wiejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (47, 'Mil�wka', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (48, 'Mucharz', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (49, 'Osiek', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (50, 'O�wi�cim', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (51, 'Polanka Wielka', 'Gmina Wiejska', '1976-07-02', '1998-12-31', 1, 1, 1);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (52, 'Por�bka', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (53, 'Przecisz�w', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (54, 'Radziechowy-Wieprz', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (55, 'Rajcza', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (56, 'Skocz�w', 'Gmina Wiejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (57, 'Spytkowice', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (58, 'Stare Bielsko', 'Gmina Wiejska', '1900-01-01', '1976-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (59, 'Strumie�', 'Gmina Wiejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (60, 'Stryszawa', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (61, 'Strysz�w', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (62, 'Szczyrk', 'Gmina Wiejska', '1976-07-02', '1990-03-31', 1, 1, 1);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (63, '�lemie�', 'Gmina Wiejska', '1900-01-01', '1976-04-01', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (63, '�lemie�', 'Gmina Wiejska', '1991-04-02', '1998-12-31', 1, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (64, '�winna', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (65, 'Tomice', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (66, 'Ujso�y', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (67, 'Wadowice', 'Gmina Wiejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (68, 'Wapienica', 'Gmina Wiejska', '1900-01-01', '1976-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (69, 'W�gierska G�rka', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (70, 'Wieprz', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (71, 'Wilamowice', 'Gmina Wiejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (72, 'Wilkowice', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (73, 'Zator', 'Gmina Wiejska', '1900-01-01', '1991-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (74, 'Zawoja', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (75, 'Zembrzyce', 'Gmina Wiejska', '1900-01-01', '1998-12-31', 0, 1, 0);

-- Gminy Miejsko - Wiejskie 1975-1998

insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (2, 'Andrych�w', 'Gmina Miejsko-Wiejska', '1992-01-01', '1998-12-31', 1, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (3, 'Che�mek', 'Gmina Miejsko-Wiejska', '1992-01-01', '1998-12-31', 1, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (5, 'Kalwaria Zebrzydowska', 'Gmina Miejsko-Wiejska', '1992-01-01', '1998-12-31', 1, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (6, 'K�ty', 'Gmina Miejsko-Wiejska', '1992-01-01', '1998-12-31', 1, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (7, 'Mak�w Podhala�ski', 'Gmina Miejsko-Wiejska', '1992-01-01', '1998-12-31', 1, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (9, 'Skocz�w', 'Gmina Miejsko-Wiejska', '1992-01-01', '1998-12-31', 1, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (10, 'Strumie�', 'Gmina Miejsko-Wiejska', '1992-01-01', '1998-12-31', 1, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (14, 'Wadowice', 'Gmina Miejsko-Wiejska', '1992-01-01', '1998-12-31', 1, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (15, 'Wilamowice', 'Gmina Miejsko-Wiejska', '1992-01-01', '1998-12-31', 1, 1, 0);
insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (17, 'Zator', 'Gmina Miejsko-Wiejska', '1992-01-01', '1998-12-31', 1, 1, 0);

-- Relacje Gmina -> Wojewodztwo 1975-1998

merge into gminawojewodztwo gw 
using (	Select g.enddate, g.ID as IDGminy, g.startDate as StartDateGminy, g.startDateVerified, g.endDateVerified, w.ID as IDwojewodztwa, w.startDate as startDateWojewodztwa 
		from gmina g, wojewodztwo w) g on g.idGminy=gw.idGmina
when not matched then 
insert (IDGmina, StartDateGmina, IDWojewodztwo, StartDateWojewodztwo, StartDate, EndDate, StartDateVerified, EndDateVerified, Description)
values (g.IDGminy, g.StartDateGminy, g.IDWojewodztwa, g.StartDateWojewodztwa, case when g.StartDateGminy = '1900-01-01' then '1975-06-01' else g.StartDateGminy end, g.endDate, g.StartDateVerified, g.endDateVerified, null);

-- Relacje Gmina -> Gmina 1975-1998

insert into GminaRelacja values (21, '1900-01-01', 37, '1976-07-02','1976-07-02', '1998-12-31', '2 lipca 1976 roku siedziba gminy zosta�a przeniesiona z Brod�w do miasta Kalwaria Zebrzydowska, z jednoczesn� zmian� nazwy gminy na gmina Kalwaria Zebrzydowska');
insert into GminaRelacja values (29, '1900-01-01', 30, '1976-07-02', '1976-07-02', '01-04-1991', '2 lipca 1976 r. gmina Gilowice-�lemie� utworzona przez po��czenie gmin Gilowice i �lemie� oraz do��czenie zniesionej gminy ��kawica (a wi�c w praktyce utworzona z trzech zniesionych gmin)');
insert into GminaRelacja values (44, '1900-01-01', 30, '1976-07-02', '1976-07-02', '01-04-1991', '2 lipca 1976 r. gmina Gilowice-�lemie� utworzona przez po��czenie gmin Gilowice i �lemie� oraz do��czenie zniesionej gminy ��kawica (a wi�c w praktyce utworzona z trzech zniesionych gmin)');
insert into GminaRelacja values (63, '1900-01-01', 30, '1976-07-02', '1976-07-02', '01-04-1991', '2 lipca 1976 r. gmina Gilowice-�lemie� utworzona przez po��czenie gmin Gilowice i �lemie� oraz do��czenie zniesionej gminy ��kawica (a wi�c w praktyce utworzona z trzech zniesionych gmin)');
insert into GminaRelacja values (30, '1976-07-02', 29, '1991-04-01', '1991-02-04', '1998-12-31', '2 kwietnia 1991 gmina Gilowice-�lemie� zosta�a zlikwidowana, a z jej obszaru odtworzono dawne gminy Gilowice, �lemie� i ��kawica sprzed komasacji. Jedynie wie� Oczk�w ze znoszonej gminy przy��czono do �ywca');
insert into GminaRelacja values (30, '1976-07-02', 44, '1900-01-01', '1991-02-04', '1998-12-31', '2 kwietnia 1991 gmina Gilowice-�lemie� zosta�a zlikwidowana, a z jej obszaru odtworzono dawne gminy Gilowice, �lemie� i ��kawica sprzed komasacji. Jedynie wie� Oczk�w ze znoszonej gminy przy��czono do �ywca');
insert into GminaRelacja values (30, '1976-07-02', 63, '1900-01-01', '1991-02-04', '1998-12-31', '2 kwietnia 1991 gmina Gilowice-�lemie� zosta�a zlikwidowana, a z jej obszaru odtworzono dawne gminy Gilowice, �lemie� i ��kawica sprzed komasacji. Jedynie wie� Oczk�w ze znoszonej gminy przy��czono do �ywca');
insert into GminaRelacja values (39, '1900-01-01', 1, '1900-01-01', '1977-01-01', '1998-12-31', '1 stycznia 1977 roku jednostka zosta�a zniesiona przez w��czenie jej teren�w do miasta Bielska-Bia�ej');
insert into GminaRelacja values (58, '1900-01-01', 1, '1900-01-01', '1977-01-01', '1998-12-31', '1 stycznia 1977 roku gmina zosta�a zniesiona przez w��czenie so�ectwa Stare Bielsko do miasta Bielsko-Bia�a');
insert into GminaRelacja values (68, '1900-01-01', 1, '1900-01-01', '1977-01-01', '1998-12-31', '1 stycznia 1977 roku zosta�a zniesiona przez w��czenie so�ectwa Wapienica do miasta Bielsko-Bia�a');
insert into GminaRelacja values (23, '1900-01-01', 62, '1976-07-02', '1976-07-02','1990-04-01', '2 lipca 1976 siedziba gminy zosta�a przeniesiona do Szczyrku, z jednoczesn� zmian� nazwy gminy na gmina Szczyrk');
insert into GminaRelacja values (62, '1976-07-02', 23, '1900-01-01', '1990-04-01','1998-12-31', '1 kwietnia 1990 siedziba gminy zosta�a przeniesiona z powrotem do Buczkowic, z jednoczesn� zmian� nazwy gminy na gmina Buczkowice');

-- Wojewodztwa 1999+

insert into Wojewodztwo(ID, Name, Type, StartDate, EndDate, StartDateVerified, EndDateVerified, IsCreationDate, Description)
values (2,'�l�skie', 'Wojew�dztwo', '1999-01-01', '9999-12-31', 1, 0, 1, null);
insert into Wojewodztwo(ID, Name, Type, StartDate, EndDate, StartDateVerified, EndDateVerified, IsCreationDate, Description)
values (3,'Ma�opolskie', 'Wojew�dztwo', '1999-01-01', '9999-12-31', 1, 0, 1, null);

-- Powiaty 1999+

insert into Powiat(ID, Name, Type, StartDate, EndDate, IsCreationDate, StartDateVerified, EndDateVerified, Description) values (1,'Bielski', 'Powiat', '1999-01-01', '9999-12-31', 1, 1, 0, null);
insert into Powiat(ID, Name, Type, StartDate, EndDate, IsCreationDate, StartDateVerified, EndDateVerified, Description) values (2,'Cieszy�ski', 'Powiat', '1999-01-01', '9999-12-31', 1, 1, 0, null);
insert into Powiat(ID, Name, Type, StartDate, EndDate, IsCreationDate, StartDateVerified, EndDateVerified, Description) values (3,'�ywiecki', 'Powiat', '1999-01-01', '9999-12-31', 1, 1, 0, null);
insert into Powiat(ID, Name, Type, StartDate, EndDate, IsCreationDate, StartDateVerified, EndDateVerified, Description) values (4,'O�wi�cimski', 'Powiat', '1999-01-01', '9999-12-31', 1, 1, 0, null);
insert into Powiat(ID, Name, Type, StartDate, EndDate, IsCreationDate, StartDateVerified, EndDateVerified, Description) values (5,'Suski', 'Powiat', '1999-01-01', '9999-12-31', 1, 1, 0, null);
insert into Powiat(ID, Name, Type, StartDate, EndDate, IsCreationDate, StartDateVerified, EndDateVerified, Description) values (6,'Wadowicki', 'Powiat', '1999-01-01', '9999-12-31', 1, 1, 0, null);

-- Relacje Powiat -> Wojewodztwo 1999+

insert into PowiatWojewodztwo values (1, '1999-01-01', 2, '1999-01-01','1999-01-01', '9999-12-31', 1, 0, null);
insert into PowiatWojewodztwo values (2, '1999-01-01', 2, '1999-01-01','1999-01-01', '9999-12-31', 1, 0, null);
insert into PowiatWojewodztwo values (3, '1999-01-01', 2, '1999-01-01','1999-01-01', '9999-12-31', 1, 0, null);
insert into PowiatWojewodztwo values (4, '1999-01-01', 3, '1999-01-01','1999-01-01', '9999-12-31', 1, 0, null);
insert into PowiatWojewodztwo values (5, '1999-01-01', 3, '1999-01-01','1999-01-01', '9999-12-31', 1, 0, null);
insert into PowiatWojewodztwo values (6, '1999-01-01', 3, '1999-01-01','1999-01-01', '9999-12-31', 1, 0, null);

-- Gminy 1999+

insert into gmina(id, Name, Type, startDate, enddate, StartDateVerified, EndDateVerified, IsCreationDate)
values (1, 'Bielsko-Bia�a', 'Gmina Miejska', '1999-01-01', '9999-12-31', 1, 0, 0);

update Gmina
set EndDate = '9999-12-31', 
	EndDateVerified = 0
where 
	EndDate = '1998-12-31' and id != 1;

-- Relacje Gmina -> Powiat 1999

merge into GminaPowiat gp
using (	Select g.ID as IDGminy, g.StartDate, p.ID
		from gmina g
		join powiat p on p.Name = 'Bielski'
		where g.Name in ('Szczyrk', 'Wilamowice', 'Buczkowice', 'Jasienica', 'Jaworze', 'Kozy', 'Por�bka', 'Wilkowice') 
		and g.endDate = '9999-12-31'
		) p on p.ID = gp.IDPowiat
when not matched then 
insert (IDGmina, StartDateGmina, IDPowiat, StartDatePowiat, StartDate, EndDate, StartDateVerified, EndDateVerified, Description)
values (p.IDGminy, p.StartDate, p.ID, '1999-01-01', '1999-01-01', '9999-12-31', 1, 0, null);

insert into GminaPowiat(IDGmina, StartDateGmina, IDPowiat, StartDatePowiat, StartDate, EndDate, StartDateVerified, EndDateVerified, Description) values (1, '1900-01-01', 1, '1999-01-01' ,'1999-01-01', '9999-12-31', 1, 0, null);


merge into GminaPowiat gp
using (	Select g.ID as IDGminy, g.StartDate, p.ID
		from gmina g
		join powiat p on p.Name = 'Cieszy�ski'
		where g.Name in ('Cieszyn', 'Ustro�', 'Wis�a', 'Skocz�w', 'Strumie�', 'Brenna', 'Chybie', 'D�bowiec', 'Golesz�w', 'Ha�lach', 'Istebna') 
		and g.endDate = '9999-12-31'
		) p on p.ID = gp.IDPowiat
when not matched then 
insert (IDGmina, StartDateGmina, IDPowiat, StartDatePowiat, StartDate, EndDate, StartDateVerified, EndDateVerified, Description)
values (p.IDGminy, p.StartDate, p.ID, '1999-01-01', '1999-01-01', '9999-12-31', 1, 0, null);

merge into GminaPowiat gp
using (	Select g.ID as IDGminy, g.StartDate, p.ID
		from gmina g
		join powiat p on p.Name = '�ywiecki'
		where g.Name in ('�ywiec', 'Czernich�w', 'Gilowice', 'Jele�nia', 'Koszarawa', 'Lipowa', '��kawica', '�odygowice', 'Mil�wka', 'Radziechowy-Wieprz', 'Rajcza', '�lemie�', '�winna', 'Ujso�y', 'W�gierska G�rka')
		and g.endDate = '9999-12-31'
		) p on p.ID = gp.IDPowiat
when not matched then 
insert (IDGmina, StartDateGmina, IDPowiat, StartDatePowiat, StartDate, EndDate, StartDateVerified, EndDateVerified, Description)
values (p.IDGminy, p.StartDate, p.ID, '1999-01-01', '1999-01-01', '9999-12-31', 1, 0, null);

merge into GminaPowiat gp
using (	Select g.ID as IDGminy, g.StartDate, p.ID
		from gmina g
		join powiat p on p.Name = 'O�wi�cimski'
		where g.Name in ('O�wi�cim', 'Che�mek', 'K�ty', 'Zator', 'Osiek', 'O�wi�cim', 'Polanka Wielka', 'Przecisz�w')
		and g.endDate = '9999-12-31'
		) p on p.ID = gp.IDPowiat
when not matched then 
insert (IDGmina, StartDateGmina, IDPowiat, StartDatePowiat, StartDate, EndDate, StartDateVerified, EndDateVerified, Description)
values (p.IDGminy, p.StartDate, p.ID, '1999-01-01', '1999-01-01', '9999-12-31', 1, 0, null);

merge into GminaPowiat gp
using (	Select g.ID as IDGminy, g.StartDate, p.ID
		from gmina g
		join powiat p on p.Name = 'Suski'
		where g.Name in ('Sucha Beskidzka', 'Mak�w Podhala�ski', 'Budz�w', 'Stryszawa', 'Zawoja', 'Zembrzyce')
		and g.endDate = '9999-12-31'
		) p on p.ID = gp.IDPowiat
when not matched then 
insert (IDGmina, StartDateGmina, IDPowiat, StartDatePowiat, StartDate, EndDate, StartDateVerified, EndDateVerified, Description)
values (p.IDGminy, p.StartDate, p.ID, '1999-01-01', '1999-01-01', '9999-12-31', 1, 0, null);

merge into GminaPowiat gp
using (	Select g.ID as IDGminy, g.StartDate, p.ID
		from gmina g
		join powiat p on p.Name = 'Wadowicki'
		where g.Name in ('Andrych�w', 'Kalwaria Zebrzydowska', 'Wadowice', 'Brze�nica', 'Lanckorona', 'Mucharz', 'Spytkowice', 'Strysz�w', 'Tomice', 'Wieprz')
		and g.endDate = '9999-12-31'
		) p on p.ID = gp.IDPowiat
when not matched then 
insert (IDGmina, StartDateGmina, IDPowiat, StartDatePowiat, StartDate, EndDate, StartDateVerified, EndDateVerified, Description)
values (p.IDGminy, p.StartDate, p.ID, '1999-01-01', '1999-01-01', '9999-12-31', 1, 0, null);


select * from wojewodztwo;
select * from gmina;
select * from GminaWojewodztwo;
select * from GminaRelacja;
select * from Powiat;
select * from PowiatWojewodztwo;
select * from gminaPowiat;

ENABLE Trigger ALL ON ALL SERVER;  


GO