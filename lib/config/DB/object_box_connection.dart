import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:requisiciones/data/data_sources/objectbox.g.dart';
import 'package:requisiciones/domain/entities/almacen_ob.dart';

class ObjectboxConnection {
  late final Store _store;

  late final Box<AlmacenOB> almacenBox;

  //Obtiene las conexiones a las bases de datos.
  ObjectboxConnection._create(this._store) {
    almacenBox = Box<AlmacenOB>(_store);
  }

  static Future<ObjectboxConnection> create() async {
    final store = await openStore(
      directory: p.join(
        (await getApplicationDocumentsDirectory()).path,
        "obx-demo",
      ),
      macosApplicationGroup: "objectbox.demo",
    );
    return ObjectboxConnection._create(store);
  }
}
