public  class LoopDemo {
    public void print_int_while() {
        integer count = 1;   //initilazation
        while (count <= 25) {  // condition
            system.debug(count);
            count++;            //increment
        }
    }

    public void print_N_numbers(integer n){
            //initilztn       condt       incrmnt
        for ( integer i=0 ;    i< n ;     i++) {
            system.debug(i);
        }
    }


    public void print_N_Odd_Numbers(integer startInt, integer endInt){

        for(integer i= startInt; i <= endInt ; i++){
            integer modI = math.mod(i, 2);
            if (modI == 1) {
                system.debug(i);
            }
        }
    }





}
