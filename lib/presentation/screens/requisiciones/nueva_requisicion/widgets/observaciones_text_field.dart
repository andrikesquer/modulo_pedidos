import 'package:flutter/material.dart';

class ObservacionesTextField extends StatelessWidget {
  const ObservacionesTextField({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;
    TextEditingController observationsController = TextEditingController();

    return Card(
      shadowColor: theme.primary.withAlpha(60),
      elevation: 4,
      margin: EdgeInsets.zero,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.textsms, color: theme.primary),
          hintText: 'Observaciones',
          suffixIcon: IconButton(
            onPressed: () {
              observationsController.clear();
            },
            icon: Icon(Icons.clear),
            color: theme.primary,
          ),
          filled: true,
          fillColor: theme.onPrimary,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(width: 0, style: BorderStyle.none),
          ),
        ),
        controller: observationsController,
      ),
    );
  }
}
