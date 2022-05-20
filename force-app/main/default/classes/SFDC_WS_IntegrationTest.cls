@isTest
public class SFDC_WS_IntegrationTest {

    @isTest 
    public static void getCurrentWeatherInfoTest() {
        //set the mock calllout or mock response
        test.setMock(HttpCalloutMock.class, new SFDC_WS_IntegrationMock());

        Test.startTest();
        SFDC_WS_Integration.getCurrentWeatherInfo('Houston');
        Test.stopTest();

    }
    
}
