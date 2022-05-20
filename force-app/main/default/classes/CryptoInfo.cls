public class CryptoInfo {

/*
1. Create one class called CryptoInfo
2. Create a static method called as showPrice
3. This method should accept one string which will be called as coinName
4. This method should return the price. Use decimal data type.
5. We have to have a map which the key is crypto name and the value is its price
6. I have to put the values of the coins into mat, use put method.
7. Use map reference.put(key, value);
8. To find the right coin I have to use if else statement
9. If the coinName is in the Map, then give me the price. To achive this, write containsKey method which is "coinName.containsKey(coinName)"
10. Give a message to user 'There is no such currency. Please enter the correct currency name.'
11. What if the map is empty? Then put it in else statemnt and eliminate the proble. else(mapName.isEmpty()) show a message from System.debug.
12. If there is no any blocker then price should equal to the value comig from the map.
price = mapName.get(coinName);
13. Create an apex file which name should be relevant like cryptoInfoTest.apex
14. Since this is a static method, call the method Class name and pass the coinName.
*/

//Create a static method called as showPrice
//This method should accept one string which will be called as coinName
//This method should return the price. Use decimal data type.

    public static Decimal showPrice(String coinName) {

    Decimal price = 0.00;

    Map<String, Decimal> cryptoMap = new Map<String, Decimal>();

//We have to have a map which the key is crypto name and the value is its price
//I have to put the values of the coins into mat, use put method.
//Use map reference.put(key, value);

    cryptoMap.put('BTC', 39045.39);
    cryptoMap.put('ETH', 2720.71);
    cryptoMap.put('CYH', 12720.71);
    cryptoMap.put('PTH', 720.71);
    cryptoMap.put('ZTH', 20.71);

//To find the right coin I have to use if else statement
//If the coinName is in the Map, then give me the price. To achive this, write containsKey method which is "coinName.containsKey(coinName)"
// Give a message to user 'There is no such currency. Please enter the correct currency name.'
// What if the map is empty? Then put it in else statemnt and eliminate the proble. else(mapName.isEmpty()) show a message from System.debug.

    if(cryptoMap==null){
        System.debug('The map is null!');

    } else if(!cryptoMap.containsKey(coinName)){

        System.debug('No such coin! Please put the correct coin name.');

    } else {
// If there is no any blocker then price should equal to the value comig from the map.
// price = mapName.get(coinName);
        price = cryptoMap.get(coinName);

        System.debug(coinName + ' price is $' + price + ' .');
    }
    return price;
} 
}