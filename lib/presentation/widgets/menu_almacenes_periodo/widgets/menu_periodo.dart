import 'package:flutter/material.dart';
import 'package:requisiciones/presentation/widgets/custom_bottom_menu.dart';
import 'package:requisiciones/presentation/widgets/custom_drop_down_menu.dart';
import 'package:requisiciones/presentation/widgets/menu_almacenes_periodo/widgets/fecha_button.dart';

class MenuPeriodo extends StatelessWidget {
  const MenuPeriodo({super.key, required this.theme});

  final ColorScheme theme;

  @override
  Widget build(BuildContext context) {
    final TextStyle defaultTextStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: theme.primary,
    );

    final List<String> tiposFecha = [
      'Fecha de registro',
      'Fecha de movimiento',
      'Fecha de cancelación',
      'Fecha de O.C',
      'Fecha de inicio consigna',
      'Fecha de fin consigna',
    ];

    Widget content() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            spacing: 25,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Tipo: ',
                style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'Fecha Inicial: ',
                style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'Fecha Fin: ',
                style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CustomDropDownMenu(options: tiposFecha),
              ),
              FechaButton(esPrimeraFecha: true),
              FechaButton(esPrimeraFecha: false),
            ],
          ),
        ],
      );
    }

    return CustomBottomMenu(
      theme: theme,
      height: 250,
      title: 'Seleccionar Periodo',
      content: content(),
    );
  }
}
