import 'package:flutter/material.dart';

class TotalesCard extends StatelessWidget {
  const TotalesCard({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;

    return Card(
      color: theme.primary,
      elevation: 4,
      shadowColor: theme.primary.withAlpha(60),
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Totales',
              style: TextStyle(
                fontSize: 18,
                color: theme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text(
                      'Total: ',
                      style: TextStyle(
                        color: theme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('0', style: TextStyle(color: theme.onPrimary)),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Cant. Aux: ',
                      style: TextStyle(
                        color: theme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('0', style: TextStyle(color: theme.onPrimary)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
