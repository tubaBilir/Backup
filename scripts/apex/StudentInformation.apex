
StudentInformation st1 = new StudentInformation('Ali' , 'ali@gmail.com ' , '156564');
StudentInformation st2 = new StudentInformation('Ali' , 'ali@gmail.com ' , '156554');
StudentInformation st3 = new StudentInformation('Ali' , 'ali@gmail.com ' , '156564');

List<StudentInformation> lstStudentInfo = new List<StudentInformation>();
lstStudentInfo.add(st1);
lstStudentInfo.add(st2);
lstStudentInfo.add(st3);

ShowStudentInformation.showStudentInfo(lstStudentInfo);

