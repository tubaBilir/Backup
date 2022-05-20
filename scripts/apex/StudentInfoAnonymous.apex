StudentInfo.InstituteName = ' Salesforce';

StudentInfo sti1 = new StudentInfo();
sti1.printStudentInfo(' Jimmy', ' Science', 90);

StudentInfo sti2 = new StudentInfo();
sti2.printStudentInfo(' Karen', ' IT', 30);

StudentInfo.InstituteName += ' University';
StudentInfo sti3 = new StudentInfo();
sti3.printStudentInfo(' Harry ', ' Electric ', 53);