import 'package:get/get.dart';

class TaskStateController extends GetxController {
  static int state = -1; //0: in queue, 1: in progress, 2: finished

  int setState(int s) {
    state = s;
    return state;
  }

  int getState() => state;
  String getTitle() {
    if (state == 0) {
      return "In Queue";
    } else if (state == 1) {
      return "In Progress";
    } else if (state == 2) {
      return "Finished";
    } else {
      return "";
    }
  }
}
