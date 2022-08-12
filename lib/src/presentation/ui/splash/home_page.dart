import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project/src/shared/utils/format_date.dart';

import '../../riverpod/movies/movies_provider.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(moviesNotifierProvider);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 33, 33),
        title: const Text('Movies'),
      ),
      body: Visibility(
        visible: movies.isNotEmpty,
        replacement: const CircularProgressIndicator(),
        child: GridView.builder(
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
                                    "https://image.tmdb.org/t/p/w500/${movies[index].posterPath}"),
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
                        top: 262,
                        left: 32,
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.black,
                          child: CircularProgressIndicator(
                            color: Colors.green,
                            // value: movies[index].popularity,
                            value: (movies[index].popularity / 10000),
                            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 271,
                        left: 41,
                        child: Text(
                          (movies[index].popularity / 100).toStringAsFixed(0),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
