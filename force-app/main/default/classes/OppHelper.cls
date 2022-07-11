public  class OppHelper {
    
    public String AccountId;
    public String Name;
    public Decimal amount;
    public Date closedate;
    public String nextstep;
    public String stage;
    public String type;
    public Decimal probability;
    public String leadsource;
    public String phone;

    public Static OppHelper parse(String json){
        return (OppHelper) System.JSON.deserialize(json, OppHelper.class);
    }
}