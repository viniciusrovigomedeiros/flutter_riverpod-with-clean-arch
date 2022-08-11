import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project/src/domain/usecases/get_all_tranding_movies/get_all_tranding_movies_usecase.dart';
import 'package:project/src/presentation/riverpod/movies/movies_notifier.dart';

final dioProvider = Provider((ref) => Dio());

// final moviesUseCaseProvider = Provider((ref) {
//   return GetAllTrandingMoviesUsecase();
// });

// final MoviesNotifierProvider = StateNotifierProvider((ref) {
//   return MoviesNotifier(_usecase);
// });
