import 'package:flutter/material.dart';

class CustomEndDrawer extends StatelessWidget {
  const CustomEndDrawer({
    super.key,
    required this.theme,
    required this.headerTitle,
    required this.options,
  });

  final ColorScheme theme;

  final String headerTitle;

  final List<ListTile> options;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: theme.primary),
              child: Center(
                child: Text(
                  headerTitle,
                  style: TextStyle(
                    color: theme.onPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Column(children: options.map((ListTile option) => option).toList()),
          ],
        ),
      ),
    );
  }
}
