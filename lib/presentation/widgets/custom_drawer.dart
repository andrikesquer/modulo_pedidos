import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends ConsumerWidget {
  final ColorScheme theme;

  const CustomDrawer({super.key, required this.theme});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: theme.primary),
              child: Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      'https://hips.hearstapps.com/hmg-prod/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=0.752xw:1.00xh;0.175xw,0&resize=1200:*',
                    ),
                  ),
                  Text(
                    'Andrik Esquer',
                    style: TextStyle(
                      color: theme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.corporate_fare),
              title: Text('Operativo'),
              iconColor: theme.primary,
              onTap: () {
                context.go("/operativo");
              },
            ),
            ListTile(
              leading: Icon(Icons.sell_outlined),
              title: Text('Requisiciones'),
              iconColor: theme.primary,
              onTap: () {
                context.go("/requisiciones");
              },
            ),
            Divider(color: theme.primary),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Cerrar sesión'),
              iconColor: Colors.red,
              onTap: () {
                debugPrint('Cerrar sesión');
              },
            ),
          ],
        ),
      ),
    );
  }
}
