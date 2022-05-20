public class SendBatchSMS {
    
    List<String> IdList;
    String tempId;
    String objType;
    
    public SendBatchSMS(List<String> IdList, String tempId, String objType){
        this.IdList = IdList;
        this.tempId = tempId;
        this.objType = objType;
    }
}