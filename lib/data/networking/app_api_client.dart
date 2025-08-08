import 'package:chopper/chopper.dart';

final class AppApiClient extends ChopperClient {
  AppApiClient()
    : super(baseUrl: Uri.parse("https://jsonplaceholder.typicode.com"));
}
