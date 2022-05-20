@isTest
public class CalculatorTest {
  
    @isTest
    private static void testMessages(){
        Calculator.welcomeMessage(); // otomatik olarak execute edecek iki methodu mavi olmasi code coverage -successfully running
        Calculator.printNewMessage('This is test Method ');

    } //red lines means method cagirilmadi 
    //code coverega must be 95 at least 75

    @isTest
    private static void addTest1() {
        integer a =10;
        integer b= 15;
        integer calcAdd = calculator.add(a,b);    
        system.assertEquals(25, calcAdd);    
    }

    @isTest
    private static void addTest2() {
        integer calcAdd = calculator.add(10,15,25);    
       // system.assertEquals(50, calcAdd);    
    }

    @isTest
    private static void addTest3() {
        List<integer> listInt = new List<integer> ();
        integer a =10;
        integer b= 15;
        listInt.add(a);
        listInt.add(b);
        integer calcAdd = calculator.add(listInt);    
        system.assertEquals(25, calcAdd);    
    }



}
//All test methods are static
//return void  
//takes no parameter