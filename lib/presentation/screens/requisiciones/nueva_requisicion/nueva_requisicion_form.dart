import 'package:flutter/material.dart';
import 'package:requisiciones/presentation/screens/requisiciones/nueva_requisicion/widgets/nueva_requisicion_widgets.dart';
import 'package:requisiciones/presentation/screens/requisiciones/widgets/requisiciones_widgets.dart';

class NuevaRequisicionForm extends StatefulWidget {
  const NuevaRequisicionForm({super.key});

  @override
  State<NuevaRequisicionForm> createState() => _NuevaRequisicionFormState();
}

class _NuevaRequisicionFormState extends State<NuevaRequisicionForm> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            spacing: 15,
            children: [
              Text(
                'Nueva Requisición',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: theme.primary,
                ),
              ),
              TotalesCard(),
              AlmacenesCard(),
              ObservacionesTextField(),
              CustomSearchBar(theme: theme),
              ArticulosExpansionPanelList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: ActionButtons(theme: theme),
      ),
    );
  }
}
