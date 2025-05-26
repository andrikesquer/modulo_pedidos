import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:requisiciones/presentation/providers/almacen_seleccionado_provider.dart';
import 'package:requisiciones/presentation/viewmodels/almacenes_viewmodel.dart';
import 'package:requisiciones/presentation/widgets/custom_top_menu.dart';
import 'package:requisiciones/presentation/widgets/menu_almacenes_periodo/widgets/menu_almacenes.dart';
import 'package:requisiciones/presentation/widgets/menu_almacenes_periodo/widgets/menu_periodo.dart';

class MenuAlmacenPeriodo extends ConsumerWidget {
  const MenuAlmacenPeriodo({super.key, required this.theme});

  final ColorScheme theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final almacenSeleccionado = ref.watch(almacenSeleccionadoProvider);
    // List<AlmacenOB> almacenes = ref.watch(almacenesFiltradosProvider);
    final almacenes = ref.watch(almacenesProvider);

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
      // Almacén
      TextButton.icon(
        label: Row(
          children: [
            Text(
              {almacenes}.isEmpty
                  ? 'Sin almacenes'
                  : almacenSeleccionado.value == null
                  ? 'no seleccionado' // ${{almacenes[0]}.id_almacen}. ${almacenes[0].nombre}
                  : '${almacenSeleccionado.value?.id_almacen}. ${almacenSeleccionado.value?.nombre}',
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
          if ({almacenes}.isNotEmpty) {
            mostrarMenu(MenuAlmacenes(theme: theme));
          }
        },
      ),
      // Fecha
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
