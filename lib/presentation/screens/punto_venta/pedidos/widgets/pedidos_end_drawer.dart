import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:requisiciones/presentation/widgets/custom_end_drawer.dart';

class PedidosEndDrawer extends ConsumerWidget {
  final ColorScheme theme;
  const PedidosEndDrawer({super.key, required this.theme});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ListTile> options = [
      ListTile(
        leading: Icon(Icons.add),
        iconColor: Colors.green,
        title: Text('Nuevo'),
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
      ListTile(
        leading: Icon(Icons.search),
        iconColor: Colors.blue,
        title: Text('Buscar'),
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
      ListTile(
        leading: Icon(Icons.saved_search),
        iconColor: Colors.blue,
        title: Text('Buscar'),
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
      ListTile(
        leading: Icon(Icons.download),
        iconColor: Colors.orange,
        title: Text('Exportar'),
        onTap: () {
          Navigator.of(context).pop();
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
      theme: theme,
      headerTitle: 'Pedidos',
      options: options,
    );
  }
}
