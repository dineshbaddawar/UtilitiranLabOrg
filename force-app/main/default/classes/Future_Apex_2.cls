public class Future_Apex_2 {
    @future
        public static void Method(){
            List<Account> AccList=[Select id,Name From Account LIMIT 1000];
            for(Account acc:AccList){
                acc.Name='Mr '+acc.Name;
            }
            update AccList;
    }
}