import 'package:flutter/services.dart' show rootBundle;

class FileUtils {
  /// đọc string ở file thêm vào thư mục assets. Chú ý cần thêm đường dẫn vào assets trong pubspec.yaml
  /// Chú ý phải cung cấp tất cả các folder con bên trong vào pubspec.yaml. nếu ko sẽ ko load được
  static Future<String> loadAsset(String assetsPath, {required bool needDecriptor, int? sub}) async {
    String source = await rootBundle.loadString(assetsPath);
    if (needDecriptor) {
      return decryptSimple(encrypted: source, sub: sub!);
    }
    return source;
  }

  static String decryptSimple({required String encrypted, required int sub}) {
    var myString = "";
    var length = encrypted.length;
    for (int i = 0; i < length; i++) {
      myString += String.fromCharCode(encrypted.codeUnitAt(i) - sub);
    }
    return myString;
  }
}
