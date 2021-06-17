# Dark Souls Journal #

Dokumentacija je kreirana 13.06.2020. koristeći portabilnu verziju programa <b>MarkdownPad 2</b>, a dovršena je 02.07.2020.

Autor ove dokumentacije, kao i ovog projekta, je Petar Poljarević.

## Uvod ##

<i>Dark Souls</i> je videoigra nastala 2011. godine, razvijena od strane japanske tvrtke <i>FromSoftware</i>, a objavljena od strane tvrtke <i>Namco Bandai</i> (također japanske). Po žanru je akcijska igra uloga iz trećeg lica, s naglaskom na vrlo izazovan gameplay.

U igri ne postoje nikakvi dnevnici pomoću kojih možete pratiti lokacije koje ste posjetili, predmete koje ste pronašli, niti informacije o neprijateljskim jedinicama s kojima ste se susreli (kao što je to slučaj u većini videoigara ovog tipa), već sve informacije morate ili pamtiti ili zapisivati pomoću papira i olovke.

Cilj ovog projekta bio je olakšati praćenje ovakvih i sličnih informacija pomoću relacijske baze <i>Oracle</i>, odnosno, simulirati papir i olovku na elegantan način.

## Tablice ##

U ovom poglavlju definirane su tablice, njihovi stupci, kao i njihove poveznice (relacije) s drugim tablicama.

### Item (predmet) ###

U igri postoje razne vrste predmeta koje se može dobiti na nekoliko različitih načina. Običnih (<i>regular</i>) predmeta u igri ima puno više nego što ih je uneseno u bazu, ali u bazi se nalaze svi oni koje sam smatrao važnima.

* `item_id`: Primarni ključ. Sastoji se od 8 znakova, pri čemu:
	* prva četiri znaka rezervirana su za podstring <i><b>item</b></i>
	* peti znak nam govori kojeg tipa je predmet, i to na sljedeći način:
		* <i><b>r</b></i> označava običan (<i><b>R</b>egular</i>) predmet
		* <i><b>w</b></i> označava oružje (<i><b>W</b>eapon</i>)
		* <i><b>s</b></i> označava svitak s čarolijom (<i><b>S</b>pell</i>)
		* <i><b>a</b></i> označava streljivo (<i><b>A</b>mmo</i>)
		* <i><b>m</b></i> označava materijal za nadogradnju oružja (<i><b>M</b>aterial</i>)
	* posljednja tri znaka rezervirana su za cijeli broj od 1 do 999 (uključivo)
* `item_name`: Naziv predmeta. Zbog načina na koji rade procedure za manipuliranje ovom tablicom, zahtijevamo da svaki predmet ima jedinstveno ime.

### Weapon class ###

Svako oružje pripada određenoj klasi te svaka klasa sadrži više instanci oružja. Klase se dosta razlikuju po izgledu, a obično imaju slične zahtjeve (<i>requirements</i>) za korištenje, kao i slične bonuse koje igrač dobiva ulaganjem u određene atribute (<i><b>STR</b></i>, <i><b>DEX</b></i>, <i><b>INT</b></i> i <i><b>FTH</b></i>)

* `weapon_class_id`: Primarni ključ. Sastoji se od četiri znaka, pri čemu su prva dva znaka rezervirana za podstring <i><b>wc</b></i> (molim bez komentara) koji označava tablicu <i><b>W</b>eapon <b>C</b>lass</i>, a preostala dva znaka rezervirana su za cijeli broj od 1 do 99 (uključivo).
* `class_name`: Naziv klase oružja. Mora biti jedinstven.

### Weapon (oružje) ###

Svako oružje nasljeđuje primarni ključ iz tablice <i><b>Item</b></i> i mora pripadati točno jednoj klasi (<i><b>Weapon class</b></i>). U bazi se nalaze sva oružja koja se mogu pronaći, kupiti ili dobiti na poklon te sam također dodao nekoliko različith varijanti nekih oružja koje možete napraviti sami, tek toliko da unesem malo raznovrsnosti u tablicu. Ukoliko se oružje dobiva isključivo na način da pretvorite neko obično oružje u njega (npr. <i><b>Claymore</b></i> u <i><b>Fire Claymore</b></i>), onda se to oružje neće nalaziti u drugim tablicama (<i><b>Ascension</b></i>, <i><b>Item drop</b></i>, <i><b>Item loot</b></i>...). To je napravljeno tako zbog određenih komplikacija koje su se dogodile prilikom kreiranja MEV-a.

* `item_id`: Primarni ključ, naslijeđen iz tablice <i><b>Item</b></i>. Obavezno započinje s <i><b>itemw</b></i>.
* `weapon_class_id`: Strani ključ
	* referencira se na tablicu <i><b>Weapon class</b></i>
	* označava tip (klasu) pojedinog oružja (npr. mač, sjekira, koplje...).

Ostali atributi vezani su uz samu igru, pa ne bih previše ulazio u detalje. Jedino što bih ovdje izdvojio su atributi koji sadrže `bonus` u imenu. Oni se sastoje od po jednog slova između <i><b>A</b></i> i <i><b>E</b></i> (uključivo), pri čemu <i><b>A</b></i> označava najbolju vrijednost, dok <i><b>E</b></i> označava drugu najlošiju (najlošija je <i><b>NULL</b></i>).

### Spell (čarolija) ###

Svaki svitak s čarolijom nasljeđuje primarni ključ iz tablice <i><b>Item</b></i>. Za korištenje čarolija potrebno je imati određenu klasu oružja.

* `item_id`: Primarni ključ, naslijeđen iz tablice <i><b>Item</b></i>. Obavezno započinje s <i><b>items</b></i>.
* `spell_type`: Postoje tri vrste čarolija:
	* <i><b>pyromancy</b></i>, koje uglavnom rade vatrenu štetu, a koristi ih se pomoću posebnog oružja <i><b>Pyromancy hand</b></i>
	* <i><b>sorcery</b></i>, koje uglavnom rade magičnu štetu ili služe za pojačavanje opreme, a koristi ih se pomoću čarobnih štapova (<i><b>Catalyst</b></i>)
	* <i><b>miracle</b></i>, koje uglavnom služe za liječenje, ali postoje i one namijenjene za borbu; koristi ih se pomoću čarobnih talismana

Ostali atributi vezani su uz samu igru, pa ne bih previše ulazio u detalje.

### Ammo (streljivo) ###

Svako streljivo nasljeđuje primarni ključ iz tablice <i><b>Item</b></i>. Streljivo je potrebno za tzv. <i>ranged</i> oružja (ne znam baš dobar prijevod na hrvatski), kao što su lukovi i samostreli.

