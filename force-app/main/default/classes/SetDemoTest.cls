@isTest
public with sharing class SetDemoTest {


    @isTest
    public static void SetDemoTest() {
        SetDemo.citySet();
        SetDemo.randomIntegerSet();
    }


 /*   
    @isTest
    public static void SetDemoTest2() {
        List<integer> myIntList = new List<integer>();
        myIntList.add(10);
        myIntList.add(3);
        myIntList.add(9);
        myIntList.add(9);

        set<integer> s = new set<integer>();
        s.addAll(myIntList);

        set<integer> expectedInt = SetDemo.setFromList(myIntList);
        system.assert(s, expectedInt);
    }

*/

    // 80% code coverage
   
}
