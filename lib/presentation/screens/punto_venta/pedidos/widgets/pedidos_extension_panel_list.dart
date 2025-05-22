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
    // Pedido(
    //   noPedido: 99380,
    //   requisicion: 1,
    //   almacen: '12. REFRI-ZARCO',
    //   sucursal: '1. CONTADO CHIHUAHUA',
    //   cliente: '19090 CONTADO CHIHUAHUA',
    //   vendedor: '50. MARCELA_ORTEGA',
    //   status: 'PEDIDO',
    //   prioridades: 0,
    //   tipoEntrega: 0,
    //   atencionA: '',
    //   RFC: 'XAXX010101000',
    //   factura: 0,
    //   plazo: 0,
    //   direccion: '',
    //   lista_precios: 'PR. AL PUBLICO',
    //   moneda: 'MXM',
    //   descuento: 0.0000,
    //   paridad: 1.0000,
    //   fechaMovimiento: '21/05/2025',
    //   fechaCancelacion: '',
    //   fechaRegistro: '21/05/2025',
    //   fechaFinOC: '',
    //   fechaIConsigna: '21/05/2025',
    //   fechaFConsigna: '21/05/2025',
    //   noSerie: 'SERIE',
    //   ordenCompra: '',
    //   campoAddenda: '',
    //   autorizar: false,
    //   ivaTotalRetenido: false,
    //   usuarioCreo: '953. 300_SISTEMAS_TESTENE',
    //   observaciones: '',
    //   usoCfdi: 'G03. Gastos en general.',
    //   subtotal: 388.75,
    //   dsctoTotal: 0.00,
    //   importeConDescuento: 388.75,
    //   IEPSTotal: 0,
    //   IVATotal: 62.20,
    //   IVARetenido: 0.00,
    //   granTotal: 450.95,
    // ),
    // Pedido con status FACTURADO
    // Pedido(
    //   noPedido: 419183,
    //   requisicion: 1,
    //   almacen: '6. REFRI-TORRES',
    //   sucursal: '1. CLIENTE DE CONTADO',
    //   cliente: '1. CLIENTE DE CONTADO',
    //   vendedor: '36. BENJAMIN_PALOMINO',
    //   status: 'FACTURADO',
    //   prioridades: 0,
    //   tipoEntrega: 0,
    //   atencionA: '',
    //   RFC: 'XAXX010101000',
    //   factura: 234223,
    //   plazo: 15,
    //   direccion: '',
    //   lista_precios: 'PR. AL PUBLICO',
    //   moneda: 'MXM',
    //   descuento: 0.0000,
    //   paridad: 1.0000,
    //   fechaMovimiento: '18/01/2025',
    //   fechaCancelacion: '',
    //   fechaRegistro: '18/01/2025',
    //   fechaFinOC: '',
    //   fechaIConsigna: '18/01/2025',
    //   fechaFConsigna: '18/01/2025',
    //   noSerie: 'SERIE',
    //   ordenCompra: '',
    //   campoAddenda: '',
    //   autorizar: false,
    //   ivaTotalRetenido: false,
    //   usuarioCreo: '36. BENJAMIN_PALOMINO',
    //   observaciones: '',
    //   usoCfdi: '',
    //   subtotal: 231.79,
    //   dsctoTotal: 0.00,
    //   importeConDescuento: 231.79,
    //   IEPSTotal: 0,
    //   IVATotal: 18.54,
    //   IVARetenido: 0.00,
    //   granTotal: 250.33,
    // ),
    Pedido(
      ID_ALMACEN: 1,
      ID_PEDIDO: 450403,
      FECHA: '2025-01-18T15:45:00',
      ID_VENDEDOR: 259,
      ID_CLIENTE: 1,
      ID_CTE_FACTURA: 1,
      PARIDAD: 1.0000,
      DESCUENTO_GLOBAL: 0.0000,
      ID_TIPO_PEDIDO: 'P',
      ENTREGA_DOMICILIO: false,
      OBSERVACIONES: '',
      ESTATUS: 'FACTURADO',
      ID_NUMREFERENCIA: 114681,
      FECHA_MOVIMIENTO: '2025-01-18T15:45:00',
      ID_SUCURSAL_CTE: 1,
      CARGO_FLETE: 0.0000,
      MANEJO_CUENTA: 0.0000,
      MUESTRA_PUBLICO_GRAL: false,
      SUBTOTAL: 626.3600,
      IVA: 50.1100,
      DESCUENTO: 0.0000,
      DiasCredito: 15,
      TipoCambio: 19.2000,
      Entrega: '',
      OrdenCompra: '',
      NUM_FACTURAS: 0,
      FECHA_CANCELACION: '2025-01-18T15:46:00',
      ESTATUS_PROCESO: '',
      SURTIO: 0,
      FECHA_ENTREGA: '1999-12-30T03:44:00',
      FECHA_ASIGNACION: null,
      FECHA_SURTIDO: null,
      FECHA_SALIDA: null,
      FECHA_CLIENTE: null,
      IVA_CTA: 0.0000,
      PORIVA_CTA: 0.0000,
      Autorizada: false,
      Id_Usuario_Autoriza: 0,
      Req_Autorizacion: false,
      ATENCION: '',
      ID_COTIZACION: 0,
      ID_COTIZACION_ALMACEN: 0,
      PEDIDOWEB: 0,
      MOV_ANT: '',
      EntregarEnDomicilio: '',
      EntregarEnColonia: '',
      EntregarEnCP: '',
      EntregarEnCiudad: '',
      EntregarEnEstado: '',
      EntregarEnCalles: '',
      ImprimirSinPrecios: false,
      FECHA_REGISTRO: '2025-01-18T15:45:00',
      Nombre: 'CLIENTE DE CONTADO',
      Id_Gravamen: 1,
      CampoAddenda: '',
      Apartado: false,
      FECHA_INICIOC: '2025-01-18T00:00:00',
      FECHA_FINC: '2025-01-18T00:00:00',
      FECHA_OC: '2025-01-18T00:00:00',
      FECHAENTREGA: null,
      IEPS: 0.0000,
      RETIENE_IVA: false,
      IVA_RETENIDO_TOTAL: 0.0000,
      ID_PRIORIDAD: 0,
      ID_TIPO_ENTREGA: 0,
      OC_PATH: '',
      USO_CFDI: 'G03',
      VENTAS_PLAZOS: false,
      ID_USUARIO_CREO: 0,
      ID_MOTIVO_CANC: 0,
      IVA_INTERIOR: false,
    )
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
                                  text: '${item.pedido.ID_PEDIDO}',
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
                                  text: item.pedido.FECHA_MOVIMIENTO,
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
                                  text: '#R',
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
                                    item.pedido.ESTATUS == 'PENDIENTE'
                                        ? Colors.red
                                        : Colors.green,
                              ),
                              Text(
                                item.pedido.ESTATUS,
                                style: TextStyle(
                                  color:
                                      item.pedido.ESTATUS == 'PENDIENTE'
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
                              text: '${item.pedido.ID_CLIENTE}',
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
                              text: '${item.pedido.ID_VENDEDOR}',
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
                        _tableRow(theme, 'Almacén', '${item.pedido.ID_ALMACEN}', true),
                        _tableRow(
                          theme,
                          'Paridad',
                          '${item.pedido.PARIDAD}',
                          false,
                        ),
                        _tableRow(
                          theme,
                          'Fecha de Cancelación',
                          item.pedido.FECHA_CANCELACION,
                          true,
                        ),
                        _tableRow(
                          theme,
                          'Fecha de Registro',
                          item.pedido.FECHA_REGISTRO,
                          false,
                        ),
                        _tableRow(
                          theme,
                          'Fecha de Inicio C',
                          item.pedido.FECHA_INICIOC,
                          true,
                        ),
                        _tableRow(
                          theme,
                          'Fecha de Fin C',
                          item.pedido.FECHA_FINC,
                          false,
                        ),
                        _tableRow(
                          theme,
                          'Fecha Fin OC',
                          item.pedido.FECHA_FINC,
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
