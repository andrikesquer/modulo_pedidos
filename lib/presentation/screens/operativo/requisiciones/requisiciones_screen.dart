import 'package:flutter/material.dart';
import 'package:requisiciones/presentation/screens/operativo/requisiciones/widgets/requisiciones_widgets.dart';
import 'package:requisiciones/presentation/widgets/articulos/articulos_search_bar.dart';
import 'package:requisiciones/presentation/widgets/custom_drawer.dart';
import 'package:requisiciones/presentation/widgets/menu_almacenes_periodo/menu_almacen_periodo.dart';

class RequisicionesScreen extends StatelessWidget {
  const RequisicionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    final ColorScheme theme = Theme.of(context).colorScheme;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
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
      ),
      drawer: CustomDrawer(theme: theme),
      endDrawer: RequisicionesEndDrawer(theme: theme),
      body: ListView(
        children: [
          MenuAlmacenPeriodo(theme: theme),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              spacing: 15,
              children: [
                ArticulosSearchBar(theme: theme),
                RequisicionesExpansionPanelList(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'btn1',
        tooltip: 'Buscar',
        onPressed: () {},
        child: Icon(Icons.search),
      ),
    );
  }
}
