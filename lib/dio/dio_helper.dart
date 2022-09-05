import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import 'model/category_model.dart';
import 'model/operation_model.dart';
import 'model/user_dto.dart';
import 'model/user_model.dart';

class DioHelper {
  static Future<List<OperationModel>> getOperations(
      int tipyOperation, DateTime date, int id) async {
    Dio dio = Dio();
    Response result = await dio.get(
        "http://zuplae.vps-kinghost.net:8085/api/Operation/Month?date=${DateFormat.yMd().format(date)}&userId=$id");
    List<OperationModel> list = [];

    for (var model in result.data[tipyOperation]) {
      list.add(OperationModel.fromMap(model));
    }
    return list;
  }

  static Future<Map> selectSum(DateTime date, int id) async {
    double positivos = 0;
    double negativos = 0;
    double sum = 0;
    List<OperationModel> list = await getOperations(2, date, id);
    for (var model in list) {
      if (model.entry == 1) {
        positivos += (model.value);
      } else {
        negativos += (model.value);
      }
    }
    sum = positivos - negativos;
    return {"entry": positivos, "output": negativos, "sum": sum};
  }

  static Future<void> createCategory(CategoryModel category) async {
    Dio dio = Dio();
    dio.post("http://zuplae.vps-kinghost.net:8085/api/Category",
        data: category.toMap());
  }

  static Future<void> createOperation(OperationModel operation) async {
    Dio dio = Dio();
    dio.post("http://zuplae.vps-kinghost.net:8085/api/Operation",
        data: operation.toMap());
  }

  static Future<List<CategoryModel>> getAllCategories(int id) async {
    Dio dio = Dio();
    List<CategoryModel> list = [];
    Response result = await dio.get(
        "http://zuplae.vps-kinghost.net:8085/api/Category/UserCategories?id=$id");

    for (var model in result.data) {
      list.add(CategoryModel.fromMap(model));
    }
    return list;
  }

  static Future<void> createUser(UserModel user) async {
    Dio dio = Dio();
    dio.post("http://zuplae.vps-kinghost.net:8085/api/User",
        data: user.toMap());
  }

  static Future<UserModel> login(UserDto userDto) async {
    Dio dio = Dio();
    Response result = await dio.post(
        "http://zuplae.vps-kinghost.net:8085/api/Access/Login",
        data: userDto.toMap());
    UserModel user = UserModel.fromMap(result.data);
    return user;
  }

  static void deleteOperation(OperationModel operation) {
    Dio dio = Dio();
    dio.delete("http://zuplae.vps-kinghost.net:8085/api/Operation/",
        data: operation.toMap());
  }
  //TODO selectSum()
  //TODO createtOperation()
  //TODO updateOperation()
  //TODO GetCategoryByID()

}
