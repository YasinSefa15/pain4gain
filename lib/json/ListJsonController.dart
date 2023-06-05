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
    if (isOption == true) {
      final JsonFileManager jsonFileManager =
          JsonFileManager('assets/json_files/defined_workout_lists.json');
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

  Future<List<String>> getUserDefinedWorkoutLists() async {
    try {
      Directory appDocumentsDir = await getApplicationDocumentsDirectory();
      String filePath = '${appDocumentsDir.path}/user_workout_lists.json';

      File file = File(filePath);
      String fileContent = await file.readAsString();
      Map<String, dynamic> jsonData = json.decode(fileContent);

      List<String> titleList = [];

      jsonData.values.forEach((entry) {
        String title = entry['title'];
        if (title != null) {
          titleList.add(title);
        }
      });

      //print("data $jsonData");
      return titleList;
    } catch (e) {
      print('Hata: $e');
      return [];
    }
  }

  Future<Map<String, dynamic>?> writeDefinedListJsonFile(String title) async {
    try {
      Directory appDocumentsDir = await getApplicationDocumentsDirectory();
      String filePath = '${appDocumentsDir.path}/user_workout_lists.json';
      Map<String, dynamic> jsonData = {};
      File file = File(filePath);
      if (!file.existsSync()) {
        file.createSync();
      } else {
        String fileContent = await file.readAsString();
        jsonData = json.decode(fileContent);
      }

      // Veri ekleme işlemini gerçekleştirin
      final newEntry = {
        "title": title,
        "workouts": []
        // Diğer veri alanlarını buraya ekleyebilirsiniz
      };
      jsonData["${jsonData.length}"] = newEntry;
      JsonFileManager jsonFileManager = JsonFileManager(filePath);
      jsonFileManager.writeJsonFile(jsonData);
      return null;
    } catch (e) {
      print('Hata: $e');
      return null;
    }
  }

  Future<void> addWorkoutToUserList(String title, workout) async {
    try {
      Directory appDocumentsDir = await getApplicationDocumentsDirectory();
      String filePath = '${appDocumentsDir.path}/user_workout_lists.json';
      Map<String, dynamic> jsonData = {};
      print(filePath);
      File file = File(filePath);
      String fileContent = await file.readAsString();
      jsonData = json.decode(fileContent);

      // Veriyi güncelle
      jsonData.values.forEach((entry) {
        if (entry['title'] == title) {
          List<dynamic> workouts = entry['workouts'];
          workouts.add(workout);
          entry['workouts'] = workouts;
        }
      });

      JsonFileManager jsonFileManager = JsonFileManager(filePath);
      jsonFileManager.writeJsonFile(jsonData);
    } catch (e) {
      print('Hata: $e');
    }
  }

  Future<void> removeUserWorkoutList(String title) async {
    try {
      Directory appDocumentsDir = await getApplicationDocumentsDirectory();
      String filePath = '${appDocumentsDir.path}/user_workout_lists.json';
      Map<String, dynamic> jsonData = {};
      Map<String, dynamic> newJsonData = {};

      File file = File(filePath);
      String fileContent = await file.readAsString();
      jsonData = json.decode(fileContent);

      bool indexPassed = false;

      // Veriyi güncelle
      jsonData.values.forEach((entry) {
        if (entry['title'] == title) {
          indexPassed = true;
        } else {
          if (indexPassed) {
            newJsonData["${jsonData.length - 1}"] = entry;
          } else {
            newJsonData["${jsonData.length}"] = entry;
          }
        }
      });

      JsonFileManager jsonFileManager = JsonFileManager(filePath);
      jsonFileManager.writeJsonFile(newJsonData);
    } catch (e) {
      print('Hata: $e');
    }
  }
}
