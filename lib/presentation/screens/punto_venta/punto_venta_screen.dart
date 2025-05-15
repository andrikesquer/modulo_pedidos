import 'package:flutter/material.dart';
import 'package:requisiciones/data/models/route_card_model.dart';
import 'package:requisiciones/presentation/screens/punto_venta/widgets/punto_venta_widgets.dart';
import 'package:requisiciones/presentation/widgets/custom_drawer.dart';
import 'package:requisiciones/presentation/widgets/routes/routes_menu_widget.dart';

class PuntoVentaScreen extends StatefulWidget {
  const PuntoVentaScreen({super.key});

  @override
  State<PuntoVentaScreen> createState() => _PuntoVentaScreenState();
}

class _PuntoVentaScreenState extends State<PuntoVentaScreen> {

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    final List<RouteCardModel> operacionesCardsModels = [
      RouteCardModel(
        location: '/punto_venta/pedidos',
        icon: Icons.shopping_cart_outlined,
        routeName: 'Pedidos',
      ),
    ];

    return Scaffold(
      appBar: PuntoVentaAppBar(theme: theme),
      drawer: CustomDrawer(theme: theme),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: <Widget>[
            RoutesMenu(
              theme: theme,
              menuIcon: Icons.compare_arrows,
              menuTitle: 'Operaciones',
              routeCardsModels: operacionesCardsModels,
            ),
          ],
        ),
      ),
    );
  }
}
