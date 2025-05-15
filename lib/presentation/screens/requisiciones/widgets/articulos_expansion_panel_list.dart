import 'package:flutter/material.dart';
import 'package:requisiciones/data/models/articulo_model.dart';
import 'package:requisiciones/presentation/screens/requisiciones/widgets/cantidad_pendiente_row.dart';

class ArticulosExpansionPanelList extends StatefulWidget {
  const ArticulosExpansionPanelList({super.key});

  @override
  State<ArticulosExpansionPanelList> createState() =>
      _ArticulosExpansionPanelListState();
}

class _ArticulosExpansionPanelListState
    extends State<ArticulosExpansionPanelList> {
  final Articulo articulo = Articulo(
    codigo: 6666,
    nombre: 'TUBO CU FLEX 1 1/8 P/REFRIGERACIÓN',
    marca: 'MUELLER',
    numeroParte: '7425M',
    factor: 0,
  );

  late final List<Articulo> arts = [articulo];

  late final List<Item> items = generateNewItems(arts);

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
          items.map<ExpansionPanel>((Item item) {
            return ExpansionPanel(
              backgroundColor: theme.onPrimary,
              splashColor: theme.primary.withAlpha(10),
              canTapOnHeader: true,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: isExpanded ? 10 : 0,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '${item.art.codigo}. ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(item.art.nombre),
                        ],
                      ),
                      isExpanded
                          ? Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Marca: ${item.art.marca}'),
                                  Text('No. parte: ${item.art.numeroParte}'),
                                  Text('Factor: ${item.art.factor}'),
                                ],
                              ),
                              Divider(),
                              CantidadPendienteRow(theme: theme),
                              Row(
                                spacing: 20,
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Unidad: ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text('MTS'),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Pend aux: ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text('0.0'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                          : Column(
                            children: [
                              Divider(),
                              CantidadPendienteRow(theme: theme),
                            ],
                          ),
                    ],
                  ),
                );
              },
              body: ListTile(
                title: Text(
                  'Existencia',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  spacing: 10,
                  children: [
                    SizedBox(height: 3),
                    Row(
                      children: [
                        Text('1. REFRI-VICENTE: '),
                        Text(
                          '19.06',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('2. REFRI-GOMEZ: '),
                        Text(
                          '15.5',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: Icon(Icons.delete, color: theme.primary),
                onTap: () {
                  setState(() {
                    items.removeWhere(
                      (Item currentItem) => item == currentItem,
                    );
                  });
                },
              ),
              isExpanded: item.isExpanded,
            );
          }).toList(),
    );
  }
}

class Item {
  Articulo art;
  bool isExpanded;

  Item({required this.art, this.isExpanded = false});
}

List<Item> generateNewItems(List<Articulo> arts) {
  return List<Item>.generate(arts.length, (int index) {
    return Item(art: arts[index]);
  });
}
