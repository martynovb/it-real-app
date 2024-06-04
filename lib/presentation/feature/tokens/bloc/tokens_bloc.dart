import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:it_real_app/data/models/product/product_model.dart';
import 'package:it_real_app/data/models/user/user_model.dart';
import 'package:it_real_app/data/repo/auth/auth_data_source.dart';
import 'package:it_real_app/data/repo/products/products_data_source.dart';
import 'package:url_launcher/url_launcher.dart';

part 'tokens_bloc.freezed.dart';

part 'tokens_event.dart';

part 'tokens_state.dart';

@Injectable()
class TokensBloc extends Bloc<TokensEvent, TokensState> {
  final ProductsDataSource tokensDataSource;
  final AuthDataSource authDataSource;

  TokensBloc({
    required this.tokensDataSource,
    required this.authDataSource,
  }) : super(
          const TokensState(
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
    Emitter<TokensState> emit,
  ) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.success,
          user: await authDataSource.getCurrentUser(),
          products: await tokensDataSource.getAllProducts(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: 'Failed to load products',
        ),
      );
    }
  }

  Future<void> _onBuyProdcut(
    _BuyProduct event,
    Emitter<TokensState> emit,
  ) async {
    try {
      final paymentMetada = await tokensDataSource.buyProduct(
        productModel: event.productModel,
      );
      await launchUrl(
        Uri.parse(paymentMetada.paymentLink),
        webOnlyWindowName: '_self',
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: 'Failed to buy tokens',
        ),
      );
    }
  }

  Future<void> _onSelectProduct(
    _SelectProduct event,
    Emitter<TokensState> emit,
  ) async {
    emit(
      state.copyWith(
        selectedProduct: event.productModel,
      ),
    );
  }
}
