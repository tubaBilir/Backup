trigger SfWebinarTrigger on SF_Webinar__c (before insert, before update) {

for (SF_Webinar__c sfWeb : trigger.new) {
    sfWeb.Price__c =  sfWeb.Price__c - (sfWeb.Price__c *30) / 100 ;
}

}