public class Humans {
    public static string FullName(string first, string last){
        string full = first + last ;
        string getUpp = full.toUpperCase();
        return getUpp;
    }

    public static integer age(date birthdate){
        integer a= 0;
        date today = date.today();
        integer daysAge= birthdate.daysBetween(today);
        a = integer.valueOf(daysage/365);

        return a;
    }


}