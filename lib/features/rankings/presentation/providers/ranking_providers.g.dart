// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$rankingRemoteDataSourceHash() =>
    r'9e7bae68267c534eee7e7d7d90b0221aa15caa57';

/// See also [rankingRemoteDataSource].
@ProviderFor(rankingRemoteDataSource)
final rankingRemoteDataSourceProvider =
    AutoDisposeProvider<RankingRemoteDataSource>.internal(
      rankingRemoteDataSource,
      name: r'rankingRemoteDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$rankingRemoteDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RankingRemoteDataSourceRef =
    AutoDisposeProviderRef<RankingRemoteDataSource>;
String _$rankingRepositoryHash() => r'49e2c0a6a1fde180af43b1aefcdd31107ecbbabf';

/// See also [rankingRepository].
@ProviderFor(rankingRepository)
final rankingRepositoryProvider =
    AutoDisposeProvider<RankingRepository>.internal(
      rankingRepository,
      name: r'rankingRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$rankingRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RankingRepositoryRef = AutoDisposeProviderRef<RankingRepository>;
String _$globalRankingHash() => r'9de6847a385c6a3b562ab2f00f7d47004fe63971';

/// See also [globalRanking].
@ProviderFor(globalRanking)
final globalRankingProvider =
    AutoDisposeFutureProvider<List<RankingEntry>>.internal(
      globalRanking,
      name: r'globalRankingProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$globalRankingHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GlobalRankingRef = AutoDisposeFutureProviderRef<List<RankingEntry>>;
String _$weeklyRankingHash() => r'040596570386af648de798d713d51d22ca2cfa64';

/// See also [weeklyRanking].
@ProviderFor(weeklyRanking)
final weeklyRankingProvider =
    AutoDisposeFutureProvider<List<RankingEntry>>.internal(
      weeklyRanking,
      name: r'weeklyRankingProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$weeklyRankingHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WeeklyRankingRef = AutoDisposeFutureProviderRef<List<RankingEntry>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
