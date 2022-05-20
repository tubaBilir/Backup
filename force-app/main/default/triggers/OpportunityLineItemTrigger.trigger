trigger OpportunityLineItemTrigger on OpportunityLineItem (after insert) {























//When opportunity line item is created, insert a quotation too .
//home>Quotes>enable>add Pagelayout
//after insert
//find mandatory field for quote-> insert quote

set<id > oppId = new set<id>();

for (OpportunityLineItem oppProd : trigger.new) {
    oppId.add(oppProd.opportunityId);  //lineitemlarin opportunitysini al
}
List<Quote> qList = new List<Quote> (); 

List<Opportunity> oppList =[select id, name, Account.name from Opportunity where id = : oppId];

if(oppList.size()> 0){
    for (opportunity opp : oppList) { //bu opplara quote girmek icin 
        quote q = new quote();
        q.opportunityId = opp.id;
        q.name = opp.name + ' ' + opp.Account.name; // account name not mandatory but makes pretty
        qList.add(q);
    }
}

if(qList.size() > 0){
    insert qList;
}

}