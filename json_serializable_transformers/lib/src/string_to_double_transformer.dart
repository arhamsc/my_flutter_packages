import 'package:freezed_annotation/freezed_annotation.dart';

///Implement this class transformer to convert a double type to String.
///
///
///Example: 20.0 to "20.0"
///
///It can be used with `freezed` or `json_serializable` packages.
///
///To implement this, just annotate the json key with this class.
///
///```dart
///@freezed
///class MyFreezedClass {
///...
///@StringToDoubleTransformer()
///Value property,
///...
///}
///```
///
class StringToDoubleTransformer implements JsonConverter<double, String> {
  const StringToDoubleTransformer();

  @override
  double fromJson(String json) => double.parse(json);

  @override
  String toJson(double object) => object.toString();
}
