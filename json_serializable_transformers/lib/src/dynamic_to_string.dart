import 'package:freezed_annotation/freezed_annotation.dart';

///Implement this class transformer to convert a int type to String.
///
///
///Example: 20 to "20"
///
///It can be used with `freezed` or `json_serializable` packages.
///
///To implement this, just annotate the json key with this class.
///
///```dart
///@freezed
///class MyFreezedClass {
///...
///@DynamicToStringTransformer()
///Value property,
///...
///}
///```
///
class DynamicToStringTransformer implements JsonConverter<String, dynamic> {
  const DynamicToStringTransformer();

  @override
  String fromJson(dynamic json) => json is String ? json : json.toString();

  @override
  dynamic toJson(String object) => object.toString();
}
