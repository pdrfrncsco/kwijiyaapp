import 'package:fpdart/fpdart.dart';
import '../../data/datasources/ranking_remote_data_source.dart';
import '../../domain/entities/ranking_entry.dart';
import '../../domain/repositories/ranking_repository.dart';

class RankingRepositoryImpl implements RankingRepository {
  final RankingRemoteDataSource _remoteDataSource;

  RankingRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Exception, List<RankingEntry>>> getGlobalRanking() async {
    try {
      final rankings = await _remoteDataSource.getGlobalRanking();
      return Right(rankings);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, List<RankingEntry>>> getWeeklyRanking() async {
    try {
      final rankings = await _remoteDataSource.getWeeklyRanking();
      return Right(rankings);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
