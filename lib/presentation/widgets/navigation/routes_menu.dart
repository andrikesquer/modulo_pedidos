import 'package:flutter/material.dart';
import 'package:requisiciones/presentation/widgets/navigation/route_card.dart';

class RoutesMenu extends StatelessWidget {
  const RoutesMenu({
    super.key,
    required this.theme,
    required this.menuIcon,
    required this.menuTitle,
    required this.routeCards,
  });

  final ColorScheme theme;

  final IconData menuIcon;

  final String menuTitle;

  final List<RouteCard> routeCards;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        border: Border.all(color: theme.primary.withAlpha(80)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: theme.primary,
              borderRadius: BorderRadius.vertical(top: Radius.circular(6)),
            ),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                spacing: 10,
                children: [
                  Icon(menuIcon, color: theme.onPrimary, size: 30),
                  Text(
                    menuTitle,
                    style: TextStyle(
                      color: theme.onPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children:
                routeCards.map((RouteCard routeCard) => routeCard).toList(),
          ),
        ],
      ),
    );
  }
}
