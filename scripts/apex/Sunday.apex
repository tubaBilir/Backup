List<integer> listInteger = new List<integer>();
listInteger.add(52);
listInteger.add(13);
listInteger.add(14);
listInteger.add(23);

sunday.printEleman(listInteger);
system.debug( 'Listem = ' + listInteger);

system.debug( 'Listemin 3 numarali indexi get ile = ' + listInteger.get(3));
system.debug( 'Listemin 3 numarali indexi array ile = ' + listInteger[3]);
system.debug( 'Listemde 7 var mi? = ' + listInteger.contains(7));
system.debug( 'Listemde 23 var mi? = ' + listInteger.contains(23));


List<String> newList = new List<String>{'Mary' , 'John', 'Ben', 'Sam'};
Sunday.printName(newList);
Sunday.printReverse(newList);

List<String> newList2 = new List<String>();
Sunday.printName(newList2);



list<string> bookList1 = new list<string>();
bookList1.add('Sefiller');
bookList1.add('Faust');
bookList1.add('Savas ve Baris');
bookList1.add('Suc ve Ceza');

system.debug(bookList1);

list<string> bookList2 = new list<string>{'Safahat', 'Mona Roza', 'Cile', 'Yagmur'};
system.debug(bookList2);

list<string> bookList3 = new list<string>{'Das Capital', 'Kavgam', 'Magaradakiler', 'Uc Medeniyet'};
system.debug(bookList3);

set<string> setList = new set<string>();
setList.add(bookList1[0]);
setList.add(bookList2[0]);
setList.add(bookList3[0]);
system.debug(setList);

map<string, list<string>> mapList = new map<string, list<string>>();
mapList.put(bookList1[0], bookList1);
mapList.put(bookList2[0], bookList2);
mapList.put(bookList3[0], bookList3);
system.debug(mapList);


list<string> corbalar = new list<string> {'Mercimek Corbasi' , 'Tavuk Corbasi' , 'Yogurt Corbasi'};

list<string> malzemeler = new list<string>();
malzemeler.add('Mercimek, sogan, patates, yag, tuz');
malzemeler.add('Tavuk, sogan, sehriye, yag, tuz');
malzemeler.add('Yogurt, pirinc, nane, zeytinyagi, tuz');

map<string, string> tarif = new map<string, string>();
tarif.put(corbalar[0], malzemeler[0]);
tarif.put(corbalar[1], malzemeler[1]);
tarif.put(corbalar[2], malzemeler[2]);

system.debug(tarif);





list<string> fakulte = new list<string> {'Iletisim' , 'Edebiyat' , 'Guzel Sanatlar'};

list<string> bolumler = new list<string>();
bolumler.add('Reklamcilik, Sinema TV, Fotografcilik ');
bolumler.add('Felsefe, Sanat Tarihi, Sosyoloji');
bolumler.add('Grafik, Heykel, Seramik');

map<string, string> universite = new map<string, string>();
universite.put(fakulte[0], bolumler[0]);
universite.put(fakulte[1], bolumler[1]);
universite.put(fakulte[2], bolumler[2]);

system.debug(universite);


