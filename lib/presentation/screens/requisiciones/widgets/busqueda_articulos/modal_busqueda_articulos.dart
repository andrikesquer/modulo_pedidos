import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:requisiciones/presentation/screens/requisiciones/widgets/busqueda_articulos/widgets/busqueda_articulos_action_buttons.dart';
import 'package:requisiciones/presentation/widgets/custom_text_field.dart';

class ModalBusquedaArticulos extends StatefulWidget {
  const ModalBusquedaArticulos({super.key, required this.theme});

  final ColorScheme theme;

  @override
  State<ModalBusquedaArticulos> createState() => _ModalBusquedaArticulosState();
}

class _ModalBusquedaArticulosState extends State<ModalBusquedaArticulos> {
  late bool _mostrarInactivos;

  late bool _precioConIVA;

  late ColorScheme _theme;

  @override
  void initState() {
    super.initState();
    _mostrarInactivos = false;
    _precioConIVA = false;
    _theme = widget.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _theme.onPrimary,
      appBar: AppBar(
        backgroundColor: _theme.primary,
        automaticallyImplyLeading: false,
        title: Text(
          'Búsqueda de Artículos',
          style: TextStyle(color: _theme.onPrimary),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          spacing: 10,
          children: [
            // Filtros
            Container(
              padding: EdgeInsets.only(left: 15),
              color: _theme.primary.withAlpha(80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.filter_list, color: _theme.primary),
                  Row(
                    spacing: 0,
                    children: [
                      Checkbox(
                        checkColor: _theme.primary,
                        fillColor: WidgetStatePropertyAll(Colors.transparent),
                        value: _mostrarInactivos,
                        onChanged: (bool? value) {
                          setState(() {
                            _mostrarInactivos = value!;
                          });
                        },
                      ),
                      Text('Mostrar inactivos'),
                    ],
                  ),
                  Row(
                    spacing: 0,
                    children: [
                      Checkbox(
                        checkColor: _theme.primary,
                        fillColor: WidgetStatePropertyAll(Colors.transparent),
                        value: _precioConIVA,
                        onChanged: (bool? value) {
                          setState(() {
                            _precioConIVA = value!;
                          });
                        },
                      ),
                      Text('Precio C/IVA'),
                    ],
                  ),
                ],
              ),
            ),
            // Campos
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                spacing: 10,
                children: [
                  // Código - Nombre
                  CustomTextField(
                    theme: _theme,
                    textInputType: TextInputType.number,
                    textInputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    content: 'Código int.',
                  ),
                  CustomTextField(
                    theme: _theme,
                    textInputType: TextInputType.text,
                    content: 'Nombre',
                  ),
                  Divider(color: _theme.primary.withAlpha(60)),
                  // Marca - Familia
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: CustomTextField(
                          theme: _theme,
                          textInputType: TextInputType.text,
                          content: 'Marca',
                        ),
                      ),
                      Expanded(
                        child: CustomTextField(
                          theme: _theme,
                          textInputType: TextInputType.text,
                          content: 'Familia',
                        ),
                      ),
                    ],
                  ),
                  // Categoría - Tipo artículo
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: CustomTextField(
                          theme: _theme,
                          textInputType: TextInputType.text,
                          content: 'Categoría',
                        ),
                      ),
                      Expanded(
                        child: CustomTextField(
                          theme: _theme,
                          textInputType: TextInputType.text,
                          content: 'Tipo artículo',
                        ),
                      ),
                    ],
                  ),
                  Divider(color: _theme.primary.withAlpha(60)),
                  // No. parte - Código barras
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: CustomTextField(
                          theme: _theme,
                          textInputType: TextInputType.number,
                          textInputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          content: 'No. Parte',
                        ),
                      ),
                      Expanded(
                        child: CustomTextField(
                          theme: _theme,
                          textInputType: TextInputType.number,
                          textInputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          content: 'Código Barras',
                        ),
                      ),
                    ],
                  ),
                  // Presentación - Código anterior
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: CustomTextField(
                          theme: _theme,
                          textInputType: TextInputType.text,
                          content: 'Presentación',
                        ),
                      ),
                      Expanded(
                        child: CustomTextField(
                          theme: _theme,
                          textInputType: TextInputType.number,
                          textInputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          content: 'Código anterior',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: BusquedaArticulosActionButtons(theme: _theme),
      ),
    );
  }
}
