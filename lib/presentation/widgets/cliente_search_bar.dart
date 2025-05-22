import 'package:flutter/material.dart';
import 'package:requisiciones/presentation/widgets/custom_search_bar.dart';

class ClienteSearchBar extends StatelessWidget {
  const ClienteSearchBar({
    super.key,
    required this.theme,
    required this.searchBarActions,
    required this.inputController,
  });

  final ColorScheme theme;
  final List<Widget> searchBarActions;
  final TextEditingController inputController;

  @override
  Widget build(BuildContext context) {
    return CustomSearchBar(
      theme: theme,
      hint: 'Cliente',
      actions: searchBarActions,
      inputController: inputController,
    );
  }
}
