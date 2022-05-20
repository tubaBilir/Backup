public class StudentInfo {
    
    public static string InstituteName; 

    public StudentInfo() {
        system.debug('Welcome to the  ' + InstituteName );
    }

    public void printStudentInfo( string name, string course, integer grade) {
       string description= '';
      if (grade > 70){
          system.debug('Hey,' + name +  ' You have got  '  +  ' Distinction  in your ' +  course);
          } else if (grade >=60){
            system.debug('Hey,' + name +  ' You have got  '  +  ' First Class  in your ' +  course);
            }else if(grade >= 50){
                system.debug('Hey,' + name +  ' You have got  '  +  ' Second Class  in your ' +  course);
            }else if(grade >= 35){
                system.debug('Hey,' + name +  'You have got  '  +  ' Pass Class  in your ' +  course);
            } else {
                    system.debug( 'Hey ' + name + 'Sorry you Failed :( ');
                }
    }
}
