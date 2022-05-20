public class ListPractice {
    public static list<Planets> planetList = new list<Planets>();

    public static string addPlanets(string planetName, Integer planetNumber, Integer numberOfMoons) {
        string returnMessage = '';
        if (planetName != null && planetName != '') {
            Planets planet1 = new Planets(); //new instance
            planet1.plName = planetName;
            planet1.planetNumber = planetNumber;
            planet1.NumOfMoons = numberOfMoons;

            planetList.add(planet1);
            returnMessage = 'Planet added successfully';
        } else {
            returnMessage = 'Planet without name cannot be added to the list';
        } return returnMessage;
    }
}