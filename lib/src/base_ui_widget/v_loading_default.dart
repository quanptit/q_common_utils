import 'package:flutter/material.dart';

class VLoadingDefault extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final bool? usingForSliver;
  final String? message; // Message hiển thị (tùy chọn)
  final TextStyle? messageStyle; // Style cho message
  final double indicatorSize; // Kích thước của CircularProgressIndicator
  final Color? indicatorColor; // Màu sắc của CircularProgressIndicator

  const VLoadingDefault({
    super.key,
    this.padding,
    this.usingForSliver,
    this.message, // Cho phép không truyền message
    this.messageStyle,
    this.indicatorSize = 36.0, // Kích thước mặc định
    this.indicatorColor, // Màu mặc định lấy từ Theme
  });

  @override
  Widget build(BuildContext context) {
    Widget child = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // CircularProgressIndicator
          SizedBox(
            width: indicatorSize,
            height: indicatorSize,
            child: CircularProgressIndicator(
              color: indicatorColor ?? Theme.of(context).primaryColor,
            ),
          ),
          if (message != null) ...[
            const SizedBox(height: 16), // Khoảng cách giữa loader và message
            Text(
              message!,
              style: messageStyle ?? Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
    child = padding == null ? child : Padding(padding: padding!, child: child);
    return usingForSliver == true ? SliverToBoxAdapter(child: child) : child;
  }
}
