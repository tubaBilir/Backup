public class PracticeTh {

    public void Pmethod() {
        string batchName = 'Eagles';
        integer num = 14;

        string full = batchName + num ;
        system.debug('Bizim batch ' + batchName + ' kisi ' + num );
    }

    public void otherMethod(string bn){
        string batchName = bn;
        system.debug('Batch name is ' + bn);
    }

    public void anothaMethod(string bn, integer candidates){
        string batchName = bn;
        integer num = candidates;

        string description = batchName + num ;
        system.debug(description);

    }

public string permanentAddress = '111 Boca';
public string currentAddress = '222 Coconut  ';
public string ofcAddress	= '333 Downtown';

public string accessAddress(string addressType){
    string ad = '';
    switch on addressType {
        when 'OfficeAddress' {
            ad = ofcAddress;  
        } when 'CurrentAddress' {
            ad = currentAddress;
        } when 'PermanentAddress'  {
            ad = permanentAddress;
        }
        when else {
            ad = null ;
        }
    }
    return ad;

}

}
