import 'package:shared_preferences/shared_preferences.dart';
import '../../auth/login/model.dart';

class CacheHelper{
  static late final SharedPreferences prefs;

  static Future<void> init()async{
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> setCount(int value){
    return prefs.setInt("count", value);
  }

  static int getCount(){
    return prefs.getInt("count")??0;
  }

  static Future<bool> clear(){
    return prefs.clear();
  }

  static bool isAuth(){
    String? token = prefs.getString("token");
    return token!= null  || (token??"").isNotEmpty;
  }

  static String getUserToken(){
    return prefs.getString("token")??"";
  }

  static Future<bool> clearUserData() async {
    return prefs.clear();
  }

  static Future<void> saveUserData(UserModel model) async{
    await prefs.setString("phone", model.phone);
    await prefs.setString("email", model.email);
    await prefs.setString("token", model.token);
    await prefs.setString("image", model.image);
    await prefs.setString("full_name", model.fullname);
    await prefs.setBool("isActive", model.isActive);
    //await prefs.setString("city_id", model.city!.id);
  }

}