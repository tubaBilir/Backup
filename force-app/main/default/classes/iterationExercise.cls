public class iterationExercise{
    
     public decimal dynamicCalculationMethod(decimal one, decimal two, string st){
        decimal son = 0;
        switch on st {
            when 'Add'  { 
                 son = one+ two ;
            }
            when 'Subs' {
                 son = one - two;
            }
            when 'Div' {
                 son = one / two;
            }
            when 'Multipl' {
                 son = one * two;
            }
        }
            return son;
    }

    public integer topla(integer a, integer b){
         integer tpl = a + b;
         return tpl;
    }

    public integer uzunluk (string cumle){
         integer sonuc = cumle.length();
         return sonuc;

     }

     public integer rakamUzunluk(integer num){
          string dondur = string.valueOf(num);
          integer dondu = dondur.length();
          return dondu;
     }

     public void getMultiplication(integer num){
          for (Integer i = 1; i <+ 10; i++) {
               system.debug(i + 'X' + num + '=' + i*num);

          }
     }

     public void getAvarage(integer num1, integer num2){
          integer sum = 0;
          integer cnt = 0;
               for (Integer i = num1; i <= num2; i++) {
               sum = sum + i;
               cnt = cnt + 1;
          }
          integer avg = 0;
          avg = sum / cnt;
          system.debug('Sum ' + sum);
          system.debug( 'Kac rakam var ' + cnt);
          system.debug('Ortalamasi ' + avg);


     }






}