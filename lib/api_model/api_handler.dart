import 'package:dio/dio.dart';
import 'package:shopping_app/api_model/products_model.dart';

class DioHandler {
  static Dio dio = Dio();

  static init()async {
    await dio.get('https://fakestoreapi.com/products');
  }

 static Future<Response> getData()async {
    Response response = await dio.get('https://fakestoreapi.com/products');
    
    return response;
  }
}
