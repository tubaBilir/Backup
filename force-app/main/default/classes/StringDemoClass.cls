public class StringDemoClass {
    public void stringMethod1() {
    string sessionDescription ='Learning string method in apex is so fun!' ;    

        integer lengthSession = sessionDescription.length();
        system.debug('Length of string is = ' + lengthSession );


        string upperSession = sessionDescription.toUpperCase();
        system.debug('Uppercasse string is = ' + upperSession );


        boolean contApex = sessionDescription.contains('apex');
        system.debug('Contains apex? = ' + contApex );

        boolean contSf = sessionDescription.contains('salesforce');
        system.debug('Contains Salesforce? = ' + contSf );


    }
}
