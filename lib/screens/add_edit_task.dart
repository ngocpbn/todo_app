import 'package:flutter/material.dart';
import 'package:todo_app/screens/widget/input_fields.dart';

class AddEditTask extends StatelessWidget {
  const AddEditTask({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(children: [InputField(hint: "Add title")]),
      ),
    ));
  }
}
