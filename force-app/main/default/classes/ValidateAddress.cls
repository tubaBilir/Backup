public  class ValidateAddress {
    public void ValidateHomeAddress() {

        string houseName = 'Dream House';
        string streetName = 'Olympic';
        string cityName = 'Los Angeles';
        string stateName = 'Culver City';
        string stateISO = 'CA';
        string countryName = 'America';
        string countryISO = 'USA';

        integer lengOfStrName = streetName.length();
        system.debug('Number of charachters of street name is ' + lengOfStrName );

        boolean contHouse = streetName.contains(houseName);
        system.debug('Street Name contains House name? ' + contHouse );

        boolean contStateIso = streetName.contains(stateISO);
        system.debug('Street Name contains state Iso ? ' + contStateIso);

        string uppStIsoCode = stateISO.toUpperCase();
        system.debug('Capitalize State Iso Code =' + uppStIsoCode );

        string uppCountryIsoCode = countryISO.toUpperCase();
        system.debug('Capitalize Country Iso Code =' + uppCountryIsoCode );

        string uppCountryName = countryName.toUpperCase();
        system.debug('Capitalize Country Name is =' + uppCountryName );

        string cityLow = cityName.toLowerCase();
        system.debug('Lower Case City Name ' + cityLow);

        string lowState = stateName.toLowerCase();
        system.debug('Lower Case State Name is = ' + lowState );

        string fullAddress = houseName + ' ' + streetName ;
        system.debug (fullAddress);



    }
}
