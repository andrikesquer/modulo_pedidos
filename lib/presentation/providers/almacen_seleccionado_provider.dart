import 'package:requisiciones/domain/entities/almacen_ob.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'almacen_seleccionado_provider.g.dart';

@riverpod
class AlmacenSeleccionado extends _$AlmacenSeleccionado {
  @override
  Future<AlmacenOB?> build() async {
    return null;
  }

  Future<void> seleccionarAlmacen(AlmacenOB almacenOB) async {
    state = AsyncData(almacenOB);
  }
}
