//contrato

import 'package:project/src/domain/entities/movie_entity.dart';

abstract class GetAllTrandingMoviesUsecase {
  Future<List<MovieEntity>> getAllTrandingMovies(String timeWindow);
}
