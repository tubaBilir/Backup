public with sharing class UsersCallout { //Outbound Callout

    public static void fetchAllUsers() {

        HttpRequest request = new HttpRequest(); //REquest instance, syntax sending request
        request.setEndpoint('https://gorest.co.in/public/v2/users'); // Postmandeki adimlargibi hepsini belirtecegiz /is to set callout endpoint url
        request.setMethod('GET'); // specifies what type of callout post, get, delete gibi

        Http httpInstance = new Http(); // Http Protocol, through protocol

        HttpResponse response =  httpInstance.send(request); // Response /3 adim request, protocol, response

        System.debug('Status is ' + response.getStatus()); //Status is OK
        System.debug('Status is ' + response.getStatusCode()); // Status is 200
        System.debug('Response ' + response.getBody()); // it will return json format 


        // endpointte bir sikinti olursa yine response olur bulamadik diye, ama bu html dondugu icin deserialize kisminda hata verir bu yuzden if else ile bunun onune gecilir ki hatanin ne oldugu anlasilsin hata alinmasin
        if (response.getStatusCode() == 200) { // status cod yerine statusu yazmiyoruz = OK olarak cunku degisebilir, statuscod yaziyoruz
            
            //deserialize syntax iki parametre alacak biri string dieri class
        List<UsersWrapper> userList =(List<UsersWrapper>) (JSON.deserialize(response.getBody(), List<UsersWrapper>.class)); //response.getbody string olarak dondugu icin ilk parametre string olacak bir sey olmali, wrapper class ta list oldugu icin list yazacagiz[] bu list / {} bu object 
            System.debug('Wrapper instance Response ' + userList);
        } else {
                System.debug('Error Occured ' + response.getStatus());
            }
    }


private class UsersWrapper{ // Outer class =usersCallout yukaridaki ana class/ inner yada wrapper class private olur genelde
//Wrapper class hold the users from response from postman as jason
    private integer id; 
    private string name;
    private string email;
    private string gender;
    private string status;
}

//get Call steps
//1. implmenting a method with email as a parameter
//2. Do a callout based on email
//3. if contact found, create contact into the salesforce based on response


public static void checkContactAndCreate(string contactEmail, string gender, string status) {

     HttpRequest request = new HttpRequest(); //Request instance

    request.setEndpoint('https://gorest.co.in/public/v2/users?email=' + contactEmail + '&status=' + status + '&gender' + gender); 
    request.setMethod('GET'); 

    Http httpInstance = new Http(); // Http protocol
   
    HttpResponse response =  httpInstance.send(request); // Response instance

    //Check if request is success or not

    if (response.getStatusCode() == 200) { 
        System.debug('Wrapper instance Response ' + response.getBody());

        List<UsersWrapper> userList =(List<UsersWrapper>) (JSON.deserialize(response.getBody(), List<UsersWrapper>.class)); //deserialization 

        //declarind list of cotnact to insert contacts
        List<Contact> contactToUpdateList = new List<Contact>();

        //iterating through list of users wrapper to prepare a contact instance
        for (UsersWrapper wrapperInstance : userList) {
            //Constructing  contact instance with wrapper instance
            Contact contactInstance = new Contact(
               LastName= wrapperInstance.name,
               email = wrapperInstance.email
            );
            contactToUpdateList.add(contactInstance);
        }

        insert contactToUpdateList;



    } else {
        System.debug('Error Occured ' + response.getStatus());
    }



}


//Post Call steps
//1. implment a method with email gender status as a parameter
//2. Do a calloutcreate records intothe erp system
//3. print record in the debug

// EndPoint URL = https://gorest.co.in/public/v2/users
//     MEthod = POST
//     Paramters =
//     Headers : Content-Type:application/json,
//               Authorization : Bearer {{Access_Token}}
//     Body : {
//         "name":"Tenali Ramakrishna",
//         "gender":"male",
//         "email":"tenali.ramakrishna@15ce.com",
//         "status":"active"
//     }

// Types where we can store secret information like access token, client id, client secret key
// 1. Protected Custom Settings
// 2. Named Credentials
// 3. Protected Custom Meta Data



public static void createUserInGoREST(string name, string contactEmail, string gender, string status) {

      HttpRequest request = new HttpRequest();
        request.setEndPoint('https://gorest.co.in/public/v2/users');
        request.setMethod('POST');

        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Authorization', 'Bearer acca14742e23f46b1fc9de9a3eab59e78ab0a95477f597707c1c92a9f5c1da2f');

        UsersWrapper wrapperInstance = new UsersWrapper();
        wrapperInstance.name = name;
        wrapperInstance.email = contactEmail;
        wrapperInstance.gender = gender;
        wrapperInstance.status = status;

        String jsonString = JSON.serialize(wrapperInstance);
        request.setBody(jsonString);

        Http httpInstance = new Http();

        HttpResponse response = httpInstance.send(request);
        System.debug('Status Code:'+ response.getStatusCode());
        if(response.getStatusCode() == 201) {
            UsersWrapper responseWrapper = (UsersWrapper) (JSON.deserialize(response.getBody(), UsersWrapper.class));
            System.debug('responseWrapper:' + responseWrapper);
        }

//apex for execution => UsersCallout.createUserInGoREST('Test From India 07 May','testname@fromindia.biz', 'female', 'active');

}

}