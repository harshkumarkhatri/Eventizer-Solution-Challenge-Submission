import 'package:connectivity/connectivity.dart';

Future<String> checkConn() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return "mobile";
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return "wifi";
  }
  return "none";
}
