import 'package:flutter/material.dart';
import 'package:requisiciones/presentation/screens/punto_venta/pedidos/widgets/pedidos_widgets.dart';
import 'package:requisiciones/presentation/widgets/cliente_search_bar.dart';
import 'package:requisiciones/presentation/widgets/custom_action_buttons.dart';
import 'package:requisiciones/presentation/widgets/menu_almacenes_periodo/menu_almacen_periodo.dart';
import 'package:requisiciones/presentation/widgets/search_button.dart';

class PedidosScreen extends StatefulWidget {
  const PedidosScreen({super.key});

  @override
  PedidosScreenState createState() => PedidosScreenState();
}

class PedidosScreenState extends State<PedidosScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    final List<FloatingActionButton> buttons = [
      FloatingActionButton(
        heroTag: "btn1",
        elevation: 4,
        tooltip: 'Limpiar Filtros',
        onPressed: () {},
        child: Icon(Icons.cleaning_services, color: theme.primary),
      ),
      FloatingActionButton(
        heroTag: "btn2",
        elevation: 4,
        tooltip: 'Buscar Pedidos',
        onPressed: () {},
        child: Icon(Icons.search, color: theme.primary),
      ),
    ];

    final TextEditingController inputController = TextEditingController();

    final List<Widget> searchBarActions = [
      IconButton(
        onPressed: () {
          inputController.clear();
        },
        icon: Icon(Icons.clear, color: theme.primary),
      ),
    ];

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: theme.primary,
        iconTheme: IconThemeData(color: theme.onPrimary),
        title: Text('Pedidos', style: TextStyle(color: theme.onPrimary)),
        actions: [
          IconButton(
            tooltip: 'Menú de Opciones',
            icon: Icon(Icons.more_vert),
            onPressed: () {
              scaffoldKey.currentState!.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: PedidosEndDrawer(theme: theme),
      body: ListView(
        children: [
          MenuAlmacenPeriodo(theme: theme),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              spacing: 15,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      flex: 3,
                      child: ClienteSearchBar(
                        theme: theme,
                        searchBarActions: searchBarActions,
                        inputController: inputController,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SearchButton(
                        theme: theme,
                        onPressed: () {
                          debugPrint('Hola');
                        },
                      ),
                    ),
                  ],
                ),
                PedidosExpansionPanelList(theme: theme),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: CustomActionButtons(theme: theme, buttons: buttons),
      ),
    );
  }
}
