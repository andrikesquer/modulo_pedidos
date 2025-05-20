import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:requisiciones/presentation/screens/punto_venta/pedidos/widgets/modal_buscar_detalladamente.dart';
import 'package:requisiciones/presentation/widgets/custom_drop_down_menu.dart';
import 'package:requisiciones/presentation/widgets/custom_end_drawer.dart';
import 'package:requisiciones/presentation/widgets/custom_text_field.dart';

class PedidosEndDrawer extends ConsumerStatefulWidget {
  const PedidosEndDrawer({super.key, required this.theme});

  final ColorScheme theme;

  @override
  ConsumerState<PedidosEndDrawer> createState() => _PedidosEndDrawerState();
}

class _PedidosEndDrawerState extends ConsumerState<PedidosEndDrawer> {
  late final ColorScheme _theme;

  @override
  void initState() {
    _theme = widget.theme;
    super.initState();
  }

  Future<void> _buscarPorMovimiento(BuildContext context) {
    final List<String> almacenes = [
      'REFRI-VICENTE',
      'REFRI-GOMEZ',
      'REFRI-TORRES',
      'REFRI-CHIHUAHUA-TEC',
      'REFRI-TORRES',
    ];

    TextEditingController controllerMovimiento = TextEditingController();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: _theme.onPrimary,
          iconColor: _theme.primary,
          icon: Icon(Icons.search),
          title: Text(
            'Búsqueda por movimiento',
            style: TextStyle(color: _theme.primary),
          ),
          content: Column(
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Almacén',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  CustomDropDownMenu(options: almacenes),
                ],
              ),
              CustomTextField(
                theme: _theme,
                textInputType: TextInputType.number,
                textEditingController: controllerMovimiento,
                textInputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                content: 'Movimiento',
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Buscar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _buscarDetalladamente(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      showDragHandle: false,
      context: context,
      builder: (BuildContext context) {
        return ModalBuscarDetalladamente();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<ListTile> options = [
      ListTile(
        leading: Icon(Icons.add),
        iconColor: Colors.green,
        title: Text('Nuevo'),
        onTap: () {
          context.go('/punto_venta/pedidos/nuevo_pedido');
          Navigator.of(context).pop();
        },
      ),
      ListTile(
        leading: Icon(Icons.search),
        iconColor: Colors.blue,
        title: Text('Búsqueda por movimiento'),
        onTap: () {
          Navigator.of(context).pop();
          _buscarPorMovimiento(context);
        },
      ),
      ListTile(
        leading: Icon(Icons.saved_search),
        iconColor: Colors.orange,
        title: Text('Búsqueda detallada'),
        onTap: () {
          Navigator.of(context).pop();
          _buscarDetalladamente(context);
        },
      ),
      ListTile(
        leading: Icon(Icons.help_outline),
        iconColor: Colors.green,
        title: Text('Ayuda'),
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
    ];

    return CustomEndDrawer(
      theme: _theme,
      headerTitle: 'Pedidos',
      options: options,
    );
  }
}
