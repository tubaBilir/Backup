public class OnlyMe {

    public integer toplama(integer num1, integer num2) {
    integer tpl = num1 + num2 ;
    return tpl;
    }

    public integer carpma(integer num3, integer num4){
    integer crp= num3 * num4;
    return crp;
    }

    public void myPrintingMethod(string str){
        system.debug(str);
    }



    public static void shoppingList(){

    list<string> maList = new list<string>();
    maList.add('Elma');
    maList.add('Armut');
    maList.add('Muz');
    maList.add('Cilek');

    string index0Value = maList.get(0);
    string index2Value = maList.get(2);
    string index3Value = maList.get(3);

    system.debug(index0Value);
    system.debug(index2Value);
    system.debug(index3Value);

    for (string eachFruit : maList) {
        system.debug(eachFruit);
    }
    }

    public static integer toplamElementler(List<integer> RakamListesi){
        integer tplm = 0;

        for (integer hepsiToplam : RakamListesi) {
            tplm += hepsiToplam;
        }
        return tplm;
    }
  

    


}
