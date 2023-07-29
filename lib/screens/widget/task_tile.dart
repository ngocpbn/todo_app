import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/screens/task_overview.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Color borderColor;
  final Color shadowColor;
  const TaskTile(
      {super.key,
      required this.task,
      required this.borderColor,
      required this.shadowColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => TaskOverview(task: task)),
      child: Container(
        margin: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
        width: double.maxFinite,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: borderColor,
              // width: 2.0,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
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
                    Text(
                      task.title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Due date: ${task.dueDate}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Priority: ${task.priority}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
