//5 Date Methods
/*1- isSameDay(dateToCompare) : Returns true if Date that called the method is the same as the specified date.*/
Date createdDay = date.newInstance(2022, 1, 1);
Date modifiedDay = date.newInstance(2022, 1, 1);
Boolean equalCreatedModified = createdDay.isSameDay(modifiedDay);
system.debug(equalCreatedModified); // true

//2- month() : Returns the month component of a Date 
Date findMonth = date.newInstance(2022, 12, 1);
integer myMonth = findMonth.month();
system.debug(myMonth); // 12

//3- format() : Returns the Date as a string using the locale of the context user
Date changeDateFormat = date.newInstance(2020, 10, 9);
string stringDate = changeDateFormat.format();
system.debug(stringDate); //10 /9 /2020

//4- daysInMonth(year, month) : Returns the number of days in the month specified year.
integer throwBack = date.daysInMonth(2020, 1);
system.debug(throwBack); //31

//5- valueOf(stringDate) : Returns a Date that contains the value of the specified String.
string currYear = '2022';
string currMonth = '2';
string currDay = '7';
string currHour = '12';
string currMinute = '20';
string currSecond = '35';
string allTimes = currYear + '-' + currMonth
 + '- ' + currDay + ' ' + currHour + ': ' + 
currMinute + ' :' + currSecond;

Date myDate = Date.valueOf(allTimes);
system.debug(myDate);

