
CREATE TABLE Adres (
    id_adres BIGSERIAL  NOT NULL PRIMARY KEY,
    ulica VARCHAR(100) NOT NULL,
    numer_domu int NOT NULL,
    kod_pocztowy VARCHAR(15) NOT NULL,
    miasto VARCHAR(50) NOT NULL,
    kraj VARCHAR(50) NOT NULL,
    id_Klient BIGINT,
    UNIQUE (id_Klient)
);


-- Table: Aktor
CREATE TABLE Aktor (
    id_Aktor BIGSERIAL  NOT NULL PRIMARY KEY,
    imie VARCHAR(50) NOT NULL,
    nazwisko VARCHAR(50) NOT NULL,
    plec VARCHAR(50) NOT NULL,
    data_urodzenia DATE,
    CONSTRAINT plec_constraint CHECK (plec = 'Kobieta' OR plec = 'Mezczyzna')
);

-- Table: Filmy
CREATE TABLE Filmy (
    id_Filmy BIGSERIAL  NOT NULL PRIMARY KEY,
    tytul VARCHAR(50)  NOT NULL,
    kat_wiekowa int  NOT NULL,
    opis VARCHAR(300),
    czas_trwania int NOT NULL,
    gatunek VARCHAR(50)  NOT NULL,
    id_Rezyser BIGINT,
    id_Jakosc BIGINT,
    CONSTRAINT kat_constraint CHECK ( kat_wiekowa = 3 OR kat_wiekowa = 7 OR kat_wiekowa = 12 OR kat_wiekowa = 15 OR kat_wiekowa = 18 ),
    UNIQUE (tytul)
);

-- Table: Filmy4k
CREATE TABLE Jakosc (
    id_Jakosc BIGSERIAL  NOT NULL PRIMARY KEY,
    full_hd boolean NOT NULL ,
    dwa_k boolean not null ,
    cztery_k boolean NOT NULL
);

-- Table: Klient
CREATE TABLE Klient (
    id_Klient BIGSERIAL  NOT NULL PRIMARY KEY,
    imie VARCHAR(50)  NOT NULL,
    nazwisko VARCHAR(50)  NOT NULL,
    plec VARCHAR(50) NOT NULL,
    rok_urodzenia Date  NOT NULL,
    email VARCHAR(70) NOT NULL,
    id_premium BIGINT,
    CONSTRAINT plec_constraint CHECK (plec = 'Kobieta' OR plec = 'Mezczyzna'),
    UNIQUE (email),
    UNIQUE (id_premium)
);

-- Table: Premium
CREATE TABLE Premium (
    id_premium BIGSERIAL  NOT NULL PRIMARY KEY,
    data_aktywacji DATE NOT NULL,
    data_zakonczenia DATE NOT NULL,
    cena numeric(19,2) NOT NULL
);

-- Table: Rezyser
CREATE TABLE Rezyser (
    id_Rezyser BIGSERIAL  NOT NULL PRIMARY KEY,
    imie VARCHAR(50) NOT NULL,
    nazwisko VARCHAR(50) NOT NULL,
    plec VARCHAR(50) NOT NULL,
    data_urodzenia DATE,
    CONSTRAINT plec_constraint CHECK (plec = 'Kobieta' OR plec = 'Mezczyzna')
);

-- Table: Ulubione
CREATE TABLE Ulubione (
    id_ulubione BIGSERIAL  NOT NULL PRIMARY KEY,
    id_Klient BIGINT,
    id_Filmy BIGINT
);


CREATE TABLE Filmy_Aktor (
    id_Filmy_aktor BIGSERIAL PRIMARY KEY,
    id_Filmy BIGINT ,
    id_Aktor BIGINT
);

-- foreign keys
-- Reference: Adres_Klient (table: Adres)
ALTER TABLE Adres ADD CONSTRAINT Adres_Klient
    FOREIGN KEY (id_Klient)
    REFERENCES Klient (id_Klient)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

ALTER TABLE Filmy_Aktor ADD CONSTRAINT Filmy_filmyaktor
    foreign key (id_Filmy)
    references Filmy (id_filmy)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

ALTER TABLE Filmy_Aktor ADD CONSTRAINT Aktor_filmyaktor
    foreign key (id_Aktor)
    references Aktor (id_Aktor)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: Filmy4k_Filmy (table: Filmy4k)
ALTER TABLE Filmy ADD CONSTRAINT Filmy_Jakosc
    FOREIGN KEY (id_Jakosc)
    REFERENCES Jakosc (id_Jakosc)
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Filmy_Rezyser (table: Filmy)
ALTER TABLE Filmy ADD CONSTRAINT Filmy_Rezyser
    FOREIGN KEY (id_Rezyser)
    REFERENCES Rezyser (id_Rezyser)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Filmy_Ulubione (table: Filmy)
ALTER TABLE Ulubione ADD CONSTRAINT Ulubione_Filmy
    FOREIGN KEY (id_Filmy)
    REFERENCES Filmy (id_Filmy)
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Klient_Premium (table: Klient)
ALTER TABLE Klient ADD CONSTRAINT Klient_Premium
    FOREIGN KEY (id_premium)
    REFERENCES Premium (id_premium)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Ulubione_Klient (table: Ulubione)
ALTER TABLE Ulubione ADD CONSTRAINT Ulubione_Klient
    FOREIGN KEY (id_Klient)
    REFERENCES Klient (id_Klient)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

