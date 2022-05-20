public class AccountManage {
    
    public static void updateAccount() {

        List<Account> lastAccount =[Select id, name, createdDate from Account order by createdDate desc limit 5];

        List<Account> updateList = new List<Account>();

        for (Account eachAcc : lastAccount) {
            eachAcc.Description = eachAcc.Name + eachAcc.CreatedDate;
            updateList.add(eachAcc);
        }

        update updateList;
    }
}
