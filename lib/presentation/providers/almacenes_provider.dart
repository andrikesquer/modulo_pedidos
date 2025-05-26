import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:requisiciones/config/DI/dependencias.dart';
import 'package:requisiciones/domain/entities/almacen_ob.dart';
import 'package:requisiciones/presentation/viewmodels/almacenes_viewmodel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'almacenes_provider.g.dart';

@riverpod
class AlmacenesProviderr extends _$AlmacenesProviderr {
  @override
  Future<List<AlmacenOB>> build () async {
    return [];
  }

  Future<List<AlmacenOB>> obtenerAlmacenes(WidgetRef ref) async {
    return ref.watch(almacenServicioProvider).getAllAlmacenesLDB();
  }

  void actualizarAlmacenes () {
    ref.read(almacenesProv.notifier).actualizar();
  }
}
