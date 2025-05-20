import 'package:flutter/material.dart';
import 'package:requisiciones/data/models/pedido_model.dart';

class PedidosExpansionPanelList extends StatefulWidget {
  const PedidosExpansionPanelList({super.key, required this.theme});

  final ColorScheme theme;

  @override
  State<PedidosExpansionPanelList> createState() =>
      _PedidosExpansionPanelListState();
}

class _PedidosExpansionPanelListState extends State<PedidosExpansionPanelList> {
  late final ColorScheme _theme;

  @override
  void initState() {
    super.initState();
    _theme = widget.theme;
  }

  final List<Pedido> pedidos = [
    Pedido(
      noPedido: 419183,
       requisicion: 11418,
      cliente: '1. CLIENTE DE CONTADO',
      vendedor: '36. BENJAMIN_PALOMINO',
      status: 'FACTURADO',
      almacen: '6. REFRI-TORRES',
      paridad: 1.0000,
       fechaMovimiento: '05/05/2025',
       fechaCancelacion: '05/05/2025',
       fechaRegistro: '05/05/2025',
       fechaInicioC: '05/05/2025',
       fechaFinC: '05/05/2025',
       fechaFinOC: '05/05/2025',
    ),
    Pedido(
      noPedido: 16660,
      requisicion: 12418,
      cliente: 'Cliente 2',
      vendedor: 'Vendedor 2',
      status: 'COMPLETADO',
      almacen: 'REFRI VICENTE',
      paridad: 8000,
      fechaMovimiento: '06/05/2025',
      fechaCancelacion: '06/05/2025',
      fechaRegistro: '06/05/2025',
      fechaInicioC: '06/05/2025',
      fechaFinC: '06/05/2025',
      fechaFinOC: '06/05/2025',
    ),
  ];

  late final List<Item> items = generateItems(pedidos);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: _buildPanel(_theme));
  }

  TableRow _tableRow(
    ColorScheme theme,
    String left,
    String right,
    bool colored,
  ) {
    return TableRow(
      decoration: BoxDecoration(
        color: colored ? theme.primary.withAlpha(30) : Colors.transparent,
      ),
      children: [
        TableCell(child: Text(left, style: TextStyle(fontSize: 16))),
        TableCell(child: Text(right, style: TextStyle(fontSize: 16))),
      ],
    );
  }

  Widget _buildPanel(ColorScheme theme) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          items[index].isExpanded = isExpanded;
        });
      },
      children:
          items.map<ExpansionPanel>((Item item) {
            return ExpansionPanel(
              backgroundColor: theme.onPrimary,
              splashColor: theme.primary.withAlpha(10),
              canTapOnHeader: true,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: isExpanded ? 0 : 10,
                    horizontal: 10,
                  ),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Pedido: ',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '${item.pedido.noPedido}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'F. Mov: ',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: item.pedido.fechaMovimiento,
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Requisición: ',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '${item.pedido.requisicion}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            spacing: 5,
                            children: [
                              Icon(
                                Icons.info_outline,
                                size: 16,
                                color:
                                    item.pedido.status == 'PENDIENTE'
                                        ? Colors.red
                                        : Colors.green,
                              ),
                              Text(
                                item.pedido.status,
                                style: TextStyle(
                                  color:
                                      item.pedido.status == 'PENDIENTE'
                                          ? Colors.red
                                          : Colors.green,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          text: 'Cliente: ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: item.pedido.cliente,
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Vendedor: ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: item.pedido.vendedor,
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              body: Padding(
                padding: const EdgeInsets.all(10),
                child: Table(
                  children: <TableRow>[
                    _tableRow(theme, 'Almacén', item.pedido.almacen, true),
                    _tableRow(
                      theme,
                      'Paridad',
                      '${item.pedido.paridad}',
                      false,
                    ),
                    _tableRow(
                      theme,
                      'Fecha de Cancelación',
                      item.pedido.fechaCancelacion,
                      true,
                    ),
                    _tableRow(
                      theme,
                      'Fecha de Registro',
                      item.pedido.fechaRegistro,
                      false,
                    ),
                    _tableRow(
                      theme,
                      'Fecha de Inicio C',
                      item.pedido.fechaInicioC,
                      true,
                    ),
                    _tableRow(
                      theme,
                      'Fecha de Fin C',
                      item.pedido.fechaFinC,
                      false,
                    ),
                    _tableRow(
                      theme,
                      'Fecha Fin OC',
                      item.pedido.fechaFinOC,
                      true,
                    ),
                  ],
                ),
              ),
              isExpanded: item.isExpanded,
            );
          }).toList(),
    );
  }
}

class Item {
  Pedido pedido;
  bool isExpanded;

  Item({required this.pedido, this.isExpanded = false});
}

List<Item> generateItems(List<Pedido> pedidos) {
  return List<Item>.generate(pedidos.length, (int index) {
    return Item(pedido: pedidos[index]);
  });
}
