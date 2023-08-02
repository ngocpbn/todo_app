import 'package:flutter/material.dart';

class TitleInputField extends StatefulWidget {
  // final String title;
  final String hint;
  final TextEditingController titleController;
  final void Function(String)? onChanged;
  const TitleInputField(
      {super.key,
      required this.titleController,
      required this.hint,
      required this.onChanged});

  @override
  State<TitleInputField> createState() => _TitleInputFieldState();
}

class _TitleInputFieldState extends State<TitleInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(),
      margin: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
      ),
      child: Row(children: [
        Expanded(
            child: TextFormField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          style: const TextStyle(fontSize: 20),
          onChanged: widget.onChanged,
          controller: widget.titleController,
          decoration: InputDecoration(
              // labelStyle: TextStyle(font),
              hintText: widget.hint,
              hintStyle: const TextStyle(fontSize: 20),
              focusedBorder: InputBorder.none,
              border: InputBorder.none),
        ))
      ]),
    );
  }
}
