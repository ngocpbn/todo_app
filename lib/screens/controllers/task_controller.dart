import 'package:get/get.dart';
import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/cache/cache_storage.dart';

class TaskController extends GetxController {
  late StorageDevice storageDevice = Get.find();

  List<Task> getTaskList() => storageDevice.getTasks();
  // final will make the hash code of the list constant - but not the element inside the list
  final RxList<Task> _inQueue = <Task>[].obs;
  final RxList<Task> _inProgress = <Task>[].obs;
  final RxList<Task> _finished = <Task>[].obs;

  List<Task> get inQueue => _inQueue.value;
  List<Task> get inProgress => _inProgress.value;
  List<Task> get finished => _finished.value;

  RxInt inQueueLength() {
    return _inQueue.length.obs;
  }

  RxInt inProgressLength() {
    return _inProgress.length.obs;
  }

  RxInt finishedLength() {
    return _finished.length.obs;
  }

  void addTask(Task task) {
    List<Task> tasks = getTaskList();
    tasks.add(task);
    storageDevice.saveTasksToCache(tasks);

    if (task.status == 0) {
      _inQueue.add(task);
    } else if (task.status == 1) {
      _inProgress.add(task);
    } else {
      _finished.add(task);
    }
  }
}
