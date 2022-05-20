public class datetimeMethodsDemo {
    public void calculateAgeInMonths() {
        
        date birthDate = date.newInstance(1983, 1, 22);
        date todayDate =date.today();

        integer myAge = birthDate.monthsBetween(todayDate);

        system.debug('My month age is now = ' + myAge);

    }
    public void calculateAgeInDays() {
        
        date birthDate = date.newInstance(1983, 1, 22);
        date todayDate =date.today();

        integer ageInDays = birthDate.daysBetween(todayDate);

        system.debug('My day age is now = ' + ageInDays);

    }

    public void calculateAgeInYears() {
        
        date birthDate = date.newInstance(1983, 1, 22);
        date todayDate =date.today();

        integer ageInYears = birthDate.daysBetween(todayDate);

        system.debug('My year age is now = ' + ageInYears / 365 );

    }

    public void printSubscriptionEndDate() {
        
        date SubscriptionStartDate = date.today();
        date SubscriptionEndDate = SubscriptionStartDate.addDays(1000);
        system.debug('SUBSCRIPTION END DATE IS = ' + SubscriptionEndDate );

        integer endDateYear = SubscriptionEndDate.year();
        system.debug('Subscription end year is = ' + endDateYear );

        integer endDateMonth = SubscriptionEndDate.month();
        system.debug('Subscription end month is = ' + endDateMonth );
    }

    public void printOfferEndDateTime() {
        
        datetime offerStarts = datetime.now();
        datetime dtOfferEnd = offerStarts.addHours(51);

        system.debug('Offer End time is = ' + dtOfferEnd );

        date offerEnd =dtOfferEnd.date();
        system.debug('Offer End date is = ' + offerEnd );
    }

    public void mybirthdayLong(){
    datetime mymiliseconds = datetime.newInstance(1990, 1, 22);
    Long myLong = mymiliseconds.getTime();
    System.debug(myLong);

    }

    public Boolean leapYearCheck (date dt){
        integer year = dt.year();
        Boolean lp = date.isLeapYear(year);
        return lp;

    }




}





