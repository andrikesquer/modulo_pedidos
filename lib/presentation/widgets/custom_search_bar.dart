import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.theme,
    required this.hint,
    required this.actions,
    required this.inputController
  });

  final ColorScheme theme;

  final String hint;

  final List<Widget> actions;

  final TextEditingController inputController;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      elevation: WidgetStatePropertyAll(4),
      backgroundColor: WidgetStatePropertyAll(theme.onPrimary),
      shadowColor: WidgetStatePropertyAll(theme.primary.withAlpha(60)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      leading: Icon(Icons.search, color: theme.primary),
      hintText: hint,
      trailing: actions.map((Widget widget) => widget).toList(),
      controller: inputController,
      onSubmitted: (query) {
        debugPrint('Buscar...');
      },
    );
  }
}
