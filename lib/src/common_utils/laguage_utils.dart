import 'dart:io' show Platform;

/**
 - nếu muốn hỗ trợ đa ngôn ngữ. trỏ appGetStringRef vào hàm lấy ngôn ngữ ở projecj.
  Nếu không cần hỗ trợ đa ngôn ngữ thì bỏ qua file này.

void mainBase() async {
  LanguagesUtils.setReferAppGetString((key, defaultValue) {
    return Intl.message(defaultValue, name: key);
  }); 
 */
class LanguagesUtils {
  static String? Function(String key, String defaultValue)? appGetStringRef;
  static setReferAppGetString(String? Function(String key, String defaultValue) appGetString) {
    appGetStringRef = appGetString;
  }

  ///tham chiếu đến cái key được khai báo ở APP. nếu ko có sử dụng default value
  static String getString(String key, String defaultValue) {
    String? value = appGetStringRef?.call(key, defaultValue);
    return value ?? defaultValue;
  }

  static bool isVietnamese() {
    String localeName = Platform.localeName.toLowerCase();
    // debugPrint('device localeName: $localeName');
    return localeName.contains(RegExp("vi|vn|vietnam"));
  }
}
