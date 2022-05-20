public class collectionSample {

    public static void collectionSample() {
        system.debug('Welcome to the world of Salesforce!');
    }

    public static string method1(integer numm){
    
    List<string> stringList = new List<string>();

    stringList.add('Karen');
    stringList.add('Adam');
    stringList.add('Susan');
    stringList.add('Rachel');
    stringList.add('Mike');

    string descrptn;

    if(numm < stringList.size()){
        descrptn = 'Hello ' + stringList[numm] + ' Welcome to the city of the list.';
    } else {
        descrptn = 'Sorry! You referred wrong index. Better luck next time!';
    }
    return descrptn;

    }

    public static void method2(List<integer> myList){
    
        integer listSize = myList.size();
        
        integer sumOfNum =0;

        for (Integer i = 0; i < listSize; i++) {
            sumOfNum += myList[i];
        }

        system.debug('Listemin sayilari toplami ' + sumOfNum );

        myList.sort();
        System.debug('Minimum number is ' + myList[0]);
        System.debug('Maximum number is ' + myList[listSize -1]);
        System.debug('Avarage number is ' + sumOfNum / listSize);
    }

}
