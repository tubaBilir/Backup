public with sharing class BillingInfo {

    //calcNextBillingDate returns the next billing date based on provided parameters.
    
    public Date calcNextBillingDate(Integer frequency, Date PrevBillDate){
        //Adding the months (frequency) in PrevBillDate Date.
        Date nextBillDate = PrevBillDate.addMonths(frequency);

        return nextBillDate;
    }

}