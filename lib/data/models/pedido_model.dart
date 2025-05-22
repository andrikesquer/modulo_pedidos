/*
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
*/

/*
{
    "ID_ALMACEN": 1,
    "ID_PEDIDO": 450403,
    "FECHA": "2025-01-18T15:45:00",
    "ID_VENDEDOR": 259,
    "ID_CLIENTE": 1,
    "ID_CTE_FACTURA": 1,
    "PARIDAD": 1.0000,
    "DESCUENTO_GLOBAL": 0.0000,
    "ID_TIPO_PEDIDO": "P",
    "ENTREGA_DOMICILIO": false,
    "OBSERVACIONES": "",
    "ESTATUS": "FACTURADO",
    "ID_NUMREFERENCIA": 114681,
    "FECHA_MOVIMIENTO": "2025-01-18T15:45:00",
    "ID_SUCURSAL_CTE": 1,
    "CARGO_FLETE": 0.0000,
    "MANEJO_CUENTA": 0.0000,
    "MUESTRA_PUBLICO_GRAL": false,
    "SUBTOTAL": 626.3600,
    "IVA": 50.1100,
    "DESCUENTO": 0.0000,
    "DiasCredito": 15,
    "TipoCambio": 19.2000,
    "Entrega": "",
    "OrdenCompra": "",
    "NUM_FACTURAS": 0,
    "FECHA_CANCELACION": "2025-01-18T15:46:00",
    "ESTATUS_PROCESO": "",
    "SURTIO": 0,
    "FECHA_ENTREGA": "1999-12-30T03:44:00",
    "FECHA_ASIGNACION": null,
    "FECHA_SURTIDO": null,
    "FECHA_SALIDA": null,
    "FECHA_CLIENTE": null,
    "IVA_CTA": 0.0000,
    "PORIVA_CTA": 0.0000,
    "Autorizada": false,
    "Id_Usuario_Autoriza": 0,
    "Req_Autorizacion": false,
    "ATENCION": "",
    "ID_COTIZACION": 0,
    "ID_COTIZACION_ALMACEN": 0,
    "PEDIDOWEB": 0,
    "MOV_ANT": "",
    "EntregarEnDomicilio": "",
    "EntregarEnColonia": "",
    "EntregarEnCP": "",
    "EntregarEnCiudad": "",
    "EntregarEnEstado": "",
    "EntregarEnCalles": "",
    "ImprimirSinPrecios": false,
    "FECHA_REGISTRO": "2025-01-18T15:45:00",
    "Nombre": "CLIENTE DE CONTADO",
    "Id_Gravamen": 1,
    "CampoAddenda": "",
    "Apartado": false,
    "FECHA_INICIOC": "2025-01-18T00:00:00",
    "FECHA_FINC": "2025-01-18T00:00:00",
    "FECHA_OC": "2025-01-18T00:00:00",
    "FECHAENTREGA": null,
    "IEPS": 0.0000,
    "RETIENE_IVA": false,
    "IVA_RETENIDO_TOTAL": 0.0000,
    "ID_PRIORIDAD": 0,
    "ID_TIPO_ENTREGA": 0,
    "OC_PATH": "",
    "USO_CFDI": "G03",
    "VENTAS_PLAZOS": false,
    "ID_USUARIO_CREO": 0,
    "ID_MOTIVO_CANC": 0,
    "IVA_INTERIOR": false
}
 */

class Pedido {
  int ID_ALMACEN;
  int ID_PEDIDO;
  String FECHA;
  int ID_VENDEDOR;
  int ID_CLIENTE;
  int ID_CTE_FACTURA;
  double PARIDAD;
  double DESCUENTO_GLOBAL;
  String ID_TIPO_PEDIDO;
  bool ENTREGA_DOMICILIO;
  String OBSERVACIONES;
  String ESTATUS;
  int ID_NUMREFERENCIA;
  String FECHA_MOVIMIENTO;
  int ID_SUCURSAL_CTE;
  double CARGO_FLETE;
  double MANEJO_CUENTA;
  bool MUESTRA_PUBLICO_GRAL;
  double SUBTOTAL;
  double IVA;
  double DESCUENTO;
  int DiasCredito;
  double TipoCambio;
  String Entrega;
  String OrdenCompra;
  int NUM_FACTURAS;
  String FECHA_CANCELACION;
  String ESTATUS_PROCESO;
  int SURTIO;
  String FECHA_ENTREGA;
  String? FECHA_ASIGNACION;
  String? FECHA_SURTIDO;
  String? FECHA_SALIDA;
  String? FECHA_CLIENTE;

