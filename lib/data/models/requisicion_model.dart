import 'package:requisiciones/data/models/articulo_venta_model.dart';

class Requisicion {
  int noRequisicion;
  String almacenEnvia;
  String almacenRecibe;

  String fecha;

  String estado;

  List<ArticuloVenta> artsVenta;

  Requisicion({
    required this.noRequisicion,
    required this.almacenEnvia,
    required this.almacenRecibe,
    required this.fecha,
    required this.estado,
    required this.artsVenta,
  });
}
