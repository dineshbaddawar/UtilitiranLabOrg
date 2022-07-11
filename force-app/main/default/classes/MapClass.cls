public class MapClass {

    public static void MapCollection(){
        Account acc = new Account();
        acc.Name = 'Map Collection';
        acc.BillingCity = 'ENG';
        
        Map<Integer, Account> map1 = new Map<Integer, Account>();
        map1.put(1,acc);
        System.debug('the Map1 ::'+map1);
        
        Map<Integer, Account> map2 = map1.clone();
         System.debug('the Map2 ::'+map2);
        map1.get(1).BillingCity = 'NZ';
        System.debug('the Map1 get Value ::'+map1);
        
        Map<String, String> colorCodes = new Map<String, String>();
        
        colorCodes.put('Red', 'FF0000');
        colorCodes.put('Blue', '0000A0');
        
        Boolean contains = colorCodes.containsKey('Blue');
        System.debug('the contains Value ::'+contains);
        System.assertEquals(true, contains);
        
        Map<String, String> colorCodes1 = new Map<String, String>();
        
        colorCodes1.put('Red', 'FF0000');
        colorCodes1.put('Blue', '0000A0');
        
        String code = colorCodes1.get('Blue');
        System.debug('The Code ::'+code);
        
    }
}