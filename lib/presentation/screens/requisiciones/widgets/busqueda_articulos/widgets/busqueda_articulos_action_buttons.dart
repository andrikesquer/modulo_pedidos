import 'package:flutter/material.dart';

class BusquedaArticulosActionButtons extends StatelessWidget {
  const BusquedaArticulosActionButtons({super.key, required this.theme});

  final ColorScheme theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FloatingActionButton(
          elevation: 4,
          tooltip: 'Cancelar',
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.close, color: theme.primary),
        ),
        FloatingActionButton(
          elevation: 4,
          tooltip: 'Buscar Artículo',
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.search, color: theme.primary),
        ),
      ],
    );
  }
}
