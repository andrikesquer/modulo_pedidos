import 'package:flutter/material.dart';

class ConfirmationWidget extends StatelessWidget {
  const ConfirmationWidget({super.key, required this.theme});

  final ColorScheme theme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.onPrimary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Pedido Realizado'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          spacing: 10,
          children: [
            Icon(Icons.check_circle_outline, color: Colors.green, size: 50),
            Text(
              'Pedido realizado correctamente',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
