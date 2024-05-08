import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterieee/Screens/DummyProducts/data/helper/dio_helper.dart';
import 'package:flutterieee/Screens/DummyProducts/data/models/product_model.dart';
import 'package:flutterieee/Screens/DummyProducts/data/products_endpoints.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  List<ProductModel> products = [];
  static ProductsCubit get(context) => BlocProvider.of(context);

  void getProducts() async {
    emit(ProductLoadingState());
    try {
      Response productsData =
          await DioHelper.productsDio.get(Endpoints.products);

      products = productsData.data['products']
          .map<ProductModel>((element) => ProductModel.data(element))
          .toList();

      // print(products[0].title);
      emit(ProductGetSuccess());
    } catch (e) {
      emit(ProductGetFailure());
    }
  }
}
