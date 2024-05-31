
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:it_real_app/data/models/product/product_model.dart';
import 'package:it_real_app/data/repo/products/products_data_source.dart';
import 'package:url_launcher/url_launcher.dart';

part 'tokens_bloc.freezed.dart';

part 'tokens_event.dart';

part 'tokens_state.dart';

@Injectable()
class TokensBloc extends Bloc<TokensEvent, TokensState> {
  final ProductsDataSource tokensDataSource;

  TokensBloc({
    required this.tokensDataSource,
  }) : super(
          const TokensState(
            status: FormzSubmissionStatus.initial,
            errorMessage: null,
            products: [],
          ),
        ) {
    on<_Started>(_onStarted);
    on<_BuyTokens>(_onBuyTokens);
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

  Future<void> _onBuyTokens(
    _BuyTokens event,
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
}
