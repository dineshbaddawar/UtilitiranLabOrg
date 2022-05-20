public class NotesClass {

    public Static void ConditionLoops(){
        /*
        // IF
        Integer i = 1;
        if (i > 0) {
            System.debug('the IF value of I--->'+i);
        }
        
        // ELSE
        Integer x, sign;
        if (x==0) {
            sign = 0;
        } else {
            sign = 1;
            System.debug('the ELSE sign value--->'+sign);
        }
        
        // WHILE
        Integer count=1;
        
        while (count < 11) {
            System.debug(count);
            count++;
            System.debug('the WHILE count value--->'+count);
        }
        */        

        // FOR
        // # 1: loop that iterates based on a condition
        
        for (Integer i = 0, j = 0; i < 10; i++) {
            System.debug('The value with i+1-->'+i+1);
        }

        // # 2: loop that iterates for each element of an array
        
        Integer[] myInts = new Integer[]{1,8, 9};
            for (Integer i : myInts) {
                System.debug('the valu in the List--->'+i);
            }

        
        // # 3: loop that iterates for each row in the resultset
        
        
        for(Account acc:[SELECT Id,Name FROM Account Where Phone !=null]){
            System.debug('the value of acc--->'+acc);
        }
        
        // BREAK: break keyword is used to exit the enclosing loop prematurely.
        // In the following example, break keyword is used to break the while loop prematurely when a specific condition is met.
        
        for(Integer i=1;i<=10;i++){
            if(i == 4)
                break;
            System.debug('the Break value of I::'+i);
        }
        
        // CONTINUE: continue keyword skips to the next iteration of the loop. The statements in the loop block after the 
        //           continue statement are skipped and the execution continues with the loop again.
        
        for(integer i =0;i< 10;i++){
            if(i == 5)
                continue;
            system.debug('The Continue I value::'+i);
        }
        
        
    }
}