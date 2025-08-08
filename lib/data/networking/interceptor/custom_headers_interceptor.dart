import 'dart:async';

import 'package:chopper/chopper.dart';

class CustomHeadersInterceptor implements Interceptor {
  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(Chain<BodyType> chain) {
    return chain.proceed(
      chain.request.copyWith(
        headers: {'authority': 'jsonplaceholder.typicode.com'},
      ),
    );
  }
}
