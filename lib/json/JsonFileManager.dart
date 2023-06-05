import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class JsonFileManager {
  final String filePath;

  JsonFileManager(this.filePath);

  Future<Map<String, dynamic>?> readJsonFile() async {
    final jsonString = await rootBundle.loadString(filePath);
    final jsonData = json.decode(jsonString);

    if (jsonData != null) {
      return jsonData;
    }

    return null;
  }

  Future<bool> writeJsonFile(Map<String, dynamic> jsonData) async {
    // 1. Geçici bir dizin oluşturun
    Directory tempDir = await getTemporaryDirectory();
    String tempFilePath = '${tempDir.path}/user_workout_lists.json';

    // 2. JSON verisini dosyaya yazın
    String jsonContent = jsonEncode(jsonData);
    await File(tempFilePath).writeAsString(jsonContent);

    // 3. Geçici dizindeki dosyayı hedef dizine taşıyın
    Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    String finalFilePath = '${appDocumentsDir.path}/user_workout_lists.json';
    await File(tempFilePath).copy(finalFilePath);

    // 4. Geçici dizindeki dosyayı silin
    await File(tempFilePath).delete();

    return true;
  }
}
