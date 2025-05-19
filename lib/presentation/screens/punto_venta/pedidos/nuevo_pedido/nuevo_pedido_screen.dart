import 'package:flutter/material.dart';
import 'package:requisiciones/presentation/screens/operativo/requisiciones/widgets/requisiciones_widgets.dart';
import 'package:requisiciones/presentation/screens/punto_venta/pedidos/nuevo_pedido/widgets/confirmation_widget.dart';
import 'package:requisiciones/presentation/widgets/custom_check_box.dart';
import 'package:requisiciones/presentation/widgets/menu_almacenes_periodo/widgets/menu_almacenes.dart';
export 'package:requisiciones/presentation/screens/punto_venta/pedidos/nuevo_pedido/widgets/nuevo_pedido_widgets.dart';

class NuevoPedidoScreen extends StatefulWidget {
  const NuevoPedidoScreen({super.key});

  @override
  State<NuevoPedidoScreen> createState() => _NuevoPedidoScreenState();
}

class _NuevoPedidoScreenState extends State<NuevoPedidoScreen> {
  int _currentStep = 0;

  TextField customTextField() {
    return TextField(decoration: InputDecoration(border: OutlineInputBorder()));
  }

  final String alm = 'REFRI-GOMEZ';

  void mostrarMenu(Widget menu) {
    showModalBottomSheet(
      useSafeArea: true,
      showDragHandle: true,
      context: context,
      builder: (BuildContext context) {
        return menu;
      },
    );
  }

