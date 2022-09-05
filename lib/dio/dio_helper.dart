import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import 'model/category_model.dart';
import 'model/operation_model.dart';
import 'model/user_dto.dart';
import 'model/user_model.dart';

class DioHelper {
  static Future<List<List<OperationModel>>> getOperations(
      DateTime date, int id) async {
    Dio dio = Dio();
    Response result = await dio.get(
        "http://zuplae.vps-kinghost.net:8085/api/Operation/Month?date=${DateFormat.yMd().format(date)}&userId=$id");
    List<List<OperationModel>> list = [];
    for (var i = 0; i < 3; i++) {
      for (var model in result.data[i]) {
        list[i].add(OperationModel.fromMap(model));
      }
    }
    return list;
  }

  static Future<Map> selectSum(DateTime date, int id) async {
    List list = await getOperations(date, id);

    list[0].sort((a, b) => a.date.compareTo(b.date));
    list[1].sort((a, b) => a.date.compareTo(b.date));

    double positivos = 0;

    for (var model in list[0]) {
      positivos += model.value;
    }

    double negativos = 0;

    for (var model in list[1]) {
      negativos += model.value;
    }

    DateTime lastEntryPositivo =
        DateTime.parse(list[0][list[0].length - 1].date);

    DateTime lastEntryNegativo =
        DateTime.parse(list[1][list[1].length - 1].date);

    double sum = positivos - negativos;

    return {
      "entry": positivos,
      "lastEntryPositivo": lastEntryPositivo,
      "output": negativos,
      "lastEntryNegativo": lastEntryNegativo,
      "sum": sum,
    };
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
    Response result = await dio.get(
        "http://zuplae.vps-kinghost.net:8085/api/Category/UserCategories?id=$id");
    return result.data;
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
    return result.data;
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
