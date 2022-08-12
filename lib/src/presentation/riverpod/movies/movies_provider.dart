import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project/src/data/datasources/remote/get_all_tranding_movies_remote_datasource_imp.dart';
import 'package:project/src/data/repositories/get_all_tranding_movies_repository_imp.dart';
import 'package:project/src/domain/entities/movie_entity.dart';

import '../../../domain/usecases/get_all_tranding_movies/get_all_trending_movies_usecase_imp.dart';
import 'movies_notifier.dart';

final dioProvider = Provider((ref) => Dio());

final moviesDatasourceProvider = Provider((ref) {
  return GetAllTrandingMoviesRemoteDatasourceImp(ref.watch(dioProvider));
});

final moviesRepositoryProvider = Provider((ref) {
  return GetAllTrandingMoviesRepositoryImp(ref.watch(moviesDatasourceProvider));
});

final moviesUseCaseProvider = Provider((ref) {
  return GetAllTrendingMoviesUsecaseImp(ref.watch(moviesRepositoryProvider));
});

final moviesNotifierProvider =
    StateNotifierProvider<MoviesNotifier, List<MovieEntity>>((ref) {
  return MoviesNotifier(ref.watch(moviesUseCaseProvider));
});
