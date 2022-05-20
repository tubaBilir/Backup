List <Case> updateCases = [select id, subject, status from case where status ='New'];

for(Case eachCase : updateCases){
    eachCase.Status = 'Working';
}
update updateCases;




// Trigger fire 2 times- 200 is limit for one trigger
for (Integer i = 0; i < 205; i++) {
    case c = new case();
    c.Subject = 'Ther is a bug';
    c.Description = 'Resolve it';
    c.Status = 'New';
    c.Origin = 'Web';
    newCases.add(c);
}

insert newCases;