  void modalButtonSheetFullScreen(Widget menu) {
    showModalBottomSheet(
      useSafeArea: true,
      showDragHandle: true,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return menu;
      },
    );
  }

  TableRow tableRow(
    ColorScheme theme,
    String left,
    Widget right,
    bool colored,
  ) {
    return TableRow(
      decoration: BoxDecoration(
        color: colored ? theme.primary.withAlpha(15) : Colors.transparent,
      ),
      children: [
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: Text(
              left,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        TableCell(
          child: Padding(padding: const EdgeInsets.all(3), child: right),
        ),
      ],
    );
  }

  final String fechaInicial = '29/05/2023';

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primary,
        iconTheme: IconThemeData(color: theme.onPrimary),
        title: Text('Nuevo Pedido', style: TextStyle(color: theme.onPrimary)),
      ),
      body: Stepper(
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child:
                _currentStep == 0
                    ? ElevatedButton(
                      onPressed: details.onStepContinue,
                      child: const Text('Siguiente'),
                    )
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: details.onStepCancel,
                          child: const Text('Atrás'),
                        ),
                        ElevatedButton(
                          onPressed: details.onStepContinue,
                          child: Text(
                            _currentStep == 5 ? 'Finalizar' : 'Siguiente',
                          ),
                        ),
                      ],
                    ),
          );
        },
        type: StepperType.vertical,
        steps: [
          // Datos del Pedido 1/4
          Step(
            isActive: _currentStep == 0,
            title: Text('Datos del Pedido'),
            subtitle: Text('1/4'),
            content: Table(
              children: <TableRow>[
                tableRow(
                  theme,
                  'Almacén',
                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft,
                    ),
                    child: Text(
                      alm,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    onPressed: () {
                      mostrarMenu(MenuAlmacenes(theme: theme));
                    },
                  ),
                  true,
                ),
                tableRow(theme, 'Cliente', customTextField(), false),
                tableRow(theme, 'Vendedor', customTextField(), true),
                tableRow(theme, 'Sucursal', customTextField(), false),
                tableRow(theme, 'Atención a', customTextField(), true),
                tableRow(theme, 'Dirección', customTextField(), false),
                tableRow(theme, 'Lista de Precios', customTextField(), true),
              ],
            ),
          ),
          // Datos del Pedido 2/4
          Step(
            isActive: _currentStep == 1,
            title: Text('Datos del Pedido'),
            subtitle: Text('2/4'),
            content: Table(
              children: <TableRow>[
                tableRow(
                  theme,
                  'Fecha de Registro',
                  TextButton(
                    child: Text(
                      fechaInicial,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        firstDate: DateTime(2015),
                        lastDate: DateTime.now(),
                      );
                    },
                  ),
                  true,
                ),
                tableRow(
                  theme,
                  'Fecha O.C',
                  TextButton(
                    child: Text(
                      fechaInicial,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        firstDate: DateTime(2015),
                        lastDate: DateTime.now(),
                      );
                    },
                  ),
                  false,
                ),
                tableRow(theme, 'No. de Serie', customTextField(), true),
                tableRow(theme, 'Orden Compra', customTextField(), false),
                tableRow(
                  theme,
                  'Archivo Orden C.',
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.upload, color: theme.primary),
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.center,
                    ),
                  ),
                  true,
                ),
              ],
            ),
          ),
          // Datos del Pedido 3/4
          Step(
            isActive: _currentStep == 2,
            title: Text('Datos del Pedido'),
            subtitle: Text('3/4'),
            content: Table(
              children: <TableRow>[
                tableRow(theme, 'Pedido', Text('15550'), true),
                tableRow(
                  theme,
                  'Estatus',
                  Text('NUEVO', style: TextStyle(color: Colors.red)),
                  false,
                ),
                tableRow(theme, 'RFC', customTextField(), true),
                tableRow(theme, 'Plazo', customTextField(), false),
                tableRow(theme, 'Descuento', customTextField(), true),
                tableRow(theme, 'Moneda', customTextField(), false),
                tableRow(theme, 'Paridad', customTextField(), true),
              ],
            ),
          ),
          // Datos del Pedido 4/4
          Step(
            isActive: _currentStep == 3,
            title: Text('Datos del Pedido'),
            subtitle: Text('4/4'),
            content: Column(
              children: [
                Table(
                  children: <TableRow>[
                    tableRow(
                      theme,
                      'Fecha I.Consigna',
                      TextButton(
                        child: Text(
                          fechaInicial,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            firstDate: DateTime(2015),
                            lastDate: DateTime.now(),
                          );
                        },
                      ),
                      true,
                    ),
                    tableRow(
                      theme,
                      'Fecha F.Consigna',
                      TextButton(
                        child: Text(
                          fechaInicial,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            firstDate: DateTime(2015),
                            lastDate: DateTime.now(),
                          );
                        },
                      ),
                      false,
                    ),
                    tableRow(theme, 'Campo Addenda', customTextField(), true),
                    tableRow(theme, 'Observaciones', customTextField(), false),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomCheckBox(theme: theme, text: 'Autorizar'),
                    CustomCheckBox(theme: theme, text: 'IVA Total Retenido'),
                  ],
                ),
              ],
            ),
          ),
          // Capturar Artículos
          Step(
            isActive: _currentStep == 4,
            title: Text('Artículos'),
            subtitle: Text('Capturar Artículos'),
            content: Column(
              spacing: 10,
              children: [
                ArticulosSearchBar(theme: theme),
                ArticulosExpansionPanelList(),
              ],
            ),
          ),
          // Totales
          Step(
            isActive: _currentStep == 5,
            title: Text('Totales'),
            content: Table(
              children: <TableRow>[
                tableRow(theme, 'Subtotal', Text('\$388.90'), true),
                tableRow(theme, '- Descuento Total', Text('\$0.00'), false),
                tableRow(theme, '+ Ieps Total', Text('\$0.00'), true),
                tableRow(theme, '+ Importe con Desc.', Text('\$388.90'), false),
                tableRow(theme, '+ IVA Total', Text('\$62.23'), true),
                tableRow(theme, '- IVA Retenido', Text('\$0.00'), false),
                tableRow(theme, '= Gran Total', Text('\$451.13'), true),
              ],
            ),
          ),
        ],
        onStepTapped: (int newIndex) {
          setState(() {
            _currentStep = newIndex;
          });
        },
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep != 5) {
            setState(() {
              _currentStep += 1;
            });
          } else {
            Navigator.pop(context);
            modalButtonSheetFullScreen(ConfirmationWidget(theme: theme));
          }
        },
        onStepCancel: () {
          if (_currentStep != 0) {
            setState(() {
              _currentStep -= 1;
            });
          }
        },
      ),
    );
  }
}
