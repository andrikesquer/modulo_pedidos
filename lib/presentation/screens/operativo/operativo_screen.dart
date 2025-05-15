import 'package:flutter/material.dart';
import 'package:requisiciones/presentation/widgets/custom_drawer.dart';

class OperativoScreen extends StatefulWidget {
  const OperativoScreen({super.key});

  @override
  State<OperativoScreen> createState() => _OperativoScreenState();
}

class _OperativoScreenState extends State<OperativoScreen> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primary,
        iconTheme: IconThemeData(color: theme.onPrimary),
        title: Text('Operaciones', style: TextStyle(color: theme.onPrimary)),
      ),
      drawer: CustomDrawer(theme: theme,),
    );
  }
}
