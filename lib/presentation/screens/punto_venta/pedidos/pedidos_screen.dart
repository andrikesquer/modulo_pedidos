import 'package:flutter/material.dart';
import 'package:requisiciones/presentation/screens/punto_venta/pedidos/widgets/pedidos_widgets.dart';

class PedidosScreen extends StatefulWidget {
  const PedidosScreen({super.key});

  @override
  _PedidosScreenState createState() => _PedidosScreenState();
}

class _PedidosScreenState extends State<PedidosScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: PedidosAppBar(scaffoldKey: scaffoldKey, theme: theme),
    );
  }
}
