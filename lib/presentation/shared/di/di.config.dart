// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:it_real_app/data/repo/auth/auth_data_source.dart' as _i12;
import 'package:it_real_app/data/repo/auth/auth_repo.dart' as _i13;
import 'package:it_real_app/data/repo/tokens/tokens_data_source.dart' as _i8;
import 'package:it_real_app/data/repo/tokens/tokens_repo.dart' as _i9;
import 'package:it_real_app/data/repo/verification/verification_data_source.dart'
    as _i10;
import 'package:it_real_app/data/repo/verification/verification_repo.dart'
    as _i11;
import 'package:it_real_app/presentation/feature/app/bloc/app_bloc.dart' as _i6;
import 'package:it_real_app/presentation/feature/auth/bloc/auth_bloc.dart'
    as _i19;
import 'package:it_real_app/presentation/feature/drag_and_drop/bloc/drag_and_drop_bloc.dart'
    as _i3;
import 'package:it_real_app/presentation/feature/home/bloc/home_bloc.dart'
    as _i4;
import 'package:it_real_app/presentation/feature/onboarding/bloc/onboarding_bloc.dart'
    as _i5;
import 'package:it_real_app/presentation/feature/photo_verification/bloc/photo_verification_bloc.dart'
    as _i14;
import 'package:it_real_app/presentation/feature/settings/bloc/settings_bloc.dart'
    as _i15;
import 'package:it_real_app/presentation/feature/sign_in/bloc/sign_in_bloc.dart'
    as _i16;
import 'package:it_real_app/presentation/feature/sign_up/bloc/sign_up_bloc.dart'
    as _i17;
import 'package:it_real_app/presentation/feature/tokens/bloc/tokens_bloc.dart'
    as _i18;
import 'package:it_real_app/presentation/shared/di/modules/data_module.dart'
    as _i20;
import 'package:supabase_flutter/supabase_flutter.dart' as _i7;

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
    gh.factory<_i3.DragAndDropBloc>(() => _i3.DragAndDropBloc());
    gh.factory<_i4.HomeBloc>(() => _i4.HomeBloc());
    gh.factory<_i5.OnboardingBloc>(() => _i5.OnboardingBloc());
    gh.singleton<_i6.AppBloc>(() => _i6.AppBloc());
    gh.singleton<_i7.SupabaseClient>(() => dataModule.supabase);
    gh.singleton<_i8.TokensDataSource>(
        () => _i9.TokensRepo(supabaseClient: gh<_i7.SupabaseClient>()));
    gh.singleton<_i10.VerificationDataSource>(
        () => _i11.VerificationRepo(supabaseClient: gh<_i7.SupabaseClient>()));
    gh.singleton<_i12.AuthDataSource>(
        () => _i13.AuthRepo(supabaseClient: gh<_i7.SupabaseClient>()));
    gh.singleton<_i14.PhotoVerificationBloc>(() => _i14.PhotoVerificationBloc(
        verificationDataSource: gh<_i10.VerificationDataSource>()));
    gh.factory<_i15.SettingsBloc>(
        () => _i15.SettingsBloc(authDataSource: gh<_i12.AuthDataSource>()));
    gh.factory<_i16.SignInBloc>(
        () => _i16.SignInBloc(authDataSource: gh<_i12.AuthDataSource>()));
    gh.factory<_i17.SignUpBloc>(
        () => _i17.SignUpBloc(authDataSource: gh<_i12.AuthDataSource>()));
    gh.factory<_i18.TokensBloc>(
        () => _i18.TokensBloc(authDataSource: gh<_i12.AuthDataSource>()));
    gh.singleton<_i19.AuthBloc>(() => _i19.AuthBloc(
          authDataSource: gh<_i12.AuthDataSource>(),
          supabaseClient: gh<_i7.SupabaseClient>(),
        ));
    return this;
  }
}

class _$DataModule extends _i20.DataModule {}
