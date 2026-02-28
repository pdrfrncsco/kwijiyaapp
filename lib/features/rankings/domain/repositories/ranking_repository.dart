import 'package:fpdart/fpdart.dart';
import '../entities/ranking_entry.dart';

abstract class RankingRepository {
  Future<Either<Exception, List<RankingEntry>>> getGlobalRanking();
  Future<Either<Exception, List<RankingEntry>>> getWeeklyRanking();
}
