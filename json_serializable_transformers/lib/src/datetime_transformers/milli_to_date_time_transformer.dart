import 'package:json_annotation/json_annotation.dart';

class MilliToDateTimeTransformer extends JsonConverter<DateTime, int> {
  const MilliToDateTimeTransformer();

  @override
  DateTime fromJson(int json) => DateTime.fromMillisecondsSinceEpoch(json);

  @override
  int toJson(DateTime object) => object.millisecondsSinceEpoch;
}