import 'dart:io';
import 'lib/config.dart';

void main() {
  print("running generate_gradle_properties success");
  final propertiesFile = File('android/app/key.properties');
  propertiesFile.writeAsStringSync('api_key=$apiKey');
}
