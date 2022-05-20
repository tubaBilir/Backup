
DeleteClosedLostOppsBatch deleteBatch = new DeleteClosedLostOppsBatch(); // new instance olusturacagiz
Database.executeBatch(deleteBatch); //buraya sayi eklersek coklu islemlerde o sayi ile batch batch execute etmis olacagiz, 