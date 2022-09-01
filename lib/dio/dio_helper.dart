import 'package:dio/dio.dart';
import 'package:flutter_teste_app/shared/models/operation_model.dart';

class DioHelper{
  final dio = Dio();

  static List<OperationModel> getOperations(DateTime date) async{
    await dio.get();
  }
}

