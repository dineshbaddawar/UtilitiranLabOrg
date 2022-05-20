global class ActivityMappingWrapper {
    
    public  cls_activitylist[] Activity;
    global class cls_activitylist{
        public String activity_type;
        public String search_by_value;
        public String exam_date;
        public String activity_note;
        public String exam_name;
        public String exam_slug;
        public String subject;
        public String exam_score;
        public Decimal skill_based_exam_score;
        public Boolean is_qualified_in_exam;
      
    }
    public Static ActivityMappingWrapper parse(String json){
        return (ActivityMappingWrapper) System.JSON.deserialize(json, ActivityMappingWrapper.class);
    }
    
}