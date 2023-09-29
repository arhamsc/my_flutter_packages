import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<String> getAppPath() async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  final appDocPath = appDocDir.path;
  return appDocPath;
}
