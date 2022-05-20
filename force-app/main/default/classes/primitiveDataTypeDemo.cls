public  class primitiveDataTypeDemo {
    public void printBasicDataType() {

        string batchName = 'Falcons';
        integer candidates = 80;
        boolean isAdminComleted = true;

        string description = batchName + ' are the Best!' ;

        system.debug(description);
        system.debug('Total of candidates= ' + candidates );

        decimal decValue = 27.01;
        system.debug('My decimal ' + decValue) ; 

        long myLongValue = 65451354131L;
        system.debug('My Long ' + myLongValue) ; 

        integer myInteger = 255;
        system.debug('My integer ' + myInteger) ; 

        Object obj = 'Aaaany data type in Object';
        Object obj2 = 15412142;

        system.debug(obj) ; 
        system.debug(obj2) ; 

    }


public void printNewDate(){

    system.debug('Create new date instance');
    Date newDate = Date.newInstance(1995, 2, 17);
    Date newDate2 = Date.newInstance(2021, 10, 7);
    system.debug('new date= '+ newDate );
    system.debug('new date 2 is = '+ newDate2 );
    Date todayDate = date.today();
    system.debug(todayDate);

}

public void printNewTime(){

Time myTime = Time.newInstance(18, 20, 2, 30);
Time meTime = Time.newInstance(16, 10, 12, 50);

system.debug('My Time is now '+ myTime);
system.debug('Mee Time is now ' + meTime);

}

public void printNewDateTime(){
    date newDate = date.today();
    time newTime =time.newInstance(23, 23, 23, 23);

// first way
    Datetime dt1 = Datetime.newInstance(newDate, newTime);
    system.debug('first date time instance is ' + dt1);

// second way
    Datetime dt2 = Datetime.newInstance(2009, 1, 9);
    system.debug('dt 2 is ' + dt2 );

// third way 
    datetime dt3 = datetime.newInstance(2020, 2, 7, 8, 26, 50);
    system.debug('dt 3 is ' + dt3 );

//fourth way
    Long longTime = 1314828183000L;
    Datetime dt4 = Datetime.newInstance(longTime);
    system.debug('From Jan 1 1970, all milliseconds ' + dt4);

//fifth way
    datetime dt5 = datetime.newInstanceGMT(2020, 2, 18, 28, 4, 5);
    system.debug('GMT date time ' + dt5);

// get now
    datetime dt6 = Datetime.now();
    system.debug('now ' + dt6);

}



}