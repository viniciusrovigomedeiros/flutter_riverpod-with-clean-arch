import 'package:project/src/data/datasources/get_all_trending_movies_datasource.dart';

import '../../domain/entities/movie_entity.dart';
import '../../domain/repositories/get_all_trending_movies_repository.dart';

class GetAllTrandingMoviesRepositoryImp
    implements GetAllTrendingMoviesRepository {
  final GetAllTrendingMoviesDatasource _datasource;
  GetAllTrandingMoviesRepositoryImp(this._datasource);

  @override
  Future<List<MovieEntity>> getAllTrandingMovies(String timeWindow) async {
    return await _datasource.getAllTrendingMovies(timeWindow);
  }
}
