public class OperationsHelper {
    public decimal largestOutOfTwoNumbers(decimal num1, decimal num2) {
        if(num1 > num2){
            return num1;
        } return num2;
    }

    public decimal smallestOutOfThreeNumbers(decimal num1, decimal num2, decimal num3) {
        if(num1 < num2 && num1 < num3){
            return num1;
        }else if (num2 < num1 && num2 < num3){
            return num2;
        } return num3;

    }

    public integer sumOfPositiveIntegers(integer n){
        integer sum=0;
        if(n<0){
            system.debug('We cant calculate its a negative numbers');
            return null;
        } 
        
        else {
            for (Integer i = 0; i < n; i++) {
                sum += i;
            }
        }
        return sum;
    }

    public decimal sumOfListItems (list<decimal> list1){
        decimal sumOfInts = 0;
        if(list1.isEmpty()== true){
            system.debug('Please provide values to do operation');

            return null;
        } else {
            for(decimal i : list1){
                sumOfInts += i;
            } return sumOfInts;
        }
    }

    public decimal avarageOfListItems(List <decimal> list1){
        decimal avarageOfInts = 0;

        if (list1.isEmpty()== true){
            system.debug('Please provide values to do operation');
            return null;
        } else {
          decimal totalSum = sumOfListItems(list1);
          avarageOfInts = totalSum / list1.size();
        }   
        return avarageOfInts;
    }

    public decimal highestOfListItems (list<decimal> list1){
        list1.sort();
        decimal lastItem = list1.get(list1.size()-1);
        return lastItem;
    }

    public decimal lowestOfListItems (list<decimal> list1){
        list1.sort();
        decimal firstItem = list1.get(0);
        return firstItem;
    }

    public list<decimal> reverseOrderList (list<decimal> list1){

        list<decimal> reverseList = new  list<decimal> ();
        for (integer i = list1.size ()-1 ; i>=0 ; i--){
        reverseList.add (list1.get(i));
        }    
        return reverseList;
    }


}
