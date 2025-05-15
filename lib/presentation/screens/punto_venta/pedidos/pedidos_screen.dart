import 'package:flutter/material.dart';
import 'package:requisiciones/presentation/screens/punto_venta/pedidos/widgets/pedidos_widgets.dart';
import 'package:requisiciones/presentation/widgets/custom_end_drawer.dart';

class PedidosScreen extends StatefulWidget {
  const PedidosScreen({super.key});

  @override
  PedidosScreenState createState() => PedidosScreenState();
}

class PedidosScreenState extends State<PedidosScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    return Scaffold(
      key: scaffoldKey,
      appBar: PedidosAppBar(scaffoldKey: scaffoldKey, theme: theme),
      endDrawer: PedidosEndDrawer(theme: theme),
    );
  }
}
