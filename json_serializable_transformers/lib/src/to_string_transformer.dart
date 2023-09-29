import 'package:freezed_annotation/freezed_annotation.dart';

///Implement this class transformer to convert a dynamic or any type to String.
///
///
///Example: 20.0 to "20.0", or 10 to "10"
///
///This transformer calls the:
///```dart 
///toString()
///``` 
///method which exists on the object.
///
///-----
///
///It can be used with `freezed` or `json_serializable` packages.
///
///To implement this, just annotate the json key with this class.
///
///```dart
///@freezed
///class MyFreezedClass {
///...
///@ToStringTransformer()
///Value property,
///...
///}
///```
///
class ToStringTransformer implements JsonConverter<String, dynamic> {
  const ToStringTransformer();

  @override
  String fromJson(dynamic json) => json.toString();

  @override
  dynamic toJson(String object) => object.toString();
}
