@isTest
public with sharing class DemoTestClassTEST {
    
    @isTest
    static void makeData(){
        String Testdata;
        // DemoTestClass.IsBlank() returns true for null values
        System.assertEquals(true, DemoTestClass.IsBlank(Testdata));

        Testdata = '';

        // DemoTestClass.IsBlank() returns true for empty Strings
        System.assertEquals(true, DemoTestClass.IsBlank(Testdata));

        Testdata ='String Value';

     // DemoTestClass.IsBlank() returns false when Testdata is neither an empty string nor null
     System.assertEquals(false, DemoTestClass.IsBlank(Testdata));
       
    }
}