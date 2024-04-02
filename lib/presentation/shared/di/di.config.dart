// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:it_real_app/data/repo/auth/auth_data_source.dart' as _i7;
import 'package:it_real_app/data/repo/auth/auth_repo.dart' as _i8;
import 'package:it_real_app/presentation/feature/app/bloc/app_bloc.dart' as _i9;
import 'package:it_real_app/presentation/feature/auth/bloc/auth_bloc.dart'
    as _i10;
import 'package:it_real_app/presentation/feature/home/bloc/home_bloc.dart'
    as _i3;
import 'package:it_real_app/presentation/feature/onboarding/bloc/onboarding_bloc.dart'
    as _i4;
import 'package:it_real_app/presentation/feature/settings/bloc/settings_bloc.dart'
    as _i11;
import 'package:it_real_app/presentation/feature/sign_in/bloc/sign_in_bloc.dart'
    as _i12;
import 'package:it_real_app/presentation/feature/sign_up/bloc/sign_up_bloc.dart'
    as _i13;
import 'package:it_real_app/presentation/feature/tokens/bloc/tokens_bloc.dart'
    as _i14;
import 'package:it_real_app/presentation/shared/di/modules/data_module.dart'
    as _i15;
import 'package:supabase_flutter/supabase_flutter.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dataModule = _$DataModule();
    gh.factory<_i3.HomeBloc>(() => _i3.HomeBloc());
    gh.factory<_i4.OnboardingBloc>(() => _i4.OnboardingBloc());
    gh.singleton<_i5.FlutterSecureStorage>(() => dataModule.secureStorage);
    gh.singleton<_i6.SupabaseClient>(() => dataModule.supabase);
    gh.singleton<_i7.AuthDataSource>(
        () => _i8.AuthRepo(supabaseClient: gh<_i6.SupabaseClient>()));
    gh.factory<_i9.AppBloc>(
        () => _i9.AppBloc(authDataSource: gh<_i7.AuthDataSource>()));
    gh.factory<_i10.AuthBloc>(
        () => _i10.AuthBloc(authDataSource: gh<_i7.AuthDataSource>()));
    gh.factory<_i11.SettingsBloc>(
        () => _i11.SettingsBloc(authDataSource: gh<_i7.AuthDataSource>()));
    gh.factory<_i12.SignInBloc>(
        () => _i12.SignInBloc(authDataSource: gh<_i7.AuthDataSource>()));
    gh.factory<_i13.SignUpBloc>(
        () => _i13.SignUpBloc(authDataSource: gh<_i7.AuthDataSource>()));
    gh.factory<_i14.TokensBloc>(
        () => _i14.TokensBloc(authDataSource: gh<_i7.AuthDataSource>()));
    return this;
  }
}

class _$DataModule extends _i15.DataModule {}
