
const String baseUrl = "https://api.openrouteservice.org/v2/directions/driving-car";
const String apiKey = "5b3ce3597851110001cf624897e9009a48f9408592f2b3cff5720ab5";

getRouteUrl(String startPoint, String endPoint){
  return Uri.parse('$baseUrl?api_key=$apiKey&start=$startPoint&end=$endPoint');
}