* `item_id`: Primarni ključ, naslijeđen iz tablice <i><b>Item</b></i>. Obavezno započinje s <i><b>itema</b></i>.
* `ammo_type`: Postoje tri vrste streljiva, nazvanih po klasama oružja koje ih koriste: <i><b>Bow</b></i> (lukovi), <i><b>Crossbow</b></i> (samostreli) i <i><b>Greatbow</b></i> (divovski lukovi). Mora započinjati velikim slovom iz razloga što imena klasa oružja također započinju velikim slovom, pa će tada biti lakše povezati streljivo s klasama i oružjima.

Ostali atributi vezani su uz samu igru, pa ne bih previše ulazio u detalje.

### Material ###

Svaki materijal za nadogradnju nasljeđuje primarni ključ iz tablice <i><b>Item</b></i>. Svaka nadogradnja zahtijeva određenu količinu određenog materijala, no smatram da bi baza bila preopširna kada bih dodavao informacije o nadogradnjama.

* `item_id`: Primarni ključ, naslijeđen iz tablice <i><b>Item</b></i>. Obavezno započinje s <i><b>itemm</b></i>.

### Special effect (posebna moć) ###

<b>Na ovoj se tablici ne može raditi update.</b>

Neka oružja imaju posebne moći, pa na primjer mogu otrovati neprijatelja ili rade dodatnu štetu određenim vrstama neprijatelja. Svaka posebna moć spojena je s jednim oružjem, no jedno oružje može imati više različitih moćiju (rijetko, ali nije nemoguće).

* `item_id`: Strani ključ:
	* referencira se na tablicu <i><b>Weapon</b></i>
	* dio je primarnog ključa
	* govori nam na koje se oružje odnosi određena moć
* `effect_type`: Dio primarnog ključa. Postoji pet posebnih moći:
	* <i><b>bleeding</b></i> (krvarenje) i <i><b>poison</b></i> (otrov) su najčešće
	* <i><b>holy</b></i> (sveta) i <i><b>unholy</b></i> (mračna) moći su vrlo rijetke, no može ih se dobiti pretvaranjem oružja u njihove <i><b>Divine</b></i>, odnosno <i><b>Occult</b></i> varijante kod određenog kovača
	* <i><b>cursed</b></i> (ukleta) oružja su iznimno rijetka (postoje samo tri), a služe za borbu protiv određenih vrsta neprijatelja na lokaciji <i><b>New Londo Ruins</b></i>
* `aux_value`: Jačina posebne moći. U slučaju <i><b>cursed</b></i> moći, ovaj atribut mora imati vrijednost <i><b>NULL</b></i>.

### Location (lokacija) ###

Svaka lokacija je različita, kako po izgledu, tako i po vrstama neprijatelja koje na njoj obitavaju.

* `location_id`: Primarni ključ. Sastoji se od 6 znakova, pri čemu su prva tri rezervirana za podstring <i><b>loc</b></i> (<i><b>Loc</b>ation</i>), dok su preostala tri rezervirana za cijeli broj od 1 do 999 (uključivo).
* `location_name`: Naziv lokacije. Neke lokacije podijeljene su na dijelove radi lakšeg snalaženja (npr. lokacija <i><b>Undead Burg</b></i> podijeljena je na dva dijela: <i><b>upper</b></i> i <i><b>lower</b></i>). Svaka lokacija mora imati jedinstven naziv.

### Transit (prijelaz) ###

<b> Na ovoj se tablici ne može raditi update.</b>

Svaki prijelaz spaja točno dvije lokacije, ali postoje parovi lokacija koji su spojeni na više mjesta. Tijekom prijelaza ne odvijaju se nikakva učitavanja (osim prijelaza tipa <i><b>warp</b></i>), pa zbog toga igra doista izgleda kao jedan velik, povezan svijet.

* `location_from_id`: Strani ključ:
	* referencira se na tablicu <i><b>Location</b></i>
	* dio je primarnog ključa
	* govori nam s koje lokacije dolazimo ovim prijelazom
* `location_to_id`: Strani ključ:
	* referencira se na tablicu <i><b>Location</b></i>
	* dio je primarnog ključa
	* govori nam na koju lokaciju dolazimo ovim prijelazom
* `transit_number`: Dio primarnog ključa. Neki parovi lokacija spojeni su pomoću više prijelaza, pa nam treba nekakav brojač koji će identificirati svaki od tih prijelaza.
* `transit_type`: Vrsta prijelaza (npr. običan prijelaz, zaključana vrata, dizalo, borba protiv <i>boss</i> neprijatelja...)

### NPC (ne-igrajući lik) ###

Tijekom igre igrač se susreće s drugim, ne-igrajućim likovima te od njih ponekad može saznati određeni dio priče ili dobiti/kupiti određeni predmet. Neki likovi mogu biti vođe određene grupe, ali te su grupe uglavnom vezane za <i>online</i> komponentu igre, pa ih nisam dodavao u bazu. Neke likove možete susresti na više lokacija, ali svi osim dvojice (<i><b>Big Hat Logan</b></i> i <i><b>Domhnall of Zena</b></i>) imaju jednu "glavnu" lokaciju i samo na toj lokaciji možete od njih kupovati i/ili dobivati predmete, dok na ostalim lokacijama možete eventualno popričati s njima.

* `npc_id`: Primarni ključ. Sastoji se od 5 znakova, pri čemu:
	* prva tri znaka rezervirana su za podstring <i><b>npc</b></i> ili <i><b>mer</b></i> (<i><b>Mer</b>chant</i>)
		* obični likovi imaju primarni ključ koji započinje s <i><b>npc</b></i>
		* trgovci imaju primarni ključ koji započinje s <i><b>mer</b></i>
	* preostala dva znaka rezervirana su za cijeli broj od 1 do 99 (uključivo)
* `npc_name`: Naziv lika. Mora biti jedinstven.
* `covenant`: Boolean vrijednost koja nam govori je li taj lik vođa neke grupe (<i>covenant leader</i>).
* `firekeeper`: Boolean vrijednost koja nam govori je li taj lik čuvar vatre (<i>firekeeper</i>). Ne bih htio u detalje objašnjavati o čemu se radi, ali to je jako važna informacija, iako ih u igri ima samo troje.
* `location_id`: Strani ključ:
	* referencira se na tablicu <i><b>Location</b></i>
	* daje nam informaciju o tome gdje ćemo naći nekog određenog lika.

### Merchant (trgovac) ###

Svaki trgovac nasljeđuje primarni ključ iz tablice <i><b>NPC</b></i>. Trgovci raspolažu raznim predmetima, a neki trgovci su ujedno i kovači te mogu nadograđivati oružja ili ih pretvarati u druge varijante.

