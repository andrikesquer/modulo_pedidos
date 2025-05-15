import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:requisiciones/presentation/screens/operativo/requisiciones/nueva_requisicion/nueva_requisicion_form.dart';
import 'package:requisiciones/presentation/widgets/custom_drop_down_menu.dart';
import 'package:requisiciones/presentation/widgets/custom_end_drawer.dart';

class PedidosEndDrawer extends ConsumerWidget {
  final ColorScheme theme;
  const PedidosEndDrawer({super.key, required this.theme});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var defaultTextStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: theme.primary,
    );

    final almacenes = [
      'REFRI-VICENTE',
      'REFRI-GOMEZ',
      'REFRI-JIROTEPEC',
      'REFRI-TORRES',
      'REFRI-CHIHUAHUA-TEC',
      'REFRI-TORRES',
    ];

    void showRequisicionesBrowser() {
      showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        showDragHandle: true,
        context: context,
        builder: (BuildContext context) {
          return Scaffold(
            body: Container(
              height: double.infinity,
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              child: Column(
                spacing: 10,
                children: [
                  Text(
                    'Buscar Requisición',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: theme.primary,
                    ),
                  ),
                  Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on, color: theme.primary),
                      Text(
                        'Almacén:',
                        style: defaultTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomDropDownMenu(options: almacenes),
                    ],
                  ),
                  CustomTextField(theme: theme),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FilledButton.tonal(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancelar'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            theme.primary,
                          ),
                        ),
                        child: Text(
                          'Buscar',
                          style: TextStyle(color: theme.onPrimary),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    void showRequisicionesForm() {
      showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        showDragHandle: true,
        context: context,
        builder: (BuildContext context) {
          return NuevaRequisicionForm();
        },
      );
    }

    return CustomEndDrawer(theme: theme, headerTitle: 'Pedidos');
      SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: theme.primary),
              child: Center(
                child: Text(
                  'Pedidos',
                  style: TextStyle(
                    color: theme.onPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.search),
              iconColor: theme.primary,
              title: Text('Buscar Almacén'),
              onTap: () {
                Navigator.of(context).pop();
                showRequisicionesBrowser();
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              iconColor: theme.primary,
              title: Text('Agregar Requisición'),
              onTap: () {
                Navigator.of(context).pop();
                showRequisicionesForm();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.theme});

  final ColorScheme theme;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
      decoration: InputDecoration(
        labelText: 'Movimiento',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.search),
        hintText: 'Movimiento',
        suffixIcon: Icon(Icons.clear),
        iconColor: theme.primary,
      ),
    );
  }
}
