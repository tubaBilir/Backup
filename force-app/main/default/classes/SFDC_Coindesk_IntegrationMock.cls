//SFDC_Coindesk_IntegrationMock 
@isTest
public class SFDC_Coindesk_IntegrationMock implements HttpCalloutMock {
	
    public HttpResponse respond(HttpRequest request) { // nonstatic method yaziyoruz
        HttpResponse response = new HttpResponse();
        
        response.setStatus('Success');
        response.setStatusCode(200);
        
        String body = '{\"time\":{\"updated\":\"May11,202203:01:00UTC\",\"updatedISO\":\"2022-05-11T03:01:00+00:00\",\"updateduk\":\"May11,2022at04:01BST\"},\"disclaimer\":\"ThisdatawasproducedfromtheCoinDeskBitcoinPriceIndex(USD).Non-USDcurrencydataconvertedusinghourlyconversionratefromopenexchangerates.org\",\"chartName\":\"Bitcoin\",\"bpi\":{\"USD\":{\"code\":\"USD\",\"symbol\":\"$\",\"rate\":\"31,464.2835\",\"description\":\"UnitedStatesDollar\",\"rate_float\":31464.2835},\"GBP\":{\"code\":\"GBP\",\"symbol\":\"£\",\"rate\":\"25,485.7235\",\"description\":\"BritishPoundSterling\",\"rate_float\":25485.7235},\"EUR\":{\"code\":\"EUR\",\"symbol\":\"€\",\"rate\":\"29,794.5998\",\"description\":\"Euro\",\"rate_float\":29794.5998}}}';
        
        response.setBody(body);
        
        return response;
    }
}