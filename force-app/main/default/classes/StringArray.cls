public class StringArray {

    public static generateStringArray(integer num) {

        list<string> myListStr= new list<string>();

        for (Integer i = 0; i < num; i++) {
            myListStr.add('Test ' + i);
        }
        return myListStr;
    }
}
