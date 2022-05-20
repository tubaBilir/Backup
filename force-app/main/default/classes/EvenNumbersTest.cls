@isTest
public with sharing class EvenNumbersTest {
   

    @isTest
    public static void findEven() {
        List<integer> myInt = new  List<integer>();
        myInt.add(10);
        myInt.add(5);
        myInt.add(2);
        integer resultInt = EvenNumbers.EvenNum(myInt);
        system.assertEquals(2, resultInt);    
    }
}
//%100 code coverage