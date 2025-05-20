import 'package:flutter/material.dart';

class FechaButton extends StatefulWidget {
  const FechaButton({super.key, required this.esPrimeraFecha});

  final bool esPrimeraFecha;

  @override
  State<FechaButton> createState() => _FechaButtonState();
}

class _FechaButtonState extends State<FechaButton> {
  late final bool _esPrimeraFecha;

  final DateTime hoy = DateTime.now();

  late final DateTime ayer = DateTime(hoy.year, hoy.month, hoy.day - 1);

  late final String hoyString = '${hoy.day}/${hoy.month}/${hoy.year}';
  late final String ayerString = '${ayer.day}/${ayer.month}/${ayer.year}';

  DateTime? selectedDate;

  @override
  void initState() {
    _esPrimeraFecha = widget.esPrimeraFecha;
    super.initState();
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _esPrimeraFecha ? ayer : hoy,
      firstDate: DateTime(2015),
      lastDate: hoy,
    );

    setState(() {
      selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      label: Text(
        selectedDate != null
            ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
            : _esPrimeraFecha
            ? ayerString
            : hoyString,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
      ),
      icon: Icon(Icons.date_range, color: Colors.black),
      onPressed: () {
        _selectDate();
      },
    );
  }
}
