import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_test_okta/core/utils/helper.dart';
import 'package:technical_test_okta/features/detail/presentation/provider/detail_movie_provider.dart';
import 'package:technical_test_okta/features/detail/presentation/provider/detail_movie_state.dart';

class DetailPage extends StatefulWidget {
  static const routeName = '/movie-detail';

  final int id;
  const DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<DetailMovieProvider>().fetchGenreMovie(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DetailMovieProvider>(builder: (context, provider, child) {
        if (provider.detailMovieState is DetailMovieLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (provider.detailMovieState is DetailMovieLoaded) {
          final data = provider.detailMovieData;
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 250.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: FadeIn(
                    duration: const Duration(milliseconds: 500),
                    child: ShaderMask(
                      shaderCallback: (rect) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black,
                            Colors.black,
                            Colors.transparent,
                          ],
                          stops: [0.0, 0.5, 1.0, 1.0],
                        ).createShader(
                          Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                        );
                      },
                      blendMode: BlendMode.dstIn,
                      child: CachedNetworkImage(
                        width: MediaQuery.of(context).size.width,
                        imageUrl: mergeImageUrl(data.backdropPath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: FadeInUp(
                  from: 20,
                  duration: const Duration(milliseconds: 500),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 2.0,
                                horizontal: 8.0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Text(
                                data.releaseDate.split('-')[0],
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20.0,
                                ),
                                const SizedBox(width: 4.0),
                                Text(
                                  (data.voteAverage / 2).toStringAsFixed(1),
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                const SizedBox(width: 4.0),
                                Text(
                                  '(${data.voteAverage})',
                                  style: const TextStyle(
                                    fontSize: 1.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 16.0),
                            Text(
                              showDuration(data.runtime),
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () async {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.add, color: Colors.black),
                              SizedBox(width: 16.0),
                              Text(
                                'Add to Favorite',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            minimumSize: Size(
                              MediaQuery.of(context).size.width,
                              42.0,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          data.overview,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Genres: ${showGenres(data.genre)}',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      }),
    );
  }
}
