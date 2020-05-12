class $ {
  // DateTime _dateTime = DateTime.now();

  // DateTimes(DateTime datetime){ //构造函数

  // }
 
  static String getNow({DateTime time,}){
    var now = time != null ? time : new DateTime.now();
    var year = now.year.toString();
    var month = now.month.toString();
    var day = now.day.toString().padLeft(2,'0');
    var hour = now.hour.toString().padLeft(2,'0');
    var minute = now.minute.toString().padLeft(2,'0');
    var second = now.second.toString().padLeft(2,'0');
    return "$year-$month-$day $hour:$minute:$second";
  }

 
}