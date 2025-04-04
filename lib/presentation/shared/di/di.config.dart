// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:image_picker/image_picker.dart' as _i183;
import 'package:injectable/injectable.dart' as _i526;
import 'package:it_real_app/data/repo/auth/auth_repo.dart' as _i910;
import 'package:it_real_app/data/repo/products/paypal_products_repo.dart'
    as _i179;
import 'package:it_real_app/data/repo/products/products_repo.dart' as _i288;
import 'package:it_real_app/data/repo/verification/verification_repo.dart'
    as _i44;
import 'package:it_real_app/domain/data_source/auth_data_source.dart' as _i277;
import 'package:it_real_app/domain/data_source/products_data_source.dart'
    as _i327;
import 'package:it_real_app/domain/data_source/verification_data_source.dart'
    as _i611;
import 'package:it_real_app/presentation/feature/app/bloc/app_bloc.dart'
    as _i622;
import 'package:it_real_app/presentation/feature/auth/bloc/auth_bloc.dart'
    as _i20;
import 'package:it_real_app/presentation/feature/drag_and_drop/bloc/drag_and_drop_bloc.dart'
    as _i64;
import 'package:it_real_app/presentation/feature/forgot_password/bloc/forgot_password_bloc.dart'
    as _i427;
import 'package:it_real_app/presentation/feature/home/bloc/home_bloc.dart'
    as _i131;
import 'package:it_real_app/presentation/feature/onboarding/bloc/onboarding_bloc.dart'
    as _i170;
import 'package:it_real_app/presentation/feature/photo_verification/bloc/photo_verification_bloc.dart'
    as _i368;
import 'package:it_real_app/presentation/feature/products/bloc/products_bloc.dart'
    as _i590;
import 'package:it_real_app/presentation/feature/reset_password/bloc/reset_password_bloc.dart'
    as _i545;
import 'package:it_real_app/presentation/feature/settings/bloc/settings_bloc.dart'
    as _i307;
import 'package:it_real_app/presentation/feature/sign_in/bloc/sign_in_bloc.dart'
    as _i613;
import 'package:it_real_app/presentation/feature/sign_up/bloc/sign_up_bloc.dart'
    as _i437;
import 'package:it_real_app/presentation/shared/di/modules/app_module.dart'
    as _i187;
import 'package:it_real_app/presentation/shared/di/modules/data_module.dart'
    as _i1048;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    final dataModule = _$DataModule();
    gh.factory<_i170.OnboardingBloc>(() => _i170.OnboardingBloc());
    gh.factory<_i183.ImagePicker>(() => appModule.imagePicker);
    gh.singleton<_i622.AppBloc>(() => _i622.AppBloc());
    gh.singleton<_i454.SupabaseClient>(() => dataModule.supabase);
    gh.factory<_i64.DragAndDropBloc>(
        () => _i64.DragAndDropBloc(imagePicker: gh<_i183.ImagePicker>()));
    gh.singleton<_i327.ProductsDataSource>(
      () =>
          _i179.PaypalProductsRepo(supabaseClient: gh<_i454.SupabaseClient>()),
      instanceName: 'paypal',
    );
    gh.singleton<_i327.ProductsDataSource>(
      () => _i288.ProductsRepo(supabaseClient: gh<_i454.SupabaseClient>()),
      instanceName: 'stripe',
    );
    gh.singleton<_i611.VerificationDataSource>(() =>
        _i44.VerificationRepo(supabaseClient: gh<_i454.SupabaseClient>()));
    gh.singleton<_i368.PhotoVerificationBloc>(() => _i368.PhotoVerificationBloc(
        verificationDataSource: gh<_i611.VerificationDataSource>()));
    gh.singleton<_i277.AuthDataSource>(
        () => _i910.AuthRepo(supabaseClient: gh<_i454.SupabaseClient>()));
    gh.factory<_i131.HomeBloc>(
        () => _i131.HomeBloc(authRepo: gh<_i277.AuthDataSource>()));
    gh.factory<_i427.ForgotPasswordBloc>(() =>
        _i427.ForgotPasswordBloc(authDataSource: gh<_i277.AuthDataSource>()));
    gh.factory<_i545.ResetPasswordBloc>(() =>
        _i545.ResetPasswordBloc(authDataSource: gh<_i277.AuthDataSource>()));
    gh.factory<_i307.SettingsBloc>(
        () => _i307.SettingsBloc(authDataSource: gh<_i277.AuthDataSource>()));
    gh.factory<_i613.SignInBloc>(
        () => _i613.SignInBloc(authDataSource: gh<_i277.AuthDataSource>()));
    gh.factory<_i437.SignUpBloc>(
        () => _i437.SignUpBloc(authDataSource: gh<_i277.AuthDataSource>()));
    gh.singleton<_i20.AuthBloc>(() => _i20.AuthBloc(
          authDataSource: gh<_i277.AuthDataSource>(),
          supabaseClient: gh<_i454.SupabaseClient>(),
        ));
    gh.factory<_i590.ProductsBloc>(() => _i590.ProductsBloc(
          productsDataSource:
              gh<_i327.ProductsDataSource>(instanceName: 'paypal'),
          authDataSource: gh<_i277.AuthDataSource>(),
        ));
    return this;
  }
}

class _$AppModule extends _i187.AppModule {}

class _$DataModule extends _i1048.DataModule {}
