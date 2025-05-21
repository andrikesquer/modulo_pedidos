import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:requisiciones/data/models/pedido_model.dart';
import 'package:requisiciones/presentation/screens/punto_venta/pedidos/nuevo_pedido/widgets/confirmation_widget.dart';
import 'package:requisiciones/presentation/widgets/articulos/articulos_search_bar.dart';
import 'package:requisiciones/presentation/widgets/custom_check_box.dart';
import 'package:requisiciones/presentation/widgets/menu_almacenes_periodo/widgets/menu_almacenes.dart';
import 'package:requisiciones/presentation/screens/operativo/requisiciones/widgets/articulos_expansion_panel_list.dart';
export 'package:requisiciones/presentation/screens/punto_venta/pedidos/nuevo_pedido/widgets/nuevo_pedido_widgets.dart';

class PedidoScreen extends StatefulWidget {
  const PedidoScreen({super.key});

  @override
  State<PedidoScreen> createState() => _PedidoScreenState();
}

class _PedidoScreenState extends State<PedidoScreen> {
  int _currentStep = 0;

  TextFormField customTextField(bool isEnabled, String? initialValue) {
    return TextFormField(
      decoration: InputDecoration(border: OutlineInputBorder()),
      enabled: isEnabled,
      initialValue: initialValue,
    );
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
    final Pedido? pedido = GoRouterState.of(context).extra as Pedido?;

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
                            _currentStep == 5
                                ? pedido == null
                                    ? 'Finalizar'
                                    : 'Cerrar'
                                : 'Siguiente',
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
                    // style: TextButton.styleFrom(
                    //   minimumSize: Size.zero,
                    //   padding: EdgeInsets.zero,
                    //   tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    //   alignment: Alignment.centerLeft,
                    // ),
                    child: Text(
                      pedido == null ? alm : pedido.almacen,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    onPressed: () {
                      if (pedido == null) {
                        mostrarMenu(MenuAlmacenes(theme: theme));
                      }
                    },
                  ),
                  true,
                ),
                tableRow(
                  theme,
                  'Cliente',
                  customTextField(
                    pedido?.status == 'FACTURADO' ? false : true,
                    pedido?.cliente,
                  ),
                  false,
                ),
                tableRow(
                  theme,
                  'Vendedor',
                  customTextField(
                    pedido == null ? true : false,
                    pedido?.vendedor,
                  ),
                  true,
                ),
                tableRow(
                  theme,
                  'Sucursal',
                  customTextField(
                    pedido == null ? true : false,
                    pedido?.sucursal,
                  ),
                  false,
                ),
                tableRow(
                  theme,
                  'Atención a',
                  customTextField(
                    pedido == null ? true : false,
                    pedido?.atencionA,
                  ),
                  true,
                ),
                tableRow(
                  theme,
                  'Dirección',
                  customTextField(
                    pedido == null ? true : false,
                    pedido?.direccion,
                  ),
                  false,
                ),
                tableRow(
                  theme,
                  'Lista de Precios',
                  customTextField(
                    pedido == null ? true : false,
                    pedido?.lista_precios,
                  ),
                  true,
                ),
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
                tableRow(
                  theme,
                  'No. de Serie',
                  customTextField(
                    pedido == null ? true : false,
                    pedido?.noSerie,
                  ),
                  true,
                ),
                tableRow(
                  theme,
                  'Orden Compra',
                  customTextField(
                    pedido == null ? true : false,
                    pedido?.ordenCompra,
                  ),
                  false,
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
                tableRow(
                  theme,
                  'RFC',
                  customTextField(pedido == null ? true : false, pedido?.RFC),
                  true,
                ),
                tableRow(
                  theme,
                  'Plazo',
                  customTextField(
                    pedido == null ? true : false,
                    '${pedido?.plazo}',
                  ),
                  false,
                ),
                tableRow(
                  theme,
                  'Descuento',
                  customTextField(
                    pedido == null ? true : false,
                    '${pedido?.descuento}',
                  ),
                  true,
                ),
                tableRow(
                  theme,
                  'Moneda',
                  customTextField(
                    pedido == null ? true : false,
                    pedido?.moneda,
                  ),
                  false,
                ),
                tableRow(
                  theme,
                  'Paridad',
                  customTextField(
                    pedido == null ? true : false,
                    '${pedido?.paridad}',
                  ),
                  true,
                ),
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
                    tableRow(
                      theme,
                      'Campo Addenda',
                      customTextField(
                        pedido == null ? true : false,
                        pedido?.campoAddenda,
                      ),
                      true,
                    ),
                    tableRow(
                      theme,
                      'Observaciones',
                      customTextField(
                        pedido == null ? true : false,
                        pedido?.observaciones,
                      ),
                      false,
                    ),
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
            pedido == null
                ? modalButtonSheetFullScreen(ConfirmationWidget(theme: theme))
                : null;
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
