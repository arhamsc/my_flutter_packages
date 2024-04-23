import 'dart:convert';
import 'dart:io';

import 'package:json_serializable_transformers/src/utils/check_image_base_64.dart';
import 'package:json_serializable_transformers/src/utils/get_app_path.dart';
import 'package:reactive_image_picker/reactive_image_picker.dart';

///Implement this class transformer to serialize the List<SelectedFile> Object,
///
///required by the `reactive_image_picker` package.
///
///This works by making a local copy of the file and storing the path to that file in the
///
///json object returned by `toJson`.
///
///------
///
///It also works with base64 encoded images which are prefixed with the appropriate type,
///
///like "data:image;", etc.
///
///It can be used with `freezed` or `json_serializable` packages.
///
///To implement this, pass the `imageFromJson` and `imageToJson` static methods to `@JsonKey()`.
///
///```dart
///@freezed
///class MyFreezedClass {
///...
///@JsonKey(fromJson: SelectedFileImageSerializer.imageFromJson, toJson:SelectedFileImageSerializer.imageToJson)
///Value property,
///...
///}
///```
///
class SelectedFileImageSerializer {
  static Future<List<SelectedFile>?> imageFromJson(dynamic json,
      {bool fromBase64 = false, String? filePath, e}) async {
    if (json == null) return Future.value(null);
    if (json is List<SelectedFile> || json is List<SelectedFile>?) {
      return json;
    }
    if (fromBase64 && isImageDataUri(json)) {
      final path = await getAppPath();

      File? doc = await File('$path/$filePath').create(
        recursive: true,
      );
      doc = await doc.writeAsBytes(base64.decode(json));
      return List<SelectedFile>.from(
        [
          SelectedFile.image(
            file: doc,
          ),
        ],
      );
    }
    final file = List<SelectedFile>.from(
      (json["image"] as List<Object?>).map<SelectedFile>(
        (x) => SelectedFile.image(
          file: File(
            (x ?? "") as String,
          ),
        ),
      ),
    );
    return file;
  }

  static Map<String, dynamic>? imageToJson(List<SelectedFile>? image) {
    if (image == null) return null;
    return {"image": image[0].file?.path};
  }
}