  double IVA_CTA;
  double PORIVA_CTA;
  bool Autorizada;
  int Id_Usuario_Autoriza;
  bool Req_Autorizacion;
  String ATENCION;
  int ID_COTIZACION;
  int ID_COTIZACION_ALMACEN;
  int PEDIDOWEB;
  String MOV_ANT;
  String EntregarEnDomicilio;
  String EntregarEnColonia;
  String EntregarEnCP;
  String EntregarEnCiudad;
  String EntregarEnEstado;
  String EntregarEnCalles;
  bool ImprimirSinPrecios;

  String FECHA_REGISTRO;
  String Nombre;
  int Id_Gravamen;
  String CampoAddenda;
  bool Apartado;
  String FECHA_INICIOC;
  String FECHA_FINC;
  String FECHA_OC;
  String? FECHAENTREGA;
  double IEPS;
  bool RETIENE_IVA;
  double IVA_RETENIDO_TOTAL;
  int ID_PRIORIDAD;
  int ID_TIPO_ENTREGA;
  String OC_PATH;
  String USO_CFDI;
  bool VENTAS_PLAZOS;

  int ID_USUARIO_CREO;
  int ID_MOTIVO_CANC;
  bool IVA_INTERIOR;

  Pedido({
    required this.ID_ALMACEN,
    required this.ID_PEDIDO,
    required this.FECHA,
    required this.ID_VENDEDOR,
    required this.ID_CLIENTE,
    required this.ID_CTE_FACTURA,
    required this.PARIDAD,
    required this.DESCUENTO_GLOBAL,
    required this.ID_TIPO_PEDIDO,
    required this.ENTREGA_DOMICILIO,
    required this.OBSERVACIONES,
    required this.ESTATUS,
    required this.ID_NUMREFERENCIA,
    required this.FECHA_MOVIMIENTO,
    required this.ID_SUCURSAL_CTE,
    required this.CARGO_FLETE,
    required this.MANEJO_CUENTA,
    required this.MUESTRA_PUBLICO_GRAL,
    required this.SUBTOTAL,
    required this.IVA,
    required this.DESCUENTO,
    required this.DiasCredito,
    required this.TipoCambio,
    required this.Entrega,
    required this.OrdenCompra,
    required this.NUM_FACTURAS,
    required this.FECHA_CANCELACION,
    required this.ESTATUS_PROCESO,
    required this.SURTIO,
    required this.FECHA_ENTREGA,
    required this.FECHA_ASIGNACION,
    required this.FECHA_SURTIDO,
    required this.FECHA_SALIDA,
    required this.FECHA_CLIENTE,
    required this.IVA_CTA,
    required this.PORIVA_CTA,
    required this.Autorizada,
    required this.Id_Usuario_Autoriza,
    required this.Req_Autorizacion,
    required this.ATENCION,
    required this.ID_COTIZACION,
    required this.ID_COTIZACION_ALMACEN,
    required this.PEDIDOWEB,
    required this.MOV_ANT,
    required this.EntregarEnDomicilio,
    required this.EntregarEnColonia,
    required this.EntregarEnCP,
    required this.EntregarEnCiudad,
    required this.EntregarEnEstado,
    required this.EntregarEnCalles,
    required this.ImprimirSinPrecios,
    required this.FECHA_REGISTRO,
    required this.Nombre,
    required this.Id_Gravamen,
    required this.CampoAddenda,
    required this.Apartado,
    required this.FECHA_INICIOC,
    required this.FECHA_FINC,
    required this.FECHA_OC,
    required this.FECHAENTREGA,
    required this.IEPS,
    required this.RETIENE_IVA,
    required this.IVA_RETENIDO_TOTAL,
    required this.ID_PRIORIDAD,
    required this.ID_TIPO_ENTREGA,
    required this.OC_PATH,
    required this.USO_CFDI,
    required this.VENTAS_PLAZOS,
    required this.ID_USUARIO_CREO,
    required this.ID_MOTIVO_CANC,
    required this.IVA_INTERIOR,
  });
}
