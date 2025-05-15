import 'package:flutter/material.dart';

class AlmacenCard extends StatelessWidget {
  final String almacen;

  const AlmacenCard({super.key, required this.almacen});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;

    return Card(
      elevation: 4,
      color: theme.primary,
      child: InkWell(
        splashColor: theme.primary.withAlpha(90),
        onTap: () {
          Navigator.pop(context);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Flexible(
              child: Text(
                '$almacen',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: theme.onPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
