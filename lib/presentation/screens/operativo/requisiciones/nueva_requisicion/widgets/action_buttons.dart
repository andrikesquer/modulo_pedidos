import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final ColorScheme theme;
  const ActionButtons({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FloatingActionButton(
          elevation: 4,
          tooltip: 'Limpiar campos',
          onPressed: () {
            debugPrint('Limpiar campos nueva requisición');
          },
          child: Icon(Icons.cleaning_services, color: theme.primary),
        ),
        FloatingActionButton(
          elevation: 4,
          tooltip: 'Guardar nueva requisición',
          onPressed: () {
            debugPrint('Guardar nueva requisición');
            Navigator.pop(context);
          },
          child: Icon(Icons.save, color: theme.primary),
        ),
      ],
    );
  }
}
