import 'package:flutter/material.dart';

import '../../../../../domain/entities/movie_entity.dart';
import '../../../../../shared/utils/format_date.dart';

class CardMovie extends StatelessWidget {
  const CardMovie({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final List<MovieEntity> movies;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 450,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: <Widget>[
                      Card(
                        elevation: 0,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Column(
                          children: <Widget>[
                            Image.network(
                              "https://image.tmdb.org/t/p/w500/${movies[index].posterPath}",
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  movies[index].title,
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  formatDate(movies[index].releaseDate),
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 280,
                    left: 25,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.black,
                          child: CircularProgressIndicator(
                            color: Colors.green,
                            // value: movies[index].popularity,
                            value: (movies[index].voteAverage / 10),
                            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (movies[index].voteAverage * 10)
                                  .toStringAsFixed(0),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            const Text(
                              '%',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
