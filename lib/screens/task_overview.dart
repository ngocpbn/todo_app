import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/data/models/task.dart';

class TaskOverview extends StatelessWidget {
  final Task task;
  const TaskOverview({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue[300],
        child: const Icon(Icons.edit_rounded),
        // elevation: ElevatedButton(onPressed: () {}, child: )
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AppBar(
            leading: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                iconSize: 20.0),
            title: const Text("Task Detail",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500)),
            centerTitle: true,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 15.0, bottom: 15.0),
            child: Text(
              task.title,
              style:
                  const TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700),
            ),
          ),
          const Divider(
            color: Color.fromARGB(
              255,
              117,
              114,
              114,
            ),
            thickness: 0.3,
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.label_important_rounded, size: 24.0),
                ),
                const Expanded(
                  flex: 2,
                  child: Text(
                    "Priority",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    task.priority == 0
                        ? "Low"
                        : task.priority == 1
                            ? "Medium"
                            : "High",
                    style: const TextStyle(fontSize: 15.0),
                  ),
                )
              ],
            ),
          ),
          Container(
            // alignment: AlignmentDirectional.center,
            margin:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.calendar_month_rounded, size: 24.0),
                ),
                const Expanded(
                  flex: 2,
                  child: Text(
                    "Start Date",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    task.startTime,
                    style: const TextStyle(fontSize: 15.0),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.calendar_month_rounded, size: 24.0),
                ),
                const Expanded(
                  flex: 2,
                  child: Text(
                    "Due Date",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    task.dueDate,
                    style: const TextStyle(fontSize: 15.0),
                  ),
                )
              ],
            ),
          ),
          const Divider(
            color: Color.fromARGB(
              255,
              117,
              114,
              114,
            ),
            thickness: 0.3,
          ),
          Container(
            margin: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
            child: const Text(
              "Description",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
            child: Text(
              task.description ?? "Add description.",
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ]),
      )),
    );
  }
}
