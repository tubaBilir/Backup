trigger ProductTrigger on Product2 (before insert) {

    
    List<Product2> pList = trigger.new;

    for (Product2 p : pList) {
        if(p.ProductCode != null && p.ProductCode != ''){
        p.ProductCode = 'PBS ' + p.ProductCode;
        }
    }
}


