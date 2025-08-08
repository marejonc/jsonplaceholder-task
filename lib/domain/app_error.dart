const apiError = AppErrorApi();

sealed class AppError {
  const AppError();
}

final class AppErrorApi extends AppError {
  const AppErrorApi();
}

final class AppErrorNetwork extends AppError {
  const AppErrorNetwork();
}
