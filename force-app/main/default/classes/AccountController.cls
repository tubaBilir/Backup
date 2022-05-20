@RestResource(urlMapping = '/fetchallaccount') // workbenchde apexrest ten sonra bu isimle cagiriyoruz, request yapmak icin kullanacagim adresi belirledigim yer bu kisim
global class AccountController {

    @HttpGet //REst Annotations  @HttpPut, @HttpPost, @HttpDelete, @HttpPatch, hangi requeste cevap hazirlayacaksak o metottu yazacagiz ki veri alisverisi olsun
    global static List<Account> queryAllAcounts(){ // global olmasi gerek, return Liste ve Account oldugu icin List <Account> Soql dondurecek
    
    
    RestRequest reqInstance = RestContext.request; //Genel classtan cagiriyoruz burasi sabit
    Map<string, string> paramMap = reqInstance.params;

    string type = paramMap.get('type');
    string name = paramMap.get('name');
    
    return [Select id, Name, Phone, Type From Account Where Type =: type And name =: name]; // istenen hangi fieldlarsa ona gore bir query ile sonuclari gonderecegiz
    }


    //Crate account
    // will send the response
 
    @HttpPost
    global static void createAccount() {

        RestRequest reqInstance = RestContext.request;
        string jsonString = reqInstance.requestBody.toString(); // converting to the body to the json string

        //type casting json string to wrapper instance
        AccountWrapper wrapperInstance =(AccountWrapper) (JSON.deserialize(jsonString, AccountWrapper.class));

        Account accountInstance = new Account(Name = wrapperInstance.accountname , type = wrapperInstance.accountType, Description = wrapperInstance.accountDescription);

        insert accountInstance;        
    }

    //1-parametre direk metodun icine yazilabilir

    public class AccountWrapper{

        public string accountname;
        public string accountType;
        public string accountDescription;
    }







}