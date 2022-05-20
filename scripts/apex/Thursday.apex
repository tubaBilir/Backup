date testDate= date.today();
system.debug(testDate);

date addDays = testDate.addDays(145);
date subDays = testDate.addDays(-145);
date addMnth = testDate.addMonths(1);
date addYr = testDate.addYears(2);

System.debug(addDays);
System.debug(subDays);
System.debug(addMnth);
System.debug(addYr);



date myBirth = date.newInstance(1983, 1, 22);
date tdy = date.today();

integer myAge= myBirth.monthsBetween(tdy);

system.debug(myAge / 12);




