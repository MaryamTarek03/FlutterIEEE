import 'package:dio/dio.dart';
import 'package:flutterieee/Screens/DummyProducts/data/products_endpoints.dart';

class DioHelper {
  static late Dio productsDio;

  static void init() {
    productsDio = Dio(BaseOptions(baseUrl: Endpoints.baseUrl));
  }
}
