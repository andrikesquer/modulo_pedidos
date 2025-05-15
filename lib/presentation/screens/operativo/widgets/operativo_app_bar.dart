import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OperativoAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final ColorScheme theme;

  const OperativoAppBar({super.key, required this.theme});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: theme.primary,
      iconTheme: IconThemeData(color: theme.onPrimary),
      title: Text('Operaciones', style: TextStyle(color: theme.onPrimary)),
      actions: [
        IconButton(
          tooltip: 'Buscar Opción',
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
