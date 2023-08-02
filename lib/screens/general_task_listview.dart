import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/data/models/task.dart';

import 'package:todo_app/data/raw_data/raw_data.dart';
import 'package:todo_app/screens/controllers/task_state_ctrl.dart';
import 'package:todo_app/screens/widget/task_tile.dart';

class GeneralTaskListview extends StatelessWidget {
  const GeneralTaskListview({super.key});

  @override
  Widget build(BuildContext context) {
    TaskStateController viewStateCtrl = Get.find();
    List<Task> tasks = <Task>[];
    int viewState = viewStateCtrl.getState();

    return Scaffold(
      floatingActionButton: viewStateCtrl.getState() == 0
          ? FloatingActionButton(
              onPressed: () => Get.toNamed("/editAdd"),
              backgroundColor: Colors.blue[300],
              child: const Icon(Icons.add),
            )
          : null,
      body: SafeArea(
          child: ListView(
        children: [
          AppBar(
            leading: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 20.0,
                )),
            backgroundColor: Colors.white,
            title: Text(viewStateCtrl.getTitle(),
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
            centerTitle: true,
          ),
          ...tasks.map(
            (e) => TaskTile(
              task: e,
            ),
          )
        ],
      )),
    );
  }
}
