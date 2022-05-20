AirlineTicketsInfo tick1 = new AirlineTicketsInfo();
tick1.departureCity = 'Virgina';
tick1.arrivalCity = 'istanbul';
tick1.flightNum = 'A14542';
tick1.seatAssignment = '18A';
tick1.printTicket();

system.debug('Your ticket information ' + tick1);

AirlineTicketsInfo tick2 = new AirlineTicketsInfo();
tick2.departureCity = 'Moscow';
tick2.arrivalCity = 'Lizbon';
tick2.flightNum = '4552';
tick2.seatAssignment = '74';
tick2.printTicket();

system.debug('Your ticket information ' + tick2);



