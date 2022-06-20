public class toDateTime1 {

    public static DateTime toDateTime(String DateTimevalue) {
    List<String> DateAndTimeList = DateTimevalue.split('T');
    List<String> dayList = DateAndTimeList[0].split('-');
    List<string> timeList = DateAndTimeList[1].split(':');
    DateTime dt = DateTime.newInstance(Integer.valueOf(dayList[0]), Integer.valueOf(dayList[1]),         Integer.valueOf(dayList[2]), Integer.valueOf(timeList[0]), Integer.valueOf(timeList[1]),  Integer.valueOf(timeList[2].split('\\.')[0]));
    return dt;
}
}