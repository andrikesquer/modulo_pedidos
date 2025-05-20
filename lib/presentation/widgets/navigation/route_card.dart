import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteCard extends StatelessWidget {
  const RouteCard({
    super.key,
    required this.location,
    required this.icon,
    required this.routeName,
  });

  final String location;

  final IconData icon;

  final String routeName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go(location);
      },
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 10,
              children: [
                Icon(icon, color: Colors.grey.shade600),
                Text(routeName, style: TextStyle(fontSize: 20)),
              ],
            ),
            Icon(Icons.arrow_right, color: Colors.grey.shade600),
          ],
        ),
      ),
    );
  }
}
