import '../../models/user_model/user_model.dart';
import '../dio.dart';

class AuthRepositories {


  static Future<UserModel> getUser() async {
    final result = await dio.get(
      'api/users/random_user',
    );

    if(result.statusCode == 200) {
      return UserModel.fromJson(result.data);
    } else {
      throw Exception('no data');
    }
  }

}