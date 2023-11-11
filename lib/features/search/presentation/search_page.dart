import 'package:flutter/material.dart';
import 'package:technical_test_okta/core/presentation/widgets/custom_app_bar.dart';
import 'package:technical_test_okta/core/static/colors.dart';
import 'package:provider/provider.dart';
import 'package:technical_test_okta/core/utils/helper.dart';
import 'package:technical_test_okta/features/home/presentation/widget/card_movie.dart';
import 'package:technical_test_okta/features/search/presentation/provider/search_provider.dart';

class SearchPageArgumnets {
  final String textSearch;

  SearchPageArgumnets({required this.textSearch});
}

class SearchPage extends StatefulWidget {
  static const routeName = '/search';
  final String textSearch;
  const SearchPage({Key? key, required this.textSearch}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
    context.read<SearchProvider>().findMovieFromDB(widget.textSearch);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          backgroundColor: primaryColor,
          centerTitle: false,
          title: 'Result',
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
                    Text(
                      'Search result : ${widget.textSearch}',
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    mediumVerticalSpacing(),
                    Consumer<SearchProvider>(builder: (context, provider, _) {
                      if (provider.resultMovie.isNotEmpty) {
                        return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemCount: provider.resultMovie.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CardMovie(
                                  onPress: () {},
                                  title: provider.resultMovie[index].title,
                                  logo: provider.resultMovie[index].posterPath);
                            });
                      }
                      return const Center(
                        child: Text(
                          'No Data Found',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }),
                  ]))),
        ));
  }
}
