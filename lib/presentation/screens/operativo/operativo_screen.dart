import 'package:flutter/material.dart';
import 'package:requisiciones/data/models/route_card_model.dart';
import 'package:requisiciones/presentation/screens/operativo/widgets/operativo_widgets.dart';
import 'package:requisiciones/presentation/widgets/custom_drawer.dart';
import 'package:requisiciones/presentation/widgets/navigation/routes_menu_widget.dart';

class OperativoScreen extends StatefulWidget {
  const OperativoScreen({super.key});

  @override
  State<OperativoScreen> createState() => _OperativoScreenState();
}

class _OperativoScreenState extends State<OperativoScreen> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    final List<RouteCardModel> traspasosCardsModels = [
      RouteCardModel(
        location: '/operativo/requisiciones',
        icon: Icons.sell_outlined,
        routeName: 'Requisiciones',
      ),
    ];

    return Scaffold(
      appBar: OperativoAppBar(theme: theme),
      drawer: CustomDrawer(theme: theme),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: <Widget>[
            RoutesMenu(
              theme: theme,
              menuIcon: Icons.compare_arrows,
              menuTitle: 'Traspasos',
              routeCardsModels: traspasosCardsModels,
            ),
          ],
        ),
      ),
    );
  }
}
