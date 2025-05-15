import 'package:flutter/material.dart';
import 'package:requisiciones/presentation/screens/requisiciones/widgets/requisiciones_widgets.dart';
import 'package:requisiciones/presentation/widgets/custom_drawer.dart';
import 'package:requisiciones/presentation/widgets/custom_drop_down_menu.dart';

class RequisicionesScreen extends StatelessWidget {
  const RequisicionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    var theme = Theme.of(context).colorScheme;

    var defaultTextStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: theme.primary,
    );

    final almacenes = [
      'REFRI-VICENTE',
      'REFRI-GOMEZ',
      'REFRI-TORRES',
      'REFRI-CHIHUAHUA-TEC',
      'REFRI-TORRES',
    ];

    final alm = almacenes[0];

    final fechaInicial = '09/05/2025';

    final tipos = [
      'Fecha de registro',
      'Fecha de movimiento',
      'Fecha de cancelación',
      'Fecha de O.C',
      'Fecha de inicio consigna',
      'Fecha de fin consigna',
    ];

    void showAlmacenesMenu() {
      showModalBottomSheet(
        useSafeArea: true,
        context: context,
        builder: (context) {
          return Container(
            height: 250,
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Seleccionar Almacén',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: theme.primary,
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: AlmacenesGrid(almacenes: almacenes),
                ),
              ],
            ),
          );
        },
      );
    }

    void showDateMenu() {
      showModalBottomSheet(
        useSafeArea: true,
        context: context,
        builder: (context) {
          return Container(
            height: 250,
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Seleccionar Periodo',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: theme.primary,
                  ),
                ),
                Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tipo:',
                      style: defaultTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CustomDropDownMenu(options: tipos),
                  ],
                ),
                Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.date_range, color: theme.primary),
                    Text(
                      'Fecha Inicial:',
                      style: defaultTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          firstDate: DateTime(2015),
                          lastDate: DateTime.now(),
                        );
                      },
                      child: Text(fechaInicial, style: defaultTextStyle),
                    ),
                  ],
                ),
                Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.date_range, color: theme.primary),
                    Text(
                      'Fecha Final:',
                      style: defaultTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          firstDate: DateTime(2015),
                          lastDate: DateTime.now(),
                        );
                      },
                      child: Text(fechaInicial, style: defaultTextStyle),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: RequisicionesAppBar(scaffoldKey: scaffoldKey, theme: theme),
      drawer: CustomDrawer(theme: theme),
      endDrawer: RequisicionesEndDrawer(theme: theme),
      body: ListView(
        children: [
          Container(
            height: 65,
            width: double.maxFinite,
            color: theme.primary.withAlpha(80),
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Row(
                      spacing: 10,
                      children: [
                        Icon(Icons.location_on_outlined, color: theme.primary),
                        Text(alm),
                        Icon(Icons.arrow_drop_down, color: theme.primary),
                      ],
                    ),
                    onTap: () {
                      showAlmacenesMenu();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.date_range, color: theme.primary),
                    onPressed: () {
                      showDateMenu();
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              spacing: 15,
              children: [CustomSearchBar(theme: theme), RequisicionesExpansionPanelList()],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Buscar',
        onPressed: () {},
        child: Icon(Icons.search),
      ),
    );
  }
}
