// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:it_real_app/data/repo/auth/auth_repo.dart' as _i14;
import 'package:it_real_app/data/repo/products/products_repo.dart' as _i9;
import 'package:it_real_app/data/repo/verification/verification_repo.dart'
    as _i11;
import 'package:it_real_app/domain/data_source/auth_data_source.dart' as _i13;
import 'package:it_real_app/domain/data_source/products_data_source.dart'
    as _i8;
import 'package:it_real_app/domain/data_source/verification_data_source.dart'
    as _i10;
import 'package:it_real_app/presentation/feature/app/bloc/app_bloc.dart' as _i5;
import 'package:it_real_app/presentation/feature/auth/bloc/auth_bloc.dart'
    as _i21;
import 'package:it_real_app/presentation/feature/drag_and_drop/bloc/drag_and_drop_bloc.dart'
    as _i7;
import 'package:it_real_app/presentation/feature/forgot_password/bloc/forgot_password_bloc.dart'
    as _i16;
import 'package:it_real_app/presentation/feature/home/bloc/home_bloc.dart'
    as _i15;
import 'package:it_real_app/presentation/feature/onboarding/bloc/onboarding_bloc.dart'
    as _i3;
import 'package:it_real_app/presentation/feature/photo_verification/bloc/photo_verification_bloc.dart'
    as _i12;
import 'package:it_real_app/presentation/feature/products/bloc/products_bloc.dart'
    as _i22;
import 'package:it_real_app/presentation/feature/reset_password/bloc/reset_password_bloc.dart'
    as _i17;
import 'package:it_real_app/presentation/feature/settings/bloc/settings_bloc.dart'
    as _i18;
import 'package:it_real_app/presentation/feature/sign_in/bloc/sign_in_bloc.dart'
    as _i19;
import 'package:it_real_app/presentation/feature/sign_up/bloc/sign_up_bloc.dart'
    as _i20;
import 'package:it_real_app/presentation/shared/di/modules/app_module.dart'
    as _i23;
import 'package:it_real_app/presentation/shared/di/modules/data_module.dart'
    as _i24;
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
    final appModule = _$AppModule();
    final dataModule = _$DataModule();
    gh.factory<_i3.OnboardingBloc>(() => _i3.OnboardingBloc());
    gh.factory<_i4.ImagePicker>(() => appModule.imagePicker);
    gh.singleton<_i5.AppBloc>(() => _i5.AppBloc());
    gh.singleton<_i6.SupabaseClient>(() => dataModule.supabase);
    gh.factory<_i7.DragAndDropBloc>(
        () => _i7.DragAndDropBloc(imagePicker: gh<_i4.ImagePicker>()));
    gh.singleton<_i8.ProductsDataSource>(
        () => _i9.ProductsRepo(supabaseClient: gh<_i6.SupabaseClient>()));
    gh.singleton<_i10.VerificationDataSource>(
        () => _i11.VerificationRepo(supabaseClient: gh<_i6.SupabaseClient>()));
    gh.singleton<_i12.PhotoVerificationBloc>(() => _i12.PhotoVerificationBloc(
        verificationDataSource: gh<_i10.VerificationDataSource>()));
    gh.singleton<_i13.AuthDataSource>(
        () => _i14.AuthRepo(supabaseClient: gh<_i6.SupabaseClient>()));
    gh.factory<_i15.HomeBloc>(
        () => _i15.HomeBloc(authRepo: gh<_i13.AuthDataSource>()));
    gh.factory<_i16.ForgotPasswordBloc>(() =>
        _i16.ForgotPasswordBloc(authDataSource: gh<_i13.AuthDataSource>()));
    gh.factory<_i17.ResetPasswordBloc>(() =>
        _i17.ResetPasswordBloc(authDataSource: gh<_i13.AuthDataSource>()));
    gh.factory<_i18.SettingsBloc>(
        () => _i18.SettingsBloc(authDataSource: gh<_i13.AuthDataSource>()));
    gh.factory<_i19.SignInBloc>(
        () => _i19.SignInBloc(authDataSource: gh<_i13.AuthDataSource>()));
    gh.factory<_i20.SignUpBloc>(
        () => _i20.SignUpBloc(authDataSource: gh<_i13.AuthDataSource>()));
    gh.singleton<_i21.AuthBloc>(() => _i21.AuthBloc(
          authDataSource: gh<_i13.AuthDataSource>(),
          supabaseClient: gh<_i6.SupabaseClient>(),
        ));
    gh.factory<_i22.ProductsBloc>(() => _i22.ProductsBloc(
          productsDataSource: gh<_i8.ProductsDataSource>(),
          authDataSource: gh<_i13.AuthDataSource>(),
        ));
    return this;
  }
}

class _$AppModule extends _i23.AppModule {}

class _$DataModule extends _i24.DataModule {}
