datetimeMethodsDemo dt = new datetimeMethodsDemo();
/*dt.calculateAgeInMonths();
dt.calculateAgeInDays();
dt.calculateAgeInYears();
dt.printSubscriptionEndDate();
dt.printOfferEndDateTime();
dt.mybirthdayLong();*/



date newDate = date.today();
Boolean lp = dt.leapYearCheck(newDate);
system.debug(lp);