// 5 string methods 
//1- isNumeric() : This string method will return true, if the string contain numbers only.
string myString = '9876543210';
Boolean stringHasNumber= myString.isNumeric();
system.debug(stringHasNumber); // true

/*2-isAlphanumeric() : Returns true if all characters in String are Unicode letters or numbers otherwise returns false */
string myPassword = 'abc123';
Boolean letterAndNumber = myPassword.isAlphanumeric();
System.debug(letterAndNumber); // true

/*3-lastIndexOf(substring) : Returns the index of the last occurrence of the specified substring..*/
string mySentence = 'eeny meeny miny mo' ;
integer findMo = mySentence.lastIndexOf('mo');
system.debug(findMo); // 16

/*4-left(length) : Returns leftmost characters of the  String of the specified length.*/
string mySentence2 = 'eeny meeny miny mo' ;
string findLeft = mySentence2.left(4);
system.debug(findLeft); // eeny

/*5-normalizeSpace() : Returns String with leading, trailing, and repeating white space characters removed.*/
string mySentence3 = 'e   en y  me e  ny m  i   n  y m   o' ;
string withoutSpace = mySentence3.normalizeSpace();
system.debug(withoutSpace); //eeny meeny miny mo' 






