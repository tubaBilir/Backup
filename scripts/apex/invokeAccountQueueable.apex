
List<Account> accs = [select id, name from account limit 20];
AccountQueueableExample aqe = new AccountQueueableExample (accs); // Constractor dan dolayi bu sekilde 
ID jobId = System.enqueueJob(aqe); // Job id is id for particular job