* `npc_id`: Primarni ključ, naslijeđen iz tablice <i><b>NPC</b></i>. Obavezno započinje s <i><b>mer</b></i>.
* `blacksmith`: Boolean vrijednost koja nam govori je li taj trgovac ujedno i kovač (<i>blacksmith</i>).

### Enemy (neprijatelj) ###

Postoje mnoge vrste neprijatelja, a neke od njih zahtijevaju posebnu strategiju da bi ih se pobijedilo. Gotovo svaka vrsta neprijatelja ima nekoliko instanci, pri čemu je svaka vrsta određena izgledom, nazivom i slabostima/otpornostima.

* `enemy_id`: Primarni ključ. Sastoji se od 6 znakova, pri čemu:
	* za obične neprijatelje, prva tri znaka su rezervirana za podstring <i><b>ene</b></i> (kao <i><b>Ene</b>my</i>), dok su preostala tri znaka rezrvirana za cijeli broj od 1 do 999 (uključivo)
	* za <i>boss</i> neprijatelje, prva četiri znaka su rezervirana za podstring <i><b>boss</b></i>, dok su preostala dva znaka rezervirana za cijeli broj od 1 do 99 (uključivo)
* `enemy_name`: Naziv vrste neprijatelja ili <i>boss</i>-a. Mora biti jedinstven.

Preostalih 5 atributa označava učinke određene vrste štete na pojedinu vrstu neprijatelja, pri čemu taj atribut može imati vrijednosti <i><b>weak to</b></i> (slabost), <i><b>resistant</b></i> (otpornost), <i><b>immune</b></i> (potpuna imunost) ili <i><b>NULL</b></i> (normalna šteta / nepoznato).

### Boss fight (<i>boss</i> borba) ###

Glavni dijelovi igre zapravo su borbe protiv <i>boss</i> neprijatelja. Neke su lakše, neke su teže, ali ono što im je svima zajedničko je da svaka borba ima vlastitu arenu te da u donjem dijelu ekrana jasno vidite koliko još štete morate nanijeti kojem neprijatelju. Svaka je borba vezana za određenu (točno jednu) lokaciju, no neke lokacije mogu sadržavati i više od jedne <i>boss</i> borbe, a neke ne sadrže niti jednu.

* `boss_fight_id`: Primarni ključ. Sastoji se od četiri znaka, pri čemu su prva dva rezervirana za podstring <i><b>bf</b></i> (<i><b>B</b>oss <b>F</b>ight</i>), dok su preostala dva rezervirana za cijeli broj od 1 do 99 (uključivo)
* `boss_fight_name`: Naziv <i>boss</i> borbe. Mora biti jedinstven.
* `location_id`: Strani ključ:
	* referencira se na tablicu <i><b>Location</b></i>
	* daje nam informaciju o tome na kojoj se lokaciji borba odvija (svaka <i>boss</i> borba ima vlastitu <i>arenu</i>)
* `souls`: Nenegativan cijeli broj koji nam govori koliko se duša (<i>souls</i>) dobije za uspješno završenu <i>boss</i> borbu.
* `lord`: Boolean vrijednost koja nam govori je li ovaj <i>boss</i> ujedno i <i>lord</i>. Pobjeda u borbi protiv sva četiri <i>lorda</i> nužna je za otvaranje posljednje lokacije u igri (<i><b>Kiln of the First Flame</b></i>).

### Boss ###

Svaki <i>boss</i> neprijatelj nasljeđuje primarni ključ iz tablice <i><b>Enemy</b></i> te je također vezan za određenu <i>boss</i> borbu (točno jednu), no neke <i>boss</i> borbe sadrže više od jednog <i>boss</i> neprijatelja (npr. <i><b>Ornstein & Smough</b></i> ili <i><b>Four Kings</b></i>).

* `enemy_id`: Primarni ključ, naslijeđen iz tablice <i><b>Enemy</b></i>. Obavezno započinje s <i><b>boss</b></i>.
* `boss_fight_id`: Strani ključ:
	* referencira se na tablicu <i><b>Boss fight</b></i>
	* govori nam u kojoj se <i>boss</i> borbi borimo protiv određenog <i>boss</i>-a
* `hp`: Prirodan broj koji nam govori koliko štete moramo nanijeti <i>boss</i>-u da bismo ga pobijedili (<i><b>H</b>it <b>P</b>oints</i>).

### Normal enemy (običan neprijatelj) ###

Svaki običan neprijatelj nasljeđuje primarni ključ iz tablice <i><b>Enemy</b></i>. Ova tablica služi isključivo za povezivanje tablica <i><b>Enemy</b></i> i <i><b>Enemy instance</b></i>.

* `enemy_id`: Primarni ključ, naslijeđen iz tablice <i><b>Enemy</b></i>. Obavezno započinje s <i><b>ene</b></i>. 

### Enemy instance (instanca neprijatelja) ###

Instanca neprijatelja određena je svojom vrstom (referenca na <i><b>Normal enemy</b></i>), lokacijom i, u većini slučajeva, nekim dodatnim nazivom. Naziv instance obično je dobiven od oružja koje ta instanca koristi, a može biti određen i nazivom lokacije na kojoj se ta instanca nalazi. Instance jedne vrste neprijatelja razlikuju se po tome koliko imaju <i>HP</i>-a, koliko donose duša, hoće li se oživjeti ako se budemo odmarali na <i>checkpointu</i>, a neke imaju i posebne informacije na koje treba obratiti pažnju.

* `enemy_id`: Strani ključ:
	* referencira se na tablicu <i><b>Normal enemy</b></i>
	* dio je primarnog ključa
	* govori nam koje je vrste određena instanca neprijatelja
* `instance_number`: Dio primarnog ključa. Neke vrste neprijatelja imaju više različitih instanci na istoj lokaciji, pa nam treba nekakav brojač koji će identificirati svaku od tih instanci.
* `instance_name`: Većina instanci ima neki svoj naziv (najčešće im kao naziv služi oružje koje koriste). Ukoliko se na određenoj lokaciji nalazi samo jedna različita instanca nekog neprijatelja, ovaj stupac će imati vrijednost <i><b>NULL</b></i>.
*  `location_id`: Strani ključ:
	* referencira se na tablicu <i><b>Location</b></i>
	* govori nam gdje se nalazi određena instanca neprijatelja
