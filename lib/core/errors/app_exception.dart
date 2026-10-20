/// Failures raised by data sources.
///
/// Domain code should not catch these directly. Repositories will map
/// them to a Failure once the API exists.
sealed class AppException implements Exception {
  const AppException(this.message);

  final String message;

  @override
  String toString() => message;
}

final class NetworkException extends AppException {
  const NetworkException(super.message);
}

final class StorageException extends AppException {
  const StorageException(super.message);
}

final class ValidationException extends AppException {
  const ValidationException(super.message);
}
