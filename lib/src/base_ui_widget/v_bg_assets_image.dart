//region StatefulWidget wrap
import 'package:flutter/material.dart';

class VBgAssetsImage extends StatelessWidget {
  // ex: assets/images/bg_top.png
  final String assetsPath;
  final Widget child;

  const VBgAssetsImage({super.key, required this.assetsPath, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Image.asset(assetsPath, fit: BoxFit.fill)),
        child
      ],
    );
  }
}
