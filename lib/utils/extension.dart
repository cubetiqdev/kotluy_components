import 'package:component_sdk/console/console.dart';

extension IterableExtension<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
  T? get lastOrNull => isEmpty ? null : last;

  Iterable<T> whereNotNull() => where((element) => element != null);
  T? firstWhereOrNull(bool Function(T element) test) => where(test).firstOrNull;
  T? lastWhereOrNull(bool Function(T element) test) => where(test).lastOrNull;
  T? firstWhereOrNull2(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}

extension MapExtension<K, V> on Map<K, V>? {
  V? getOrNull(K key) => this?[key];
  String? getOrEmpty(K key) => this?[key]?.toString() ?? '';
  V? getOrDefault(K key, V defaultValue) => this?[key] ?? defaultValue;
}

String? safeString(dynamic value) {
  if (value == null) return null;
  if (value is String) return value;
  return value.toString();
}

String? getErrorMessage(dynamic error) {
  try {
    if (error is String) return error;
    if (error is Map) return error['message'];
    if (error is Exception) return error.toString();
    return null;
  } catch (e) {
    Console.error('getErrorMessage', e);
    rethrow;
  }
}
