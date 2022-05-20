public class SFDC_Coindesk_Integration {
   
public static void getBitcoinPrice() {

    //endpoint-https://api.coindesk.com/v1/bpi/currentprice.json
    //request body-no need we are not gonna sent any body
    //response body-yes
    //authentication- no need open api
    //method type-get


    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://api.coindesk.com/v1/bpi/currentprice.json');
    request.setMethod('GET');
  
    Http http = new Http();
    HttpResponse response = http.send(request);
    System.debug('SFDC Coindesk integration statusCode ' + response.getStatusCode());
    System.debug('SFDC Coindesk integration body= ' + response.getBody());


}


}