INSERT INTO Rezyser (id_Rezyser,imie, nazwisko, plec, data_urodzenia) VALUES (1,'Todd', 'Philips', 'Mezczyzna', DATE'20-12-1970');
INSERT INTO Rezyser (id_Rezyser,imie, nazwisko, plec, data_urodzenia) VALUES (2,'Quentin','Tarantino', 'Mezczyzna', DATE'27-03-1963');
INSERT INTO Rezyser (id_Rezyser,imie, nazwisko, plec, data_urodzenia) VALUES (3,'Anthony','Russo', 'Mezczyzna', DATE'03-02-1970');
INSERT INTO Rezyser (id_Rezyser,imie, nazwisko, plec, data_urodzenia) VALUES (4,'Martin','Scorsese', 'Mezczyzna', DATE'17-11-1942');
INSERT INTO Rezyser (id_Rezyser,imie, nazwisko, plec, data_urodzenia) VALUES (5,'Jan','Komasa', 'Mezczyzna', DATE'28-10-1981');
INSERT INTO Rezyser (id_Rezyser,imie, nazwisko, plec, data_urodzenia) VALUES (6,'Anna','Boden', 'Kobieta', null);
INSERT INTO Rezyser (id_Rezyser,imie, nazwisko, plec, data_urodzenia) VALUES (7,'Night','Shyamalan', 'Mezczyzna', DATE'06-08-1970');
INSERT INTO Rezyser (id_Rezyser,imie, nazwisko, plec, data_urodzenia) VALUES (8,'Jon','Favreau', 'Mezczyzna', DATE'19-10-1966');
INSERT INTO Rezyser (id_Rezyser,imie, nazwisko, plec, data_urodzenia) VALUES (9,'Joon-ho','Bong', 'Mezczyzna', DATE'14-10-1969');
INSERT INTO Rezyser (id_Rezyser,imie, nazwisko, plec, data_urodzenia) VALUES (10,'Marek','Turek', 'Mezczyzna', DATE'18-01-1959');
INSERT INTO Rezyser (id_Rezyser,imie, nazwisko, plec, data_urodzenia) VALUES (11,'Kamil','Twardowski', 'Mezczyzna', DATE'22-03-1971');
INSERT INTO Rezyser (id_Rezyser,imie, nazwisko, plec, data_urodzenia) VALUES (12,'Piotr','Stanczyk', 'Mezczyzna', DATE'10-05-1989');
INSERT INTO Rezyser (id_Rezyser,imie, nazwisko, plec, data_urodzenia) VALUES (13,'Thomas','Gruszkowski', 'Mezczyzna', null);
INSERT INTO Rezyser (id_Rezyser,imie, nazwisko, plec, data_urodzenia) VALUES (14,'Piter','Rynski', 'Mezczyzna', null);
INSERT INTO Rezyser (id_Rezyser,imie, nazwisko, plec, data_urodzenia) VALUES (15,'Piotr','Sibinski', 'Mezczyzna', DATE'11-07-1977');
INSERT INTO Rezyser (id_Rezyser,imie, nazwisko, plec, data_urodzenia) VALUES (16,'Marcin','Gasik', 'Mezczyzna', DATE'13-08-1965');
INSERT INTO Rezyser (id_Rezyser,imie, nazwisko, plec, data_urodzenia) VALUES (17,'Maciek','Pazura', 'Mezczyzna', DATE'16-12-1968');
INSERT INTO Rezyser (id_Rezyser,imie, nazwisko, plec, data_urodzenia) VALUES (18,'Maksymilian','Ciszewski', 'Mezczyzna', DATE'18-02-1984');
INSERT INTO Rezyser (id_Rezyser,imie, nazwisko, plec, data_urodzenia) VALUES (19,'Hubert','Iglany', 'Mezczyzna', DATE'19-04-1993');
INSERT INTO Rezyser (id_Rezyser,imie, nazwisko, plec, data_urodzenia) VALUES (20,'Zbigniew','Nazwiskowy', 'Mezczyzna', DATE'23-06-1988');
INSERT INTO Rezyser (id_Rezyser,imie, nazwisko, plec, data_urodzenia) VALUES (21,'Sandra','Kaminska', 'Kobieta', null);
INSERT INTO Rezyser (id_Rezyser,imie, nazwisko, plec, data_urodzenia) VALUES (22,'Monika','Opocka', 'Kobieta', DATE'01-07-1979');
INSERT INTO Rezyser (id_Rezyser,imie, nazwisko, plec, data_urodzenia) VALUES (23,'Katarzyna','Ralinska', 'Kobieta', DATE'08-09-1967');
INSERT INTO Rezyser (id_Rezyser,imie, nazwisko, plec, data_urodzenia) VALUES (24,'Paulina','Ulamana', 'Kobieta', DATE'10-10-1981');
INSERT INTO Rezyser (id_Rezyser,imie, nazwisko, plec, data_urodzenia) VALUES (25,'Agnieszka','Szczesna', 'Kobieta', DATE'17-01-19571');


INSERT INTO Jakosc (id_Jakosc,full_hd, dwa_k, cztery_k) VALUES (1,true,true,true);
INSERT INTO Jakosc (id_Jakosc,full_hd, dwa_k, cztery_k) VALUES (2,true,true,false);
INSERT INTO Jakosc (id_Jakosc,full_hd, dwa_k, cztery_k) VALUES (3,true,false,false);

INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (1,'Titanic',15,'Film dokumentalny opowiadajacy o zatonieciu titanica',100 , 'Dokumentalny', 1,3);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (2,'Jurassic Park', 15, 'Film o dinozaurach',90, 'Akcja', 3,3);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (3,'Joker', 18, 'Strudzony zyciem komik popada w obled i staje sie psychopatycznym morderca', 122, 'Dramat', 1,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (4,'Pewnego razu... w Holywood', 15, 'Aktor Rick Dalton i jego przyjaciel kaskader powracaja do Hollywood',161 , 'Akcja', 2,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (5,'Avengers: Koniec Gry', 12, 'Po wymazaniu polowy zycia we Wszechswiecie przez Thanosa Avengersi staraja sie zrobic wszystko, co konieczne, aby pokonac szalonego tytana',182, 'Akcja', 3,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (6,'Irlandczyk', 18, 'Platny zabojca Frank Sheeran powraca do sekretow, ktorych strzegl jako lojalny czlonek rodziny przestepczej Bufalino',210 , 'Biograficzny', 4,2);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (7,'Boze Cialo', 18, 'Dwudziestoletni Daniel zostaje warunkowo zwolniony z poprawczaka', 115, 'Obyczajowy', 5,3);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (8,'Kapitan Marvel', 7, 'Ziemska kobieta po kontakcie z obca rasa Kree otrzymuje nadludzkie moce',124 , 'Akcja', 6,3);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (9,'Glass', 18, 'Straznik David Dunn, wykorzystuje swoje nadprzyrodzone zdolnosci, tropi czlowieka o wielu osobowosciach',129, 'Thriller', 7,3);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (10,'Krol Lew', 3, 'W wyniku podstepu Skazy, prawowity wladca Afrykanskiej sawanny Simba zostaje wygnany',118, 'Familijny', 8,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (11,'Parasite', 12, 'Kiedy Ki-Woo dostaje prace jako koreptetytor corki zamoznego malzenstwa, wymysla sposob na zapewnienie zatrudnienia rowniez reszcie swojej rodziny',122, 'Dramat', 3,3);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (12,'Jak wytresowac smoka 3', 3, 'Opowiesc o wytresowaniu smoka',104, 'Familijny', 15,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (13,'Spider-Man: Daleko od domu', 7, 'Kolejny film o czlowieku pajaku',129, 'Akcja', 17,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (14,'Ad Astra', 15, 'Astronauta przeszukuje galaktyke w celu odnalezienia zaginionego dwadziescia lat wczesniej ojca',124, 'Thriller', 10,3);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (15,'To: Rozdzial 2', 18, '27 lat po tragicznych wydarzeniach w Derry dorosli czlonkowie "klubu Frajerow" powracaja do miasteczka, aby ponownie zmierzyc sie z zabojczym klaunem',169, 'Horror', 20,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (16,'Gwiezdne Wojny: Skywalker. Odrodzenie', 7, 'Czlonkowie organizacji Ruchu Oporu ponownie stawiaja czola Najwyzszemu Porzadkowi',155, 'Przygodowy', 3,3);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (17,'X-Men: Mroczna Phoenix', 12, 'Kolejny nudny film o x-menach',114, 'Akcja', 23,2);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (18,'Na noze', 7, 'Detektyw Blanc bada sprawe smierci bogatego pisarza, glowy ekscentrycznej rodziny. Wszyscy jego krewni sa podejrzani',130, 'Kryminal', 25,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (19,'Tylko nie mow nikomu', 12, 'Dzienikarz sledczy rozmawia z dziewiecioma ksiezmi katolickimi, ktorzy dopuscili sie zbrodni pedofilii i molestowania nieletnich',121, 'Dokumentalny', 24,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (20,'John Wick 3', 12, 'John Wick probuje opuscic Nowy Jork po tym, jak zostaje wydalony z organizacji zabojcow za morderstwo czlonka rady',131, 'Akcja', 16,3);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (21,'Toy Story 4', 3, 'Kowboj Chudy wraz z przyjaciolmi wyruszaja na poszukiwania zaginionej nowej zabawki, Sztucka',100, 'Familijny', 13,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (22,'Shazam!', 3, 'Chlopiec otrzymuje moce dzieki ktorym staje sie doroslym superbohaterem',132, 'Akcja', 12,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (23,'Alladyn', 3, 'Chlopak o czystym sercu dostaje propozycje od poteznego wezyra, by znalazl dla niego tajemnicza lampe',128, 'Przygodowy', 15,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (24,'Rocketman', 3, 'Historia zycia Eltona Johna',121, 'Biograficzny', 4,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (25,'Zombieland: Kulku w leb', 12, 'Od czasu gdy na ziemi pojawily sie zombie udalo im sie ewoluowac przez co trudniej z nimi walczyc',93, 'Komedia', 2,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (26,'Czarownica 2', 7, 'Aurora postanawia wyjsc za maz i zamieszkac w zamku przyszlego meza',119, 'Familijny', 7,3);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (27,'To my', 12, 'Matka i ojciec spedzaja czas z dziecmi w domku na plazy. Wkrotce ich spokoj zakocaja nieproszeni goscie',120, 'Thriller', 8,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (28,'Kraina Lodu 2', 3, 'Elsa i Anna wraz z przyjaciolmi udaja sie do zaczarowanego lasu w poszukiwaniu pomocy dla swojego krolestwa',103, 'Przygodowy', 9,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (29,'Lighthouse', 15, 'Historia dwoch straznikow latarni morskiej ktorzy w obliczy samotnosci powoli traca zdrowie psychiczne',110, 'Horror', 11,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (30,'Pokemon Detektyw Pikachu', 3, 'Prywatny deketyw Harry Goodman znika w niewyjasnionych okolocznosciach',104, 'Familijny', 14,3);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (31,'Trzy kroki od siebie', 7, 'Zycie chorej na mukowiscydoze Stelli Grant ulega zmianie, gdy poczas pobyti w szpitalu poznaje pacjenta Willa',116, 'Melodramat', 19,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (32,'Le Mans 66', 7, 'Na zlecenie Henrego Forda 2 amerykanski projektant Carrol Shelby podejmuje wyzwanie pokonania samochodow Ferrari',90, 'Biograficzny', 20,2);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (33,'Tolkien', 7, 'Kluczowe lata z zycia nastoletniego Tolkiena, ktory po smierci matki trafia do szkoly z internatem',112, 'Biograficzny', 21,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (34,'Smetarz dla zwierzakow', 18, 'Rodzina odkrywa tejemniczy cmentarz. Wkrotce zaczynaja sie dziac przerazajace rzeczy',101, 'Horror', 22,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (35,'Nieznajomi', 3, 'Grupa przyjaciol postanawia ze do konca kolacji wszystkie rozmowy telefoniczne maja byc w trybie glosnomowiacym',103, 'Komedia', 23,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (36,'Historia malzenska', 3, 'Po dziesieciu latach malzenstwo Nicole i Charliego zaczyna sie rozpadac',136, 'Komedia', 24,2);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (37,'Krol', 12, 'Ksiaze Hal musi zmienic sie z krnabrnego prozniaka w silnego wladce i walczyc o Anglie',133, 'Biograficzny', 17,2);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (38,'Niedobrani', 3, 'Dziennikarz polityczny probuje umowic sie ze swoja byla opiekunka ktora zajmuje wazna pozycje w rzadzie',125, 'Komedia', 25,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (39,'Doktor Sen', 18, 'Minelo wiele lat od czasu wydarzen, ktore rozegraly sie w lsnieniu.',151, 'Horror', 1,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (40,'Yesterday', 7, 'Mlody mezczyzna budzi sie w swiecie, gdzie nikt oprocz niego nie zna piosenek Beatlesow',112, 'Komedia', 4,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (41,'Szybcy i Wsciekli: Hobbs i Shaw', 7, 'Stroz prawa Luke Hobbs i wyrzuteg Deckard Shaw lacza swoje sily przeciwko cybernetycznie zmodyfikowanemu przestepcy',134, 'Akcja', 3,2);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (42,'Polityka', 18, 'Spojrzenie na zachowania polskich politykow, gdy kamery sa wylaczone',135, 'Obyczajowy', 6,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (43,'Oszustki', 7, 'Mlody milioner stanie sie obiektem rywalizacji dwoch oszustek',94, 'Komedia', 8,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (44,'Planeta Singli 3', 7, 'Ania i Tomek planuja wesele na wsi u rodziny mezczyzny',103, 'Komedia', 12,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (45,'Rodzina Addamsow', 7, 'Rodzina Addamsow po przeprowadce do New Jersey musis staic czolo wyzwaniom 21 wieku',87, 'Familijny', 14,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (46,'Zabojczy Rejs', 7, 'W trakcie wakacji na jachci miliardera nowojorski policjant i jego zona staja sie glownymi podejrzanymi',97, 'Komedia', 15,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (47,'After', 18, 'Tessa rozpoczyna wymarzone studia',100, 'Akcja', 18,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (48,'Underdog', 12, 'Borys Kosinski to zawodnik MMA, ktory jest u szczytu formy',116, 'Akcja', 17,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (49,'Dumbo', 3, 'Byy zolnierz Holt zostaje opiekunem cyrkowego slonia',112, 'Familijny', 16,1);
INSERT INTO Filmy (id_Filmy,tytul, kat_wiekowa, opis,czas_trwania, gatunek, id_Rezyser,id_Jakosc) VALUES (50,'Godzilla 2: Krol potworow', 12, 'Po pojawieniu sie nowego zagrozenia Krol Potworow powraca , by ponownie przywrocic w przyrodzie rownowage',132, 'Akcja', 20,3);





INSERT INTO Aktor (id_Aktor,imie, nazwisko, plec, data_urodzenia) VALUES (1,'Kazimierz','Dolny','Mezczyzna', DATE'03-08-1983');
INSERT INTO Aktor (id_Aktor,imie, nazwisko, plec, data_urodzenia) VALUES (2,'Marcin','Karpinski','Mezczyzna', DATE'21-06-1993');
INSERT INTO Aktor (id_Aktor,imie, nazwisko, plec, data_urodzenia) VALUES (3,'Angelina','Jolie','Kobieta', DATE'18-03-1979');
INSERT INTO Aktor (id_Aktor,imie, nazwisko, plec, data_urodzenia) VALUES (4,'Leonardo','Dicaprio','Mezczyzna', DATE'23-05-1983');
INSERT INTO Aktor (id_Aktor,imie, nazwisko, plec, data_urodzenia) VALUES (5,'Anna','Salwoska','Kobieta', DATE'02-01-1999');
INSERT INTO Aktor (id_Aktor,imie, nazwisko, plec, data_urodzenia) VALUES (6,'Katarzyna','Gasik','Kobieta', DATE'22-12-1997');
INSERT INTO Aktor (id_Aktor,imie, nazwisko, plec, data_urodzenia) VALUES (7,'Zbigniew','Komorowski','Mezczyzna', DATE'11-03-1977');
INSERT INTO Aktor (id_Aktor,imie, nazwisko, plec, data_urodzenia) VALUES (8,'Grzegorz','Schwarzeneger','Mezczyzna', DATE'27-06-1974');
INSERT INTO Aktor (id_Aktor,imie, nazwisko, plec, data_urodzenia) VALUES (9,'Katarzyna','Cichopek','Kobieta', DATE'07-09-1983');
INSERT INTO Aktor (id_Aktor,imie, nazwisko, plec, data_urodzenia) VALUES (10,'Tomasz','Lisicki','Mezczyzna',  null);
INSERT INTO Aktor (id_Aktor,imie, nazwisko, plec, data_urodzenia) VALUES (11,'Paulina','Zarzeka','Kobieta',  null);
INSERT INTO Aktor (id_Aktor,imie, nazwisko, plec, data_urodzenia) VALUES (12,'Aleksandra','Napiorkowska','Kobieta', DATE'23-01-1955');
INSERT INTO Aktor (id_Aktor,imie, nazwisko, plec, data_urodzenia) VALUES (13,'Julia','Mikowska','Kobieta', DATE'13-03-1963');
INSERT INTO Aktor (id_Aktor,imie, nazwisko, plec, data_urodzenia) VALUES (14,'Maciek','Szczepanik','Mezczyzna',  null);
INSERT INTO Aktor (id_Aktor,imie, nazwisko, plec, data_urodzenia) VALUES (15,'Zbigniew','Stawicki','Mezczyzna', DATE'03-05-1978');
INSERT INTO Aktor (id_Aktor,imie, nazwisko, plec, data_urodzenia) VALUES (16,'Franciszek','Miekus','Mezczyzna', DATE'25-07-1999');
INSERT INTO Aktor (id_Aktor,imie, nazwisko, plec, data_urodzenia) VALUES (17,'Sandra','Falda','Kobieta',  null);
INSERT INTO Aktor (id_Aktor,imie, nazwisko, plec, data_urodzenia) VALUES (18,'Weronika','Gajewska','Kobieta', DATE'05-09-2001');
INSERT INTO Aktor (id_Aktor,imie, nazwisko, plec, data_urodzenia) VALUES (19,'Kazimierz','Korzeniewski','Mezczyzna', DATE'07-11-1993');
INSERT INTO Aktor (id_Aktor,imie, nazwisko, plec, data_urodzenia) VALUES (20,'Ignacy','Krasicki','Mezczyzna',  null);
INSERT INTO Aktor (id_Aktor,imie, nazwisko, plec, data_urodzenia) VALUES (21,'Anna','Mieckiewicz','Kobieta', DATE'13-02-1994');
INSERT INTO Aktor (id_Aktor,imie, nazwisko, plec, data_urodzenia) VALUES (22,'Bogdan','Chrobry','Mezczyzna', DATE'19-04-1997');


INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (1,1,2);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (2,1,3);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (3,1,7);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (4,1,1);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (5,1,4);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (6,2,5);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (7,2,6);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (8,2,9);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (9,2,8);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (10,2,11);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (11,3,22);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (12,3,20);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (13,3,7);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (14,3,1);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (15,3,3);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (16,4,18);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (17,4,15);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (18,4,11);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (19,4,2);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (20,4,22);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (21,5,7);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (22,5,6);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (23,5,3);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (24,5,1);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (25,5,9);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (26,6,13);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (27,6,12);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (28,6,17);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (29,6,19);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (30,7,20);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (31,7,21);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (32,7,22);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (33,7,16);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (34,7,13);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (35,8,14);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (36,8,7);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (37,8,5);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (38,8,4);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (39,8,1);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (40,8,8);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (41,9,9);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (42,9,11);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (43,9,14);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (44,9,17);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (45,9,19);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (46,10,10);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (47,10,8);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (48,10,6);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (49,11,5);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (50,11,3);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (51,11,1);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (52,11,19);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (53,12,22);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (54,12,18);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (55,12,19);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (56,12,17);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (57,12,8);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (58,12,9);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (59,13,4);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (60,13,6);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (61,13,5);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (62,14,19);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (63,14,12);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (64,14,10);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (65,14,9);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (66,14,3);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (67,15,7);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (68,15,11);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (69,16,22);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (70,16,4);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (71,16,2);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (72,16,7);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (73,17,19);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (74,17,13);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (75,17,14);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (76,17,17);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (77,18,8);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (78,18,3);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (79,18,2);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (80,18,1);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (81,18,9);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (82,19,11);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (83,19,13);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (84,19,15);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (85,19,17);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (86,19,19);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (87,20,21);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (88,20,20);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (89,20,22);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (90,21,1);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (91,21,3);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (92,21,5);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (93,21,7);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (94,21,9);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (95,21,10);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (96,22,2);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (97,22,5);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (98,22,7);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (99,22,9);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (100,23,13);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (101,23,17);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (102,23,14);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (103,23,11);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (104,24,10);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (105,25,8);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (106,25,7);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (107,25,4);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (108,25,2);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (109,25,1);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (110,25,19);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (111,26,22);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (112,26,21);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (113,26,18);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (114,26,13);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (115,27,11);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (116,27,8);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (117,28,3);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (118,28,4);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (119,28,1);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (120,28,5);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (121,28,7);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (122,29,8);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (123,29,9);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (124,29,10);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (125,30,12);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (126,30,16);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (128,30,18);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (129,31,20);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (130,31,21);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (131,32,22);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (132,32,1);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (133,33,3);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (134,33,5);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (135,33,6);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (136,33,7);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (137,34,8);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (138,35,9);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (139,35,10);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (140,35,11);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (141,35,12);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (142,35,13);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (143,36,14);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (144,36,15);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (145,36,16);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (146,36,17);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (147,37,18);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (148,37,19);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (149,37,20);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (150,38,21);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (151,38,22);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (152,38,1);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (153,38,3);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (154,38,5);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (155,39,7);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (156,39,9);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (157,39,11);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (158,39,13);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (159,40,15);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (160,40,17);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (161,41,19);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (162,41,21);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (163,41,2);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (164,41,4);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (165,41,6);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (166,42,8);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (167,42,10);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (168,42,12);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (169,42,14);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (170,42,16);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (171,43,18);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (172,43,20);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (173,43,22);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (174,44,1);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (175,44,2);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (176,44,3);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (177,44,4);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (178,44,5);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (179,45,6);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (180,45,7);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (181,46,8);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (182,46,9);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (183,46,10);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (184,47,11);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (185,47,12);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (186,47,13);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (187,47,14);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (188,47,15);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (189,47,16);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (190,48,17);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (191,48,18);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (192,48,19);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (193,48,20);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (194,49,21);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (195,49,22);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (196,50,3);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (197,50,7);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (198,50,10);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (199,50,13);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (200,50,15);
INSERT INTO Filmy_Aktor (id_Filmy_aktor,id_filmy, id_Aktor) VALUES (201,50,14);



INSERT INTO Premium (id_premium,data_aktywacji, data_zakonczenia, cena) VALUES (1,DATE'25-12-2019',DATE'25-01-2020', 20);
INSERT INTO Premium (id_premium,data_aktywacji, data_zakonczenia, cena) VALUES (2,DATE'23-12-2019',DATE'23-01-2020', 20);
INSERT INTO Premium (id_premium,data_aktywacji, data_zakonczenia, cena) VALUES (3,DATE'28-12-2019',DATE'28-01-2020', 20);
INSERT INTO Premium (id_premium,data_aktywacji, data_zakonczenia, cena) VALUES (4,DATE'01-01-2020',DATE'01-02-2020', 20);
INSERT INTO Premium (id_premium,data_aktywacji, data_zakonczenia, cena) VALUES (5,DATE'05-01-2020',DATE'05-02-2020', 20);
INSERT INTO Premium (id_premium,data_aktywacji, data_zakonczenia, cena) VALUES (6,DATE'05-01-2020',DATE'05-02-2020', 20);
INSERT INTO Premium (id_premium,data_aktywacji, data_zakonczenia, cena) VALUES (7,DATE'09-01-2020',DATE'09-02-2020', 20);
INSERT INTO Premium (id_premium,data_aktywacji, data_zakonczenia, cena) VALUES (8,DATE'10-01-2020',DATE'10-02-2020', 20);
INSERT INTO Premium (id_premium,data_aktywacji, data_zakonczenia, cena) VALUES (9,DATE'07-01-2020',DATE'07-02-2020', 20);
INSERT INTO Premium (id_premium,data_aktywacji, data_zakonczenia, cena) VALUES (10,DATE'09-01-2020',DATE'09-02-2020', 20);


insert into klient (id_Klient,imie, nazwisko, plec, rok_urodzenia, email, id_premium) values (1,'Hastie', 'Di Dello', 'Mezczyzna', DATE '09-02-1975', 'hdidello0@github.com', null);
insert into klient (id_Klient,imie, nazwisko, plec, rok_urodzenia, email, id_premium) values (2,'Josi', 'Arnholtz', 'Kobieta', DATE '21-07-1999', 'jarnholtz1@com.com', 7);
insert into klient (id_Klient,imie, nazwisko, plec, rok_urodzenia, email, id_premium) values (3,'Georgeta', 'Simants', 'Mezczyzna',DATE '28-09-1976', 'gsimants2@digg.com', null);
insert into klient (id_Klient,imie, nazwisko, plec, rok_urodzenia, email, id_premium) values (4,'Erena', 'Gabbidon', 'Kobieta', DATE '19-09-2001', 'egabbidon3@phpbb.com', null);
insert into klient (id_Klient,imie, nazwisko, plec, rok_urodzenia, email, id_premium) values (5,'Nate', 'Mueller', 'Mezczyzna', DATE '28-01-1988', 'nmueller4@dot.gov', 1);
insert into klient (id_Klient,imie, nazwisko, plec, rok_urodzenia, email, id_premium) values (6,'Angie', 'Whisker', 'Mezczyzna', DATE '17-06-1967', 'awhisker5@wsj.com', null);
insert into klient (id_Klient,imie, nazwisko, plec, rok_urodzenia, email, id_premium) values (7,'Madlen', 'Breston', 'Kobieta', DATE '09-02-2003', 'mbreston6@wordpress.org', 3);
insert into klient (id_Klient,imie, nazwisko, plec, rok_urodzenia, email, id_premium) values (8,'Nalani', 'Etherton', 'Kobieta', DATE '10-04-1979', 'netherton7@ucla.edu', null);
insert into klient (id_Klient,imie, nazwisko, plec, rok_urodzenia, email, id_premium) values (9,'Madonna', 'Maudling', 'Kobieta', DATE '11-07-1988', 'mmaudling8@cnbc.com', 4);
insert into klient (id_Klient,imie, nazwisko, plec, rok_urodzenia, email, id_premium) values (10,'Aila', 'Purdey', 'Kobieta', DATE '12-05-1977', 'apurdey9@usatoday.com', null);
insert into klient (id_Klient,imie, nazwisko, plec, rok_urodzenia, email, id_premium) values (11,'Flossy', 'Rallings', 'Kobieta', DATE '21-05-1989', 'frallingsa@jalbum.net', 5);
insert into klient (id_Klient,imie, nazwisko, plec, rok_urodzenia, email, id_premium) values (12,'Odelia', 'Tebbet', 'Kobieta', DATE '25-02-1975', 'otebbetb@ow.ly', null);
insert into klient (id_Klient,imie, nazwisko, plec, rok_urodzenia, email, id_premium) values (13,'Glenda', 'Piff', 'Kobieta', DATE '26-03-1955', 'gpiffc@ox.ac.uk', 2);
insert into klient (id_Klient,imie, nazwisko, plec, rok_urodzenia, email, id_premium) values (14,'Benjamin', 'Ponte', 'Mezczyzna', DATE '18-12-1999', 'bponted@sohu.com', null);
insert into klient (id_Klient,imie, nazwisko, plec, rok_urodzenia, email, id_premium) values (15,'Raven', 'Crates', 'Kobieta', DATE '17-05-1986', 'rcratese@bing.com', 6);
insert into klient (id_Klient, imie, nazwisko, plec, rok_urodzenia, email, id_premium) values (16, 'Christin', 'Rispen', 'Kobieta', DATE '14-03-1994', 'crispen0@nyu.edu', null);
insert into klient (id_Klient, imie, nazwisko, plec, rok_urodzenia, email, id_premium) values (17, 'Diandra', 'Levick', 'Kobieta', DATE '13-11-1993', 'dlevick1@pbs.org', null);
insert into klient (id_Klient, imie, nazwisko, plec, rok_urodzenia, email, id_premium) values (18, 'Merrili', 'Novic', 'Kobieta', DATE '16-04-1959', 'mnovic2@google.it', null);
insert into klient (id_Klient, imie, nazwisko, plec, rok_urodzenia, email, id_premium) values (19, 'Addi', 'Purver', 'Kobieta', DATE '18-08-1977', 'apurver3@arizona.edu', null);
insert into klient (id_Klient, imie, nazwisko, plec, rok_urodzenia, email, id_premium) values (20, 'Nil', 'Curuclis', 'Mezczyzna', DATE '19-08-1998', 'ncuruclis4@topsy.com', null);
insert into klient (id_Klient, imie, nazwisko, plec, rok_urodzenia, email, id_premium) values (21, 'Netti', 'Wisniowski', 'Kobieta', DATE '14-03-1988', 'nwisniowski5@jigsy.com', null);
insert into klient (id_Klient, imie, nazwisko, plec, rok_urodzenia, email, id_premium) values (22, 'Niall', 'Dimitrie', 'Mezczyzna', DATE '13-02-1992', 'ndimitrie6@discovery.com', null);
insert into klient (id_Klient, imie, nazwisko, plec, rok_urodzenia, email, id_premium) values (23, 'Tammie', 'Cork', 'Kobieta', DATE '01-01-1991', 'tcork7@mapquest.com', null);
insert into klient (id_Klient, imie, nazwisko, plec, rok_urodzenia, email, id_premium) values (24, 'Ellery', 'Stroton', 'Mezczyzna', DATE '03-07-1967', 'estroton8@myspace.com', 8);
insert into klient (id_Klient, imie, nazwisko, plec, rok_urodzenia, email, id_premium) values (25, 'Gardy', 'Whiteford', 'Mezczyzna', DATE '08-09-1996', 'gwhiteford9@reverbnation.com', null);
insert into klient (id_Klient, imie, nazwisko, plec, rok_urodzenia, email, id_premium) values (26, 'Pace', 'Dugood', 'Mezczyzna', DATE '03-05-1983', 'pdugooda@unesco.org', null);
insert into klient (id_Klient, imie, nazwisko, plec, rok_urodzenia, email, id_premium) values (27, 'Tallou', 'O''Dee', 'Kobieta', DATE '07-09-1979', 'todeeb@bloglines.com', null);
insert into klient (id_Klient, imie, nazwisko, plec, rok_urodzenia, email, id_premium) values (28, 'Cinderella', 'Kittley', 'Kobieta', DATE '05-09-1996', 'ckittleyc@360.cn', null);
insert into klient (id_Klient, imie, nazwisko, plec, rok_urodzenia, email, id_premium) values (29, 'Bette', 'Kubiak', 'Kobieta', DATE '07-09-1999', 'bkubiakd@nytimes.com', 9);
insert into klient (id_Klient, imie, nazwisko, plec, rok_urodzenia, email, id_premium) values (30, 'Prince', 'Corp', 'Mezczyzna', DATE '08-09-2005', 'pcorpe@aol.com', 10);

insert into Adres (id_adres,ulica, numer_domu, kod_pocztowy, miasto, kraj, id_klient) values (1,'Park Meadow 22', 3, '03-291', 'Lantera', 'Indonezja', 4);
insert into Adres (id_adres,ulica, numer_domu, kod_pocztowy, miasto, kraj, id_klient) values (2,'Clarendon 34', 55, '04-500', 'Goyang-si', 'Korea Południowa', 5);
insert into Adres (id_adres,ulica, numer_domu, kod_pocztowy, miasto, kraj, id_klient) values (3,'Roth 114', 33, '08-746', 'Saint-Tite', 'Kanada', 8);
insert into Adres (id_adres,ulica, numer_domu, kod_pocztowy, miasto, kraj, id_klient) values (4,'Shopko 129', 23, '08-777', 'Haquira', 'Peru', 3);
insert into Adres (id_adres,ulica, numer_domu, kod_pocztowy, miasto, kraj, id_klient) values (5,'Stang 33', 88, '34-500', 'Pirok', 'Macedonia', 6);
insert into Adres (id_adres,ulica, numer_domu, kod_pocztowy, miasto, kraj, id_klient) values (6,'Riverside 31', 23, '23-400', 'Limbe', 'Cameroon', 9);
insert into Adres (id_adres,ulica, numer_domu, kod_pocztowy, miasto, kraj, id_klient) values (7,'Park Meadow 14', 1, '36-756', 'Ubrub', 'Indonezja', 2);
insert into Adres (id_adres,ulica, numer_domu, kod_pocztowy, miasto, kraj, id_klient) values (8,'Rigney 18', 89, '67-666', 'Sundbyberg', 'Szwecja', 10);
insert into Adres (id_adres,ulica, numer_domu, kod_pocztowy, miasto, kraj, id_klient) values (9,'Canary 98', 5, '34-455', 'Piaocao', 'Chiny', 12);
insert into Adres (id_adres,ulica, numer_domu, kod_pocztowy, miasto, kraj, id_klient) values (10,'Emmet 77', 14, '34-333', 'Strängnäs', 'Szwecja', 1);
insert into Adres (id_adres,ulica, numer_domu, kod_pocztowy, miasto, kraj, id_klient) values (11,'Atwood 87', 13, '23-453', 'Port-Vila', 'Wietnam', 11);
insert into Adres (id_adres,ulica, numer_domu, kod_pocztowy, miasto, kraj, id_klient) values (12,'Susan 33', 23, '23-453', 'Lanhe', 'Chiny', 7);
insert into Adres (id_adres,ulica, numer_domu, kod_pocztowy, miasto, kraj, id_klient) values (13,'Main 22', 64, '23-333', 'Ciladaeun', 'Indonezja', 15);
insert into Adres (id_adres,ulica, numer_domu, kod_pocztowy, miasto, kraj, id_klient) values (14,'Pearson 2', 54, '25-434', 'Vailoatai', 'Stany Zjednoczone', 13);
insert into Adres (id_adres,ulica, numer_domu, kod_pocztowy, miasto, kraj, id_klient) values (15,'Tennyson 8', 77, '68-555', 'Huntsville', 'Stany Zjednoczone', 14);
insert into Adres (id_adres,ulica, numer_domu, kod_pocztowy, miasto, kraj, id_klient) values (16,'Sw. Wincentego 8', 12, '03-299', 'Warszawa', 'Polska', 19);
insert into Adres (id_adres,ulica, numer_domu, kod_pocztowy, miasto, kraj, id_klient) values (17,'Potocka 10', 3, '03-991', 'Poznan', 'Polska', 16);
insert into Adres (id_adres,ulica, numer_domu, kod_pocztowy, miasto, kraj, id_klient) values (18,'St. Louis 42', 45, '23-555', 'London', 'Anglia', 20);
insert into Adres (id_adres,ulica, numer_domu, kod_pocztowy, miasto, kraj, id_klient) values (19,'Mool 89', 32, '88-888', 'New York', 'Stany Zjednoczone', 25);
insert into Adres (id_adres,ulica, numer_domu, kod_pocztowy, miasto, kraj, id_klient) values (20,'Iglis 2', 444, '98-342', 'Berlin', 'Niemcy', 24);
insert into Adres (id_adres,ulica, numer_domu, kod_pocztowy, miasto, kraj, id_klient) values (21,'Winston 5', 23, '41-857', 'Paryz', 'Francja', 28);
insert into Adres (id_adres,ulica, numer_domu, kod_pocztowy, miasto, kraj, id_klient) values (22,'Stark 47', 1, '68-473', 'Bruksela', 'Belgia', 21);
insert into Adres (id_adres,ulica, numer_domu, kod_pocztowy, miasto, kraj, id_klient) values (23,'Pokatna 2', 3, '38-856', 'Moskwa', 'Rosja', 23);
insert into Adres (id_adres,ulica, numer_domu, kod_pocztowy, miasto, kraj, id_klient) values (24,'Gryfindor 36', 23, '94-385', 'Hogwart', 'Wielka Brytania', 26);
insert into Adres (id_adres,ulica, numer_domu, kod_pocztowy, miasto, kraj, id_klient) values (25,'Ravencaf 77', 1, '28-385', 'London', 'Wielka Brytania', 29);
insert into Adres (id_adres,ulica, numer_domu, kod_pocztowy, miasto, kraj, id_klient) values (26,'Haffelpuf 85', 34, '85-283', 'London', 'Wielka Brytania', 22);
insert into Adres (id_adres,ulica, numer_domu, kod_pocztowy, miasto, kraj, id_klient) values (27,'Slitherin 13', 54, '23-985', 'London', 'Wielka Brytania', 30);
insert into Adres (id_adres,ulica, numer_domu, kod_pocztowy, miasto, kraj, id_klient) values (28,'Snape 255', 32, '39-958', 'Paryz', 'Francja', 27);



INSERT INTO Ulubione (id_ulubione, id_Klient, id_Filmy) values (1,15, 1);
INSERT INTO Ulubione (id_ulubione, id_Klient, id_Filmy) values (2,15, 2);
INSERT INTO Ulubione (id_ulubione, id_Klient, id_Filmy) values (3,14, 2);




