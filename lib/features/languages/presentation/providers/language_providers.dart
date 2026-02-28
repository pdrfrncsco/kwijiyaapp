import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/providers/core_providers.dart';
import '../../data/datasources/language_remote_data_source.dart';
import '../../data/repositories/language_repository_impl.dart';
import '../../domain/entities/language.dart';
import '../../domain/repositories/language_repository.dart';

part 'language_providers.g.dart';

@riverpod
LanguageRemoteDataSource languageRemoteDataSource(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return LanguageRemoteDataSource(apiClient);
}

@riverpod
LanguageRepository languageRepository(Ref ref) {
  final remoteDataSource = ref.watch(languageRemoteDataSourceProvider);
  return LanguageRepositoryImpl(remoteDataSource);
}

@riverpod
Future<List<Language>> languages(Ref ref) async {
  final repository = ref.watch(languageRepositoryProvider);
  final result = await repository.getLanguages();
  return result.fold(
    (l) => throw l,
    (r) => r,
  );
}

// Store selected language
@Riverpod(keepAlive: true)
class SelectedLanguage extends _$SelectedLanguage {
  @override
  Language? build() => null;

  void select(Language language) {
    state = language;
  }
}
