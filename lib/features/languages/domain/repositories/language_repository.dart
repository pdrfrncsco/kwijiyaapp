import 'package:fpdart/fpdart.dart';
import '../entities/language.dart';

abstract class LanguageRepository {
  Future<Either<Exception, List<Language>>> getLanguages();
}
