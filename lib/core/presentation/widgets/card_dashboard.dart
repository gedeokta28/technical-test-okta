import 'package:flutter/material.dart';
import 'package:technical_test_okta/core/static/colors.dart';

class CardDashboard extends StatelessWidget {
  final Function() onPress;
  final Widget cardIcon;
  final String cardTitle;

  const CardDashboard({
    Key? key,
    required this.onPress,
    required this.cardIcon,
    required this.cardTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {},
        splashColor: primaryColor,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              cardIcon,
              Text(cardTitle, style: const TextStyle(fontSize: 17.0)),
            ],
          ),
        ),
      ),
    );
  }
}
