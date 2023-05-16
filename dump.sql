--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authors (
                                id integer NOT NULL,
                                name character varying NOT NULL,
                                last_name character varying NOT NULL,
                                info text
);


ALTER TABLE public.authors OWNER TO postgres;

--
-- Name: authors_book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authors_book (
                                     author_id integer NOT NULL,
                                     book_id integer NOT NULL
);


ALTER TABLE public.authors_book OWNER TO postgres;

--
-- Name: awards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.awards (
                               id integer NOT NULL,
                               name character varying NOT NULL,
                               priority integer
);


ALTER TABLE public.awards OWNER TO postgres;

--
-- Name: book_genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_genre (
                                   book_id integer NOT NULL,
                                   genre_id integer NOT NULL
);


ALTER TABLE public.book_genre OWNER TO postgres;

--
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books (
                              id integer NOT NULL,
                              isbn character varying(30) NOT NULL,
                              title character varying(50) NOT NULL,
                              release_year integer,
                              number_of_pages integer,
                              info text,
                              language_id integer NOT NULL,
                              available integer
);


ALTER TABLE public.books OWNER TO postgres;

--
-- Name: contact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact (
                                id integer NOT NULL,
                                name character varying NOT NULL,
                                email character varying,
                                subject character varying,
                                message character varying,
                                solved boolean DEFAULT false
);


ALTER TABLE public.contact OWNER TO postgres;

--
-- Name: genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genres (
                               id integer NOT NULL,
                               name character varying NOT NULL
);


ALTER TABLE public.genres OWNER TO postgres;

--
-- Name: languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.languages (
                                  id integer NOT NULL,
                                  name character varying NOT NULL
);


ALTER TABLE public.languages OWNER TO postgres;

--
-- Name: reservation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservation (
                                    id integer NOT NULL,
                                    number integer NOT NULL,
                                    email character varying
);


ALTER TABLE public.reservation OWNER TO postgres;

--
-- Name: reservation_book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservation_book (
                                         reservation_id integer NOT NULL,
                                         book_id integer NOT NULL
);


