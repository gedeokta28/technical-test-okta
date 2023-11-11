import 'package:flutter/material.dart';
import 'package:technical_test_okta/core/utils/helper.dart';
import 'package:technical_test_okta/features/home/presentation/pages/banner_slider.dart';
import 'package:technical_test_okta/features/home/presentation/provider/home_provider.dart';
import 'package:technical_test_okta/features/home/presentation/widget/card_movie.dart';

import '../../../../core/presentation/widgets/custom_app_bar.dart';
import '../../../../core/static/colors.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().fetchPopularMovieFromDB();
  }

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
                  'Popular Movie',
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                ),
                smallVerticalSpacing(),
                Consumer<HomeProvider>(builder: (context, provider, _) {
                  if (provider.popularMovieData.isNotEmpty) {
                    return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: provider.popularMovieData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CardMovie(
                              onPress: () {},
                              title: provider.popularMovieData[index].title,
                              logo:
                                  provider.popularMovieData[index].posterPath);
                        });
                  }
                  return const SizedBox();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
