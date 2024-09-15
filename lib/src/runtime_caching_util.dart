class RuntimeCachingUtil {
  static final RuntimeCachingUtil _instance = RuntimeCachingUtil._internal();
  final Map<String, dynamic> _cache = {};

  factory RuntimeCachingUtil() {
    return _instance;
  }

  RuntimeCachingUtil._internal();

  // Cache a variable
  void cacheVariable<T>(String key, T value) {
    _cache[key] = value;
  }

  // Retrieve a cached variable
  T? getCachedVariable<T>(String key) {
    return _cache[key] as T?;
  }

  // Cache a whole class
  void cacheClass<T>(String key, T object) {
    if (object is! Map<String, dynamic>) {
      throw ArgumentError('Object must be a Map<String, dynamic>');
    }
    _cache[key] = object;
  }

  // Retrieve a cached class
  Map<String, dynamic>? getCachedClass(String key) {
    dynamic cachedObject = _cache[key];
    if (cachedObject is Map<String, dynamic>) {
      return cachedObject;
    }
    return null;
  }

  // Cache any value
  void cacheValue(String key, dynamic value) {
    _cache[key] = value;
  }

  // Retrieve any cached value
  dynamic getCachedValue(String key) {
    return _cache[key];
  }

  // Check if a key exists in the cache
  bool containsKey(String key) {
    return _cache.containsKey(key);
  }

  // Remove a specific item from the cache
  void removeFromCache(String key) {
    _cache.remove(key);
  }

  // Clear entire cache
  void clearCache() {
    _cache.clear();
  }

  // Get all keys in the cache
  Set<String> get allKeys => _cache.keys.toSet();

  // Get the size of the cache
  int get cacheSize => _cache.length;
}
