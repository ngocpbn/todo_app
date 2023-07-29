import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/common/titles_colors.dart';
// import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/data/raw_data/raw_data.dart';
import 'package:todo_app/screens/widget/task_tile.dart';

class GeneralTaskListview extends StatelessWidget {
  const GeneralTaskListview({super.key});
  @override
  Widget build(BuildContext context) {
    var matchingKey = Get.parameters["matchingKey"];
    String? title = matching[matchingKey]?[0] as String?;
    Color? borderColor = matching[matchingKey]?[1] as Color?;
    Color? shadowColor = matching[matchingKey]?[2] as Color?;
    // String imageDir = matching[matchingKey]![3] as String;
    return Scaffold(
      // appBar: AppBar(leading: const Icon(Icons.arrow_back_ios_new_rounded)),
      floatingActionButton: matchingKey == "0"
          ? FloatingActionButton(
              onPressed: () => Get.toNamed("/editAdd"),
              backgroundColor: Colors.blue[300],
              child: const Icon(Icons.add),
              // elevation: ElevatedButton(onPressed: () {}, child: )
            )
          : null,
      // floatingActionButton: null,
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
            title: Text(title ?? "",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
            centerTitle: true,
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 20.0, bottom: 15.0),
          //   child: Center(
          //     child: Text(title,
          //         style: const TextStyle(
          //             fontSize: 25, fontWeight: FontWeight.bold)),
          //   ),
          // ),
          ...tasks.map(
            (e) => TaskTile(
              task: e,
              borderColor: borderColor ?? Colors.red,
              shadowColor: shadowColor ?? Colors.red,
            ),
          )
        ],
      )),
    );
  }
}
