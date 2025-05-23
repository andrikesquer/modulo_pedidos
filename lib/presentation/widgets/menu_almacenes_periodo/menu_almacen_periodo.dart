import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:requisiciones/config/DI/dependencias.dart';
import 'package:requisiciones/domain/entities/almacen_ob.dart';
import 'package:requisiciones/presentation/providers/almacen_seleccionado_provider.dart';
import 'package:requisiciones/presentation/widgets/custom_top_menu.dart';
import 'package:requisiciones/presentation/widgets/menu_almacenes_periodo/widgets/menu_almacenes.dart';
import 'package:requisiciones/presentation/widgets/menu_almacenes_periodo/widgets/menu_periodo.dart';

class MenuAlmacenPeriodo extends ConsumerWidget {
  const MenuAlmacenPeriodo({super.key, required this.theme});

  final ColorScheme theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String almacen = 'REFRI-GOMEZ';

    // final AlmacenOB? almacenSeleccionado = ref.watch(almacenSeleccionadoProvider);

    void mostrarMenu(Widget menu) {
      showModalBottomSheet(
        useSafeArea: true,
        showDragHandle: true,
        context: context,
        builder: (BuildContext context) {
          return menu;
        },
      );
    }

    final List<TextButton> buttons = [
      TextButton.icon(
        label: Row(
          children: [
            Text(
              almacen,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        icon: Icon(Icons.location_on, color: theme.primary, size: 24),
        onPressed: () {
          mostrarMenu(MenuAlmacenes(theme: theme));
        },
      ),
      TextButton.icon(
        label: Row(
          children: [
            Text(
              '15/05/2025',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
            Icon(Icons.arrow_right),
            Text(
              '16/05/2025',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        icon: Icon(Icons.date_range, color: theme.primary, size: 24),
        onPressed: () {
          mostrarMenu(MenuPeriodo(theme: theme));
        },
      ),
    ];

    return CustomMenu(theme: theme, buttons: buttons);
  }
}
