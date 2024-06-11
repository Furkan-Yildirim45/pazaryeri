import 'dart:io';
import 'package:Pazaryeri/product/model/product_model_from_backend';
import 'package:dio/dio.dart';

abstract class IMainService{
  final Dio dio;
  IMainService({required this.dio});
  
  Future<ProductModelFromBackend?> fetchResourceItem();
}

class MainService extends IMainService{
  MainService({required super.dio});

  @override
  Future<ProductModelFromBackend?> fetchResourceItem() async {
    try{
      final response = await dio.get("/${_ServicePath.product.name}");
    if(response.statusCode == HttpStatus.ok){
      final jsonBody = response.data;
      if(jsonBody is Map<String,dynamic>){
        return ProductModelFromBackend.fromJson(jsonBody);
      }
    }
    return null;
    }
    on DioException catch(error){
      throw Exception("You have 'GET' failed :$error");
    }
  }
}

enum _ServicePath{
  product,
}

//todo: şaunda musti bana url i vermesi gerekiyor!! ondan sonra deniceksin ui da!