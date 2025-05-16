import 'package:flutter/material.dart';
import 'package:requisiciones/presentation/widgets/articulos/modal_busqueda_articulos.dart';
import 'package:requisiciones/presentation/widgets/custom_search_bar.dart';

class ArticulosSearchBar extends StatelessWidget {
  final ColorScheme theme;
  const ArticulosSearchBar({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    final TextEditingController inputController = TextEditingController();

    void mostrarModalBusquedaArticulos() {
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

    final List<Widget> actions = [
      Tooltip(
        message: 'Búsqueda parametrizada',
        child: IconButton(
          onPressed: () {
            mostrarModalBusquedaArticulos();
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
    ];

    return CustomSearchBar(
      theme: theme,
      hint: 'Código de Artículo',
      actions: actions,
      inputController: inputController,
    );
  }
}
