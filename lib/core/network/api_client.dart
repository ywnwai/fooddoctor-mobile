/// HTTP boundary.
///
/// No implementation is registered. Registration approval, directory
/// content, and the manual payment check in the business requirement
/// will go through this type when a backend exists.
abstract interface class ApiClient {
  Future<String> get(String path);

  Future<String> post(String path, Map<String, Object?> body);
}
