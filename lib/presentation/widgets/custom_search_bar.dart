import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.theme,
    this.textInputType = TextInputType.text,
    this.textInputFormatters = const [],
    required this.hint,
    required this.actions,
    required this.inputController,
  });

  final ColorScheme theme;

  final TextInputType textInputType;

  final List<TextInputFormatter> textInputFormatters;

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
      keyboardType: textInputType,
      hintText: hint,
      trailing: actions.map((Widget widget) => widget).toList(),
      controller: inputController,
      onSubmitted: (query) {
        debugPrint('Buscar...');
      },
    );
  }
}
