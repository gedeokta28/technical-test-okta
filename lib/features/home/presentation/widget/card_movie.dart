import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:technical_test_okta/core/utils/helper.dart';

class CardMovie extends StatelessWidget {
  final String title;
  final String logo;
  final Function() onPress;

  const CardMovie({
    Key? key,
    required this.title,
    required this.logo,
    required this.onPress,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
      child: GestureDetector(
        onTap: onPress,
        child: CachedNetworkImage(
          imageUrl: mergeImageUrl(logo),
          imageBuilder: (context, imageProvider) => Container(
            width: double.infinity,
            height: 500,
            decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
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
          placeholder: (context, url) => Image.asset('assets/placeholder.png'),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
