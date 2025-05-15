import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:requisiciones/presentation/screens/screens.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/requisiciones',
    routes: <RouteBase>[
      GoRoute(
        path: '/operativo',
        builder: (context, state) => const OperativoScreen(),
      ),
      GoRoute(
        path: '/requisiciones',
        builder: (context, state) => const RequisicionesScreen(),
      ),
    ],
  );
});
