import 'package:flutter/material.dart';
import 'package:requisiciones/presentation/widgets/custom_drop_down_menu.dart';

class AlmacenesCard extends StatelessWidget {
  const AlmacenesCard({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;

    var defaultTextStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: theme.primary,
    );

    final almacenes = [
      'REFRI-VICENTE',
      'REFRI-GOMEZ',
      'REFRI-TORRES',
      'REFRI-CHIHUAHUA-TEC',
      'REFRI-TORRES',
    ];

    return Card(
      color: theme.onPrimary,
      shadowColor: theme.primary.withAlpha(60),
      elevation: 4,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.storefront, color: theme.primary),
              Text(
                'Solicita: ',
                style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              CustomDropDownMenu(options: almacenes),
            ],
          ),
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.storefront, color: theme.primary),
              Text(
                'Para: ',
                style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              CustomDropDownMenu(options: almacenes),
            ],
          ),
        ],
      ),
    );
  }
}
