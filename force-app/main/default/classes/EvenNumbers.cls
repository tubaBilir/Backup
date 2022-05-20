public class EvenNumbers {
    
    public static integer EvenNum(list<integer> intList) {
        integer sum = 0;

        for (integer i : intList) {
            if(math.mod(i, 2) == 0){
                System.debug(i++);
            }
            list<integer> evenList = new list<integer>(intList);
        } 
        return sum;
    }
}
