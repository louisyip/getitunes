import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' as http;
import 'dart:io';

class MethodService {
  static void getMethod(String apiPath, void onSuccess(Response response),
      void onFailed(Error error)) async {
    final ioClient = HttpClient();
    ioClient.connectionTimeout = const Duration(seconds: 20);
    final client = http.IOClient(ioClient);
    http.Response response;
    try {
      response = await client
          .get(apiPath, headers: {'Content-Type': 'application/json'});
      if (response != null) {
        onSuccess(response);
      } else {
        onFailed(Error());
      }
    } on SocketException catch (e) {
      print("network error!!!");
      // Display an alert, no internet
    } catch (err) {
      print(err);
      return null;
    }

    ioClient.close();
  }
}