* `respawns`: Boolean vrijednost koja nam govori hoće li određena instanca neprijatelja oživjeti ako se budemo odmarali na <i>checkpointu</i> ili ne. Ova vrijednost je po defaultu <i><b>true</b></i>, budući da većina instanci hoće.
* `hp`: Prirodan broj koji nam govori koliko štete moramo nanijeti određenoj instanci neprijatelja da bismo ju pobijedili (<i><b>H</b>it <b>P</b>oints</i>). Ovaj atribut je obično različit kod različitih instanci.
* `souls`: Nenegativan cijeli broj koji nam govori koliko se duša (<i>souls</i>) ako određena instanca umre u blizini igrača (ne nužno od strane igrača).
* `notes`: Opcionalan atribut koji nam daje neke dodatne informacije o određenoj instanci neprijatelja (npr. neke instance neprijatelja odmah ožive nakon što umru, osim ako ih pobijedite određenom vrstom oružja).

### Ascension (pretvorba) ###

<b>Na ovoj se tablici ne može raditi update.</b>

Pretvorba se odvija na način da se oružje određene klase kombinira zajedno s dušom određenog <i>boss</i>-a (<i>boss soul</i>) kod kovača <i><b>Giant Blacksmith</b></i>. Ova tablica sadrži samo reference na tablice <i><b>Weapon</b></i>, <i><b>Boss</b></i> i <i><b>Weapon class</b></i> te nema nikakvih dodatnih atributa.

* `item_id`: Strani ključ:
	* referencira se na tablicu <i><b>Weapon</b></i>
	* dio je primarnog ključa
	* daje nam informaciju o tome koje ćemo oružje dobiti kao rezultat pretvorbe
* `enemy_id`: Strani ključ:
	* referencira se na tablicu <i><b>Boss</b></i>
	* dio je primarnog ključa
	* daje nam informaciju o tome čija duša je potrebna za pretvorbu
* `weapon_class_id`: Strani ključ:
	* referencira se na tablicu <i><b>Weapon class</b></i>
	* dio je primarnog ključa
	* daje nam informaciju o tome koja nam klasa oružja treba za pretvorbu (neka oružja možemo dobiti od više različitih klasa) 

### Tail cut (rezanje repa) ###

<b>Na ovoj se tablici ne može raditi update.</b>

Postoji nekoliko <i>boss</i>-ova i dvije vrste neprijatelja kojima se može odrezati rep i pritom dobiti novo oružje. Svaki neprijatelj može ovim putem dati najviše jedno oružje, ali neka se oružja mogu dobiti od više različitih neprijatelja. Ova tablica sadrži samo reference na tablice <i><b>Weapon</b></i> i <i><b>Enemy</b></i> te ne sadrži nikakve dodatne atribute (prvotno je trebala imati jedan dodatni atribut, ali taj atribut ovisi o verziji igre koju posjedujemo).

* `enemy_id`: Strani ključ:
	* referencira se na tablicu <i><b>Enemy</b></i>
	* dio je primarnog ključa
	* daje nam informaciju o tome kome treba odrezati rep
* `item_id`: Strani ključ:
	* referencira se na tablicu <i><b>Weapon</b></i>
	* dio je primarnog ključa
	* daje nam informaciju o tome koje oružje dobivamo kao rezultat rezanja

### Item drop (ispuštanje predmeta) ###

Većina neprijatelja može ispustiti nekakav predmet kada ih se pobijedi. Svaka instanca može ispustiti i više od jednog predmeta (a neke ne ispuštaju niti jedan) te isto tako, neke predmete možemo dobiti od više različitih instanci, kao i više različitih vrsta neprijatelja. Postoji poseban mehanizam kojim se može utjecati na vjerojatnost ispuštanja nekog predmeta, ali je prilično opširan pa ga nisam htio uvoditi u bazu.

* `enemy_id` + `instance_number`: Dvodjelni strani ključ:
	* referencira se na tablicu <i><b>Enemy instance</b></i>
	* dio je primarnog ključa
	* daje nam informaciju o tome koja instanca neprijatelja ispušta određeni predmet
* `item_id`: Strani ključ:
	* referencira se na tablicu <i><b>Item</b></i>
	* dio je primarnog ključa
	* daje nam informaciju o tome koji predmet će neprijatelj ispustiti
* `drop_quantity`: Koliko ćemo takvih predmeta dobiti. Ovaj atribut je po defaultu 1 i također je dio primarnog ključa, budući da neke instance neprijatelja mogu ispustiti jedan predmet, ali se ponekad dogodi da ispuste dva ili više takvih predmeta.
* `drop_chance`: Opisni atribut. Daje nam informaciju o tome koliko često možemo očekivati određeni predmet od određene instance neprijatelja.

### Item loot (skupljanje predmeta) ###

Jako velik broj predmeta možemo pronaći na različitim mjestima, a da se pritom ne moramo boriti protiv neprijatelja. Ako se neki predmet nalazi u ovoj tablici, to znači da će ga svaki igrač sigurno pronaći baš na tom mjestu svaki put kada bude prelazio igru, ali samo jednom po prelasku (<i>playthrough</i>). Velik broj predmeta možemo pronaći na više različitih mjesta, pa isto tako, gotovo svaka lokacija može sadržavati više od jednog predmeta za skupljanje.

* `location_id`: Strani ključ:
	* referencira se na tablicu <i><b>Location</b></i>
	* dio je primarnog ključa
	* daje nam informaciju o tome gdje ćemo pronaći određeni predmet
* `item_id`: Strani ključ:
	* referencira se na tablicu <i><b>Item</b></i>
	* dio je primarnog ključa
	* daje nam informaciju o tome koji predmet ćemo pronaći na određenoj lokaciji
* `loot_number`: Dio primarnog ključa. Neke predmete možemo naći na više različitih mjesta na istoj lokaciji, pa nam treba nekakav btojač koji će ih identificirati.
* `loot_quantity`: Koliko ćemo takvih predmeta dobiti. Ovaj atribut je po defaultu 1.
* `loot_type`: Na koji način ćemo skupiti određeni predmet. To mogu biti <i><b>chest</b></i> (u škrinji), <i><b>ground</b></i> (na tlu) ili <i><b>special</b></i> (npr. na lusteru).

### Item purchase (kupovina predmeta) ###

Trgovci i kovači mogu prodavati specifične vrste predmeta, a mogu biti i univerzalni. Ne prodaju svi trgovci iste predmete po istoj cijeni. Svi trgovci koriste istu valutu - duše (<i>souls</i>). U igri postoji jedan trgovac kojem se predmeti mogu i prodavati (svaki predmet po fiksnoj cijeni), ali njega nisam uključio u bazu, budući da se njemu može prodati apsolutno svaki predmet u igri, pa bi baza jednostavno pukla od tolikog broja unosa. Svaki trgovac može prodavati više različitih predmeta, pa isto tako, možemo velik broj predmeta kupiti kod nekoliko različitih trgovaca.

* `npc_id`: Strani ključ:
	* referencira se na tablicu <i><b>Merchant</b></i>
	* dio je primarnog ključa
	* daje nam informaciju o tome kod kojeg trgovca možemo kupiti određeni predmet
