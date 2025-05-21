import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    // Pedido con status PEDIDO
    Pedido(
      noPedido: 99380,
      requisicion: 1,
      almacen: '12. REFRI-ZARCO',
      sucursal: '1. CONTADO CHIHUAHUA',
      cliente: '19090 CONTADO CHIHUAHUA',
      vendedor: '50. MARCELA_ORTEGA',
      status: 'PEDIDO',
      prioridades: 0,
      tipoEntrega: 0,
      atencionA: '',
      RFC: 'XAXX010101000',
      factura: 0,
      plazo: 0,
      direccion: '',
      lista_precios: 'PR. AL PUBLICO',
      moneda: 'MXM',
      descuento: 0.0000,
      paridad: 1.0000,
      fechaMovimiento: '21/05/2025',
      fechaCancelacion: '',
      fechaRegistro: '21/05/2025',
      fechaFinOC: '',
      fechaIConsigna: '21/05/2025',
      fechaFConsigna: '21/05/2025',
      noSerie: 'SERIE',
      ordenCompra: '',
      campoAddenda: '',
      autorizar: false,
      ivaTotalRetenido: false,
      usuarioCreo: '953. 300_SISTEMAS_TESTENE',
      observaciones: '',
      usoCfdi: 'G03. Gastos en general.',
      subtotal: 388.75,
      dsctoTotal: 0.00,
      importeConDescuento: 388.75,
      IEPSTotal: 0,
      IVATotal: 62.20,
      IVARetenido: 0.00,
      granTotal: 450.95,
    ),
    // Pedido con status FACTURADO
    Pedido(
      noPedido: 419183,
      requisicion: 1,
      almacen: '6. REFRI-TORRES',
      sucursal: '1. CLIENTE DE CONTADO',
      cliente: '1. CLIENTE DE CONTADO',
      vendedor: '36. BENJAMIN_PALOMINO',
      status: 'FACTURADO',
      prioridades: 0,
      tipoEntrega: 0,
      atencionA: '',
      RFC: 'XAXX010101000',
      factura: 234223,
      plazo: 15,
      direccion: '',
      lista_precios: 'PR. AL PUBLICO',
      moneda: 'MXM',
      descuento: 0.0000,
      paridad: 1.0000,
      fechaMovimiento: '18/01/2025',
      fechaCancelacion: '',
      fechaRegistro: '18/01/2025',
      fechaFinOC: '',
      fechaIConsigna: '18/01/2025',
      fechaFConsigna: '18/01/2025',
      noSerie: 'SERIE',
      ordenCompra: '',
      campoAddenda: '',
      autorizar: false,
      ivaTotalRetenido: false,
      usuarioCreo: '36. BENJAMIN_PALOMINO',
      observaciones: '',
      usoCfdi: '',
      subtotal: 231.79,
      dsctoTotal: 0.00,
      importeConDescuento: 231.79,
      IEPSTotal: 0,
      IVATotal: 18.54,
      IVARetenido: 0.00,
      granTotal: 250.33,
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
                child: Column(
                  spacing: 10,
                  children: [
                    Table(
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
                          item.pedido.fechaIConsigna,
                          true,
                        ),
                        _tableRow(
                          theme,
                          'Fecha de Fin C',
                          item.pedido.fechaIConsigna,
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
                    SizedBox(
                      width: double.maxFinite,
                      child: TextButton.icon(
                        onPressed: () {
                          context.go(
                            '/punto_venta/pedidos/nuevo_pedido',
                            extra: item.pedido,
                          );
                        },
                        label: Text('Ver más detalles'),
                        icon: Icon(Icons.open_in_new),
                      ),
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