ALTER TABLE public.reservation_book OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
                              id integer NOT NULL,
                              username character varying NOT NULL,
                              password character varying NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.authors VALUES (1, 'Douglas', 'Adams', 'Douglas Noël Adams bol spisovateľom, rozhlasovým dramatikom a humoristom. Narodil sa 11. marca v roku 1952 v Cambridge vo Veľkej Británii.
Jeho rodičia sa rozišli, keď mal päť rokov. Matka bola zdravotná sestra a otec študent teológie. Matka ho vychovávala sama, a tak si už ako stredoškolák privyrábal ako ošetrovateľ v ústave pre duševne chorých, zametač kurínov aj ako asistent pri rӧntgene.. Na strednej škole mal vynikajúce hodnotenie z angličtiny (neskôr slúžil profesorom ako vzorový príklad žiaka), čo mu dopomohlo k štipendiu na štúdiá anglickej literatúry v Cambridgei.

Bol študentom - bohémom. Patril k hlavným aktérom divadelného diania na škole, ale bol aj dobrým a zábavným spoločníkom. Neil Gaiman, jeho spolupracovník a priateľ, si na spoločné študentské roky spomína ako na zbierku absurdných príhod a skúšku hraníc, kam až sa dá zájsť s provokatívnosťou v témach. Po jednom predstavení vysokoškolskej hry, ktorá sa hrala v divadelnom West Ende v Londýne, , sa Adams stretol s Grahamom Chapmanom, členom kultovej skupiny Monthy Python. Časom sa s Pytónmi skamarátil a občas spolu aj pracovali. ');
INSERT INTO public.authors VALUES (3, 'Allen', 'Woody', 'Allen Stewart Konigsberg, známy ako Woody Allen je americký filmový režisér, spisovateľ, herec aj komediant.
Woody Allen je jedným z mála amerických filmárov, ktorý sa dokázal presadiť predovšetkým ako tvorca autorských filmov. K tomu, aby sa tak stalo potreboval široké spektrum rôznych záujmov a mnoho talentu. Woody Allen je nielen režisérom, ale aj hercom, spisovateľom a v neposlednom rade aj jazzmanom a to hráčom na klarinet.

Narodil sa roku 1. decembra 1935 ako Allen Stewart Konigsberg v Brooklyne v New Yorku.

Woody Allen skončil už v prvom semestri na New Yorskej univerzite, ale hneď na to sa zamestnal v NBC ako scenárista. Popri tom sa snažil presadiť ako tvorca vtipných gagov pre komikov a pre rôzne vystúpenia v nočných podnikoch. V roku 1965 Woody hrá a je scenáristom filmu Co je nového, kočičko?  Woody ako režisér debutuje nízko rozpočtovým japonským špionážnym trilerom What''s New, Pussycat, ktorý je nakrútený s anglickými dialógmi a predabovaný americkými hercami. ');
INSERT INTO public.authors VALUES (2, 'Alfred', 'Hitchcock', 'Hitchcockova kariéra sa spočiatku vôbec nepodobala na to, čím sa mala neskôr stať. Najskôr pracoval v odvetví, ktoré s filmom nemalo nič spoločné - zamestnal sa vo svojom rodisku, v Londýne, ako bankový úradník.
Využil však svoj výtvarný talent a fantáziu a prispieval do rôznych časopisov karikatúrami. Tak sa zamestnal ako kreslič titulkov. Bolo to jeho prvé priblíženie sa k svetu filmu. Už vtedy videl, že mu môže ponúknuť mnoho. Začal písať scenáre, pôsobil tiež ako výtvarník a asistent réžie. V podstate tieto skúsenosti mu neskôr pomohli vytvoriť svoje najlepšie diela, keďže na vlastnej koži pocítil ako funguje celý mechanizmus výroby filmu a od toho, do akej miery sú jednotlivé zložky prepojené, závisí jeho pôsobivosť a vierohodnosť. Jeho debutom bol film Bludisko lásky (1925), ale dôležitým je najmä jeho tretí film Príšerný hosť (1926). Už v tomto filme sa mu podarilo vytvoriť dokonale napätú atmosféru pochmúrnych londýnskych zákutí. Napätie je založené na rytme, v ktorom sú jednotlivé udalosti predostierané. Nadšená filmová kritika písala, že je to najlepší film, aký kedy v Anglicku vznikol.
Z tejto úrovne už Alfréd Hitchcock nepoľavil. Do roku 1939 nakrúcal Hitchcock v Anglicku. Tu si vytvoril onen neopakovateľný štýl. Vplývala na neho anglická dokumentárna škola 30. rokov i filmy anglického režiséra Alexandra Kordu – plné plynulého deja, dobrých hereckých výkonov, inscenačného rozmachu. A netreba zdôrazňovať, že Anglicko je kolískou kriminálnej literatúry, čo tiež zanechalo stopy na Hitchcockovej tvorbe.

Pod vplyvom udalostí II. Svetovej vojny sa Alfréd Hitchcock v roku 1940 natrvalo usadil v Hollywoode, kam prišiel na pozvanie producenta Davida O. Sleznicka. Tu začína Hitchcockovo americké obdobie. Keď prišiel do Hollywoodu, máloktorý producent bol ochotný zveriť Hitchcockovi nakrúcanie filmu. Prevládal názor, že Hitchcock ako odchovanec anglickej filmovej školy nedokáže natočiť „hollywoodsky“ obraz. Hitchcock však umlčal kritikov, keď jeho prvý americký film Rebecca (Rebeka, 1940) získal 2 Oscary 1941 ako najlepší film roku a za najlepšiu kameru. Jeho film sa vyznačuje dokonalea a
vystupňovanou psychologickou kalkuláciou a dusnou atmosférou neistoty.');
INSERT INTO public.authors VALUES (4, 'Asher', 'Jay', 'Jay Asher (1975) je súčasný americký spisovateľ píšuci knihy pre tínedžerov. Jeho knihy boli preložené do viac ako 30 jazykov.
Debutoval príbehom Thirteen Reasons Why, ktorý sa od roku 2007 pravidelne objavuje na zozname najpredávanejších kníh za posledných desať rokov podľa New York Times. V roku 2017 prichádza TV stanica Netflix podľa jeho predlohy so seriálom  - Thirteen Reasons Why. Vo vydavateľstve Slovart vychádza kniha pod názvom Mŕtve dievča neklame (2017).
Facebook ti napovie (2012), Asherov druhý román, napísal v spolupráci s Carolyn Mackler. Tretím románom je What Light (2016).');
INSERT INTO public.authors VALUES (5, 'Elisabeth', 'Asbrink', 'Elisabeth Asbrink (1965) je švédska spisovateľka a novinárka. V súčasnosti pracuje v televízii SVT ako redaktorka a producentka. Býva v Štokholme.
Prvá kniha vydaná vo vydavateľstve Absynt – A vo Viedenskom lese stále stoja stromy získala nielen Augustovu cenu, ale aj prestížne ocenenie pre reportážnu literatúru, Cenu Ryszarda Kapuścińskeho, a cenu Švédsko-dánskeho kultúrneho fondu. Jej najnovšia kniha 1947 je ambicióznym historicko-reportážnym projektom, v ktorom Asbrink rekonštruuje jediný povojnový rok – 1947 – rok, ktorý formoval aj našu prítomnosť.');


--
-- Data for Name: authors_book; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.authors_book VALUES (2, 2);
INSERT INTO public.authors_book VALUES (1, 1);
INSERT INTO public.authors_book VALUES (1, 3);
INSERT INTO public.authors_book VALUES (4, 4);
INSERT INTO public.authors_book VALUES (3, 1);


--
-- Data for Name: awards; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.awards VALUES (1, 'Top kniha', 1);
INSERT INTO public.awards VALUES (2, 'Best kniha', 3);
INSERT INTO public.awards VALUES (3, 'VYsoke', 2);
INSERT INTO public.awards VALUES (4, 'Ocenenie', 2);


--
-- Data for Name: book_genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.book_genre VALUES (1, 1);
INSERT INTO public.book_genre VALUES (1, 2);
INSERT INTO public.book_genre VALUES (2, 2);
INSERT INTO public.book_genre VALUES (2, 3);
INSERT INTO public.book_genre VALUES (3, 3);


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.books VALUES (1, '60-200-2201-2', 'Stopařův průvodce Galaxií 4. Sbohem', 2022, 122, 'Čtvrtá část bravurní parodie na sci-fi, která je dnes již klasickým dílem. Ve vesmíru se může stát cokoliv a tak i odstrkovaný tvor, jako je Pozemšťan Arthur Dent, může slavit svou hvěznou hodinu. Čtvrtá část stopařského cyklu je věnovaná z velké části jemu a jeho milostnému románku.', 1, 4);
INSERT INTO public.books VALUES (2, '80-220-1361-7', 'Moje obľúbené strašidlá', 1970, 206, 'Devätnásť príbehov slávneho režiséra, špecialistu na hrôzy, vraždy a krváky, zaradených do tejto knihy pobaví `a príjemne vyľaká každého`, ako hovorí sám Alfred Hitchcock. Nečudo, keď sa v nich stretávame s pestrou zbierkou neľútostných sadistov, krvilačných bláznov, úchylných čudákov, huspeninovitých prízrakov bez kostí, cvičenými psami, čo na rozkaz prehryznú človeku hrdlo, a všelijakými inými netvormi v ľudskej, zvieracej či nejakej inej neidentifikovateľnej podobe. Často vás môže pomýliť ich nenápadný zovňajšok. Veď kto by z niečoho podozrieval neškodnú starú dievku, malého odstrkovaného chlapca, ženu s prísnymi morálnymi zásadami, váženého profesora či starého vojnového veterána? O to väčšie je však prekvapenie a spúšť, ktorú zlo za sebou zanecháva, keď mu spadne maska a má voľné ruky.', 1, 1);
INSERT INTO public.books VALUES (3, '60-223-2131-2', 'Stopařův průvodce Galaxií. Omnibus', 2021, 100, 'Ano, stopovat po Galaxii se dá, dokonce za méně než třicet altairských dolarů na den. Zde je seznam toho, co k tomu budete potřebovat: pivo; parťáka, který už má projetou většinu galaktických barů a ví, jak přežít i bez altairských dolarů; ručník; pouze reziduální pud sebezáchovy; vstřícnost k jiným formám života. Co potřebovat nebudete: vlastní kosmickou loď, společenský oděv, jazykové příručky. Co byste možná potřebovali, ale nejspíš to neseženete: čaj. A nesmí vás znervózňovat, že se možná nestihnete dostat na Vánoce domů. To je přesně případ Arthura Denta, kterému bez přehánění hoří Země pod nohama, a ať chce nebo nechce, vydat se stopem nekonečnou rozlohou prostoru a času je pořád lepší, než spolu se zbytkem lidstva padnout za oběť budování dopravní infrastruktury.

Proslulé dílo galaktického stopaře Douglase Adamse vydáváme v jediném svazku s ilustracemi Pavla Trávníčka a Vládi Chalupy.', 1, 4);
INSERT INTO public.books VALUES (4, '70-200-1233-3', 'Micsoda fény!', 2005, 144, 'Keserédes történet az első szerelemről, a megbocsátás erejéről és a második esélyekről. Arról, hogyan lásd meg a másik valódi személyiségét. Sierra csak átmenetileg lakik a városban: a családjával minden évben eltöltenek itt egy rövid időszakot. Ez idő alatt a lány megpróbál érzelmileg távol maradni a fiúktól – Caleb pedig épp azon dolgozik, hogy megbocsásson önmagának, miután egy szörnyű tettet vitt véghez. A fiú szerint: mindenkinek lehet néha rossz napja. De csak akkor kezd el hinni ebben igazán, miután megismerte Sierrát. Nevettem, tapsikoltam, sírtam és hát igen, teljesen beleestem Sierrába, Calebbe és ebbe a tökéletesen megírt, bájos történetbe.”', 2, 3);


--
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.contact VALUES (1, 'adsfads', 'adsfas', 'asdf', 'adsf', false);
INSERT INTO public.contact VALUES (100, 'meno1', 'email', 'subject', 'message', true);
INSERT INTO public.contact VALUES (101, 'meno2', 'email', 'subject', 'message', false);


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.genres VALUES (1, 'Sci-fi');
INSERT INTO public.genres VALUES (2, 'Fantasy');
INSERT INTO public.genres VALUES (3, 'Rozprávka');
INSERT INTO public.genres VALUES (4, 'Thriler');


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.languages VALUES (1, 'Slovenský');
INSERT INTO public.languages VALUES (2, 'Anglický');
INSERT INTO public.languages VALUES (3, 'Nemecký');
INSERT INTO public.languages VALUES (4, 'Francúzsky');
INSERT INTO public.languages VALUES (5, 'Taliansky');


--
-- Data for Name: reservation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.reservation VALUES (4, 100004, 'asdf');
INSERT INTO public.reservation VALUES (5, 100005, 'miro@gmail.com');


--
-- Data for Name: reservation_book; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.reservation_book VALUES (4, 2);
INSERT INTO public.reservation_book VALUES (5, 1);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (1, 'admin', 'YWRtaW4=');
INSERT INTO public.users VALUES (2, 'special', 'c3BlY2lhbA==');
INSERT INTO public.users VALUES (3, 'tajny', 'aGVzbG8=');


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: awards awards_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_pk PRIMARY KEY (id);


--
-- Name: books book_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT book_pk PRIMARY KEY (id);


--
-- Name: contact contact_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_pk PRIMARY KEY (id);


--
-- Name: genres genre_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genre_pk PRIMARY KEY (id);


--
-- Name: languages language_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT language_pk PRIMARY KEY (id);


--
-- Name: reservation reservation_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pk PRIMARY KEY (id);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- Name: awards_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX awards_id_uindex ON public.awards USING btree (id);


--
-- Name: awards_name_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX awards_name_uindex ON public.awards USING btree (name);


--
-- Name: contact_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX contact_id_uindex ON public.contact USING btree (id);


--
-- Name: language_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX language_id_uindex ON public.languages USING btree (id);


--
-- Name: reservation_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX reservation_id_uindex ON public.reservation USING btree (id);


--
-- Name: users_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_id_uindex ON public.users USING btree (id);


--
-- Name: authors_book authors_book_authors_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors_book
    ADD CONSTRAINT authors_book_authors_id_fk FOREIGN KEY (author_id) REFERENCES public.authors(id);


--
-- Name: authors_book authors_book_book_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors_book
    ADD CONSTRAINT authors_book_book_id_fk FOREIGN KEY (book_id) REFERENCES public.books(id);


--
-- Name: book_genre book_genre_book_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_genre
    ADD CONSTRAINT book_genre_book_id_fk FOREIGN KEY (book_id) REFERENCES public.books(id);


--
-- Name: book_genre book_genre_genres_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_genre
    ADD CONSTRAINT book_genre_genres_id_fk FOREIGN KEY (genre_id) REFERENCES public.genres(id);


--
-- Name: reservation_book reservation_book_books_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation_book
    ADD CONSTRAINT reservation_book_books_id_fk FOREIGN KEY (book_id) REFERENCES public.books(id);


--
-- Name: reservation_book reservation_book_reservation_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation_book
    ADD CONSTRAINT reservation_book_reservation_id_fk FOREIGN KEY (reservation_id) REFERENCES public.reservation(id);


--
-- PostgreSQL database dump complete
--

