public with sharing class DemoTestClass {
   
    public Static Boolean IsBlank(String DataToPass){
        if(DataToPass == null){
            System.debug('True 1');
            return true;
        }else if(DataToPass == ''){
            System.debug('True 2');
            return true;
        } else {
            return false;
        }
    }
}