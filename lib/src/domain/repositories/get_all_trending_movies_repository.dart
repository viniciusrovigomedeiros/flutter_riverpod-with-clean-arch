//contrato do repositório
import 'package:project/src/domain/entities/movie_entity.dart';

abstract class GetAllTrendingMoviesRepository {
  Future<List<MovieEntity>> getAllTrandingMovies(String timeWindow);
}
