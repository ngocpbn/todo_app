import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  final TextEditingController dateTime;
  final String hint;
  const DatePicker({super.key, required this.dateTime, required this.hint});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(hintText: widget.hint),
      controller: widget.dateTime,
      onTap: () {
        showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019, 1),
            lastDate: DateTime(2040, 12));
      },
    );
  }
}
