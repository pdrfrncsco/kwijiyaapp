import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/providers/core_providers.dart';
import '../../data/datasources/ranking_remote_data_source.dart';
import '../../data/repositories/ranking_repository_impl.dart';
import '../../domain/entities/ranking_entry.dart';
import '../../domain/repositories/ranking_repository.dart';

part 'ranking_providers.g.dart';

@riverpod
RankingRemoteDataSource rankingRemoteDataSource(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return RankingRemoteDataSource(apiClient);
}

@riverpod
RankingRepository rankingRepository(Ref ref) {
  final remoteDataSource = ref.watch(rankingRemoteDataSourceProvider);
  return RankingRepositoryImpl(remoteDataSource);
}

@riverpod
Future<List<RankingEntry>> globalRanking(Ref ref) async {
  final repository = ref.watch(rankingRepositoryProvider);
  final result = await repository.getGlobalRanking();
  return result.fold(
    (l) => throw l,
    (r) => r,
  );
}

@riverpod
Future<List<RankingEntry>> weeklyRanking(Ref ref) async {
  final repository = ref.watch(rankingRepositoryProvider);
  final result = await repository.getWeeklyRanking();
  return result.fold(
    (l) => throw l,
    (r) => r,
  );
}
