import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CantidadPendienteRow extends StatelessWidget {
  final ColorScheme theme;

  const CantidadPendienteRow({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {
              _dialogBuilder(context);
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(0.5),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cantidad: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('1.0'),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pendiente: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('0.0'),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    TextEditingController controllerCantidad = TextEditingController();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: theme.onPrimary,
          iconColor: theme.primary,
          icon: Icon(Icons.info),
          title: Text(
            'Modificar Cantidad',
            style: TextStyle(color: theme.primary),
          ),
          content: Column(
            spacing: 15,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Existencia', style: TextStyle(fontWeight: FontWeight.bold)),
              Column(
                spacing: 10,
                children: [
                  Row(
                    children: [
                      Text('1. REFRI-VICENTE: '),
                      Text(
                        '19.06',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('2. REFRI-GOMEZ: '),
                      Text(
                        '15.5',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: controllerCantidad,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration: InputDecoration(
                  labelText: 'Cantidad',
                  border: OutlineInputBorder(),
                  hintText: 'Cantidad',
                  suffixIcon: IconButton(
                    onPressed: () {
                      controllerCantidad.clear();
                    },
                    icon: Icon(Icons.clear),
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
