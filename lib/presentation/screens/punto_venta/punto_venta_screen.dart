import 'package:flutter/material.dart';
import 'package:requisiciones/presentation/widgets/custom_drawer.dart';
import 'package:requisiciones/presentation/widgets/navigation/route_card.dart';
import 'package:requisiciones/presentation/widgets/navigation/routes_menu.dart';

class PuntoVentaScreen extends StatefulWidget {
  const PuntoVentaScreen({super.key});

  @override
  State<PuntoVentaScreen> createState() => _PuntoVentaScreenState();
}

class _PuntoVentaScreenState extends State<PuntoVentaScreen> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    final List<RouteCard> operacionesRouteCards = [
      RouteCard(
        location: '/punto_venta/pedidos',
        icon: Icons.shopping_cart_outlined,
        routeName: 'Pedidos',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primary,
        iconTheme: IconThemeData(color: theme.onPrimary),
        title: Text('Punto de Venta', style: TextStyle(color: theme.onPrimary)),
        actions: [
          IconButton(
            tooltip: 'Buscar opción',
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      drawer: CustomDrawer(theme: theme),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: <Widget>[
            RoutesMenu(
              theme: theme,
              menuIcon: Icons.compare_arrows,
              menuTitle: 'Operaciones',
              routeCards: operacionesRouteCards,
            ),
          ],
        ),
      ),
    );
  }
}
