@isTest
public class ContactTriggerHandlerTest {
    // @isTest
    // private static void test1(){
    //     Account acc = new Account();
    //     acc.Name = 'Jimmy';
    //     insert acc;

    //     Contact con = new Contact();
    //     con.LastName = 'Jimmy Contact';
    //     con.AccountId = acc.Id;
    //     insert con;

    //     con.Description = 'test description';
    //     update con;

    //     delete con;
    // }


   
    @isTest
    public static void passiveContactTest() { //100% code coverage but fails, something wrong with whole page

        Account acc = new Account();
        acc.Name = 'Montessori';
        acc.Need_Info__c = false;
        insert acc;

        List<Contact> conList = new List<Contact>();

        Contact con = new Contact();
        con.LastName = 'Rachael Frtdesk';
        con.AccountId = acc.Id;
        con.Passive__c = true;
        conList.add(con);

        Contact con1 = new Contact();
        con1.LastName = 'Luise Frodesk';
        con1.AccountId = acc.Id;
        con1.Passive__c = false;
        conList.add(con1);
        
        Contact con2 = new Contact();
        con2.LastName = 'Monica Frontdk';
        con2.AccountId = acc.Id;
        con2.Passive__c = true;
        conList.add(con2);

        Contact con3 = new Contact();
        con3.LastName = 'Yonica Frontdes';
        con3.AccountId = acc.Id;
        con3.Passive__c = true;
        conList.add(con3);

        insert conList;

        List<Account> accList = [select id, name, Need_Info__c from Account where name = 'Montessori'];

        system.assertEquals(true, accList[0].Need_Info__c );
        
    }








}