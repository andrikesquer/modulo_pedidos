import 'package:flutter/material.dart';
import 'package:requisiciones/presentation/widgets/custom_drawer.dart';
import 'package:requisiciones/presentation/widgets/navigation/route_card.dart';
import 'package:requisiciones/presentation/widgets/navigation/routes_menu.dart';

class OperativoScreen extends StatefulWidget {
  const OperativoScreen({super.key});

  @override
  State<OperativoScreen> createState() => _OperativoScreenState();
}

class _OperativoScreenState extends State<OperativoScreen> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    final List<RouteCard> operativoRouteCards = [
      RouteCard(
        location: '/operativo/requisiciones',
        icon: Icons.sell_outlined,
        routeName: 'Requisiciones',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primary,
        iconTheme: IconThemeData(color: theme.onPrimary),
        title: Text('Operaciones', style: TextStyle(color: theme.onPrimary)),
        actions: [
          IconButton(
            tooltip: 'Buscar Opción',
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
              menuTitle: 'Traspasos',
              routeCards: operativoRouteCards,
            ),
          ],
        ),
      ),
    );
  }
}
