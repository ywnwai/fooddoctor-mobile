/// Local key-value storage.
///
/// Sign-in later needs a place for "remember password". Nothing writes
/// to disk in this step.
abstract interface class KeyValueStore {
  Future<String?> read(String key);

  Future<void> write(String key, String value);

  Future<void> delete(String key);
}
