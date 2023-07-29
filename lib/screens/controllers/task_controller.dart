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

  RxInt inQueueLength() {
    return _inQueue.length.obs;
  }

  RxInt inProgressLength() {
    return _inProgress.length.obs;
  }

  RxInt finishedLength() {
    return _finished.length.obs;
  }

  void addToInQueue(Task t) {
    _inQueue.add(t);
  }

  void addToInProgress(Task t) {
    _inProgress.add(t);
  }

  void addToFinished(Task t) {
    _finished.add(t);
  }
}
