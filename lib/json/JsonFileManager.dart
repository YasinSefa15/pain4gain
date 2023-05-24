import 'dart:convert';
import 'dart:io';

class JsonFileManager {
  final String filePath;

  JsonFileManager(this.filePath);

  Future<Map<String, dynamic>?> readJsonFile() async {
    try {
      File file = File(filePath);
      if (await file.exists()) {

        String fileContent = await file.readAsString();
        Map<String, dynamic> jsonData = jsonDecode(fileContent);
        return jsonData;
      }
    } catch (e) {
      print('Hata: $e');
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
