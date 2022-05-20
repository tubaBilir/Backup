list<decimal> listOfDecimals = new list<decimal> ();
listOfDecimals.add(1.2);
listOfDecimals.add(9.6);
listOfDecimals.add(4.3);
listOfDecimals.add(1.8);
system.debug('My list is' + listOfDecimals);

OperationsHelper op1 = new OperationsHelper();

system.debug( 'Sum of list items '+ op1.sumOfListItems(listOfDecimals));
system.debug( 'My avarage  ' + op1.avarageOfListItems(listOfDecimals));

system.debug( 'My highest  ' + op1.highestOfListItems(listOfDecimals));
system.debug( 'My lowest  ' + op1.lowestOfListItems(listOfDecimals));

system.debug( 'The reverse order list ' + op1.reverseOrderList(listOfDecimals));

