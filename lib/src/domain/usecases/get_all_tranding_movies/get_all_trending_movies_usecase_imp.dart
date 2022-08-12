import 'package:project/src/domain/repositories/get_all_trending_movies_repository.dart';

import '../../entities/movie_entity.dart';
import 'get_all_tranding_movies_usecase.dart';

class GetAllTrendingMoviesUsecaseImp implements GetAllTrandingMoviesUsecase {
  final GetAllTrendingMoviesRepository _repository;

  GetAllTrendingMoviesUsecaseImp(this._repository);

  @override
  Future<List<MovieEntity>> getAllTrandingMovies(String timeWindow) async {
    //chamada do repository
    return await _repository.getAllTrandingMovies(timeWindow);
  }
}
