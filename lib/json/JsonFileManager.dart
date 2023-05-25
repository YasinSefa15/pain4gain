import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

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
    try {
      File file = File(filePath);
      String fileContent = jsonEncode(jsonData);
      await file.writeAsString(fileContent);
      return true;
    } catch (e) {
      print('Hata: $e');
    }
    return false;
  }
}
