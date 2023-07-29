import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/task.dart';

class StorageDevice extends GetxService {
  late final SharedPreferences _prefs;
  Future<StorageDevice> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  // static StorageDevice get to => Get.find();

  Future<bool> saveTasksToCache(List<Task> tasks) async {
    return await _prefs.setString("storage", jsonEncode(tasks));
  }

  // String getTask
  List<Task> getTasks() {
    List<Task> taskList = <Task>[];
    String rawList = _prefs.getString('storage') as String;
    dynamic listMap = jsonDecode(rawList);
    for (var task in listMap) {
      taskList.add(Task.fromJson(task));
    }

    return taskList;
  }
}
