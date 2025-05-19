import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:requisiciones/presentation/screens/screens.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/punto_venta',
    routes: <RouteBase>[
      GoRoute(
        path: '/operativo',
        builder:
            (BuildContext context, GoRouterState state) =>
                const OperativoScreen(),
        routes: <RouteBase>[
          GoRoute(
            path: 'requisiciones',
            builder:
                (BuildContext context, GoRouterState state) =>
                    const RequisicionesScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/punto_venta',
        builder:
            (BuildContext context, GoRouterState state) =>
                const PuntoVentaScreen(),
        routes: <RouteBase>[
          GoRoute(
            path: 'pedidos',
            builder:
                (BuildContext context, GoRouterState state) =>
                    const PedidosScreen(),
            routes: <RouteBase>[
              GoRoute(
                path: 'nuevo_pedido',
                builder:
                    (BuildContext context, GoRouterState state) =>
                        const NuevoPedidoScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
