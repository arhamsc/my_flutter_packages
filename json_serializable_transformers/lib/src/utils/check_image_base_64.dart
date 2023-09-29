
bool isImageDataUri(String data) {
  // Define a regex pattern for image data URIs
  final pattern = RegExp(r'^data:image+;base64,', caseSensitive: false);

  // Check if the input string matches the pattern
  return pattern.hasMatch(data);
}
