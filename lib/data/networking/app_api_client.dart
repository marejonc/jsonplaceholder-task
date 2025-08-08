import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_chopper_logger/simple_chopper_logger.dart';
import 'package:tcb_recru_task/data/networking/interceptor/custom_headers_interceptor.dart';

@lazySingleton
final class AppApiClient extends ChopperClient {
  AppApiClient()
    : super(
        baseUrl: Uri.parse("https://jsonplaceholder.typicode.com"),
        interceptors: [CustomHeadersInterceptor(), SimpleChopperLogger()],
      );
}