* `item_id`: Strani ključ:
	* referencira se na tablicu <i><b>Item</b></i>
	* dio je primarnog ključa
	* daje nam informaciju o tome koji predmet kupujemo
* `item_cost`: Cijena po kojoj kupujemo predmet kod određenog trgovca.

### Item gift (poklon) ###

Neki likovi (<i>NPC</i>) mogu dati igraču određene predmete kao poklon, ali obično za to postoje određeni uvjeti (npr. <i><b>Siegmeyer</b></i> će igraču dati svitak s čarolijom <i><b>Emit Force</b></i> ukoliko mu igrač pomogne u jednoj borbi). Ne daju svi likovi poklone igraču, ali neki mogu dati više različitih predmeta.

* `npc_id`: Strani ključ:
	* referencira se na tablicu <i><b>NPC</b></i>
	* dio je primarnog ključa
	* daje nam informaciju o tome od kojeg lika možemo dobiti određeni predmet
* `item_id`: Strani ključ:
	* referencira se na tablicu <i><b>Item</b></i>
	* dio je primarnog ključa
	* daje nam informaciju o tome koji predmet dobivamo na poklon
* `gift_condition`: Uvjet pod kojim igrač dobiva određeni predmet na poklon.

## Procedure i funkcije ##

U ovom poglavlju definirane su procedure i funkcije - što primaju, što rade i što vraćaju.

### Item ###

* `new_item`
	* procedura stvara novi predmet (obični)
	* <b>INPUT</b>
		* `p_name`
* `rename_item`
	* procedura preimenuje predmet (bilo kojeg tipa) u nešto drugo
	* <b>INPUT</b>
		* `p_old_name`
		* `p_new_name`
* `delete_item`
	* procedura briše predmet (bilo kojeg tipa) iz baze
	* <b>INPUT</b>
		* `p_name`

### Weapon class ###

* `new_weapon_class`
	* procedura služi za ručno stvaranje nove klase oružja
	* <b>INPUT</b>
		* `p_class_name`
* `new_weapon_class_out`
	* procedura služi za automatsko stvaranje nove klase oružja
	* <b>korisnik ju ne bi trebao pozivati ručno</b>
	* <b>INPUT</b>
		* `p_class_name`
	* <b>OUTPUT</b>
		* `p_o_class_id`
* `rename_weapon_class`
	* procedura preimenuje klasu oružja
	* <b>INPUT</b>
		* `p_old_name`
		* `p_new_name`
* `delete_weapon_class`
	* procedura briše klasu oružja iz baze
	* <b>INPUT</b>
		* `p_name`

### Weapon ###

* `new_weapon`
	* procedura stvara novo oružje
	* <b>INPUT</b>
		* `p_weapon_name`
		* `p_weapon_class`
		* `p_base_phys_dmg`
		* `p_base_spec_dmg`
		* `p_spec_dmg_type`
		* `p_weight`
		* `p_durability`
	* <b>OPTIONAL INPUT</b>
		* `p_str_req` - default <i><b>NULL</b></i>
		* `p_dex_req` - default <i><b>NULL</b></i>
		* `p_int_req` - default <i><b>NULL</b></i>
		* `p_fth_req` - default <i><b>NULL</b></i>
		* `p_str_bonus` - default <i><b>NULL</b></i>
		* `p_dex_bonus` - default <i><b>NULL</b></i>
		* `p_int_bonus` - default <i><b>NULL</b></i>
		* `p_fth_bonus` - default <i><b>NULL</b></i>
		* `p_upg_type` - default <i><b>?</b></i>
* `change_weapon_class`
	* procedura mijenja klasu određenog oružja
	* <b>INPUT</b>
		* `p_weapon_name`
		* `p_new_class`
* `change_weapon_dmg`
	* procedura mijenja `dmg` atribute određenog oružja
	* <b>INPUT</b>
		* `p_weapon_name`
		* `p_base_phys_dmg`
		* `p_base_spec_dmg`
		* `p_spec_dmg_type`
* `change_weapon_reqs`
	* procedure mijenja `req` atribute određenog oružja
	* <b>INPUT</b>
		* `p_weapon_name`
	* <b>OPTIONAL INPUT</b>
		* `p_str_req` - default <i><b>NULL</b></i> 
		* `p_dex_req` - default <i><b>NULL</b></i>
		* `p_int_req` - default <i><b>NULL</b></i>
		* `p_fth_req` - default <i><b>NULL</b></i>
* `change_weapon_scaling`
	* procedura mijenja `bonus` atribute određenog oružja
	* <b>INPUT</b>
		* `p_weapon_name`
	* <b>OPTIONAL INPUT</b>
		* `p_str_bonus` - default <i><b>NULL</b></i>
		* `p_dex_bonus` - default <i><b>NULL</b></i>
		* `p_int_bonus` - default <i><b>NULL</b></i>
		* `p_fth_bonus` - default <i><b>NULL</b></i>
* `change_weapon_other_stats`
	* procedura mijenja `weight` i `durability` atribute određenog oružja
	* <b>INPUT</b>
		* `p_weapon_name`
	* <b>OPTIONAL INPUT</b>
		* `p_weight` - default <i><b>NULL</b></i> 
		* `p_durability` - default <i><b>NULL</b></i>
* `weapon_upgrade`
	* procedura mijenja `upgrade_type` atribut određenog oružja
	* <b>INPUT</b>
		* `p_weapon_name`
		* `p_upg_type`

### Spell ###

* `new_spell`
	* procedura stvara novu čaroliju
	* <b>INPUT</b>
		* `p_spell_name`
		* `p_spell_type`
		* `p_slots`
		* `p_uses`
		* `p_effect_type`
	* <b>OPTIONAL INPUT</b>
		* `p_effect_subtype` - default <i><b>NULL</b></i>
		* `p_int_req` - default <i><b>NULL</b></i>
		* `p_fth_req` - default <i><b>NULL</b></i>
* `change_spell_type`
	* procedura mijenja tip čarolije s određenim nazivom
	* <b>INPUT</b>
		* `p_spell_name`
		* `p_new_type`
* `change_spell_effect`
	* procedura mijenja atribute `effect_type` i `effect_subtype` čaroliji s određenim nazivom
	* <b>INPUT</b>
		* `p_spell_name`
		* `p_effect_type`
	* <b>OPTIONAL INPUT</b>
		* `p_effect_subtype` - default <i><b>NULL</b></i>
* `change_spell_reqs`
	* procedura mijenja `req` atribute određene čarolije
	* <b>INPUT</b>
		* `p_spell_name` - naziv čarolije
	* <b>OPTIONAL INPUT</b>
		* `p_int_req` - default <i><b>NULL</b></i>
		* `p_fth_req` - default <i><b>NULL</b></i>
