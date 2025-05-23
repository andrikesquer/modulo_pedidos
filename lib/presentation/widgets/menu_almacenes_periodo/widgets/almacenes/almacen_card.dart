import 'package:flutter/material.dart';
import 'package:requisiciones/domain/entities/almacen_ob.dart';

class AlmacenCard extends StatelessWidget {
  const AlmacenCard({super.key, required this.almacen, required this.theme});

  final AlmacenOB almacen;

  final ColorScheme theme;

  @override
  Widget build(BuildContext context) {
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
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                '${almacen.id_almacen}. ${almacen.nombre}',
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
