import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class CustomCards extends StatelessWidget {
  CustomCards({
    Key? key,
    required this.number,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.color,
  }) : super(key: key);
  String title;
  int number;
  Function onTap;
  Color color;
  Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      child: Badge(
        badgeColor: Colors.white,
        position: BadgePosition.topEnd(end: 6),
        padding: const EdgeInsets.all(8),
        badgeContent: Text('$number'),
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          elevation: 0,
          color: color,
          child: Center(
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.all(10),
                child: icon,
              ),
              subtitle: Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              onTap: () => onTap(),
            ),
          ),
        ),
      ),
    );
  }
}
