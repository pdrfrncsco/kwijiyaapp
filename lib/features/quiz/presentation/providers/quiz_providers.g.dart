// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$quizRemoteDataSourceHash() =>
    r'6556995f22c55c7c57a985586e7260b5f0f511b1';

/// See also [quizRemoteDataSource].
@ProviderFor(quizRemoteDataSource)
final quizRemoteDataSourceProvider =
    AutoDisposeProvider<QuizRemoteDataSource>.internal(
      quizRemoteDataSource,
      name: r'quizRemoteDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$quizRemoteDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef QuizRemoteDataSourceRef = AutoDisposeProviderRef<QuizRemoteDataSource>;
String _$quizRepositoryHash() => r'4df8e806624e9a39b0b9e0e3617999ae47439e40';

/// See also [quizRepository].
@ProviderFor(quizRepository)
final quizRepositoryProvider = AutoDisposeProvider<QuizRepository>.internal(
  quizRepository,
  name: r'quizRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$quizRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef QuizRepositoryRef = AutoDisposeProviderRef<QuizRepository>;
String _$quizControllerHash() => r'7ab2ec9b1c3b7ebd470362e555bd7267ad505723';

/// See also [QuizController].
@ProviderFor(QuizController)
final quizControllerProvider =
    AutoDisposeNotifierProvider<QuizController, QuizState>.internal(
      QuizController.new,
      name: r'quizControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$quizControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$QuizController = AutoDisposeNotifier<QuizState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
