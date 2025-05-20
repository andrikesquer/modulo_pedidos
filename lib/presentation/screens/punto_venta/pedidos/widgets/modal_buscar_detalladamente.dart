import 'package:flutter/material.dart';
import 'package:requisiciones/presentation/widgets/custom_action_buttons.dart';
import 'package:requisiciones/presentation/widgets/custom_drop_down_menu.dart';
import 'package:requisiciones/presentation/widgets/custom_text_field.dart';
import 'package:requisiciones/presentation/widgets/menu_almacenes_periodo/widgets/fecha_button.dart';

class ModalBuscarDetalladamente extends StatefulWidget {
  const ModalBuscarDetalladamente({super.key});

  @override
  State<ModalBuscarDetalladamente> createState() =>
      _ModalBuscarDetalladamenteState();
}

class _ModalBuscarDetalladamenteState extends State<ModalBuscarDetalladamente> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    TableRow tableRow(String left, Widget right, bool colored) {
      return TableRow(
        decoration: BoxDecoration(
          color: colored ? theme.primary.withAlpha(30) : Colors.transparent,
        ),
        children: [
          TableCell(
            child: SizedBox(
              height: 55,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      left,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          TableCell(
            child: Padding(padding: const EdgeInsets.all(3), child: right),
          ),
        ],
      );
    }

    final List<String> almacenes = [
      'REFRI-VICENTE',
      'REFRI-GOMEZ',
      'REFRI-TORRES',
      'REFRI-CHIHUAHUA-TEC',
      'REFRI-TORRES',
    ];

    final TextEditingController ordenesCompraController =
        TextEditingController();
    final TextEditingController clienteController = TextEditingController();
    final TextEditingController folioController = TextEditingController();

    List<FloatingActionButton> buttons = [
      FloatingActionButton(
        elevation: 4,
        tooltip: 'Cancelar',
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.close, color: theme.primary),
      ),
      FloatingActionButton(
        elevation: 4,
        tooltip: 'Buscar Pedido',
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.search, color: theme.primary),
      ),
    ];

    return Scaffold(
      backgroundColor: theme.onPrimary,
      appBar: AppBar(
        backgroundColor: theme.primary,
        automaticallyImplyLeading: false,
        title: Text(
          'Búsqueda Detallada',
          style: TextStyle(color: theme.onPrimary, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Table(
          children: <TableRow>[
            tableRow('Almacén', CustomDropDownMenu(options: almacenes), true),
            tableRow(
              'Cliente',
              CustomTextField(
                theme: theme,
                textEditingController: clienteController,
              ),
              false,
            ),
            tableRow(
              'Órdenes compra',
              CustomTextField(
                theme: theme,
                textEditingController: ordenesCompraController,
              ),
              true,
            ),
            tableRow('Fecha inicial', FechaButton(esPrimeraFecha: true), false),
            tableRow('Fecha fin', FechaButton(esPrimeraFecha: false), true),
            tableRow(
              'Folio',
              CustomTextField(
                theme: theme,
                textEditingController: folioController,
              ),
              false,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: CustomActionButtons(theme: theme, buttons: buttons),
      ),
    );
  }
}
