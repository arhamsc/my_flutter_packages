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
///@DoubleToStringTransformer()
///Value property,
///...
///}
///```
///
class DoubleToStringTransformer implements JsonConverter<String, double> {
  const DoubleToStringTransformer();

  @override
  String fromJson(double json) => json.toString();

  @override
  double toJson(String object) => double.parse(object);
}
