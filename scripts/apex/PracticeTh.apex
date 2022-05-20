PracticeTh pt = new PracticeTh();
/*pt.Pmethod();
pt.otherMethod('Falcons not Eagles');

string letsSay = 'Come on!';
pt.otherMethod(letsSay);

string bn23 = 'Yeni Falconsss';
integer myINtt = 9999 ;
pt.anothaMethod(bn23, myINtt);*/

string ad1= pt.accessAddress('OfficeAddress');
system.debug('My Office ' + ad1);
string ad2= pt.accessAddress('CurrentAddress');
system.debug('My current address ' + ad2);
string ad3= pt.accessAddress('PermanentAddress');
system.debug('My permenant address ' + ad3);
string ad4= pt.accessAddress(null);
system.debug('AddressType is required to print an address value' + ad4 );