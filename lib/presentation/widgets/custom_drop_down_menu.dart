import 'package:flutter/material.dart';

class CustomDropDownMenu extends StatelessWidget {
  final List<String> options;

  const CustomDropDownMenu({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: options.first,
      icon: const Icon(Icons.arrow_drop_down),
      iconEnabledColor: Colors.black,
      elevation: 4,
      style: TextStyle(color: Colors.black, fontSize: 16),
      items:
          options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
      onChanged: (String? value) {
        debugPrint(value);
      },
    );
  }
}
