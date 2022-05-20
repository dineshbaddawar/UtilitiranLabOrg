public class EduereKaClass {

    
    public static String ReturnKeyWord(){
      String  name = 'Dinesh Baddawar';
        System.debug('Return--> '+name);
        return name;
    }
    
    /* 
     
# With Sharing KeyWord:

* If a class defined with this 'With Sharing' Keyword, then all the sharing rules apply to the current user.
public with Sharing Class Method1(){

}


# If Lopp:

integer a =200;
integer b = 2000;
if(a>b){
System.debug('A is Greater than B');
}
System.debug('B is Greater than A');


# IF Else Loop:

integer a =2200;
integer b = 2000;
integer c = 5000;
if(a>b && a>c){
System.debug('A is Greater');
}else{
System.debug(' B or C is Greater than A');
}

# Looping Statements:

1: While Loop:


Integer count = 1;
while(count< 11){
System.debug('The Count---> '+count);
count++;
}


# Do-While Loop:



integer count = 1;
do{
System.debug('The Count---> '+count);
count++;
}while(count<13);


     */
   
}