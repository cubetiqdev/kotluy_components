import 'dart:convert';

abstract class BaseModel<T> {
  BaseModel();

  Map<String, dynamic> toMap();

  T fromMap(Map<String, dynamic> map);

  T fromJson(String json) {
    return fromMap(decode(json));
  }

  @override
  String toString() {
    return toMap().toString();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BaseModel && other.toMap() == toMap();
  }

  @override
  int get hashCode => toMap().hashCode;

  String toJson() => encode(toMap());

  dynamic decode(String json) => jsonDecode(json);
  String encode(dynamic json) => jsonEncode(json);
}
