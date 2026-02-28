// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$languageRemoteDataSourceHash() =>
    r'19eb00186452e170bf7c372dcd33030dcbad12c8';

/// See also [languageRemoteDataSource].
@ProviderFor(languageRemoteDataSource)
final languageRemoteDataSourceProvider =
    AutoDisposeProvider<LanguageRemoteDataSource>.internal(
      languageRemoteDataSource,
      name: r'languageRemoteDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$languageRemoteDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LanguageRemoteDataSourceRef =
    AutoDisposeProviderRef<LanguageRemoteDataSource>;
String _$languageRepositoryHash() =>
    r'41a4c8965f8f271ac8e471227b62056c37cba840';

/// See also [languageRepository].
@ProviderFor(languageRepository)
final languageRepositoryProvider =
    AutoDisposeProvider<LanguageRepository>.internal(
      languageRepository,
      name: r'languageRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$languageRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LanguageRepositoryRef = AutoDisposeProviderRef<LanguageRepository>;
String _$languagesHash() => r'f10ac2f13093ef9899dcc3d16daee8d48a1fa764';

/// See also [languages].
@ProviderFor(languages)
final languagesProvider = AutoDisposeFutureProvider<List<Language>>.internal(
  languages,
  name: r'languagesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$languagesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LanguagesRef = AutoDisposeFutureProviderRef<List<Language>>;
String _$selectedLanguageHash() => r'e2dc2f1f33b6c4e018828780da7dc1448b155839';

/// See also [SelectedLanguage].
@ProviderFor(SelectedLanguage)
final selectedLanguageProvider =
    NotifierProvider<SelectedLanguage, Language?>.internal(
      SelectedLanguage.new,
      name: r'selectedLanguageProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$selectedLanguageHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SelectedLanguage = Notifier<Language?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
