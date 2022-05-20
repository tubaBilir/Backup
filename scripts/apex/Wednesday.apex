
List <integer> myList = new List<Integer>{14, 4, 58, 25, 7, 5, 2};
Wednesday.listSum(myList);





List <integer> myList = new List<Integer>();
myList.add(4);
myList.add(9);
myList.add(7);
myList.add(6);

system.debug('My integer list is ' + myList);
system.debug('Listemin 3. indexinde bulunan deger' + myList[3]);

List<String> myStr= new List<String>();

myStr.add('Ali');
myStr.add('Veli');
myStr.add('Ayse');
myStr.add('Hayriye');

system.debug('ayse var mi listede? ' + myStr.contains('Ayse'));
system.debug('Aysenin index numarasi ' + myStr.indexOf('Ayse'));

system.debug('My string list is ' + myStr);
system.debug('My string listemdeki ilk deger  ' + myStr[0]);



list<decimal> myDec = new list<decimal>{1, 4.5, 55, 5.7, 14};
system.debug(myDec);
system.debug(myDec[1]);





Wednesday wd = new Wednesday();



Wednesday.tasKagitMakas('Tas');
Wednesday.tasKagitMakas('Kagit');
Wednesday.tasKagitMakas('Makas');
Wednesday.tasKagitMakas('Tas');
Wednesday.tasKagitMakas('Maas');







/*string str1 = wd.printString('Bugun hava karli ');
system.debug(str1);

system.debug(wd.printString('Bugun hava yagisli'));

wd.integerMethod1(415, 10);
wd.integerMethod1(15464, 25);

string cml = 'merhaba dunyali';
wd.stringMethod1(cml);
integer a =wd.stringMethod2(cml);
system.debug('Cumlenin karakter uzunlugu ' + a );

integer b= 4244;
integer result = wd.integerMetot2(b);
system.debug ( b + 'sayisi ' + result + 'tane rakamdan olusuyor.');

date d = date.today();
integer result = wd.dateMetot(d);
system.debug( d + 'tarihinin karakter sayisi ' + result);

integer tpl = wd.toplama(11, 22);
integer crp = wd.carpma (11, 22);
system.debug(crp-tpl);
// diger yol
integer result = crp- tpl;
system.debug ('carpmadan toplamayi cikarma islemi sonucu' + result); */