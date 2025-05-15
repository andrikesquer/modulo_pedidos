import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:requisiciones/data/models/route_card_model.dart';

class RouteCardWidget extends StatelessWidget {
  const RouteCardWidget({super.key, required this.routeCardModel});

  final RouteCardModel routeCardModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go(routeCardModel.location);
      },
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 10,
              children: [
                Icon(routeCardModel.icon, color: Colors.grey.shade600),
                Text(routeCardModel.routeName, style: TextStyle(fontSize: 20)),
              ],
            ),
            Icon(Icons.arrow_right, color: Colors.grey.shade600),
          ],
        ),
      ),
    );
  }
}
