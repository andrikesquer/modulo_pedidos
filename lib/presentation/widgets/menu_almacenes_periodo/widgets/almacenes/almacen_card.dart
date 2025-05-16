import 'package:flutter/material.dart';

class AlmacenCard extends StatelessWidget {
  const AlmacenCard({super.key, required this.alm, required this.theme});

  final String alm;

  final ColorScheme theme;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: theme.primary,
      child: InkWell(
        splashColor: theme.primary.withAlpha(90),
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Flexible(
            child: Text(
              alm,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: theme.onPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
