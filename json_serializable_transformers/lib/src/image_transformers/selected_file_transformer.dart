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
    extends JsonConverter<List<SelectedFile>, dynamic> {
  const SelectedFileTransformer();

  @override
  List<SelectedFile> fromJson(dynamic json) {
    if (json is String) {
      final uri = Uri.tryParse(json);
      return [
        SelectedFile.image(
          file: null,
          url: uri?.toString(),
        )
      ];
    }

    if (json is List<Object?>) {
      final file = List<SelectedFile>.from(
        (json).map<SelectedFile>((x) {
          if (x is! Map<String, dynamic>) {
            return SelectedFile.image(file: null, url: null);
          }
          final url = Uri.tryParse(x["url"]["url"]);
          final fileExists = x["file"]["path"] != null &&
              ((x["file"]["path"] as String?)?.isNotEmpty ?? false);

          return SelectedFile.image(
            file: fileExists
                ? XFile(
                    x["file"]["path"],
                    name: x["file"]["name"],
                    mimeType: x["file"]["mimeType"],
                  )
                : null,
            url: url?.toString(),
          );
        }),
      );
      return file;
    }
    return [];
  }

  @override
  List<dynamic> toJson(List<SelectedFile> object) {
    return object
        .map((e) => {
              "file": {
                "path": e.file?.path,
                "name": e.file?.name,
                "mimeType": e.file?.mimeType,
              },
              "url": {
                "url": e.url,
              }
            })
        .toList();
  }
}
