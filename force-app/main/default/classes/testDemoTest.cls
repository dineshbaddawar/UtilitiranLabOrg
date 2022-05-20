@isTest
public with sharing class testDemoTest {

   @isTest static void  TestDate(){
    String message = testDemo.getMessage();
    System.assertEquals('Dinesh Baddawar',message,'Test is Passed Successfully');

    }
}