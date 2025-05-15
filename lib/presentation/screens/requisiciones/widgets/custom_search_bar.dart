import 'package:flutter/material.dart';
import 'package:requisiciones/presentation/screens/requisiciones/widgets/busqueda_articulos/modal_busqueda_articulos.dart';

import 'busqueda_articulos/modal_busqueda_articulos.dart';

class CustomSearchBar extends StatelessWidget {
  final ColorScheme theme;
  const CustomSearchBar({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    final TextEditingController inputController = TextEditingController();

    void showModalBusquedaArticulos() {
      showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        showDragHandle: true,
        context: context,
        builder: (BuildContext context) {
         return ModalBusquedaArticulos(theme: theme);
        },
      );
    }

    return SearchBar(
      elevation: WidgetStatePropertyAll(4),
      backgroundColor: WidgetStatePropertyAll(theme.onPrimary),
      shadowColor: WidgetStatePropertyAll(theme.primary.withAlpha(60)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      leading: Icon(Icons.search, color: theme.primary),
      hintText: 'Código de artículo',
      trailing: <Widget>[
        Tooltip(
          message: 'Búsqueda parametrizada',
          child: IconButton(
            onPressed: () {
              showModalBusquedaArticulos();
            },
            icon: Icon(Icons.open_in_full, color: theme.primary),
          ),
        ),
        Tooltip(
          message: 'Escanear código de artículo',
          child:
          // Se podría implementar que cuando se ha escrito algo, el icono sea otro para limpiar el buscador
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.qr_code_scanner, color: theme.primary),
          ),
        ),
      ],
      controller: inputController,
      onSubmitted: (query) {
        debugPrint('Buscar...');
      },
    );
  }
}
