import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'almacen_card.dart';

class AlmacenesGrid extends ConsumerWidget {
  const AlmacenesGrid({super.key, required this.theme});

  final ColorScheme theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> almacenes = [
      'REFRI-VICENTE',
      'REFRI-GOMEZ',
      'REFRI-TORRES',
      'REFRI-CHIHUAHUA-TEC',
      'REFRI-TORRES',
    ];

    return GridView.builder(
      itemCount: almacenes.length,
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      itemBuilder: (BuildContext context, int index) {
        return AlmacenCard(theme: theme, alm: almacenes[index]);
      },
    );
  }
}
