Pazar p = new Pazar();
    p.sum();
    p.sub();
    p.multply();
    p.divide();
    p.fullName();
    p.yashesap();

// cls ta baglantisi yok sadece apexte bu kisim
    integer a= 10;
    integer b= 2;
        if(a>b){
        system.debug('a sayisi b den buyuktur');
        } else if(b>a) {
        system.debug('b sayisi a den buyuktur');
        }else{
        system.debug('a sayisi b ye esittir');
        }

string str = 'Kek';
integer btr = 5 ;
decimal siparis = Pazar.totalAmount(str , btr);
system.debug(btr + 'Tane ' + str + 'urununun toplam fiyati ' + siparis );


Pazar.printNum(11);


Pazar.stringRepeat('  Say my name', 5);



