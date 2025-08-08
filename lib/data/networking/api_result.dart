import 'package:tcb_recru_task/domain/app_error.dart';

sealed class ApiResult<T> {
  const ApiResult();
}

final class ApiResultFailure<T> extends ApiResult<T> {
  const ApiResultFailure(this.error);

  final AppError error;
}

final class ApiResultSuccess<T> extends ApiResult<T> {
  final T data;

  const ApiResultSuccess(this.data);
}
