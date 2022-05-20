/*Name:SFDC_WS_Integration
Author:Tuba
Functunality:To call the WS API s
CreatedDate:10 May 2022
*/

public class SFDC_WS_Integration {
    public static void getCurrentWeatherInfo(string cityName) {
        if(cityName!= null && string.isNotBlank(cityName)){
            //'http://api.weatherstack.com/current?access_key=f6d3ff1cd2857fcf6ced5e6336e1c661&query=Miami'
            string endPoint = 'http://api.weatherstack.com/current?access_key=' + system.label.WeatherStackApiKey + '&query=' + cityName;
            //string endPoint = 'http://api.weatherstack.com/current?access_key=f6d3ff1cd2857fcf6ced5e6336e1c661&query= + cityName; boyle de hard coded olabilir, ustteki satirla ayni

            HttpRequest request = new HttpRequest(); //Request instance create http request
            request.setEndpoint(endPoint); 
            request.setMethod('GET'); 

            Http httpInstance = new Http(); // Http protocol

            //Send request
            HttpResponse response =  httpInstance.send(request); // Response instance

            System.debug( 'Status Code ' +response.getStatusCode());
            System.debug('Booody ' + response.getBody());

            //Check if status code is 200
            if(response.getStatusCode() ==200){
                WeatherStackResponse__c wsApi = new WeatherStackResponse__c();
                wsApi.Weather_Information__c = response.getBody();
                wsApi.City__c = cityName;

                try {
                    insert wsApi;
                } catch (Exception exp) {
                    
                }
            }
        }
    }


//Anonymous Part:
//SFDC_WS_Integration.getCurrentWeatherInfo('Indiana');
//SFDC_WS_Integration.getCurrentWeatherInfo('London,%20United%20Kingdom');
//SFDC_WS_Integration.getCurrentWeatherInfo('Istanbul,%20Turkey');


}
