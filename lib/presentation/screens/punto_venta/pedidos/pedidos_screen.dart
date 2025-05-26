import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:requisiciones/data/models/almacen_model.dart';
import 'package:requisiciones/domain/entities/almacen_ob.dart';
import 'package:requisiciones/presentation/screens/punto_venta/pedidos/widgets/pedidos_widgets.dart';
import 'package:requisiciones/presentation/viewmodels/almacenes_viewmodel.dart';
import 'package:requisiciones/presentation/widgets/custom_search_bar.dart';
import 'package:requisiciones/presentation/widgets/menu_almacenes_periodo/menu_almacen_periodo.dart';
import 'package:requisiciones/presentation/widgets/search_button.dart';

class PedidosScreen extends ConsumerStatefulWidget {
  const PedidosScreen({super.key});

  @override
  ConsumerState<PedidosScreen> createState() => PedidosScreenState();
}

class PedidosScreenState extends ConsumerState<PedidosScreen> {
  bool isLoading = false;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    List<Almacen> almacenes = ref.watch(almacenesProvider);

    final TextEditingController inputController = TextEditingController();

    final List<Widget> searchBarActions = [
      IconButton(
        onPressed: () {
          inputController.clear();
        },
        icon: Icon(Icons.clear, color: theme.primary),
      ),
    ];

    stopLoading() {
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          isLoading = false;
        });
      });
    }

    guardarAlmacenes(List<Almacen> almacenes) async {
      if (almacenes.isNotEmpty) {
        int i = 1;
        for (Almacen alm in almacenes) {
          AlmacenOB almacenOB = AlmacenOB(
            id_sucursal: alm.id_sucursal,
            id_almacen: alm.id_almacen,
            nombre: alm.nombre,
          );

          bool result = ref.read(almacenesVMProvider).agregarAlmacen(almacenOB);

          if (result == false) {
            debugPrint(
              "Almacen no registrado, id_almacen duplicado: ${almacenOB.id_almacen}",
            );
          } else {
            debugPrint("Guardando almacenes...${i++}/${almacenes.length}");
          }
        }
      } else {
        debugPrint("No hay almacenes para guardar");
      }
      setState(() {
        ref.watch(almacenesVMProvider.notifier).getAllAlmacenesLDB();
      });
    }

    cargarAlmacenes() async {
      setState(() {
        isLoading = true;
      });

      await ref
          .read(almacenesProvider.notifier)
          .fetchAlmacenes('19cf4bcd-c52c-41bf-9fc8-b1f3d91af2df', 2, 10);

      stopLoading();
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: theme.primary,
        iconTheme: IconThemeData(color: theme.onPrimary),
        title: Text('Pedidos', style: TextStyle(color: theme.onPrimary)),
        actions: [
          IconButton(
            tooltip: 'Menú de Opciones',
            icon: Icon(Icons.more_vert),
            onPressed: () {
              scaffoldKey.currentState!.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: PedidosEndDrawer(theme: theme),
      body: ListView(
        children: [
          MenuAlmacenPeriodo(theme: theme),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              spacing: 15,
              children: [
                // Barra de búsqueda cliente y botón de búsqueda pedidos
                Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      flex: 3,
                      child: CustomSearchBar(
                        theme: theme,
                        hint: 'Cliente',
                        actions: searchBarActions,
                        inputController: inputController,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 56,
                        child: SearchButton(
                          theme: theme,
                          onPressed: () {
                            debugPrint('Buscar');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                // Resultados de búsqueda (pedidos)
                isLoading
                    ? CircularProgressIndicator()
                    : PedidosExpansionPanelList(theme: theme),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (almacenes.isEmpty) {
            cargarAlmacenes();
          } else {
            guardarAlmacenes(almacenes);
          }
        },
        child: Icon(Icons.storefront),
      ),
    );
  }
}
