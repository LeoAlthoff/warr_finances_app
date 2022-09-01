import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import 'model/category_model.dart';
import 'model/operation_model.dart';
import 'model/user_dto.dart';
import 'model/user_model.dart';

class DioHelper {
  static Future<List<OperationModel>> getOperations(
      DateTime date, int id) async {
    Dio dio = Dio();
    Response result = await dio.get(
        "http://localhost:5185/api/Operation/Month?date=${DateFormat.yMd().format(date)}&userId=$id");
    print(result.data);
    return result.data;
  }

  static Future<void> createCategory(CategoryModel category) async {
    Dio dio = Dio();
    dio.post("http://localhost:5185/api/Category", data: category.toMap());
  }

  static Future<void> createOperation(OperationModel operation) async {
    Dio dio = Dio();
    dio.post("http://localhost:5185/api/Operation", data: operation.toMap());
  }

  static Future<List<CategoryModel>> getAllCategories(int id) async {
    Dio dio = Dio();
    Response result = await dio
        .get("http://localhost:5185/api/Category/UserCategories?id=$id");
    return result.data;
  }

  static Future<void> createUser(UserModel user) async {
    Dio dio = Dio();
    dio.post("http://localhost:5185/api/User", data: user.toMap());
  }

  static Future<UserModel> login(UserDto userDto) async {
    Dio dio = Dio();
    Response result = await dio.post("http://localhost:5185/api/Access/Login",
        data: userDto.toMap());
    return result.data;
  }

  static void deleteOperation(OperationModel operation) {
    Dio dio = Dio();
    dio.delete("http://localhost:5185/api/Operation/", data: operation.toMap());
  }
    //TODO selectSum()
    //TODO createtOperation()
    //TODO updateOperation()
    //TODO GetCategoryByID()
    

}
