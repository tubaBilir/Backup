@isTest
public class HumansTest {
    @isTest
    public static void FullNameTest() {
        humans.FullName('Tuba', 'Bilir');
    }

    @isTest
    public static void age(){
        date myDate = Date.newInstance(1983, 1, 22);

        integer daysBetween = Humans.age(myDate);
        system.assertEquals(39, daysBetween);
    }

//100 % code coverage



}


  