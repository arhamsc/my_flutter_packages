import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

/// A [JsonConverter] that converts [InternetAddress] objects to and from JSON strings.
///
/// This converter is used to serialize and deserialize [InternetAddress] objects
/// when working with JSON data. It converts [InternetAddress] objects to their
/// string representation when serializing to JSON, and converts JSON strings
/// back to [InternetAddress] objects when deserializing from JSON.
///
/// Example usage:
///```dart
///@freezed
///class MyFreezedClass {
///...
///@InternetAddressTransformer()
///InternetAddress property,
///...
///}
///```
///
class InternetAddressTransformer
    implements JsonConverter<InternetAddress, String> {
  const InternetAddressTransformer();

  @override
  InternetAddress fromJson(dynamic json) {
    if (json is String) return InternetAddress(json);
    if (json is InternetAddress) return json;
    throw ArgumentError.value(json, 'json', 'Invalid InternetAddress');
  }

  @override
  String toJson(InternetAddress object) => object.address;
}
