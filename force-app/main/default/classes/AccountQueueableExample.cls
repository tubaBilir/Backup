public class AccountQueueableExample implements Queueable {
    
    public List<Account> accountList;
    
    public AccountQueueableExample(List<Account> accList) { //parametre almayan constructor
        accountList = accList;
    }

    public void execute(QueueableContext context){ // execute tek mandatory metod
        system.debug('Reached in execute method'); // bir kere run edecek
        for(Account acc :accountList ){
            acc.Name += '---Si';
        }
        update accountList;

    }
} //Anonymoustan cagiracagiz metodu simdi
