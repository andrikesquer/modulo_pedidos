import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:requisiciones/config/DB/object_box_connection.dart';
import 'package:requisiciones/core/dao/almacen_dao.dart';
import 'package:requisiciones/core/services/almacenes_servicio.dart';
import 'package:requisiciones/data/repositories/almacen_dao_objectbox_impl.dart';

// ObjectBox
final objectBoxProvider = Provider<ObjectboxConnection>(
  (ref) => throw UnimplementedError(),
);

// Almacenes
final almacenDaoImplProvider = Provider<AlmacenLDBDao>(
  (ref) => AlmacenDAOObjectboxImpl(ref.read(objectBoxProvider)),
);

final almacenServicioProvider = Provider<AlmacenServicio>(
  (ref) => AlmacenServicio(ref.read(almacenDaoImplProvider)),
);
