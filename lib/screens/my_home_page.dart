import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/common/colors.dart';
import 'package:todo_app/screens/controllers/task_controller.dart';
import 'package:todo_app/screens/controllers/task_state_ctrl.dart';
// import 'package:todo_app/screens/general_task_listview/view/general_task_listview.dart';
// import 'package:todo_app/screens/controllers/init_controllers/init_dependency.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TaskController taskController = Get.find();
    TaskStateController taskStateController = Get.find();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/nature.jpg',
                  ),
                  Container(
                    height: 261,
                    width: double.maxFinite,
                    // margin: const EdgeInsets.all(20.0),
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      // borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20.0, bottom: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Text("Greetings!",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold))),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Text("How are you doing today?",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)))
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, top: 25.0),
                child: Text(
                  "To do list",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: () => Get.toNamed("/inQueue", parameters: {
                  "matchingKey": taskStateController.setState(0).toString()
                }),
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                  width: double.maxFinite,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: inQueueBorder,
                        // width: 2.0,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: inQueueShadow,
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: const Offset(4, 5),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "In queue",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Obx(() => Text(
                                    "${taskController.inQueueLength()} tasks waiting",
                                    style: const TextStyle(fontSize: 16),
                                  ))
                            ]),
                        const Icon(
                          Icons.assignment_outlined,
                          size: 45,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Get.toNamed("/inProgress", parameters: {
                  "matchingKey": taskStateController.setState(1).toString()
                }),
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                  width: double.maxFinite,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: inProgressBorder,
                        // width: 2.0,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: inProgressShadow,
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: const Offset(4, 5),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "In progress",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Obx(() => Text(
                                    "${taskController.inProgressLength()} tasks in progress",
                                    style: const TextStyle(fontSize: 16),
                                  ))
                            ]),
                        const Icon(
                          Icons.pending_outlined,
                          size: 45,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Get.toNamed("/finished", parameters: {
                  "matchingKey": taskStateController.setState(2).toString()
                }),
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                  width: double.maxFinite,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: finishedBorder,
                        // width: 0.5,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: finishedShadow,
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: const Offset(4, 5),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Finished",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Obx(() => Text(
                                    "${taskController.finishedLength()} tasks finished!",
                                    style: const TextStyle(fontSize: 16),
                                  ))
                            ]),
                        const Icon(Icons.assignment_turned_in_outlined,
                            size: 45),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
