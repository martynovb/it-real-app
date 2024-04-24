import 'package:easy_localization/easy_localization.dart';
import 'package:it_real_app/presentation/shared/localization/locale_keys.g.dart';

abstract class BaseException implements Exception {
  final String? title;
  final String? message;

  BaseException({
    this.title,
    this.message,
  });

  @override
  String toString() {
    return 'Exception(title: $title, message: $message)';
  }
}

class UnknownException extends BaseException {
  UnknownException()
      : super(
          title: LocaleKeys.somethingWentWrong.tr(),
        );
}

class NetworkException extends BaseException {
  NetworkException()
      : super(
          title: LocaleKeys.networkError.tr(),
          message: LocaleKeys.somethingWentWrong.tr(),
        );
}

class ServerException extends BaseException {
  ServerException()
      : super(
          title: LocaleKeys.serverError.tr(),
          message: LocaleKeys.somethingWentWrong.tr(),
        );
}


BaseException handleException(dynamic error) {
  return UnknownException();
}
