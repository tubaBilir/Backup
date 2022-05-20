@isTest 
public class SFDC_Coindesk_IntegrationTest {

@isTest 
static void getBitcoinPriceTest(){
     //set the mock calllout or mock response
     test.setMock(HttpCalloutMock.class, new SFDC_Coindesk_IntegrationMock());

     Test.startTest();
     SFDC_Coindesk_Integration.getBitcoinPrice();
     Test.stopTest();
}
   
} //100% code coverage
