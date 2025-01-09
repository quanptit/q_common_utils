import 'package:flutter/material.dart';

import '../common_utils/edge_s.dart';

class VErrorDefault extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final String? errorMessage;
  final bool? usingForSliver;

  /// if exits ==> show reload button
  final VoidCallback? onRetry;
  final int iconSize;
  final TextStyle? textStyle;

  const VErrorDefault(
      {super.key,
      this.usingForSliver,
      this.padding,
      required this.errorMessage,
      this.onRetry,
      this.iconSize = 48,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorError = theme.colorScheme.error;

    Widget child = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.error_outline,
          color: colorError,
          size: iconSize.toDouble(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(errorMessage ?? 'Error',
              maxLines: 10,
              textAlign: TextAlign.center,
              style: textStyle ?? theme.textTheme.bodyMedium?.copyWith(color: colorError)),
        ),
        if (onRetry != null)
          ElevatedButton(
            onPressed: onRetry,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.refresh),
                Padding(
                  padding: E.left6,
                  child: const Text("Reload"),
                ),
              ],
            ),
          ),
      ],
    );
    child = padding == null ? child : Padding(padding: padding!, child: child);
    return usingForSliver == true ? SliverToBoxAdapter(child: child) : child;
  }
}
