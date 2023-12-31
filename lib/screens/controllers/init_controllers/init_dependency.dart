import 'package:get/get.dart';
import 'package:todo_app/cache/cache_storage.dart';
import 'package:todo_app/screens/controllers/task_controller.dart';
import 'package:todo_app/screens/controllers/task_state_ctrl.dart';

class InitDep implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<TaskStateController>(TaskStateController());
    Get.put<TaskController>(TaskController(), permanent: true);
    await Get.putAsync<StorageDevice>(() => StorageDevice().init());
  }
}
