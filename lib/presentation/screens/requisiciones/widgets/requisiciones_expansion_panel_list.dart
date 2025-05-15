import 'package:flutter/material.dart';
import 'package:requisiciones/data/models/articulo_model.dart';
import 'package:requisiciones/data/models/articulo_venta_model.dart';
import 'package:requisiciones/data/models/requisicion_model.dart';
import 'package:requisiciones/presentation/screens/requisiciones/widgets/cantidad_pendiente_row.dart';

class RequisicionesExpansionPanelList extends StatefulWidget {
  const RequisicionesExpansionPanelList({super.key});

  @override
  State<RequisicionesExpansionPanelList> createState() =>
      _RequisicionesExpansionPanelListState();
}

class _RequisicionesExpansionPanelListState
    extends State<RequisicionesExpansionPanelList> {
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
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                          RichText(
                            text: TextSpan(
                              text: 'Fecha: ',
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
                          Column(
                            spacing: 10,
                            children: [
                              RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  text: 'Envía: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: item.req.almacenEnvia,
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Recibe: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: item.req.almacenRecibe,
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            spacing: 10,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Estatus: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'PENDIENTE',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.red,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              body: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: theme.primary.withAlpha(15),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        spacing: 8,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: '${artVenta.art.codigo}: ',
                              style: TextStyle(color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(text: articulo.nombre),
                              ],
                            ),
                          ),
                          Text(
                            'Unidad: MTS',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                            ),
                          ),
                          Row(
                            spacing: 20,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text('Cantidad: '),
                                      Text(
                                        '${artVenta.cantidad}',
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Cantidad Aux: '),
                                      Text(
                                        '${artVenta.cantidadAuxiliar}',
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text('Pendiente: '),
                                      Text(
                                        '${artVenta.pendiente}',
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Pendiente Aux: '),
                                      Text(
                                        '${artVenta.pendienteAuxiliar}',
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {},
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
