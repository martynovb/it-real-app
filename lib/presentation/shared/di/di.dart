import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:it_real_app/presentation/shared/di/di.config.dart';

const development = Environment('development');
const production = Environment('production');

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies({
  required Environment environment,
}) =>
    getIt.init(
      environment: environment.name,
    );
