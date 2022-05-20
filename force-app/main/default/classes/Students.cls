public class Students {

    public string firstName; 
    public string lastName;
    public integer classYear;
    public string majorStream; 

    public string generateReport() {
        system.debug('Report generated for ' + firstName + ' ' +  lastName + 'of ' + classYear);
        return majorStream;

    }
}
