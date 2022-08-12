import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project/src/presentation/riverpod/movies/movies_provider.dart';

class DrowerMovies extends HookConsumerWidget {
  const DrowerMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 33, 33, 33),
            ),
            child: Text(
              'M',
              style: TextStyle(color: Colors.white, fontSize: 100),
            ),
          ),
          ListTile(
            title: const Text('Filmes diários'),
            onTap: () {
              ref
                  .read(moviesNotifierProvider.notifier)
                  .getAllTrandingMovies('day');
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Filmes semainais'),
            onTap: () {
              ref
                  .read(moviesNotifierProvider.notifier)
                  .getAllTrandingMovies('week');
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
