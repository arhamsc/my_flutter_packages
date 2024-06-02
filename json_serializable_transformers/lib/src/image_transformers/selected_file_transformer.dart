import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
import 'package:reactive_image_picker/reactive_image_picker.dart';


///Implement this class transformer to serialize the List<SelectedFile> Object,
///
///required by the `reactive_image_picker` package.
///
///This works by making a local copy of the file and storing the path to that file in the
///
///json object returned by `toJson` and if there is an url it will be storing it in the uri.
///
///------
///
///It can be used with `freezed` or `json_serializable` packages.
///
///To implement this, pass the `imageFromJson` and `imageToJson` static methods to `@JsonKey()`.
///
///```dart
///@freezed
///class MyFreezedClass {
///...
///@SelectedFileTransformer()
///Value property,
///...
///}
///```
///
class SelectedFileTransformer
    extends JsonConverter<List<SelectedFile>, List<Map<String, dynamic>>> {
  const SelectedFileTransformer();

  @override
  List<SelectedFile> fromJson(dynamic json) {
    if (json == null) return [];

    if (json is List<SelectedFile> || json is List<SelectedFile>?) {
      return json;
    }

    final file = List<SelectedFile>.from(
      (json as List<Object?>).map<SelectedFile>((x) {
        if (x is! Map<String, dynamic>) return SelectedFile.image(file: null, url: null);
        final url = Uri.tryParse(x["url"]["url"]);
        final fileExists = x["file"]["path"] != null && ((x["file"]["path"] as String?)?.isNotEmpty ?? false);

        return SelectedFile.image(
          file: fileExists
              ? File(
                  x["file"]["path"],
                )
              : null,
          url: url?.toString(),
        );
      }),
    );
    return file;
  }

  @override
  List<Map<String, dynamic>> toJson(List<SelectedFile> object) {
    return object.map((e) => {
      "file" : {
        "path": e.file?.path,
      },
      "url" : {
        "url": e.url,
      }
    }).toList();
  }
}
