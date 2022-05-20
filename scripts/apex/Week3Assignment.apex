List<string> ColourList = new List<string>();

ColourList.add('Red');
ColourList.add('Yellow');
ColourList.add('White');
ColourList.add('Green');
ColourList.add('Orange');
ColourList.add('Blue');

integer colorSize = ColourList.size();
system.debug( 'My list size ' + colorSize);

boolean containsRed = ColourList.contains('Red');
system.debug( ' Contains red? ' + containsRed);

string lastElement = ColourList.get(colorSize - 1);
system.debug('My last elemet of list ' + lastElement);

string uppLastElement = lastElement.toUpperCase();
system.debug( 'Upper case last element ' + uppLastElement);

/*ColourList.set(4, uppLastElement.toUpperCase());
system.debug( ColourList);*/

list<string> ColorCode = new list<string>();
ColorCode.add('#F12344');
ColorCode.add('#F22345');
ColorCode.add('#F32346');
ColorCode.add('#F42347');
ColorCode.add('#F52348');
ColorCode.add('#F62349');

boolean listAreEqual =  ColourList.equals(ColorCode);
system.debug(listAreEqual);


list<string> newListName = new list<string>();
newListName.addAll(ColourList);
newListName.addAll(ColorCode);

system.debug(newListName);




