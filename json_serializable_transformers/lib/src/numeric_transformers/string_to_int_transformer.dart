import 'package:freezed_annotation/freezed_annotation.dart';

///Implement this class transformer to convert a String type to int.
///
///
///Example: "20" to 20
///
///It can be used with `freezed` or `json_serializable` packages.
///
///To implement this, just annotate the json key with this class.
///
///```dart
///@freezed
///class MyFreezedClass {
///...
///@StringToIntTransformer()
///Value property,
///...
///}
///```
///
class StringToIntTransformer implements JsonConverter<int, String> {
  const StringToIntTransformer();

  @override
  int fromJson(String json) => int.parse(json);

  @override
  String toJson(int object) => object.toString();
}
