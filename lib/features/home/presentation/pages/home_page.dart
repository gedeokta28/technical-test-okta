import 'package:flutter/material.dart';
import 'package:technical_test_okta/core/utils/helper.dart';
import 'package:technical_test_okta/features/home/presentation/pages/banner_slider.dart';
import 'package:technical_test_okta/features/home/presentation/widget/card_movie.dart';

import '../../../../core/presentation/widgets/custom_app_bar.dart';
import '../../../../core/static/colors.dart';
import '../../../../core/utils/app_settings.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        backgroundColor: primaryColor,
        centerTitle: false,
        title: 'Movie',
        titleColor: whiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BannerSlider(),
                mediumVerticalSpacing(),
                TextField(
                  key: const Key('enterMovieQuery'),
                  onChanged: (query) {},
                  decoration: InputDecoration(
                    hintText: 'Search movies',
                    prefixIcon: const Icon(
                      Icons.search,
                      color: primaryColor,
                    ),
                    contentPadding: const EdgeInsets.all(8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: primaryColor),
                    ),
                  ),
                  textInputAction: TextInputAction.search,
                  cursorColor: primaryColor,
                ),
                mediumVerticalSpacing(),
                const Text(
                  'Genre',
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                ),
                smallVerticalSpacing(),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.only(
                            right: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25)),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context)
                                    .focusColor
                                    .withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 20.0,
                                  right: 20.0,
                                  bottom: 5.0,
                                  top: 5.0),
                              child: Text(
                                'category',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                mediumVerticalSpacing(),
                const Text(
                  'Popular',
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                ),
                smallVerticalSpacing(),
                GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: home_items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CardMovie(
                          onPress: () {},
                          title: home_items[index].title,
                          rating: home_items[index].ratings,
                          logo: home_items[index].logo_path);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
