public class Cat {

    public string name = '';
    public string color = '';

    public Cat() { // Constractor icin anonymousta clas ismi ile new instance olusturmak gerek, constructor yeni bir obje create edilnce ulasilabilir
    //eger constructorda bir deger asssign edilirse new instance sart eger assign edilmemisse this ile anonymoustan cagrilir
    
        system.debug('Cat consturactor called');
    }

    public Cat(string n, string clr){
        name = n;
        color = clr;
    }



    public static integer toplaGel(List<integer> myList){
        integer calcul = 0;
        
        for (integer hepsi : myList) {
            calcul += hepsi;
        }
        return calcul;
    }

 
}
