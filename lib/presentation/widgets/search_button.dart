import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key, required this.theme, required this.onPressed});

  final ColorScheme theme;

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(theme.onPrimary),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        elevation: WidgetStatePropertyAll(4),
        shadowColor: WidgetStatePropertyAll(theme.primary.withAlpha(60)),
      ),
      onPressed: () {
        onPressed;
      },
      child: Icon(Icons.search),
    );
  }
}
