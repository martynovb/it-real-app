import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:it_real_app/data/models/product/product_model.dart';
import 'package:it_real_app/data/models/user/user_model.dart';
import 'package:it_real_app/domain/data_source/auth_data_source.dart';
import 'package:it_real_app/presentation/shared/localization/locale_keys.g.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../../domain/data_source/products_data_source.dart';
import '../../../../domain/managers/checkout/checkout_manager.dart';
import '../../../shared/di/names/checkout_name.dart';

part 'products_bloc.freezed.dart';

part 'products_event.dart';

part 'products_state.dart';

@Injectable()
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsDataSource productsDataSource;
  final CheckoutManager checkoutManager;
  final AuthDataSource authDataSource;

  ProductsBloc({
    @Named(CheckoutName.paddle) required this.productsDataSource,
    @Named(CheckoutName.paddle) required this.checkoutManager,
    required this.authDataSource,
  }) : super(
          const ProductsState(
            status: FormzSubmissionStatus.initial,
            errorMessage: null,
            user: UserModel.empty,
            products: [],
          ),
        ) {
    on<_Started>(_onStarted);
    on<_BuyProduct>(_onBuyProdcut);
    on<_SelectProduct>(_onSelectProduct);
  }

  Future<void> _onStarted(
    _Started event,
    Emitter<ProductsState> emit,
  ) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.initial,
          user: await authDataSource.getCurrentUser(),
          products: await productsDataSource.getAllProducts(),
          errorMessage: null,
        ),
      );
    } catch (e) {
      await Sentry.captureException(e);
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: LocaleKeys.somethingWentWrong.tr(),
        ),
      );
    }
  }

  Future<void> _onBuyProdcut(
    _BuyProduct event,
    Emitter<ProductsState> emit,
  ) async {
    try {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

      final isPurchaseSuccessful = await checkoutManager.openPaymentCheckout(
        currentUser: state.user,
        productModel: event.productModel,
      );

      if (isPurchaseSuccessful) {
        emit(
          state.copyWith(
            status: FormzSubmissionStatus.success,
            user: await authDataSource.getCurrentUser(),
            errorMessage: null,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: FormzSubmissionStatus.initial,
          ),
        );
      }
    } catch (exception) {
      Sentry.captureException(exception);
      emit(
        ProductsState(
          status: FormzSubmissionStatus.failure,
          errorMessage: LocaleKeys.somethingWentWrong.tr(),
          user: state.user,
          products: state.products,
        ),
      );
    }
  }

  Future<void> _onSelectProduct(
    _SelectProduct event,
    Emitter<ProductsState> emit,
  ) async {
    emit(
      state.copyWith(
        selectedProduct: event.productModel,
        errorMessage: null,
      ),
    );
  }
}
