import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:it_real_app/data/models/product/product_model.dart';
import 'package:it_real_app/data/models/user/user_model.dart';
import 'package:it_real_app/domain/data_source/auth_data_source.dart';
import 'package:it_real_app/domain/data_source/products_data_source.dart';
import 'package:url_launcher/url_launcher.dart';

part 'products_bloc.freezed.dart';

part 'products_event.dart';

part 'products_state.dart';

@Injectable()
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsDataSource productsDataSource;
  final AuthDataSource authDataSource;

  ProductsBloc({
    required this.productsDataSource,
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
          status: FormzSubmissionStatus.success,
          user: await authDataSource.getCurrentUser(),
          products: await productsDataSource.getAllProducts(),
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
    Emitter<ProductsState> emit,
  ) async {
    try {
      final paymentMetada = await productsDataSource.buyProduct(
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
          errorMessage: 'Failed to buy checks',
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
      ),
    );
  }
}
