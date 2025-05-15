import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RequisicionesAppBar extends ConsumerWidget
    implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  final ColorScheme theme;

  const RequisicionesAppBar({
    super.key,
    required this.scaffoldKey,
    required this.theme,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(
        'Requisición de Mercancía',
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
