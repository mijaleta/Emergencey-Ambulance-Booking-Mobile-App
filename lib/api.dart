// import 'package:gebetamap/gebetamap.dart';
//
// class GebetaMapApi {
//   Future<ResponseData> getDirections(double startLatitude, double startLongitude, double endLatitude, double endLongitude, String apiKey) async {
//     GebetaMapRequest gmr = new GebetaMapRequest();
//     var directionStart = {'lat': startLatitude, 'lon': startLongitude};
//     var directionStop = {'lat': endLatitude, 'lon': endLongitude};
//     String apiKey = "";
//
//     ResponseData rds = await gmr.direction(directionStart, directionStop, apiKey);
//     return rds;
//   }
// }

// import 'package:gebetamap/gebetamap.dart';
//     GebetaMapRequest gmr = new GebetaMapRequest();
//      var directionStart = new Map();
//      directionStart["lat"] = 9.022528936095531;
//     directionStart["lon"] = 38.80400061607361;
//     var directionStop = new Map();
//     directionStop["lat"] = 9.021755421022991;
//      directionStop["lon"] = 38.79883468151093;
//     String apiKey = "";
//     ResponseData rds = await gmr.direction(directionStart, directionStop, apiKey);
//
//     print('Response message: ${rds.message}');
//     print('Response status: ${rds.status}');
//     print('Response body: ${rds.path}');

const String baseUrl = "https://api.openrouteservice.org/v2/directions/driving-car";
const String apiKey = "5b3ce3597851110001cf624897e9009a48f9408592f2b3cff5720ab5";

getRouteUrl(String startPoint, String endPoint){
  return Uri.parse('$baseUrl?api_key=$apiKey&start=$startPoint&end=$endPoint');
}
