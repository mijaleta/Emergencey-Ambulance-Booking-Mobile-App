import 'package:gebetamap/gebetamap.dart';

void callDirection() async {
  GebetaMapRequest gmr = new GebetaMapRequest();
  var directionStart = new Map();
  // 7.675808292092417,36.829905866568666
  directionStart["lat"] = 7.675808292092417;
  directionStart["lon"] = 36.829905866568666;
  var directionStop = new Map();
  // 7.693872917682323,36.81926729439167
  directionStop["lat"] = 7.693872917682323;
  directionStop["lon"] = 36.81926729439167;
  String apiKey = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjNiYmNhM2M4LWYwNWQtNDZiNy04YTk4LWQ1YmEyMTkzY2YzYSJ9.0InfDuks2cAZnfel8Wq8ItetdKkaLUXu2RjInGLQ0Pg";

  ResponseData rds = await gmr.direction(directionStart, directionStop, apiKey);
  print('Response message: ${rds.message}');
  print('Response status: ${rds.status}');
  print('path: ${rds.path}');
  print('distance: ${rds.totalDistance}');
  print('time: ${rds.totaltime}');
}

void callMatrix() async {
  String apiKey = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjNiYmNhM2M4LWYwNWQtNDZiNy04YTk4LWQ1YmEyMTkzY2YzYSJ9.0InfDuks2cAZnfel8Wq8ItetdKkaLUXu2RjInGLQ0Pg";
  List<List<double>> points = [
    // 7.675808292092417,36.829905866568666 - Start
    // 7.693872917682323,36.81926729439167 - Stop
    [7.675808292092417, 36.829905866568666],
    [7.693872917682323, 36.81926729439167]
  ];

  GebetaMapRequest gmr = new GebetaMapRequest();
  List<List<ResponseData>> rs = await gmr.matrix(points, apiKey);
  for (int i = 0; i < rs.length; i++) {
    for (int j = 0; j < rs[i].length; j++) {
      print('Response message: ${rs[i][j].message}');
      print('Response status: ${rs[i][j].status}');
      print('path: ${rs[i][j].path}');
      print('distance: ${rs[i][j].totalDistance}');
      print('time: ${rs[i][j].totaltime}');
    }
  }
}

void callTss() async {
  String apiKey = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjNiYmNhM2M4LWYwNWQtNDZiNy04YTk4LWQ1YmEyMTkzY2YzYSJ9.0InfDuks2cAZnfel8Wq8ItetdKkaLUXu2RjInGLQ0Pg";
  List<List<double>> points = [
    // 7.675808292092417,36.829905866568666 - Start
    // 7.693872917682323,36.81926729439167 - Stop
    [7.675808292092417, 36.829905866568666],
    [7.693872917682323, 36.81926729439167]
  ];

  GebetaMapRequest gmr = new GebetaMapRequest();
  ResponseData rds = await gmr.tss(points, apiKey);
  print('Response message: ${rds.message}');
  print('Response status: ${rds.status}');
  print('path: ${rds.path}');
  print('distance: ${rds.totalDistance}');
  print('time: ${rds.totaltime}');
}

void callOneToMany() async {
  // Agri Cumpus - 7.685180740992518,36.82945544314987
  // 7.693872917682323,36.81926729439167 - Stop
  var directionStart = new Map();
  directionStart["lat"] = 7.685180740992518;
  directionStart["lon"] = 36.82945544314987;
  List<List<double>> points = [
    [7.685180740992518, 36.82945544314987],
    [7.693872917682323, 36.81926729439167]
  ];
  String apiKey = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjNiYmNhM2M4LWYwNWQtNDZiNy04YTk4LWQ1YmEyMTkzY2YzYSJ9.0InfDuks2cAZnfel8Wq8ItetdKkaLUXu2RjInGLQ0Pg";

  GebetaMapRequest gmr = new GebetaMapRequest();
  List<ResponseData> rs = await gmr.OneToMany(directionStart, points, apiKey);

  for (int i = 0; i < rs.length; i++) {
    print('Response message: ${rs[i].message}');
    print('Response status: ${rs[i].status}');
    print('path: ${rs[i].path}');
    print('distance: ${rs[i].totalDistance}');
    print('time: ${rs[i].totaltime}');
  }
}

void callGeoCode() async {
  String name = "Jimma Health Center";
  String apiKey = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjNiYmNhM2M4LWYwNWQtNDZiNy04YTk4LWQ1YmEyMTkzY2YzYSJ9.0InfDuks2cAZnfel8Wq8ItetdKkaLUXu2RjInGLQ0Pg";
  GebetaMapRequest gmr = new GebetaMapRequest();
  ResponseData rs = await gmr.geocode(name, apiKey);
  // print(rs.data);
}

// void callMapFunctions() async {
//   making geocoding request
//   callOneToMany();
//   callGeoCode();
//   callDirection();
//   callMatrix();
//   callTss();
// }