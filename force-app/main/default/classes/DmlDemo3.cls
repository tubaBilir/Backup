public class DmlDemo3 {

    public static void dmlInsert(integer num) {
        list<Account> accList= new list<Account>();
        for (integer i = 1; i <= num; i++) {
            Account acc = new Account();
            acc.Name= 'Account' + i;
            accList.add(acc);
        } 
        insert accList;
    }

    public static void dmlUpdate(string str) {
        List<Account> lastAcc =[Select Name from Account order by CreatedDate desc limit 3];
        list<Account> updAcc= new list<Account> ();
        for (Account myAcc : lastAcc) {
            myAcc.name = myAcc.name + str;
            updAcc.add(myAcc);
        }
        update updAcc;
    }

    public static void dmlDelete() {
        List<Account> lastAccDelete =[Select Name from Account order by CreatedDate desc limit 3];
        delete lastAccDelete;
    }


}
