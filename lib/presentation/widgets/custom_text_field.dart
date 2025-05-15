import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.theme,
    required this.textInputType,
    this.textInputFormatters = const [],
    required this.content,
  });

  final ColorScheme theme;

  final TextInputType textInputType;

  // For numbers: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))]
  final List<TextInputFormatter> textInputFormatters;

  final String content;

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();

    return TextField(
      keyboardType: textInputType,
      controller: textEditingController,
      inputFormatters: textInputFormatters,
      decoration: InputDecoration(
        labelText: content,
        border: OutlineInputBorder(),
        // prefixIcon: Icon(Icons.search),
        hintText: content,
        suffixIcon: IconButton(onPressed: () {
          textEditingController.clear();
        }, icon: Icon(Icons.clear)),
        iconColor: theme.primary,
      ),
    );
  }
}
