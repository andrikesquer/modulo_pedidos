class Pedido {
  int noPedido;

  int requisicion;

  String cliente;

  String vendedor;

  String status;

  String almacen;

  double paridad;

  String fechaMovimiento;

  String fechaCancelacion;

  String fechaRegistro;

  String fechaInicioC;
  String fechaFinC;
  String fechaFinOC;

  Pedido({
    required this.noPedido,
    required this.requisicion,
    required this.cliente,
    required this.vendedor,
    required this.status,
    required this.almacen,
    required this.paridad,
    required this.fechaMovimiento,
    required this.fechaCancelacion,
    required this.fechaRegistro,
    required this.fechaInicioC,
    required this.fechaFinC,
    required this.fechaFinOC,
  });
}
