public  class Pazar {
    public void sum(){
        integer num1 = 12;
        integer num2 = 23;
        integer sum = num1 + num2 ;

        system.debug('Iki sayinin toplami => '+ sum);
    }

    public void sub(){
        integer num1 = 12;
        integer num2 = 23;
        integer sub = num1 - num2 ;

        system.debug('Iki sayinin cikarimi => '+ sub);

    }

    public void multply(){
        integer num1 = 12;
        integer num2 = 23;
        integer multply = num1 * num2 ;

        system.debug('Iki sayinin carpimi => ' + multply);

    }

    public void divide(){
        integer num1 = 12;
        integer num2 = 23;
        decimal divideNum = num1 / num2 ;

        system.debug('Iki sayinin bolumu => ' + divideNum);

    }

    public void fullName(){

        string firstName = 'John';
        string lastName = 'Snow';
        string full = firstName + lastName ;

        system.debug('Full Name is => ' + full);

    }

    public void yashesap(){
        date bugun = date.today();
        date myBirthDate = date.newInstance(1983, 1, 22);
        integer hesapla = myBirthDate.monthsBetween(bugun);
        system.debug(hesapla);
        integer age = hesapla / 12;
        system.debug('Yil olarak yasiniz => ' + age );
    }

    public static decimal totalAmount(string a, integer b ){
        decimal siparis = 0;
        if (a== 'Simit' ) {
            siparis = b * 2 ;
        }else if(a == 'Kek'){
            siparis = b * 3 ;
        }else if (a == 'Ekmek') {
            siparis = b*1;
        }else{
            system.debug('Urun kodu hatali');
        }
        return siparis;
    }

    public static void printNum(integer n){
        system.debug(n);
        for (Integer i = 1; i <= n; i++) {
            system.debug(i); 
        }
    }

    public static void stringRepeat(string str, integer n){
        string text= '';
        for (Integer i = 1; i <= n; i++) {
            text += str;
        }
        system.debug(text);
    }







    

}