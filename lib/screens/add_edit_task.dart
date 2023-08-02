import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/data/enums/common_enums.dart';
import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/screens/widget/date_picker.dart';
import 'package:todo_app/screens/controllers/task_controller.dart';
import 'package:todo_app/screens/widget/title_input_fields.dart';
import 'package:intl/intl.dart';

class AddEditTask extends StatefulWidget {
  const AddEditTask({super.key});

  @override
  State<AddEditTask> createState() => _AddEditTaskState();
}

class _AddEditTaskState extends State<AddEditTask> {
  String appBar = "";

  TextEditingController titleController = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController dueDate = TextEditingController();
  String status = Status.queue;
  int statusID = 0;
  String priority = Priority.low.name;
  int priorityID = 0;
  TextEditingController description = TextEditingController();
  // String hintText = "Pick date here";

  @override
  void initState() {
    super.initState();
  }

  void onChange(String text) {
    setState(() {
      appBar = titleController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    TaskController taskController = Get.find();
    return SafeArea(
        child: Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       appBar = titleController.text;
      //     });
      //   },
      // ),
      appBar: AppBar(
        title: Text(appBar),
        actions: [
          GestureDetector(
            onTap: () {
              taskController.addTask(Task(
                  456,
                  titleController.text,
                  description.text,
                  DateFormat.yMMMd().format(DateTime.now()),
                  priorityID,
                  startDate.text,
                  dueDate.text,
                  statusID));
              Get.toNamed("/");
            },
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              width: 50,
              height: 30,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: const Text(
                "Save",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TitleInputField(
            onChanged: onChange,
            hint: "Add title",
            titleController: titleController,
          ),
          const Divider(
            height: 1,
            color: Color.fromARGB(
              255,
              117,
              114,
              114,
            ),
            thickness: 0.3,
          ),
          Container(
            height: 50,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DropdownButton<String>(
                          value: priority,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          underline: const SizedBox(),
                          items: [
                            DropdownMenuItem(
                              value: Priority.low.name,
                              child: const Text("high",
                                  style: TextStyle(color: Colors.red)),
                            ),
                            DropdownMenuItem(
                              value: Priority.medium.name,
                              child: const Text("medium",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 242, 183, 9))),
                            ),
                            DropdownMenuItem(
                              value: Priority.high.name,
                              child: const Text("low",
                                  style: TextStyle(color: Colors.green)),
                            ),
                          ],
                          // value: chosenValue,
                          onChanged: (value) {
                            setState(() {
                              // status.text = value!;
                              if (value != null) {
                                priority = value;
                                if (value == Priority.low.name) {
                                  priorityID = Priority.low.index;
                                } else if (value == Priority.medium.name) {
                                  priorityID = Priority.medium.index;
                                } else {
                                  priorityID = Priority.high.index;
                                }
                              }
                            });
                          },
                        ),
                      ],
                    ))
              ],
            ),
          ),
          const Divider(
            height: 1,
            color: Color.fromARGB(
              255,
              117,
              114,
              114,
            ),
            thickness: 0.3,
          ),
          Container(
            height: 50,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    child: TextField(
                      decoration: const InputDecoration(
                          // contentPadding: EdgeInsets.all(-1),
                          hintText: "pick a date",
                          border: InputBorder.none),
                      controller: startDate,
                      readOnly: true,
                      onTap: () async {
                        DateTime? chosenDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2019, 1),
                            lastDate: DateTime(2040, 12));
                        if (chosenDate != null) {
                          setState(() {
                            startDate.text =
                                DateFormat.yMMMd().format(chosenDate);
                          });
                        }
                      },
                    ))
              ],
            ),
          ),
          const Divider(
            height: 1,
            color: Color.fromARGB(
              255,
              117,
              114,
              114,
            ),
            thickness: 0.3,
          ),
          Container(
            height: 50,
            alignment: AlignmentDirectional.center,
            margin: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    child: TextFormField(
                      readOnly: true,
                      decoration: const InputDecoration(
                          hintText: "pick a date", border: InputBorder.none),
                      controller: dueDate,
                      onTap: () async {
                        DateTime? chosenDueDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2015, 1),
                            lastDate: DateTime(2040, 12));
                        if (chosenDueDate != null) {
                          dueDate.text =
                              DateFormat.yMMMd().format(chosenDueDate);
                        }
                      },
                    ))
              ],
            ),
          ),
          const Divider(
            height: 1,
            color: Color.fromARGB(
              255,
              117,
              114,
              114,
            ),
            thickness: 0.3,
          ),
          Container(
            height: 50,
            alignment: AlignmentDirectional.center,
            margin: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.pending_outlined, size: 24.0),
                ),
                const Expanded(
                  flex: 2,
                  child: Text(
                    "Status",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownButton<String>(
                          value: status,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          underline: const SizedBox(),
                          items: const [
                            DropdownMenuItem(
                              value: Status.queue,
                              child: Text(Status.queue,
                                  style: TextStyle(color: Colors.red)),
                            ),
                            DropdownMenuItem(
                              value: Status.progress,
                              child: Text(Status.progress,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 242, 183, 9))),
                            ),
                            DropdownMenuItem(
                              value: Status.finished,
                              child: Text(Status.finished,
                                  style: TextStyle(color: Colors.green)),
                            ),
                          ],
                          // value: chosenValue,
                          onChanged: (value) {
                            setState(() {
                              // status.text = value!;
                              if (value != null) {
                                status = value;
                              }
                              if (value == Status.queue) {
                                statusID = Status.inQueueID;
                              } else if (value == Status.progress) {
                                statusID = Status.inProgressID;
                              } else {
                                statusID = Status.finisedID;
                              }
                            });
                          },
                        ),
                      ],
                    ))
              ],
            ),
          ),
          const Divider(
            height: 1,
            color: Color.fromARGB(
              255,
              117,
              114,
              114,
            ),
            thickness: 0.3,
          ),
          Container(
            height: 50,
            alignment: AlignmentDirectional.center,
            margin: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.description_outlined, size: 24.0),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "Description",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 53, right: 20),
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: description,
              decoration: const InputDecoration(
                  hintText: "Add description",
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none),
            ),
          )
        ]),
      ),
    ));
  }
}
