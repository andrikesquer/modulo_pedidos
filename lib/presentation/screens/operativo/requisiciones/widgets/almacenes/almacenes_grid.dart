import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:requisiciones/presentation/screens/operativo/requisiciones/widgets/almacenes/almacen_card.dart';

class AlmacenesGrid extends ConsumerWidget {
  final List<String> almacenes;

  const AlmacenesGrid({super.key, required this.almacenes});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      itemCount: almacenes.length,
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      itemBuilder: (BuildContext context, int index) {
        return AlmacenCard(almacen: almacenes[index]);
      },
    );
  }
}
