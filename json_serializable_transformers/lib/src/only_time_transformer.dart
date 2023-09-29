import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_serializable_transformers/src/utils/only_time_parser.dart';

///Implement this class transformer to parse a string which contains only time,
///
///in format of HH:MM:SS, in json string to DateTime object.
///
///Example: `20:30:00` contains time information of 10:30 PM
///
///It can be used with `freezed` or `json_serializable` packages.
///
///To implement this, just annotate the json key with this class.
///
///```dart
///@freezed
///class MyFreezedClass {
///...
///@OnlyTimeTransformer()
///Value property,
///...
///}
///```
///
class OnlyTimeTransformer implements JsonConverter<DateTime, String> {
  const OnlyTimeTransformer();

  @override
  DateTime fromJson(dynamic json) =>
      DateTime.tryParse(json as String) ?? onlyTimeParser(json);

  @override
  String toJson(DateTime object) => object.toIso8601String();
}
