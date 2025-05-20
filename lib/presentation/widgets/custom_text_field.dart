import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.theme,
    this.showPrefixIcon = false,
    this.textInputType = TextInputType.text,
    required this.textEditingController,
    this.textInputFormatters = const [],
    this.content = '',
  });

  final ColorScheme theme;

  final bool showPrefixIcon;

  final TextInputType textInputType;

  final TextEditingController textEditingController;

  final List<TextInputFormatter> textInputFormatters;
  // For numbers: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))]

  final String content;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final ColorScheme _theme;

  late final bool _showPrefixIcon;

  late final TextInputType _textInputType;

  late final TextEditingController _textEditingController;

  late final List<TextInputFormatter> _textInputFormatters;

  late final String _content;

  @override
  void initState() {
    _theme = widget.theme;
    _showPrefixIcon = widget.showPrefixIcon;
    _textInputType = widget.textInputType;
    _textEditingController = widget.textEditingController;
    _textInputFormatters = widget.textInputFormatters;
    _content = widget.content;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: _textInputType,
      controller: _textEditingController,
      inputFormatters: _textInputFormatters,
      onChanged: (text) {
        setState(() {});
      },
      decoration: InputDecoration(
        labelText: _content,
        border: OutlineInputBorder(),
        prefixIcon: _showPrefixIcon ? Icon(Icons.search) : null,
        hintText: _content,
        suffixIcon:
            _textEditingController.text.isEmpty
                ? null
                : IconButton(
                  onPressed: () {
                    setState(() {
                      _textEditingController.clear();
                    });
                  },
                  icon: Icon(Icons.cleaning_services, size: 20),
                ),
        iconColor: _theme.primary,
      ),
    );
  }
}
