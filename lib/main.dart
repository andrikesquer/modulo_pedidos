import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:requisiciones/config/DB/object_box_connection.dart';
import 'package:requisiciones/config/DI/dependencias.dart';
import 'package:requisiciones/routes/routes.dart';
import 'package:requisiciones/presentation/providers/theme_provider.dart';
import 'config/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final ObjectboxConnection objectBox = await ObjectboxConnection.create();

  runApp(
    ProviderScope(
      overrides: [objectBoxProvider.overrideWithValue(objectBox)],
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    final isDarkMode = ref.watch(darkModeProvider);

    return isDarkMode.when(
      loading:
          () => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              brightness: Brightness.light,
              colorSchemeSeed: Colors.blue,
              listTileTheme: const ListTileThemeData(iconColor: Colors.blue),
            ),
            home: const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          ),
      error:
          (e, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(child: Text('Error cargando tema: $e')),
            ),
          ),
      data:
          (isDarkMode) => MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Integral Móvil Operativo',
            theme: AppTheme(isDarkMode: isDarkMode).getTheme(),
            routerConfig: router,
          ),
    );
  }
}