* `change_spell_other_stats`
	* procedura mijenja atribute `slots` i `uses` čaroliji s određenim nazivom
	* <b>INPUT</b>
		* `p_spell_name`
		* `p_slots`
		* `p_uses`

### Ammo ###

* `new_ammo`
	* procedura stvara novo streljivo
	* <b>INPUT</b>
		* `p_ammo_name`
		* `p_ammo_type`
		* `p_phys_dmg`
		* `p_spec_dmg`
		* `p_dmg_type`
* `change_ammo_type`
	* procedura mijenja tip streljiva s određenim nazivom
	* <b>INPUT</b>
		* `p_ammo_name`
		* `p_new_type`
* `change_ammo_dmg`
	* procedura mijenja `dmg` atribute određenog streljiva
	* <b>INPUT</b>
		* `p_ammo_name`
		* `p_phys_dmg`
		* `p_spec_dmg`
		* `p_dmg_type`

### Material ###

* `new_material`
	* procedura stvara novi materijal za nadogradnju
	* <b>INPUT</b>
		* `p_material_name`

### Special effect ###

* `add_weapon_effect`
	* procedura dodaje novu posebnu moć određenom oružju
	* <b>INPUT</b>
		* `p_weapon_name`
		* `p_effect_type`
		* `p_aux_value`
* `remove_weapon_effect`
	* procedura uklanja posebnu moć određenog tipa s određenog oružja
	* <b>INPUT</b>
		* `p_weapon_name`
		* `p_effect_type`

### Location ###

* `new_location` 
	* procedura dodaje novu lokaciju
	* <b>INPUT</b>
		* `p_name`
* `rename_location`
	* procedura preimenuje lokaciju
	* <b>INPUT</b>
		* `p_old_name`
		* `p_new_name`
* `delete_location`
	* procedura briše lokaciju iz baze
	* <b>INPUT</b>
		* `p_name`

### Transit ###

* `new_transit`
	* procedura dodaje novi prijelaz
	* <b>INPUT</b>
		* `p_location_from`
		* `p_location_to`
		* `p_transit_type`
* `disconnect_locations`
	* procedura uklanja sve prijelaze za određeni par (ne uređeni par) lokacija 
	* <b>INPUT</b>
		* `p_location_from`
		* `p_location_to`
* `count_connections`
	* funkcija vraća broj lokacija s kojima je predana lokacija povezana
	* <b>INPUT</b>
		* `p_location`
	* <b>RETURN</b>
		* vrijednost tipa `INTEGER`

### NPC & Merchant ###

* `new_npc`
	* procedura dodaje novog lika
	* <b>INPUT</b>
		* `p_name`
		* `p_location`
	* <b>OPTIONAL INPUT</b>
		* `p_covenant` - default '0'
		* `p_firekeeper` - default '0'
* `new_merchant`
	* procedura dodaje novog trgovca
	* <b>INPUT</b>
		* `p_name`
		* `p_location`
	* <b>OPTIONAL INPUT</b>
		* `p_blacksmith` - default '0'
* `rename_npc`
	* procedura preimenuje lika / trgovca
	* <b>INPUT</b>
		* `p_old_name`
		* `p_new_name`
* `delete_npc`
	* procedura briše lika / trgovca iz baze
	* <b>INPUT</b>
		* `p_name`

### Boss fight ###

* `new_boss_fight`
	* procedura dodaje novu <i>boss</i> borbu u bazu
	* <b>INPUT</b>
		* `p_name`
		* `p_location`
		* `p_souls` - default 0
		* `p_lord` - default '0'
* `update_boss_fight`
	* procedura mijenja vrijednosti atributa `souls` i `lord`, ukoliko su oni proslijeđeni
	* <b>INPUT</b>
		* `p_name`
		* `p_souls` - default 0
		* `p_lord` - default 'X'

* `delete_boss_fight`
	* procedura briše <i>boss</i> borbu iz baze
	* <b>INPUT</b>
		* `p_name`

### Boss ###

* `new_boss`
	* procedura dodaje novog <i>boss</i> neprijatelja u bazu
	* <b>INPUT</b>
		* `p_name`
		* `p_fight`
	* <b>OPTIONAL INPUT</b>
		* `p_hp` - default 1

### Normal enemy ###

* `new_enemy_type`
	* procedura ručno dodaje novu vrstu (običnog) neprijatelja u bazu
	* <b>INPUT</b>
		* `p_name`
* `new_enemy_type_out`
	* procedura automatski dodaje novu vrstu (običnog) neprijatelja u bazu
	* <b>korisnik ju ne bi trebao pozivati ručno</b>
	* <b>INPUT</b>
		* `p_name`
	* <b>OUTPUT</b>
		* `p_o_id`

### Enemy instance ###

* `new_enemy_instance`
	* procedura dodaje novu instancu određene vrste neprijatelja u bazu
	* također stvara novu vrstu neprijatelja, ukoliko ta vrsta već ne postoji u bazi
	* <b>INPUT</b>
		* `p_enemy_type`
		* `p_inst_name`
		* `p_location`
	* <b>OPTIONAL INPUT</b>
		* `p_respawns` - default 1
		* `p_hp` - default 1
		* `p_souls` - default 0
		* `p_notes` - default <i><b>NULL</b></i>
* `rename_enemy_instance`
	* procedura preimenuje određenu instancu neprijatelja (na određenoj lokaciji)
	* <b>INPUT</b>
		* `p_enemy_type`
		* `p_location`
		* `p_old_name`
		* `p_new_name`
* `delete_enemy_instance`
	* procedura briše određenu instancu neprijatelja (na određenoj lokaciji)
	* <b>INPUT</b>
		* `p_enemy_type`
		* `p_inst_name`
		* `p_location`
* `get_inst_number_out`
	* procedrura pronalazi sve instance neprijatelja određene vrste i određenog naziva te vraća kursor na sve brojeve instanci koji odgovaraju navedenim kriterijima
	* <b>korisnik ju ne bi trebao pozivati ručno</b>
	* ukoliko se kao naziv instance pošalje riječ 'all', procedura će vratiti kursor na sve instance određene vrste neprijatelja
	* <b>INPUT</b>
		* `p_enemy_id`
		* `p_inst_name`
	* <b>OUTPUT</b>
		* `p_o_cursor`
* `update_enemy_instance`
	* procedura mijenja sve atribute određene instance neprijatelja koji su joj predani
	* <b>INPUT</b>
		* `p_enemy_type`
		* `p_inst_name`
		* `p_location`
	* <b>OPTIONAL INPUT</b>
		* `p_respawns` - default 'X'
		* `p_hp` - default -1
		* `p_souls` - default -1
		* `p_notes` - default 'Nothing specific'

