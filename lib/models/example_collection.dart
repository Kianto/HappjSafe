import 'package:happjsafe/models/news.dart';
import 'package:happjsafe/models/route.dart';
import 'package:happjsafe/models/service.dart';
import 'package:happjsafe/models/user.dart';

///
/// Contain example data
///

abstract class RouteCollector {
  static List<Route> getCollection() {
    return [
      Route(id: "11", serviceId: "Over Sea Ship",
          fromPlace: "Hoang Sa",
          toPlace: "Truong Sa",
          fromTime: DateTime.now().subtract(Duration(days: 5)),
          toTime: DateTime.now().subtract(Duration(days: 5)).add(Duration(hours: 21)),
          isGood: true,
      ),
      Route(id: "01", serviceId: "A Train",
        fromPlace: "HCM",
        toPlace: "HN",
        fromTime: DateTime.now().subtract(Duration(days: 2)),
        toTime: DateTime.now().subtract(Duration(days: 2)).add(Duration(hours: 5)),
          isGood: false,
      ),
      Route(id: "02", serviceId: "ALVN",
          fromPlace: "DN",
          toPlace: "Hue",
          fromTime: DateTime.now().subtract(Duration(days: 1)),
          toTime: DateTime.now().subtract(Duration(days: 1)).add(Duration(hours: 3)),
        isGood: true,
      ),
      Route(id: "01", serviceId: "ALVN",
          fromPlace: "TS",
          toPlace: "HS",
          fromTime: DateTime.now(),
          toTime: DateTime.now().add(Duration(hours: 13)),
        isGood: true,
      ),
    ];
  }
}


abstract class NewsCollector {
  static List<News> getCollection() {
    return [
      News(
          id: "081",
          title: "Government",
          content: "Extended the social isolation measures at least until April 22 for high-risk localities.",
          time: DateTime.now().subtract(Duration(hours: 21)),
          isDanger: false,
      ),
      News(
        id: "091",
        title: "Virus News",
        content: "Found: 100, Cured: 50, Died: 0",
        time: DateTime.now().subtract(Duration(hours: 21)),
        isDanger: false,
      ),
      News(
          id: "701",
          title: "Virus News",
          content: "Found: 80, Cured: 40, Died: 0",
          time: DateTime.now().subtract(Duration(days: 1)),
          isDanger: false,
      ),
      News(
          id: "201",
          title: "Virus News",
          content: "Found: 70, Cured: 32, Died: 0",
          time: DateTime.now().subtract(Duration(days: 2)),
          isDanger: false,
      ),
    ];
  }
}

abstract class ServiceCollector {
  static Service getCollection() {
    return Service(
        id: "ALVN",
        provider: "Vietnam Airline",
        qrCode: "https://cdn.quantrinhahang.edu.vn/wp-content/uploads/2019/07/qr-code-la-gi-400x400.jpg",
        fromPlace: "DN",
        toPlace: "Hue",
        passengerIds: ["000000000000001"],
        fromTime: DateTime.now().subtract(Duration(days: 1)),
        toTime: DateTime.now().subtract(Duration(days: 1)).add(Duration(hours: 3)),
    );
  }
}

abstract class UserCollector {
  static User getCollection() {
    return User(
      id: "000000000000001",
      phone: "+84000111222",
      qrCode: "https://cdn.quantrinhahang.edu.vn/wp-content/uploads/2019/07/qr-code-la-gi-400x400.jpg",
      name: "Happj Man",
      isGood: true,
      isInspector: false,
      history: RouteCollector.getCollection(),
      warnings: [News(id: "000pp",
        title: "Warning",
        content: "The trip from HN to HCM you have joined in April 20 had reported an infected case!",
        time: DateTime.now().subtract(Duration(days: 1)),
        isDanger: true,)],
    );
  }
}
