import 'package:requisiciones/data/data_sources/objectbox.g.dart';
import 'package:requisiciones/config/DB/object_box_connection.dart';
import 'package:requisiciones/core/dao/almacen_dao.dart';
import 'package:requisiciones/domain/entities/almacen_ob.dart';

class AlmacenDAOObjectboxImpl extends AlmacenLDBDao {
  final ObjectboxConnection _connectionDB;

  AlmacenDAOObjectboxImpl(this._connectionDB);

  @override
  AlmacenOB? getAlmacenByIdLDB(int idAlmacenOB) {
    final almacenesLDB = _connectionDB.almacenBox;

    return almacenesLDB.get(idAlmacenOB);
  }

  @override
  List<AlmacenOB> getAllAlmacenesLDB() {
    final almacenesLDB = _connectionDB.almacenBox;

    return almacenesLDB.getAll();
  }

  @override
  bool agregarAlmacenLDB(AlmacenOB almacenOB) {
    final almacenesLDB = _connectionDB.almacenBox;
    try {
      almacenesLDB.put(almacenOB);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  bool eliminarAlmacenLDB(int idAlmacenOB) {
    final almacenesLDB = _connectionDB.almacenBox;
    try {
      almacenesLDB.remove(idAlmacenOB);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  bool updateAlmacenLDB(AlmacenOB almacenOB) {
    final almacenesLDB = _connectionDB.almacenBox;
    try {
      almacenesLDB.put(almacenOB);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  List<AlmacenOB> existeAlmacenPorIdLDB(int idAlmacenOB) {
    final almacenesLDB = _connectionDB.almacenBox;
    return almacenesLDB
        .query(AlmacenOB_.id_almacen.equals(idAlmacenOB))
        .build()
        .find();
  }
}
