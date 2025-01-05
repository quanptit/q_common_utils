import 'package:flutter/services.dart' show rootBundle;

import 'json_utils.dart';

class FileUtils {
  /// đọc string ở file thêm vào thư mục assets. Chú ý cần thêm đường dẫn vào assets trong pubspec.yaml
  /// Chú ý phải cung cấp tất cả các folder con bên trong vào pubspec.yaml. nếu ko sẽ ko load được
  /// String content = await FileUtils.loadAsset("assets/tuvung/dong_vat/summary");
  /// @assetsPath: Full path
  static Future<String> loadAsset(String assetsPath, {bool needDecriptor=false, int? sub}) async {
    String source = await rootBundle.loadString(assetsPath);
    if (needDecriptor) {
      return decryptSimple(encrypted: source, sub: sub!);
    }
    return source;
  }

  ///json is aray. fromJson is generate function
  ///EX: List<Obj> objs = await NetworkUtils.getListDataObj(url, cache: true, fromJson: Obj.fromJson);
  static Future<List<T>> loadAssetListDataObj<T>(String assetsPath, {required T Function(Map<String, dynamic> data) fromJson}) async {
    final responseStr = await loadAsset(assetsPath);
    return JsonUtils.parserJsonToArray(responseStr, fromJson);
  }

  static Future<T> loadAssetData<T>(String assetsPath, {required  T Function(Map<String, dynamic> json) fromJson}) async {
    final responseStr = await loadAsset(assetsPath);
    return JsonUtils.parserJsonToObj(responseStr, fromJson);
  }


  static String decryptSimple({required String encrypted, required int sub}) {
    var myString = "";
    var length = encrypted.length;
    for (int i = 0; i < length; i++) {
      myString += String.fromCharCode(encrypted.codeUnitAt(i) - sub);
    }
    return myString;
  }

  FileUtils._();
}
