public class AccountHandlerInfo {

    public static List<Account> insertNewAccount(List<String> lstStr) { // Tekir, Duman, Coco, Pamuk
        List<Account> accList = new List<Account>();
        if (lstStr.isEmpty()) {
          System.debug('Error message');
          accList = null;

        } else {
          for (String str : lstStr) {
            Account acL = new Account();
            acL.name = str;
            accList.add(acL);
          }
          insert accList;
        }
      
        return accList;

    }
   

}
