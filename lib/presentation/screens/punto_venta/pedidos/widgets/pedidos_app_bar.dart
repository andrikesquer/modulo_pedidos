import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PedidosAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  final ColorScheme theme;

  const PedidosAppBar({
    super.key,
    required this.scaffoldKey,
    required this.theme,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(
        'Pedidos',
        style: TextStyle(color: theme.onPrimary),
      ),
      actions: [
        IconButton(
          tooltip: 'Buscar/agregar requisición',
          icon: Icon(Icons.more_vert),
          onPressed: () {
            scaffoldKey.currentState!.openEndDrawer();
          },
        ),
      ],
      backgroundColor: theme.primary,
      iconTheme: IconThemeData(color: theme.onPrimary),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
