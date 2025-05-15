import 'articulo_model.dart';

class ArticuloVenta {
  Articulo art;

  String unidad;

  int cantidad;

  int cantidadAuxiliar;

  double pendiente;

  double pendienteAuxiliar;

  ArticuloVenta({
    required this.art,
    required this.unidad,
    required this.cantidad,
    required this.cantidadAuxiliar,
    required this.pendiente,
    required this.pendienteAuxiliar,
  });
}
