import 'dart:io';

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
    final JsonFileManager jsonFileManager = isOption
        ? JsonFileManager('assets/json_files/defined_workout_lists.json')
        : JsonFileManager('assets/json_files/user_workout_lists.json');

    Map<String, dynamic>? jsonData = await jsonFileManager.readJsonFile();

    return jsonData;
  }

}