### Enemy & Boss ###

* `rename_enemy_or_boss`
	* procedura preimenuje određenu vrstu neprijatelja / <i>boss</i> neprijatelja
	* <b>INPUT</b>
		* `p_old_name`
		* `p_new_name`
* `delete_enemy_or_boss`
	* procedura briše određenu vrstu neprijatelja / <i>boss</i> neprijatelja
	* <b>INPUT</b>
		* `p_name`
* `update_enemy_dmg`
	* procedura mijenja sve `dmg` atribute određene vrste neprijatelja / <i>boss</i> neprijatelja koji su joj predani
	* <b>INPUT</b>
		* `p_name`
	* <b>OPTIONAL INPUT</b>
		* `p_mag_dmg` - default '###'
		* `p_fir_dmg` - default '###'
		* `p_lig_dmg` - default '###'
		* `p_holy_dmg` - default '###'
		* `p_unholy_dmg` - default '###'

### Ascension ###

* `new_ascension`
	* procedura spaja vrijednosti iz tablica <i><b>Weapon</b></i>, <i><b>Boss</b></i> i <i><b>Weapon class</b></i> te dodaje novi redak u tablici <i><b>Ascension</b></i> 
	* <b>INPUT</b>
		* `p_weapon_name`
		* `p_boss_name`
		* `p_class_req`
* `delete_ascension`
	* procedura briše sve retke u tablici <i><b>Ascension</b></i> koji zadovoljavaju predane parametre
	* svaki parametar različit od <i><b>NULL</b></i> označava preciznije brisanje, dok svaki parametar jednak <i><b>NULL</b></i> označava općenitije brisanje
	* <b>OPTIONAL INPUT</b>
		* `p_weapon_name` - default <i><b>NULL</b></i>
		* `p_boss_name` - default <i><b>NULL</b></i>
		* `p_class_req` - default <i><b>NULL</b></i>

### Tail cut ###

* `new_tail_cut`
	* procedura spaja vrijednosti iz tablica <i><b>Weapon</b></i> i <i><b>Enemy</b></i> te dodaje novi redak u tablici <i><b>Tail cut</b></i>
	* <b>INPUT</b>
		* `p_weapon_name`
		* `p_enemy_name`
* `delete_tail_cut`
	* procedura briše sve retke u tablici <i><b>Tail cut</b></i> koji zadovoljavaju predane parametre
	* svaki parametar različit od <i><b>NULL</b></i> označava preciznije brisanje, dok svaki parametar jednak <i><b>NULL</b></i> označava općenitije brisanje
	* <b>OPTIONAL INPUT</b>
		* `p_weapon_name` - default <i><b>NULL</b></i>
		* `p_enemy_name` - default <i><b>NULL</b></i>

### Item drop ###

* `new_item_drop`
	* procedura spaja vrijednosti iz tablica <i><b>Item</b></i> i <i><b>Enemy instance</b></i> te dodaje novi redak u tablici <i><b>Item drop</b></i>. 
	* <b>NAPOMENA: </b>Ukoliko se kao parametar `p_inst_name` proslijedi string <i><b>all</b></i>, procedura će dodati redak za svaku instancu te vrste neprijatelja.
	* <b>INPUT</b>
		* `p_item_name`
		* `p_enemy_type`
	* <b>OPTIONAL INPUT</b>
		* `p_inst_name` - default <i><b>NULL</b></i>
		* `p_quantity` - default 1
		* `p_chance` - default 'common'
* `update_item_drop`
	* procedura mijenja vrijednosti atributa `drop_quantity` i `drop_chance` (ako su predani) u tablici <i><b>Item drop</b></i> za određenu instancu neprijatelja i određeni predmet
	* <b>INPUT</b>
		* `p_item_name`
		* `p_enemy_type`
	* <b>OPTIONAL INPUT</b>
		* `p_inst_name` - default <i><b>NULL</b></i>
		* `p_quantity` - default <i><b>NULL</b></i>
		* `p_chance` - default <i><b>NULL</b></i>
* `delete_item_drop`
	* procedura briše sve retke u tablici <i><b>Item drop</b></i> koji zadovoljavaju predane parametre
	* svaki parametar različit od <i><b>NULL</b></i> označava preciznije brisanje, dok svaki parametar jednak <i><b>NULL</b></i> označava općenitije brisanje
	* <b>OPTIONAL INPUT</b>
		* `p_item_name` - default <i><b>NULL</b></i>
		* `p_enemy_type` - default <i><b>NULL</b></i>
		* `p_location` - default <i><b>NULL</b></i>

### Item loot ###

* `new_item_loot`
	* procedura spaja vrijednosti iz tablica <i><b>Item</b></i> i <i><b>Location</b></i> te dodaje novi redak u tablici <i><b>Item loot</b></i>
	* <b>INPUT</b>
		* `p_item_name`
		* `p_location`
		* `p_loot_type`
	* <b>OPTIONAL INPUT</b>
		* `p_quantity` - default 1
* `update_item_loot`
	* procedura mijenja vrijednost atributa `loot_quantity` (ako je predan) u tablici <i><b>Item loot</b></i> za određenu lokaciju, predmet i vrstu <i>loot</i>-a
	* <b>INPUT</b>
		* `p_item_name`
		* `p_location`
		* `p_loot_type`
	* <b>OPTIONAL INPUT</b>
		* `p_new_quan` - default <i><b>NULL</b></i>
* `delete_item_loot`
	* procedura briše sve retke u tablici <i><b>Item loot</b></i> koji zadovoljavaju predane parametre
	* svaki parametar različit od <i><b>NULL</b></i> označava preciznije brisanje, dok svaki parametar jednak <i><b>NULL</b></i> označava općenitije brisanje
	* <b>OPTIONAL INPUT</b>
		* `p_item_name` - default <i><b>NULL</b></i>
		* `p_location` - default <i><b>NULL</b></i>
		* `p_loot_type` - default <i><b>NULL</b></i>

### Item purchase ###

* `new_item_purchase`
	* procedura spaja vrijednosti iz tablica <i><b>Item</b></i> i <i><b>Merchant</b></i> te dodaje novi redak u tablici <i><b>Item purchase</b></i>
	* <b>INPUT</b>
		* `p_merchant`
		* `p_item_name`
	* <b>OPTIONAL INPUT</b>
		* `p_item_cost` - default <i><b>NULL</b></i>
* `update_item_cost`
	* procedura mijenja vrijednost atributa `item_cost` (ako je predan) u tablici <i><b>Item purchase</b></i> za određenog trgovca i određeni predmet
	* <b>INPUT</b>
		* `p_merchant`
		* `p_item_name`
	* <b>OPTIONAL INPUT</b>
		* `p_new_cost` - default <i><b>NULL</b></i>
