import 'package:flutter/material.dart';
import 'package:requisiciones/data/models/articulo_model.dart';
import 'package:requisiciones/data/models/articulo_venta_model.dart';
import 'package:requisiciones/data/models/requisicion_model.dart';

class PedidosExpansionPanelList extends StatefulWidget {
  const PedidosExpansionPanelList({super.key});

  @override
  State<PedidosExpansionPanelList> createState() =>
      _PedidosExpansionPanelListState();
}

class _PedidosExpansionPanelListState extends State<PedidosExpansionPanelList> {
  final Articulo articulo = Articulo(
    codigo: 6666,
    nombre: 'TUBO CU FLEX 1 1/8 P/REFRIGERACIÓN',
    marca: 'MUELLER',
    numeroParte: '7425M',
    factor: 0,
  );

  late final ArticuloVenta artVenta = ArticuloVenta(
    art: articulo,
    unidad: 'MTS',
    cantidad: 1,
    cantidadAuxiliar: 0,
    pendiente: 0,
    pendienteAuxiliar: 0,
  );

  late final List<ArticuloVenta> artsVenta = [artVenta];

  late final Requisicion req = Requisicion(
    noRequisicion: 11418,
    almacenEnvia: '1. REFRI-VICENTE',
    almacenRecibe: '1. REFRI-GOMEZ',
    fecha: '05/05/2025',
    estado: 'PENDIENTE',
    artsVenta: artsVenta,
  );

  late final List<Requisicion> requisiciones = [req];

  late final List<NewItem> items = generateItems(requisiciones);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;

    return SingleChildScrollView(child: _buildPanel(theme));
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
        Padding(
          padding: EdgeInsets.all(3),
          child: TableCell(child: Text(left, style: TextStyle(fontSize: 16))),
        ),
        Padding(
          padding: EdgeInsets.all(3),
          child: TableCell(child: Text(right, style: TextStyle(fontSize: 16))),
        ),
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
          items.map<ExpansionPanel>((NewItem item) {
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
                                  text: '15550',
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
                                  text: item.req.fecha,
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
                                  text: '${item.req.noRequisicion}',
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
                                color: Colors.red,
                              ),
                              Text(
                                'PENDIENTE',
                                style: TextStyle(
                                  color: Colors.red,
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
                              text: 'Cliente',
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
                              text: 'Vendedor',
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
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: theme.primary.withAlpha(15),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Table(
                    children: <TableRow>[
                      _tableRow(theme, 'Almacén', 'REFRI GÓMEZ', true),
                      _tableRow(theme, 'Paridad', '0', false),
                      _tableRow(
                        theme,
                        'Fecha de Cancelación',
                        '16/05/2025',
                        true,
                      ),
                      _tableRow(
                        theme,
                        'Fecha de Registro',
                        '16/05/2025',
                        false,
                      ),
                      _tableRow(theme, 'Fecha de Inicio C', '16/05/2025', true),
                      _tableRow(theme, 'Fecha de Fin C', '16/05/2025', false),
                      _tableRow(theme, 'Fecha Fin OC', '16/05/2025', true),
                    ],
                  ),
                ),
              ),
              isExpanded: item.isExpanded,
            );
          }).toList(),
    );
  }
}

class NewItem {
  Requisicion req;
  bool isExpanded;

  NewItem({required this.req, this.isExpanded = false});
}

List<NewItem> generateItems(List<Requisicion> requisiciones) {
  return List<NewItem>.generate(requisiciones.length, (int index) {
    return NewItem(req: requisiciones[index]);
  });
}
