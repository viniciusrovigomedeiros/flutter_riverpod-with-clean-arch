import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project/src/domain/entities/movie_entity.dart';

import '../../../domain/usecases/get_all_tranding_movies/get_all_tranding_movies_usecase.dart';

class MoviesNotifier extends StateNotifier<List<MovieEntity>> {
  GetAllTrandingMoviesUsecase _usecase;

  MoviesNotifier(this._usecase) : super([]) {
    getAllTrandingMovies('day');
  }

  Future<void> getAllTrandingMovies(String timeWindow) async {
    state = [];
    state = await _usecase.getAllTrandingMovies(timeWindow);
  }
}
