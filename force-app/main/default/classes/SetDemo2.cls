public class SetDemo2 {
    
    public static set<string> upperCaseSet(set<string> ss) {
        set<string> returnSet = new set<string>();
        System.debug( 'ss set '+ss);

        for (string eachElement : ss) {
            System.debug(eachElement);
            String tempStr = eachElement.toUpperCase();
            returnSet.add(tempStr);
        }
        return returnSet;
    }
}
/* It's like we are sending the cookies(here cities) in a container (here ss set variable) to prepare in oven.
And then we are checking every cookie (here converting city name to capital) and placing it in the different container (here returnSet variable) for serving to have it. */


