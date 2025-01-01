import 'package:flutter/material.dart';

import '../common_utils/edge_s.dart';

class VError extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final Object? error;
  /// if exits ==> show reload button
  final VoidCallback? reload;

  const VError({super.key, this.error, this.reload,  this.padding = const EdgeInsets.only(top: 30)});

  @override
  Widget build(BuildContext context) {
     var childs = [
      const Icon(
        Icons.error_outline,
        color: Colors.red,
        size: 30,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 12),
        child:
            Text('Error: $error', maxLines: 10, textAlign: TextAlign.center, style: const TextStyle(color: Colors.red)),
      ),
    ];
    if (reload != null) {
      childs.add(ElevatedButton(
        onPressed: reload,
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
      ));
    }

    return Padding(
      padding: E.top30,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: childs,
        ),
      ),
    );
  }
}