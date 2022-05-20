public class PlayingWithDates {
    public void printDateOutput() {

        Date todayDate = date.today();
        system.debug('Today is ' + todayDate);

        Date newDate = date.newInstance(2789, 11, 5);
        system.debug('day in Future ' + newDate );

        Date newDate2 = date.newInstance(1453, 3, 4);
        system.debug('day in the past ' + newDate2);
        
        integer dayInt = 5;
        integer monthInt = 11 ;
        integer yearInt = 1983;

        Date Group9 = date.newInstance(yearInt, monthInt, dayInt);
        system.debug(Group9);

        Date after67 = todayDate.addDays(67);
        system.debug('After 67 Days from today =' + after67);

        Date before7Months = todayDate.addMonths(-7);
        system.debug('Before 7 months from today = ' + before7Months);

        Date before895Days = todayDate.addDays(-895);
        system.debug('Before 895 days from today = ' + before895Days );
//9 
        Date before59Year = todayDate.addYears(-59);
        system.debug ('Before 59 years from today = ' + before59Year );

//10
        Date after278Year = todayDate.addYears(278);
        system.debug('After 278 years from today = ' + after278Year);

    }

    public void olympicGamesAge(){
        date tdy = date.today();
        date olympic = date.newInstance(1896, 4, 6);
        integer totalDays = olympic.daysBetween(tdy);
        integer totalmonths = totalDays / 12;
        integer totalyear = totalDays / 365;
        
        system.debug('Days > ' + totalDays);
        system.debug('Months > ' + totalmonths);
        system.debug('Years > ' + totalyear);

        system.debug(date.isLeapYear(1896));
    }




}
