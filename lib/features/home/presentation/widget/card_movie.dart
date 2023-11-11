import 'package:flutter/material.dart';
import 'package:technical_test_okta/core/utils/app_settings.dart';

class CardMovie extends StatelessWidget {
  final String title;
  final String rating;
  final String logo;
  final Function() onPress;

  const CardMovie({
    Key? key,
    required this.title,
    required this.rating,
    required this.logo,
    required this.onPress,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          width: double.infinity,
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  '$baseUrlImage$logo',
                ),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(8),
                color: Colors.black.withOpacity(0.5),
                child: Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