* `delete_item_purchase`
	* procedura briše sve retke u tablici <i><b>Item purchase</b></i> koji zadovoljavaju predane parametre
	* svaki parametar različit od <i><b>NULL</b></i> označava preciznije brisanje, dok svaki parametar jednak <i><b>NULL</b></i> označava općenitije brisanje
	* <b>OPTIONAL INPUT</b>
		* `p_merchant` - default <i><b>NULL</b></i>
		* `p_item_name` - default <i><b>NULL</b></i>

### Item gift ###

* `new_gift`
	* procedura spaja vrijednosti iz tablica <i><b>Item</b></i> i <i><b>NPC</b></i> te dodaje novi redak u tablici <i><b>Item gift</b></i>
	* <b>INPUT</b>
		* `p_npc_name`
		* `p_item_name`
		* `p_condition`
* `update_gift_condition`
	* procedura mijenja vrijednost atributa `gift_condition` (ako je predan) u tablici <i><b>Item gift</b></i> za određenog lika i određeni predmet
	* <b>INPUT</b>
		* `p_npc_name`
		* `p_item_name`
	* <b>OPTIONAL INPUT</b>
		* `p_new_cond` - default '###'
* `delete_item_gift`
	* procedura briše sve retke u tablici <i><b>Item gift</b></i> koji zadovoljavaju predane parametre
	* svaki parametar različit od <i><b>NULL</b></i> označava preciznije brisanje, dok svaki parametar jednak <i><b>NULL</b></i> označava općenitije brisanje
	* <b>OPTIONAL INPUT</b>
		* `p_npc_name` - default <i><b>NULL</b></i>
		* `p_item_name` - default <i><b>NULL</b></i>

## Indeksi ##

U bazi ne postoje eksplicitno navedeni indeksi. Umjesto toga, svaki put kada zahtijevamo da su sve vrijednosti u određenom stupcu jedinstvene (bilo da se radi o primarnom ključu ili <i>UNIQUE</i> constraintu), stvori se indeks na tom stupcu. Slično, kada smo kao primarni ključ neke tablice naveli kombinaciju stupaca, stvorili smo indeks na toj kombinaciji stupaca.

Ovdje nisam naveo sve indekse, nego samo one najvažnije.

### Item ###

* `item_pk`: Indeks koji se nalazi na stupcu `item_id`. Npr. ako se u tablici <i><b>Item loot</b></i> nalazi primarni ključ nekog predmeta, ovaj će indeks ubrzati traženje njegovog naziva.
* `item_uq`: Indeks koji se nalazi na stupcu `item_name`. Npr. ako želimo u tablicu <i><b>Item drop</b></i> dodati neki predmet, treba nam njegov primarni ključ, a ovaj će indeks ubrzati traženje tog primarnog ključa.

Svaka tablica koja nasljeđuje primarni ključ iz ove tablice (<i><b>Weapon</b></i>, <i><b>Spell</b></i>, <i><b>Ammo</b></i> i <i><b>Material</b></i>) također ima indeks `[ime_tablice]`_pk na stupcu `item_id`. Značajnije ubrzanje osjetit će se jedino na tablici <i><b>Weapon</b></i>, budući da ona sadrži preko 100 redaka.

### Location ###

Ova tablica sadrži dva indeksa. Budući da ne sadrži prevelik broj redaka, neće se osjetiti preveliko ubrzanje tijekom upita nad njom, no ipak malo pomaže prilikom provjere je li naziv svake lokacije jedinstven.

* `location_pk`: Indeks koji se nalazi na stupcu `location_id`.
* `location_uq`: Indeks koji se nalazi na stupcu `location_name`.

### Enemy ###

Ova tablica sadrži preko 100 redaka, tako da će pretraživanje biti prilično brže zahvaljujući njenim indeksima.

* `enemy_pk`: Indeks koji se nalazi na stupcu `enemy_id`. Npr. ako se u tablici <i><b>Enemy instance</b></i> nalazi primarni ključ neke vrste neprijatelja, a nas zanima koja je to vrsta neprijatelja (kako se zove), ovaj indeks će ubrzati traženje tog naziva.
* `enemy_uq`: Indeks koji se nalazi na stupcu `enemy_name`. Npr. ako želimo u tablicu <i><b>Enemy instance</b></i> dodati novi redak, moramo prvo znati primarni ključ određene vrste neprijatelja. Ovaj indeks će ubrzati traženje tog primarnog ključa.

Tablice koje nasljeđuju primarni ključ iz ove tablice (<i><b>Normal enemy</b></i> i <i><b>Boss</b></i>) imaju malo neravnomjerno raspoređen broj redaka. Dok tablica <i><b>Enemy instance</b></i> ima oko 100 redaka i na njoj će indeks igrati neku ulogu, tablica <i><b>Boss</b></i> ima tek oko 30, što znači da njen indeks neće baš igrati značajnu ulogu tijekom upita nad njom.

### Enemy instance ###

* `enemy_instance_pk`: Indeks nad stupcima `enemy_id` i `instance_number`. Npr ako znamo primarni ključ određene vrste neprijatelja (saznali smo ju pomoću tablice <i><b>Enemy</b></i>) i želimo vidjeti na kojim se sve lokacijama može pronaći ta vrsta neprijatelja, upravo će nam ovaj indeks ubrzati traženje te informacije.

## Pogledi ##

Gotovo svi pogledi funkcioniraju po principu nevidljivih primarnih i stranih ključeva, a služe nam zato da bismo mogli vidjeti na što se točno referenciraju. Npr. tablica <i><b>Item loot</b></i> ne daje nam praktički nikakve korisne informacije, pa nam zato treba pogled koji će ju spojiti s tablicama na koje se referencira: <i><b>Item</b></i> i <i><b>Location</b></i>. U njima se nalaze informacije o nazivu predmeta i nazivu lokacije na koje se tablica <i><b>Item drop</b></i> referencira.

Ovdje su samo navedeni nazivi svih pogleda, upravo zato što ih i ja često zaboravim, a nazivi stupaca su većinom identični onima u tablicama.

* `all_item_view`
* `regular_item_view`
* `weapon_view`
* `weapon_class_view`
* `special_effect_view`
* `spell_view`
* `ammo_view`
* `material_view`
* `location_view`
* `transit_view`
* `all_npc_view`
* `npc_view`
* `merchant_view`
* `boss_fight_view`
* `boss_view`
* `enemy_view`
* `enemy_instance_view`
* `ascension_view`
* `tail_cut_view`
* `item_drop_view`
* `item_loot_view`
* `item_purchase_view`
* `item_gift_view`
