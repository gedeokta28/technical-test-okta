import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerGenre extends StatelessWidget {
  const ShimmerGenre({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                  ),
                  width: 100,
                ),
              ),
            );
          },
        ));
  }
}
