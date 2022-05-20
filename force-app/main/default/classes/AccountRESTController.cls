@RestResource(urlMapping = '/fetchallaccounts')
global class AccountRESTController {
    
    @HttpGet
    global static List<Account> queryAllAccounts() {
        
        /* URL =  https://demoorg9-dev-ed.my.salesforce.com/services/apexrest/fetchallaccounts?type=Prospect&name=abc
         * host =
         * domain = https://demoorg9-dev-ed.lightning.force.com/
         * path = /services/apexrest/fetchallaccounts
         * search/params = type=Prospect
         */
        RestRequest reqInstance = RestContext.request; // Context Of Request
        Map<String, String> paramMap = reqInstance.params;
        
        String type = paramMap.get('type');
        String name = paramMap.get('name');

        return [SELECT Id, Name, Phone, Type FROM Account WHERE Type = :type AND name = : name];
    }
}

