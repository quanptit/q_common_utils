import 'package:flutter/cupertino.dart';

class MathUtils {
  ///loại bỏ các ký tự không phải số va parse
  static int? parseToIntFromTextField(TextEditingController controller) {
    String text = controller.text.trim().replaceAll(RegExp(r'[^0-9]'), '');
    return int.tryParse(text);
  }

  // Bạn có thể sử dụng hàm sau để chuyển đổi số về dạng rút gọn như "100 triệu", "100 nghìn", "100 đồng":
  static String formatVNDCurrency(num amount, bool addText) {
    if (amount >= 1e9) {
      return _formatNumber(amount / 1e9) + (addText ? ' tỷ' : "");
    } else if (amount >= 1e6) {
      return _formatNumber(amount / 1e6) + (addText ? ' triệu' : "");
    } else if (amount >= 1e3) {
      return _formatNumber(amount / 1e3) + (addText ? ' nghìn' : "");
    } else {
      return '$amount${addText ?' đồng':''}';
    }
  }

  /// Loai bo .0 o cuoi
  static String _formatNumber(double number) {
    return number % 1 == 0 ? number.toInt().toString() : number.toStringAsFixed(1);
  }

  MathUtils._();
}
