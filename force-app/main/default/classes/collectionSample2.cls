public class collectionSample2{
    public collectionSample2(){
        system.debug('Welcome to the world of Salesforce');
    }
    public static string method1(integer indxNum) {
        list<string> myList = new list<string>{'Ayse' , 'Fatma' , 'Hayriye'};
        string description; 
        if(indxNum < myList.size()){
            description = 'Hello ' + myList + 'welcome to the city of the list.' ;
        } else {
            description = 'Sorry! You referred wrong index. Better luck next time!' ;
        }
        return description;
    }
}