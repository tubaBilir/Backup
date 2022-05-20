public class Wednesday {

    public static void listSum(list<integer> listint){
        integer listSize = listint.size();
        integer sum = 0;
        for (integer i =0 ; i< listSize ; i++) {
            sum += listint[i];
            //sum = sum+ listInt[i]; boyle de yazilir

            system.debug(listint + 'listesinin elemanlari toplami ' + sum);

            listint.sort();
            System.debug(listint);
            System.debug('En kucuk eleman ' + listint[0]);
            System.debug('En buyuk eleman ' + listint[listSize-1]);


        }
    }




    public static void tasKagitMakas(string tkm){
        integer randomNum = Math.round(Math.random()*2);
        string computer = '';
        if(randomNum == 0){
            computer ='Tas';
        }else if(randomNum ==1){
            computer ='Kagit';
        }else{
            computer = 'Makas';
        }
        System.debug(computer);

        string me = tkm.toLowerCase().trim();
        if (me== 'Tas' || me == 'Kagit' || me== 'Makas') {
            if(computer== me){
                system.debug('Berabereee');
        } else if (me == 'Tas' && computer == 'Makas'){
            system.debug('Ben kazandim');
        } else if (me == 'Kagit ' && computer == 'Tas'){
            system.debug('Ben kazandim');
        } else if (me == 'Makas ' && computer == 'Kagit'){
            system.debug('Ben kazandim');
        } else {
            system.debug('Bilgisayar kazandi');
        }
        } else {
            system.debug('Hatali yazdiniz. Duzgun yazin');
        }
    }


    /*public string printString(string str) {
        string yer = 'Usa' + str;
        return yer ;
    }

    public void stringMethod1(string abc){
        system.debug('Gelen metodu yazdiriyor => ' +abc);
        }

    public void integerMethod1(integer num1, integer num2){
    decimal blm = num1 / num2;
    system.debug(blm);
    }

    public integer stringMethod2(string str){
    integer lng= str.length();
    return lng;

    }

    public integer integerMetot2 (integer a){
        string str1 =string.valueOf(a);
        integer alng = str1.length();
        return alng;

    }

   public integer dateMetot(date dt){
   string dStr = string.valueOf(dt);
   integer dLng = dStr.length();
   return dLng;
   }


   public integer toplama(integer a, integer b){
   return a + b;

   }

   public integer carpma(integer c, integer d ){
   integer crp= c * d;
   return crp;
   } */

}
