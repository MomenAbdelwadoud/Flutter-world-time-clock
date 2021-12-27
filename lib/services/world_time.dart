import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  String date;
  Map date_map;
  bool isDay;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.http('worldtimeapi.org', 'api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      // print(offset);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      // print(now);
      isDay = now.hour > 6 && now.hour < 19 ? true : false;
      date_map = {'day': now.day, 'month': now.month, 'year': now.year};
      date = '${date_map['year']}:${date_map['month']}:${date_map['day']}';
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = 'Error happened';
    }
  }
}
