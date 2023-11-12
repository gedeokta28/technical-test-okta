import 'package:flutter/material.dart';
import 'package:technical_test_okta/core/presentation/widgets/custom_app_bar.dart';
import 'package:technical_test_okta/core/static/colors.dart';
import 'package:provider/provider.dart';
import 'package:technical_test_okta/core/utils/helper.dart';
import 'package:technical_test_okta/features/detail/presentation/pages/detail_page.dart';
import 'package:technical_test_okta/features/favorite/presentation/provider/favorite_movie_state.dart';
import 'package:technical_test_okta/features/favorite/presentation/provider/favorite_provider.dart';
import 'package:technical_test_okta/features/home/presentation/widget/card_movie.dart';

class FavoriteMoviePage extends StatefulWidget {
  static const routeName = '/favorite';
  const FavoriteMoviePage({Key? key}) : super(key: key);

  @override
  State<FavoriteMoviePage> createState() => _FavoriteMoviePageState();
}

class _FavoriteMoviePageState extends State<FavoriteMoviePage> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteProvider>().fetchDataFavoriteMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          backgroundColor: primaryColor,
          centerTitle: false,
          title: 'Favorite Movie',
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
                    mediumVerticalSpacing(),
                    Consumer<FavoriteProvider>(builder: (context, provider, _) {
                      if (provider.state is FavoriteMovieLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (provider.state is FavoriteMovieLoaded) {
                        final data = provider.favoriteMovieData;
                        if (data.isNotEmpty) {
                          return GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemCount: data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return CardMovie(
                                    onPress: () {
                                      Navigator.pushNamed(
                                          context, DetailPage.routeName,
                                          arguments: data[index].id);
                                    },
                                    title: data[index].title,
                                    logo: data[index].posterPath);
                              });
                        }
                        return const Center(
                          child: Text(
                            'There is no favorite movie yet',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }

                      return const SizedBox.shrink();
                    }),
                  ]))),
        ));
  }
}
