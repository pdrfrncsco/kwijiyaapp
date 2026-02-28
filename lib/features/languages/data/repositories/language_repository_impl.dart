import 'package:fpdart/fpdart.dart';
import '../../data/datasources/language_remote_data_source.dart';
import '../../domain/entities/language.dart';
import '../../domain/repositories/language_repository.dart';

class LanguageRepositoryImpl implements LanguageRepository {
  final LanguageRemoteDataSource _remoteDataSource;

  LanguageRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Exception, List<Language>>> getLanguages() async {
    try {
      final languages = await _remoteDataSource.getLanguages();
      return Right(languages);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
