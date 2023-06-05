import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import 'JsonFileManager.dart';

class ListJsonController {
  String parentDirectoryPath = Directory.current.parent.path;

  Future<Map<String, dynamic>?> readCategoryJsonFile() async {
    final JsonFileManager jsonFileManager =
        JsonFileManager('assets/json_files/category_types.json');

    Map<String, dynamic>? jsonData = await jsonFileManager.readJsonFile();

    return jsonData;
  }

  Future<Map<String, dynamic>?> readDefinedListJsonFile(bool isOption) async {
    if(isOption == true){
      final JsonFileManager jsonFileManager = JsonFileManager('assets/json_files/defined_workout_lists.json');
      Map<String, dynamic>? jsonData = await jsonFileManager.readJsonFile();
      return jsonData;
    }

    try {
      Directory appDocumentsDir = await getApplicationDocumentsDirectory();
      String filePath = '${appDocumentsDir.path}/user_workout_lists.json';

      File file = File(filePath);
      String fileContent = await file.readAsString();
      Map<String, dynamic> jsonData = json.decode(fileContent);
      return jsonData;
    } catch (e) {
      print('Hata: $e');
      return null;
    }

  }

  Future<Map<String, dynamic>?> writeDefinedListJsonFile(String title) async {
    try {
      Directory appDocumentsDir = await getApplicationDocumentsDirectory();
      String filePath = '${appDocumentsDir.path}/user_workout_lists.json';
      Map<String, dynamic> jsonData = {};
          File file = File(filePath);
      if(!file.existsSync()){
      print("list json cont. 51");
        file.createSync();
      print("list json cont. 53");
      }else{
      print("list json cont. 55");
        String fileContent = await file.readAsString();
        jsonData = json.decode(fileContent);
      print("list json cont. 58");
      }

      print("list json cont. 61");

      // Veri ekleme işlemini gerçekleştirin
      final newEntry = {
        "title": title,
        "workouts": []
        // Diğer veri alanlarını buraya ekleyebilirsiniz
      };

      // JSON verisine yeni girdiyi ekleyin
      //jsonMap['entries'] ??= [];
      jsonData["${jsonData.length}"] = newEntry;

      // JSON verisini dosyaya geri yazın
      //await file.writeAsString(json.encode(jsonMap));
      //print(jsonData);

      JsonFileManager jsonFileManager = JsonFileManager(filePath);
      jsonFileManager.writeJsonFile(jsonData);
      return null;
      return jsonData;
    } catch (e) {
      print('Hata: $e');
      return null;
    }


  }
}
