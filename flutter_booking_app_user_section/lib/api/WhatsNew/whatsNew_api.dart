import 'package:flutter_booking_app_user_section/utils/impData.dart';
import 'package:http/http.dart' as http;

Future<http.Response> fetchAlbum() {
  return http.get(impData().whatsNewAPIURL);
}
