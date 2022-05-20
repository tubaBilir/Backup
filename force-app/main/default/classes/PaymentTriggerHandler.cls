public class PaymentTriggerHandler {

    //UPDATE AND TRACK PARENT field WHEN CHILD created, UPDATED, deleted and undeleted
    //update rollup summary field on parent

    public static void onlinePaymentAfterInsert(List<payments__c> TriggerNew) {  
        //Number_of_Online_Payments__c

        set<id> CstmrSetId= new set<id> (); 

        for (payments__c pymnt : TriggerNew) { //Crate edilen childlari getirir
            if(pymnt.Customerr__c != null && pymnt.mode__c =='Online'){ //bir parente a bagli ve 'online' olan childlarin
                CstmrSetId.add(pymnt.Customerr__c); //bir parente a bagli ve 'online' olan childlarin parentlarinin id lerini topladik
            }

            List<Customer__c> listOfCust =[select id, name,(select id, name, Customerr__c, mode__c from payments__r where mode__c = 'Online') from Customer__c where id in : CstmrSetId ];//bir parente a bagli ve 'online' olan childlarin parentlari childlari ile beraber getirmek icin query olusturduk
            for (Customer__c cs : listOfCust) { //Childi Parenta assigne etmek icin for
                integer size = cs.payments__r.size();// her bir customer ile ilintili olan paymentlarin listesinin adetini getirecek 
                cs.Number_of_Online_Payments__c = size;// parent objectin ilgili fieldine assign edecek
            }
            //Suan read only, contact silindiginde veya recycledan geri alindiginda vs update etmez bunun icin trigger kisminda butun secenekleri ile birlikte metotlari tek tek yazmak gerekir 
             //after insert metotu cagir
             //after update icin tekrar ayni metotu yaz ve new instance olustur for un icinde account icin ve assign et, yeni metot ismi ile triggerda tekrar cagir
             //Delete icin tekrar...

             if(listOfCust.size() > 0){
                update listOfCust; 
             }
        }
    }

    public static void onlinePaymentAfterUpdate(List<payments__c> TriggerNew) {  
        //Number_of_Online_Payments__c
        set<id> CstmrSetId= new set<id> (); 
        for (payments__c pymnt : TriggerNew) { //Crate edilen childlari getirir
            if(pymnt.Customerr__c != null && pymnt.mode__c =='Online'){ //bir parente a bagli ve 'online' olan childlarin
                CstmrSetId.add(pymnt.Customerr__c); //bir parente a bagli ve 'online' olan childlarin parentlarinin id lerini topladik
            }

            List<Customer__c> listOfCust =[select id, name,(select id, name, Customerr__c, mode__c from payments__r where mode__c = 'Online') from Customer__c where id in : CstmrSetId ];
            List<Customer__c> lstCustomerUpdate = new List<Customer__c>(); //Updatede de paymenti guncelleyip eklesin diye yeni bir liste lazim
            for (Customer__c cs : listOfCust) { 
                Customer__c csUpdate = new Customer__c (); // Yeni bir instance update olan paymentlar icin 
                csUpdate.id = cs.id;//bunun id sini for dan cikacaklara esleyecegiz ve listeye ekleyip onu dml ile update edecegiz
                integer size = cs.payments__r.size();
                csUpdate.Number_of_Online_Payments__c = size;
                lstCustomerUpdate.add(csUpdate);
            }
            
             if(lstCustomerUpdate.size() > 0){
                update lstCustomerUpdate; 
             }
        }
    }

    public static void onlinePaymentAfterDelete(List<payments__c> TriggerOld) {  

        set<id> CstmrSetId= new set<id> (); 

        for (payments__c pymnt : TriggerOld) { 
            if(pymnt.Customerr__c != null && pymnt.mode__c =='Online'){ 
                CstmrSetId.add(pymnt.Customerr__c); 
            }
            List<Customer__c> listOfCust =[select id, name,(select id, name, Customerr__c, mode__c from payments__r where mode__c = 'Online') from Customer__c where id in : CstmrSetId ];
            for (Customer__c cs : listOfCust) { 
                integer size = cs.payments__r.size();
                cs.Number_of_Online_Payments__c = size;
            }

             if(listOfCust.size() > 0){
                delete listOfCust; 
             }
        }
    }

//Total_Cash_Payment__c
// Create a currency custom field on Customer__c object and name it as ‘Total Cash Payment’. write a trigger to achieve the following functionality:
// Total Cash Payment – It should show the total cash payments done for a particular customer. This value should update as soon as any of the following event occurs:
// a. Amount field is updated for a payment. /b. A new cash payment is added.
// c. An online payment is updated to cash, or a cash payment is updated to online./ d. A cash payment is deleted./ e. A cash payment is un-deleted.

    public static void totalCashPaymentAfterInsert(List<payments__c> TriggerNew) {  
    
        set<id> CstmrSetId= new set<id> (); 

        for (payments__c pymnt : TriggerNew) { 
            if(pymnt.Customerr__c != null && pymnt.mode__c == 'Cash'){ 
            CstmrSetId.add(pymnt.Customerr__c);
            }
        }
            List<Customer__c> custList =[select id, name, Number_of_Online_Payments__c, Total_Cash_Payment__c, (select id, name, Customerr__c, amount__c from payments__r where mode__c = 'Cash') from Customer__c where id in : CstmrSetId ];

            // decimal sum = 0;
            for (Customer__c cs : custList) { 
                decimal sum = 0;
                for (Payments__c pm : cs.payments__r) {
                    sum = sum + pm.amount__c;
                }
                cs.Total_Cash_Payment__c = sum;
            }
        if(custList.size() > 0){
            update custList;
        }
    }

    //Deploy ediyor, fieldi orgda update etmiyor
    public static void totalCashPaymentAfterUpdate(List<payments__c> TriggerNew, map<id,payments__c > TriggerOldMap) {  
    
        set<id> CstmrSetId= new set<id> (); 

        for (payments__c pymnt : TriggerNew) { 
            if(pymnt.mode__c != TriggerOldMap.get(pymnt.id).mode__c || pymnt.Amount__c != TriggerOldMap.get(pymnt.id).Amount__c){ // Mode update olmussa veya amount update olmussa
            CstmrSetId.add(pymnt.Customerr__c);
            }
        }
            List<Customer__c> custList =[select id, name, Number_of_Online_Payments__c, Total_Cash_Payment__c, (select id, name, Customerr__c, amount__c from payments__r where mode__c = 'Cash') from Customer__c where id in : CstmrSetId ];

            for (Customer__c cs : custList) { 
                Customer__c csUpdate = new Customer__c (); //update icin new instance
                csUpdate.id = cs.id;
                for ( Payments__c pm : csUpdate.payments__r) {
                    decimal sum =0;
                    sum = sum + pm.amount__c;
                    csUpdate.Total_Cash_Payment__c = sum;
                }
            }
        if(custList.size() > 0){
            update custList;
        }
    }




}