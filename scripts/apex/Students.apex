Students st1 = new Students();
st1.firstName = 'Altinay';
st1.lastName = 'Adamkul';
st1.classYear= 2008;
st1.majorStream = 'Art/ Science';

string m = st1.generateReport();
system.debug(m);
system.debug(st1);

Students st2 = new Students();
st2.firstName = 'Maryam';
st2.lastName = 'Bainazar';
st2.classYear= 2004;
st2.majorStream = 'Electric';

string m2 = st2.generateReport();
system.debug(m2);
system.debug(st2);

