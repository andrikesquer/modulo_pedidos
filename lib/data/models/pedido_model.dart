class Pedido {
  int noPedido;

  int requisicion;

  String almacen;

  String sucursal;

  String cliente;

  String vendedor;

  String status;

  int prioridades;

  int tipoEntrega;

  String atencionA;

  String RFC;

  int factura;

  int plazo;

  String direccion;

  String lista_precios;

  String moneda;

  double descuento;

  double paridad;

  String fechaMovimiento;

  String fechaCancelacion;

  String fechaRegistro;

  String fechaFinOC;

  String fechaIConsigna;

  String fechaFConsigna;

  String noSerie;

  String ordenCompra;

  String campoAddenda;

  bool autorizar;

  bool ivaTotalRetenido;

  String usuarioCreo;

  String observaciones;

  String usoCfdi;

  double subtotal;

  double dsctoTotal;

  double importeConDescuento;

  double IEPSTotal;

  double IVATotal;

  double IVARetenido;

  double granTotal;

  Pedido({
    required this.noPedido,
    required this.requisicion,
    required this.almacen,
    required this.sucursal,
    required this.cliente,
    required this.vendedor,
    required this.status,
    required this.prioridades,
    required this.tipoEntrega,
    required this.atencionA,
    required this.RFC,
    required this.factura,
    required this.plazo,
    required this.direccion,
    required this.lista_precios,
    required this.moneda,
    required this.descuento,
    required this.paridad,
    required this.fechaMovimiento,
    required this.fechaCancelacion,
    required this.fechaRegistro,
    required this.fechaFinOC,
    required this.fechaIConsigna,
    required this.fechaFConsigna,
    required this.noSerie,
    required this.ordenCompra,
    required this.campoAddenda,
    required this.autorizar,
    required this.ivaTotalRetenido,
    required this.usuarioCreo,
    required this.observaciones,
    required this.usoCfdi,
    required this.subtotal,
    required this.dsctoTotal,
    required this.importeConDescuento,
    required this.IEPSTotal,
    required this.IVATotal,
    required this.IVARetenido,
    required this.granTotal,
  });
}
