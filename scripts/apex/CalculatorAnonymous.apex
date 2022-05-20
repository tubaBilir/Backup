Calculator calc = new Calculator();
Calculator.welcomeMessage();

Calculator.printNewMessage('this is new age calc.'); //dynamic

integer addInteger = Calculator.add(12, 20);
System.debug('sum = ' + addInteger);

integer one = 11;
integer two =85;

integer sum1 = Calculator.add(one, two);
system.debug('Sum 1 = ' + sum1 );

integer sum2 = Calculator.add(one, 65);
system.debug('Sum 2 = ' + sum2 );

integer sum3 = Calculator.add(22, two);
system.debug('Sum 3 = ' + sum3 );

integer sum4 = Calculator.add(22, 15, two);
system.debug('Sum 4 = ' + sum4 );


List<integer> listInteger = new list<integer>();
listInteger.add(10);
listInteger.add(15);
listInteger.add(21);
listInteger.add(15);
listInteger.add(88);

integer sumInt = Calculator.add(listInteger);
System.debug(sumInt);




